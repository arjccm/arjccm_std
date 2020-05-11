package com.arjjs.ccm.modules.ccm.rest.web;

import com.alibaba.fastjson.JSONObject;
import com.arjjs.ccm.common.config.Global;
import com.arjjs.ccm.common.gis.MapUtil;
import com.arjjs.ccm.common.gis.Point;
import com.arjjs.ccm.common.security.Digests;
import com.arjjs.ccm.common.utils.CacheUtils;
import com.arjjs.ccm.common.utils.Encodes;
import com.arjjs.ccm.common.utils.StringUtils;
import com.arjjs.ccm.common.web.BaseController;
import com.arjjs.ccm.modules.ccm.ccmsys.entity.CcmMobileDevice;
import com.arjjs.ccm.modules.ccm.ccmsys.service.CcmMobileDeviceService;
import com.arjjs.ccm.modules.ccm.event.entity.CcmAlarmLog;
import com.arjjs.ccm.modules.ccm.event.service.CcmAlarmLogService;
import com.arjjs.ccm.modules.ccm.org.entity.CcmOrgTeam;
import com.arjjs.ccm.modules.ccm.org.service.CcmOrgTeamService;
import com.arjjs.ccm.modules.ccm.patrol.entity.CcmTracingpoint;
import com.arjjs.ccm.modules.ccm.patrol.service.CcmTracingpointService;
import com.arjjs.ccm.modules.ccm.pop.entity.CcmPeople;
import com.arjjs.ccm.modules.ccm.pop.service.CcmPeopleService;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestResult;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestType;
import com.arjjs.ccm.modules.ccm.sys.service.SysConfigService;
import com.arjjs.ccm.modules.ccm.view.entity.VCcmTeam;
import com.arjjs.ccm.modules.flat.deviceonline.service.CcmDeviceOnlineService;
import com.arjjs.ccm.modules.flat.deviceuse.service.CcmDeviceUseService;
import com.arjjs.ccm.modules.flat.userBindingDevice.service.UserBindingDeviceService;
import com.arjjs.ccm.modules.sys.dao.UserDao;
import com.arjjs.ccm.modules.sys.entity.Dict;
import com.arjjs.ccm.modules.sys.entity.User;
import com.arjjs.ccm.modules.sys.service.DictService;
import com.arjjs.ccm.modules.sys.utils.UserUtils;
import com.arjjs.ccm.tool.MessageTools;
import com.arjjs.ccm.tool.StringTool;
import com.arjjs.ccm.tool.TransGPS;
import com.google.common.collect.Maps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.SecureRandom;
import java.util.*;

/**
 * 登录接口类
 *
 * @author fuxinshuang
 * @version 2018-0301
 */
@Controller
@RequestMapping(value = "${appPath}/rest/login")
public class CcmRestLogin extends BaseController {
    public static final int HASH_INTERATIONS = 1024;

    @Autowired
    private UserDao userDao;
    @Autowired
    private CcmOrgTeamService ccmOrgTeamService;
    @Autowired
    private CcmMobileDeviceService ccmMobileDeviceService;
    @Autowired
    private CcmTracingpointService ccmTracingpointService;
    @Autowired
    private CcmAlarmLogService ccmAlarmLogService;
    @Autowired
    private CcmDeviceUseService ccmDeviceUseService;
    @Autowired
    private CcmDeviceOnlineService ccmDeviceOnlineService;
    @Autowired
    private CcmPeopleService ccmPeopleService;
    @Autowired
    private DictService dictService;
    @Autowired
    private UserBindingDeviceService userBindingDeviceService;
    @Autowired
    private SysConfigService sysConfigService;

    private static final String SYMBOLS = "0123456789";
    private static final Random RANDOM = new SecureRandom();

    @Value("${RABBIT_MQ_HOST}")
    private  String  RABBIT_MQ_HOST;

    @Value("${RABBIT_MQ_PORT}")
    private  String  RABBIT_MQ_PORT;

    @Value("${RABBIT_MQ_USERNAME}")
    private  String  RABBIT_MQ_USERNAME;
    @Value("${RABBIT_MQ_PASSWORD}")
    private  String  RABBIT_MQ_PASSWORD;
    /**
     *  @see  登录
     * @param loginName  用户名
     * @param password  密码
     * @return
     * @author fuxinshuang
     * @version 2018-02-28
     */
    @ResponseBody
    @RequestMapping(value="/login", method = RequestMethod.POST)
    public CcmRestResult get(CcmMobileDevice ccmMobileDevice,User user,HttpServletRequest req, HttpServletResponse resp) throws IOException {
    	logger.info("当前正在执行的类名为》》》"+Thread.currentThread().getStackTrace()[1].getClassName());
		logger.info("当前正在执行的方法名为》》》"+Thread.currentThread().getStackTrace()[1].getMethodName());
		logger.info("当前方法运行参数为》》》ccmMobileDevice : " + String.valueOf(ccmMobileDevice) + "  user : " + String.valueOf(user));
    	CcmRestResult result = new CcmRestResult();

        if (user.getLoginName() == null || "".equals(user.getLoginName())) {//登录名为空
            result.setCode(CcmRestType.ERROR_NO_LOGINNAME);
            return result;
        }
        if (user.getPassword() == null || "".equals(user.getPassword())) {//登录密码为空
            result.setCode(CcmRestType.ERROR_NO_PASSWORD);
            return result;
        }
        if (ccmMobileDevice == null || ccmMobileDevice.getDeviceId() == null || "".equals(ccmMobileDevice.getDeviceId())) {
            result.setCode(CcmRestType.ERROR_PARAM);
            return result;
        }
        User userDB = userDao.getByLoginName(user);
        if(userDB==null) {
            result.setCode(CcmRestType.ERROR_NO_USER);
            return result;
        }else if (!validatePassword(user.getPassword(), userDB.getPassword())) {
            result.setCode(CcmRestType.ERROR_NO_USER);
            return result;
        }
       /* CcmTracingpoint ccmTracingpoint = new CcmTracingpoint();
        ccmTracingpoint.setUser(userDB);
        Page<CcmTracingpoint> page = ccmTracingpointService.findPage(new Page<>(1, 10), ccmTracingpoint);
        if(page!=null&& page.getList()!=null && page.getList().size()>0){
            boolean  me=false;
            CcmTracingpoint ccmTracingpoint1 = page.getList().get(0);
            long l = System.currentTimeMillis() - ccmTracingpoint1.getCurDate().getTime();
            if(l<1000*60){
                result.setCode(CcmRestType.ERROR_SAME_USER_LOGON);
                return result;
            }
        }*/
        CcmOrgTeam ccmOrgTeam = ccmOrgTeamService.findUserId(userDB.getId());
        if (ccmOrgTeam == null) {
            ccmOrgTeam = new CcmOrgTeam();
            ccmOrgTeam.setUser(userDB);
            ccmOrgTeam.setCreateBy(userDB);
            ccmOrgTeam.setUpdateBy(userDB);
        }/*else{
            String status = ccmOrgTeam.getStatus();
            if(!"".equals(status) && "online".equals(status)){//判断重复登录，1分钟内是否更新的记录
            	Date dateUpdate = ccmOrgTeam.getUpdateDate();
            	Date now = new Date();
            	long diff = now.getTime() - dateUpdate.getTime();
            	long mins = diff / 1000;
            	if (mins < 60) {//60秒内存在更新的话，则说明在线，不允许重复登录
            		result.setCode(CcmRestType.ERROR_SAME_USER_LOGON);
                    return result;
            	}
            }
        }*/

        if (ccmMobileDevice != null && ccmMobileDevice.getDeviceId() != null
                && !"".equals(ccmMobileDevice.getDeviceId())) {// 手机App的处理

            CcmMobileDevice ccmMobileDeviceDB = ccmMobileDeviceService.findByDeviceId(ccmMobileDevice.getDeviceId());
            if (ccmMobileDeviceDB == null){// 为null，则证明当前设备没有授权过，需要授权
                ccmMobileDeviceDB = new CcmMobileDevice();
                ccmMobileDeviceDB.setDeviceId(ccmMobileDevice.getDeviceId());
                ccmMobileDeviceDB.setCreateBy(userDB);
                ccmMobileDeviceDB.setIcon("");
                ccmMobileDeviceDB.setIsVariable("01");
                ccmMobileDeviceDB.setvCcmTeam(new VCcmTeam(userDB.getId()));
                ccmMobileDeviceDB.setUpdateBy(userDB);
                ccmMobileDeviceDB.setUseType("01");
                ccmMobileDeviceService.save(ccmMobileDeviceDB);
                result.setCode(CcmRestType.ERROR_NO_PERSSION);
                return result;
            }else{// 手机授权注册过，判断是否通过
                String isVariable = ccmMobileDeviceDB.getIsVariable();
                if(!"02".equals(isVariable)){
                    result.setCode(CcmRestType.ERROR_NO_PERSSION);
                    return result;
                }
                /*CcmMobileDevice deviceIdAndUserId = ccmMobileDeviceService.findByDeviceIdAndUserId(ccmMobileDevice.getDeviceId(), userDB.getId());
                if (deviceIdAndUserId == null ) {// 为null，则证明当前设备授权的不是当前用户，需要更新绑定设备为当前用户
                    // 用户绑定设备
                    String userBindId = userBindingDeviceService.findDeviceByPolicePhoneCode(ccmMobileDevice.getDeviceId());
                    UserBindingDevice userBindingDevice = new UserBindingDevice();
                    userBindingDevice.setUserId(userDB.getId());
                    userBindingDevice.setCreateBy(userDB);
                    userBindingDevice.setUpdateBy(userDB);
                    if( userBindId != null){//绑定过，更新绑定用户
                        userBindingDeviceService.updateBinding(userBindId,userDB.getId());
                    }else{//如果未绑定过，绑定当前设备
                        userBindingDevice.setPolicePhoneCode(ccmMobileDevice.getDeviceId());
                        userBindingDevice.setDefualtDevice("0");//设备默认为警务通
                        userBindingDeviceService.save(userBindingDevice);
                    }
                }*/
            }
            ccmMobileDeviceDB.setvCcmTeam(new VCcmTeam(userDB.getId()));

            //坐标经纬度的转换（GCJ坐标 -> 标准坐标）
            String piont = ccmMobileDevice.getAreaPoint();
            String areaPiont = "";
            if (!"".equals(piont) && null != piont) {
                String[] pionts = piont.split(",");
                TransGPS ins = new TransGPS();
                TransGPS.Location wcj = ins.new Location();
                wcj.setLat(Double.parseDouble(pionts[1]));
                wcj.setLng(Double.parseDouble(pionts[0]));

                TransGPS.Location wgs = ins.transformFromGCJToWGS(wcj);
                areaPiont = wgs.getLng() + ","  + wgs.getLat();
            }

            ccmMobileDeviceDB.setAreaPoint(areaPiont);

            ccmMobileDeviceDB.setUpdateBy(userDB);
            ccmMobileDeviceService.save(ccmMobileDeviceDB);
        }
        
        //登录成功则修改状态为在线   pengjianqiang
        ccmOrgTeam.setStatus("online");
        ccmOrgTeamService.save(ccmOrgTeam);

        req.getSession().setAttribute("user", userDB);
        result.setCode(CcmRestType.OK);
        JSONObject json= new JSONObject();
        json.put("RABBIT_MQ_HOST",RABBIT_MQ_HOST);
        json.put("RABBIT_MQ_PORT",RABBIT_MQ_PORT);
        json.put("RABBIT_MQ_USERNAME",RABBIT_MQ_USERNAME);
        json.put("RABBIT_MQ_PASSWORD",RABBIT_MQ_PASSWORD);
        json.put("id",userDB.getId());
        json.put("remarks",userDB.getRemarks());
        json.put("loginName",userDB.getLoginName());
        json.put("no",userDB.getNo());
        json.put("name",userDB.getName());
        json.put("email",userDB.getEmail());
        json.put("phone",userDB.getPhone());
        json.put("mobile",userDB.getMobile());
        json.put("userType",userDB.getUserType());
        json.put("loginIp",userDB.getLoginIp());
        String imageMapUrl = sysConfigService.getImageMapConfig();
        json.put("imageMapUrl",imageMapUrl);
        if(StringUtils.isNotBlank(userDB.getPhoto())) {
        	json.put("photo", Global.getConfig("FILE_UPLOAD_URL")+userDB.getPhoto());
		}else {
			json.put("photo", userDB.getPhoto());
		}
        json.put("admin",userDB.isAdmin());

        json.put("arj_netty_url",Global.getConfig("ARJIM_NETTY_URL"));
        //json.put("arj_netty_websocket_url",Global.getConfig("ARJIM_NETTY_WEBSOCKET_URL"));
        json.put("arj_rest_url",Global.getConfig("ARJIM_RETS_URL"));
        json.put("arj_webrtc_host_room_url",Global.getConfig("ARJIM_WEBRTC_HOST_ROOM_URL"));
        json.put("arj_webrtc_host_url",Global.getConfig("ARJIM_WEBRTC_HOST_URL"));

        result.setResult(json);
        return result;
    }
    /**
     * @see  退出
     * @param loginName  用户名
     * @param password  密码
     * @return
     * @author fuxinshuang
     * @version 2018-02-28
     */
    @ResponseBody
    @RequestMapping(value="/logout", method = RequestMethod.GET)
    public CcmRestResult logout(String userId,HttpServletRequest req, HttpServletResponse resp) throws IOException {
        CcmRestResult result = new CcmRestResult();
        User sessionUser = (User) req.getSession().getAttribute("user");
        if (sessionUser== null) {
            result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
            return result;
        }
        String sessionUserId = sessionUser.getId();
        if (userId== null || "".equals(userId) ||!userId.equals(sessionUserId)) {
            result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
            return result;
        }

        CcmOrgTeam ccmOrgTeam = ccmOrgTeamService.findUserId(userId);
        ccmOrgTeam.setStatus("hide");
        ccmOrgTeamService.save(ccmOrgTeam);
        req.getSession().removeAttribute("user");
        result.setCode(CcmRestType.OK);
        result.setResult("成功");
        return result;
    }
    /**
     * @see  更新坐标信息
     * @param loginName  用户名
     * @param password  密码
     * @return
     * @author fuxinshuang
     * @version 2018-02-28
     */
    @ResponseBody
    @RequestMapping(value="/updateLocation", method = RequestMethod.POST)
    public CcmRestResult updateLocation(String userId,CcmMobileDevice ccmMobileDevice,HttpServletRequest req, HttpServletResponse resp) throws IOException {
        logger.info("当前正在执行的类名为》》》"+Thread.currentThread().getStackTrace()[1].getClassName());
        logger.info("当前正在执行的方法名为》》》"+Thread.currentThread().getStackTrace()[1].getMethodName());
        CcmRestResult result = new CcmRestResult();
        User sessionUser = (User) req.getSession().getAttribute("user");
        if (sessionUser== null) {
            result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
            return result;
        }
        String sessionUserId = sessionUser.getId();
        if (userId== null || "".equals(userId) ||!userId.equals(sessionUserId)) {
            result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
            return result;
        }

        CcmOrgTeam ccmOrgTeam = ccmOrgTeamService.findUserId(sessionUser.getId());
        if (ccmOrgTeam == null) {
            ccmOrgTeam = new CcmOrgTeam();
            ccmOrgTeam.setUser(sessionUser);
            ccmOrgTeam.setCreateBy(sessionUser);
            ccmOrgTeam.setUpdateBy(sessionUser);
        }
        ccmOrgTeam.setStatus("online");
        ccmOrgTeamService.save(ccmOrgTeam);
        
        //向移动设备表存入数据
        CcmMobileDevice ccmMobileDeviceDB = ccmMobileDeviceService.findByDeviceId(ccmMobileDevice.getDeviceId());
        ccmMobileDeviceDB.setvCcmTeam(new VCcmTeam(sessionUser.getId()));

        //坐标经纬度的转换（百度坐标 -> 标准坐标）
        String piont = ccmMobileDevice.getAreaPoint();
        String areaPiont = "";
        if (!"".equals(piont) && null != piont) {
            String[] pionts = piont.split(",");
            TransGPS ins = new TransGPS();
//            ins.setBaidulng(Double.parseDouble(pionts[0]));
//            ins.setBaidulat(Double.parseDouble(pionts[1]));

//            areaPiont = ins.zhuanhuan();
            areaPiont = pionts[0]+","+pionts[1];
        }
        ccmMobileDeviceDB.setAreaPoint(areaPiont);

        ccmMobileDeviceDB.setUpdateBy(sessionUser);
        ccmMobileDeviceDB.setIsAlarm("0");//是否越界-否

        //向巡逻点位表存入数据
        CcmTracingpoint ccmTracingpoint = new CcmTracingpoint();
//		ccmTracingpoint.setAreaPoint(ccmMobileDevice.getAreaPoint());
        ccmTracingpoint.setAreaPoint(areaPiont);
        ccmTracingpoint.setUser(sessionUser);
        ccmTracingpoint.setDeviceId(ccmMobileDevice.getDeviceId());
        if (ccmTracingpoint.getIsNewRecord()) {
            User userDto = new User(userId);
            ccmTracingpoint.setCreateBy(userDto);
            ccmTracingpoint.setUpdateBy(userDto);
        }
        ccmTracingpoint.setCurDate(new Date());
        ccmTracingpoint.setUser(new User(userId));
        ccmTracingpointService.save(ccmTracingpoint);

        //判断是否越界告警
        String eFenceScope = ccmMobileDeviceDB.getEfenceScope();
        if (!"".equals(eFenceScope) && null != eFenceScope) {//存在电子围栏设置时
            String[] points = areaPiont.split(",");
            Point pointApp = new Point(Double.parseDouble(points[0]), Double.parseDouble(points[1]));//app点位

            //电子围栏区域
            List<Point> eFencePointList = new ArrayList<>();
            String[] eFencePoints = eFenceScope.split(";");
            for (int i = 0; i < eFencePoints.length; i++) {
                Point point = new Point(Double.parseDouble(eFencePoints[i].split(",")[0]), Double.parseDouble(eFencePoints[i].split(",")[1]));
                eFencePointList.add(point);
            }
            MapUtil mu=new MapUtil();
            boolean isPointInPolygon = mu.isPointInPolygon(pointApp, eFencePointList);//在围栏里面返回true，不报警，false则报警
            if (!isPointInPolygon) {
                CcmAlarmLog ccmAlarmLog = new CcmAlarmLog();
                ccmAlarmLog.setAlarmType("01");
                ccmAlarmLog.setObjTable("ccm_mobile_device");
                ccmAlarmLog.setObjId(ccmMobileDevice.getDeviceId());//存放设备ID
                User userDto = new User(userId);
                ccmAlarmLog.setCreateBy(userDto);//用户
                ccmAlarmLog.setUpdateBy(userDto);
                ccmAlarmLog.setCreateDate(new Date());
                ccmAlarmLog.setUpdateDate(new Date());
                ccmAlarmLog.setDelFlag("0");
                ccmAlarmLog.setParam(ccmMobileDeviceDB.getId());//存放记录ID
                List<CcmAlarmLog> listOverstep = ccmAlarmLogService.findListOverstep(ccmAlarmLog);//查找判断是否越界告警
                for(CcmAlarmLog l:listOverstep){
                    CcmAlarmLog ccmAlarmLog2 = new CcmAlarmLog();
                    ccmAlarmLog2 = ccmAlarmLog;
                    ccmAlarmLog2.setId(l.getId());//id
                    ccmAlarmLog2.setCreateDate(l.getCreateDate());//开始时间
                    ccmAlarmLogService.save(ccmAlarmLog2);//修改
                }
                if(listOverstep.size()==0){
                    ccmAlarmLogService.save(ccmAlarmLog);//保存
                }

                ccmMobileDeviceDB.setIsAlarm("1");// 是否越界-是
                Map<String, String> stringStringMap = new HashMap<>();
                stringStringMap.put("id", ccmMobileDeviceDB.getDeviceId());
                stringStringMap.put("name", "出栏警告！");
                MessageTools.sendAppMsgByUserId(ccmMobileDeviceDB.getCreateBy().getId(), stringStringMap);

            }
        }

        ccmMobileDeviceService.save(ccmMobileDeviceDB);//保存移动设备管理

        result.setCode(CcmRestType.OK);
        result.setResult("成功");
        return result;
    }

    /**
     * 验证密码
     * @param plainPassword 明文密码
     * @param password 密文密码
     * @return 验证成功返回true
     */
    public static boolean validatePassword(String plainPassword, String password) {
        String plain = Encodes.unescapeHtml(plainPassword);
        byte[] salt = Encodes.decodeHex(password.substring(0,16));
        byte[] hashPassword = Digests.sha1(plain.getBytes(), salt, HASH_INTERATIONS);
        return password.equals(Encodes.encodeHex(salt)+Encodes.encodeHex(hashPassword));
    }


    @ResponseBody
    @RequestMapping(value = "location", method = RequestMethod.POST)
    public CcmRestResult location(CcmMobileDevice ccmMobileDevice) {
        CcmRestResult result = new CcmRestResult();
        // 向移动设备表存入数据
        CcmMobileDevice ccmMobileDeviceDB = ccmMobileDeviceService.findByDeviceId(ccmMobileDevice.getDeviceId());

        if (ccmMobileDeviceDB == null) {
            result.setCode(CcmRestType.ERROR_PARAM);
            return result;
        }
        if (ccmMobileDeviceDB.getElecFenceInfo() != null) {


            // 判断是否越界告警
            String eFenceScope = ccmMobileDeviceDB.getElecFenceInfo().getAreaMap();
            if (!"".equals(eFenceScope) && null != eFenceScope) {// 存在电子围栏设置时
                String[] points = ccmMobileDevice.getAreaPoint().split(",");
                Point pointApp = new Point(Double.parseDouble(points[0]), Double.parseDouble(points[1]));// app点位

                // 电子围栏区域
                List<Point> eFencePointList = new ArrayList<>();
                String[] eFencePoints = eFenceScope.split(";");
                for (int i = 0; i < eFencePoints.length; i++) {
                    Point point = new Point(Double.parseDouble(eFencePoints[i].split(",")[0]),
                            Double.parseDouble(eFencePoints[i].split(",")[1]));
                    eFencePointList.add(point);
                }
//			MapUtil mu = new MapUtil();
                boolean isPointInPolygon = MapUtil.isPointInPolygon(pointApp, eFencePointList);// 在围栏里面返回true，不报警，false则报警
                if (!isPointInPolygon && System.currentTimeMillis() - ccmMobileDeviceDB.getUpdateDate().getTime() > 60) {
                    ccmMobileDeviceDB.setIsAlarm("1");// 是否越界-是
                    ccmMobileDeviceDB.setUpdateDate(new Date());
                    ccmMobileDeviceDB.setAreaPoint(ccmMobileDevice.getAreaPoint());
                    ccmMobileDeviceService.save(ccmMobileDeviceDB);// 保存移动设备管理

                    Map<String, String> stringStringMap = new HashMap<>();
                    stringStringMap.put("id", ccmMobileDeviceDB.getDeviceId());
                    stringStringMap.put("name", ccmMobileDeviceDB.getvCcmTeam().getName() + "-出栏警告！");
                    MessageTools.sendAppMsgByUserId(ccmMobileDeviceDB.getCreateBy().getId(), stringStringMap);

                }
            }
        }

        // 向巡逻点位表存入数据
        CcmTracingpoint ccmTracingpoint = new CcmTracingpoint();
        ccmTracingpoint.setAreaPoint(ccmMobileDevice.getAreaPoint());
        ccmTracingpoint.setDeviceId(ccmMobileDevice.getDeviceId());
        ccmTracingpoint.setUser(new User(ccmMobileDevice.getUserId()));
        ccmTracingpoint.setCurDate(new Date());
        ccmTracingpointService.save(ccmTracingpoint);
        result.setCode(CcmRestType.OK);
        return result;
    }

    /**
     * 获取消息验证
     *
     * @param deviceId
     * @param policeAccount
     * @param req
     * @param resp
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/validate", method = RequestMethod.POST)
    public CcmRestResult validate(String deviceId, String policeAccount, HttpServletRequest req, HttpServletResponse resp) {
        CcmRestResult result = new CcmRestResult();
        if (deviceId == null || "".equals(deviceId) || policeAccount == null || "".equals(policeAccount)) {
            result.setCode(CcmRestType.ERROR_PARAM);
            return result;
        }
        StringBuilder sb = new StringBuilder(deviceId);
        sb.append(policeAccount);

        User userDB = UserUtils.getByLoginName(policeAccount);
        if (userDB == null) {
            result.setCode(CcmRestType.ERROR_NO_USER);
            return result;
        }
        String captcha = getNonceStr();
        Map<String, String> map = Maps.newHashMap();
        map.put("name", "验证码:" + captcha);
        map.put("type", "CAPTCHA");
        map.put("id", captcha);
        System.out.println(captcha);
        CacheUtils.put(sb.toString(), captcha);
        MessageTools.sendAppMsgByUserId(userDB.getId(), map);
        result.setCode(CcmRestType.OK);
        return result;
    }

    /**
     * 重点人员添加到设备管理
     *
     * @param deviceId      设备号
     * @param policeAccount 警察账号
     * @param captcha       验证码
     * @param peopleId      重点人员id
     * @param areaPonit     当前位置
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/savepel", method = RequestMethod.POST)
    public CcmRestResult isValidate(String deviceId, String policeAccount, String captcha, String peopleId, String areaPonit) {
        CcmRestResult result = new CcmRestResult();
        if (StringTool.isAllEmpty(deviceId, policeAccount, captcha, peopleId, areaPonit)) {
            result.setCode(CcmRestType.ERROR_PARAM);
            return result;
        }
        String string = (String) CacheUtils.get(deviceId + policeAccount);
        if (string == null) {
            result.setCode(CcmRestType.ERROR_PARAM);
            return result;
        }
        if (!string.equals(captcha)) {
            result.setCode(CcmRestType.ERROR__VERIFICATION_CODE_INCORRECT);
            return result;
        }
        CcmPeople ccmPeople = ccmPeopleService.get(peopleId);
        if (ccmPeople == null) {
            result.setCode(CcmRestType.ERROR_NOT_EXIST_CRUCIAL_DATA);
            return result;
        }

        CcmMobileDevice byDeviceId = ccmMobileDeviceService.findByDeviceId(deviceId);
        CcmMobileDevice ccmMobileDevice = new CcmMobileDevice();
        if (byDeviceId != null) {
            ccmMobileDevice.setId(deviceId);
        }
        VCcmTeam vCcmTeam = new VCcmTeam();
        vCcmTeam.setId(ccmPeople.getId());
        ccmMobileDevice.setvCcmTeam(vCcmTeam);
        ccmMobileDevice.setParentId(peopleId);
        //用户id
        ccmMobileDevice.setDeviceId(deviceId);
        //管控 type 类型 数据字典里的value
        ccmMobileDevice.setUseType("02");
        ccmMobileDevice.setAreaPoint(areaPonit);
        //授权可接入 状态
        ccmMobileDevice.setIsVariable("02");
        ccmMobileDevice.setCreateBy(UserUtils.getByLoginName(policeAccount));
        ccmMobileDeviceService.save(ccmMobileDevice);
        result.setCode(CcmRestType.OK);

        return result;
    }

    /**
     * 获得警察id
     *
     * @param policeAccount 警察账号
     * @return
     */
    @RequestMapping(value = "getPoliceId", method = RequestMethod.POST)
    @ResponseBody
    public CcmRestResult getPoliceId(String policeAccount) {
        CcmRestResult result = new CcmRestResult();
        result.setResult(UserUtils.getByLoginName(policeAccount));
        result.setCode(CcmRestType.OK);
        return result;
    }


    @ResponseBody
    @RequestMapping(value = "/special", method = RequestMethod.POST)
    public CcmRestResult special(String name, String type) {
        CcmRestResult result = new CcmRestResult();
        if (StringTool.isAllBlank(name, type)) {
            result.setCode(CcmRestType.ERROR_PARAM);
            return result;
        }
        try {
            Dict dict = new Dict();
            //重点人群 数据字典type
            dict.setType("emphasis_people_type");
            dict.setValue(type);
            List<Dict> list = dictService.findList(dict);
            if (list.isEmpty()) {
                result.setCode(CcmRestType.ERROR_PARAM);
                return result;
            }
            List<CcmPeople> listByName = ccmPeopleService.findListByName(list.get(0).getRemarks(), name);
            result.setResult(listByName);
            result.setCode(CcmRestType.OK);
            return result;
        } catch (Exception e) {
            System.out.println(e);
            result.setCode(CcmRestType.ERROR_PARAM);
            return result;
        }


    }

    /**
     * 根据设备号判断是否 注册过
     *
     * @param deviceId
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/isRegistered", method = RequestMethod.POST)
    public CcmRestResult isRegistered(String deviceId) {
        CcmRestResult result = new CcmRestResult();

        CcmMobileDevice ccmMobileDevice = new CcmMobileDevice();
        ccmMobileDevice.setDeviceId(deviceId);
        List<CcmMobileDevice> list = ccmMobileDeviceService.findList(ccmMobileDevice);
        if (list == null || list.size() == 0) {
            result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
            return result;
        }
        Map<String, Object> map = new HashMap<>();
        map.put("peopleId", list.get(0).getvCcmTeam().getId());
        map.put("policeId", list.get(0).getCreateBy().getId());
        map.put("policeName", userDao.get(new User(list.get(0).getCreateBy().getId())).getName());

        result.setResult(map);
        result.setCode(CcmRestType.OK);

        return result;
    }


    public static String getNonceStr() {
        char[] nonceChars = new char[6];

        for (int index = 0; index < nonceChars.length; ++index) {
            nonceChars[index] = SYMBOLS.charAt(RANDOM.nextInt(SYMBOLS.length()));
        }

        return new String(nonceChars);
    }
}