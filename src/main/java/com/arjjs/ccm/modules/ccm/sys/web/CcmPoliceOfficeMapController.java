package com.arjjs.ccm.modules.ccm.sys.web;


import com.arjjs.ccm.modules.ccm.place.casino.entity.CcmPlaceCasino;
import com.arjjs.ccm.modules.ccm.place.casino.service.CcmPlaceCasinoService;
import com.arjjs.ccm.modules.ccm.ccmsys.entity.CcmDevice;
import com.arjjs.ccm.modules.ccm.ccmsys.service.CcmDeviceService;
import com.arjjs.ccm.modules.ccm.place.hotel.entity.CcmPlaceHotel;
import com.arjjs.ccm.modules.ccm.place.hotel.service.CcmPlaceHotelService;
import com.arjjs.ccm.modules.ccm.org.entity.CcmOrgArea;
import com.arjjs.ccm.modules.ccm.org.service.CcmOrgAreaService;
import com.arjjs.ccm.modules.ccm.place.base.service.CcmBasePlaceService;
import com.arjjs.ccm.modules.ccm.pop.entity.CcmPopTenant;
import com.arjjs.ccm.modules.ccm.pop.service.CcmPeopleService;
import com.arjjs.ccm.modules.ccm.rest.entity.AlarmHandleInfo;
import com.arjjs.ccm.modules.ccm.rest.service.AlarmHandleInfoService;
import com.arjjs.ccm.modules.ccm.pop.service.CcmPopTenantService;
import com.arjjs.ccm.tool.EchartType;
import com.arjjs.ccm.tool.geoJson.Features;
import com.arjjs.ccm.tool.geoJson.GeoJSON;
import com.arjjs.ccm.tool.geoJson.Geometry;
import com.arjjs.ccm.tool.geoJson.Properties;
import com.google.common.collect.Lists;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "${adminPath}/sys/policemap")
public class CcmPoliceOfficeMapController {

    // 人员管理
    @Autowired
    private CcmPeopleService ccmPeopleService;

    @Autowired
    private CcmOrgAreaService ccmOrgAreaService;

    //出租房数据
    @Autowired
    private CcmPopTenantService ccmPopTenantService;
    //警情事件
    @Autowired
    private AlarmHandleInfoService alarmHandleInfoService;
    // 设备管理
    @Autowired
    private CcmDeviceService ccmDeviceService;

    @Autowired
    private CcmPlaceCasinoService ccmPlaceCasinoService;

    @Autowired
    private CcmBasePlaceService ccmBasePlaceService;

    @Autowired
    private CcmPlaceHotelService ccmPlaceHotelService;

    /**
     * 查询重点人员数据
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "getKeyPeopleNum")
    public GeoJSON getKeyPeopleNum(){
        CcmOrgArea ccmOrgArea = new CcmOrgArea();
        ccmOrgArea.setType("7");
        List<CcmOrgArea>  resOrgArealist = ccmOrgAreaService.findAreaList(ccmOrgArea);
        // 返回对象
        GeoJSON geoJSON = new GeoJSON();
        List<Features> featureList = new ArrayList<Features>();
        for (CcmOrgArea resccmOrgArea : resOrgArealist) {
            // 特征,属性
            Features featureDto = new Features();
            Properties properties = new Properties();
            // 1 type 默认不填
            // 2 id 添加
            featureDto.setId(resccmOrgArea.getId());
            // 3 properties 展示属性信息
           /* String keyPersonnelNum = "";
            int num = 0;
            if(resccmOrgArea.getKeyPersonnelNum()!=null){
                keyPersonnelNum = resccmOrgArea.getKeyPersonnelNum().toString();
                num = resccmOrgArea.getKeyPersonnelNum();
            }
            properties.setName(keyPersonnelNum);
            if(num<100){
                properties.setIcon("map_num1.png");
            } else if(num>=100 && num<400){
                properties.setIcon("map_num2.png");
            } else if(num>=400 && num<700){
                properties.setIcon("map_num3.png");
            } else if(num>=7000){
                properties.setIcon("map_num4.png");
            }*/
            // 点击后展示详细属性值
            Map<String, Object> map_P = new HashMap<String, Object>();
            properties.addInfo(map_P);
            featureList.add(featureDto);
            featureDto.setProperties(properties);
            // 4 geometry 配置参数
            Geometry geometry = new Geometry();
            featureDto.setGeometry(geometry);
            // 点位信息 测试为点
            geometry.setType("Point");
            // 为中心点赋值
            if (!StringUtils.isEmpty(resccmOrgArea.getAreaPoint())) {
                // 获取中心点的值
                String[] centpoint = resccmOrgArea.getAreaPoint().split(",");
                // 图层中心的
                geoJSON.setCentpoint(centpoint);
                // 图形中心点
                properties.setCoordinateCentre(centpoint);
            }
            // 添加具体数据
            // 封装的list
            List<String> Coordinateslist = new ArrayList<>();
            // 当前是否为空如果为空则进行添加空数组 ，否则进行拆分添加数据
            String[] a = (StringUtils.isEmpty(resccmOrgArea.getAreaPoint()) ? (",") : resccmOrgArea.getAreaPoint()).split(",");
            // 填充数据
            if (a.length < 2) {
                Coordinateslist.add("");
                Coordinateslist.add("");
            } else {
                Coordinateslist.add(a[0]);
                Coordinateslist.add(a[1]);
            }
            // 装配点位
            geometry.setCoordinates(Coordinateslist);
        }

        // 添加数据
        geoJSON.setFeatures(featureList);
        // 如果无数据
        if (featureList.size() == 0) {
            return null;
        }
        return geoJSON;
    }


    /**
     * @see  /生成视频地图信息点位图
     * @param ccmDevice
     * @param
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "deviceiveMap")
    public GeoJSON deviceiveMap(CcmDevice ccmDevice) {
        // 查询地图视频信息
        List<CcmDevice> ccmdevicelist = ccmDeviceService.findList(ccmDevice);
        // 返回对象
        GeoJSON geoJSON = new GeoJSON();
        List<Features> featureList = new ArrayList<Features>();
        // 数组
        for (CcmDevice device : ccmdevicelist) {
            // 特征,属性
            Features featureDto = new Features();
            Properties properties = new Properties();
            // 1 type 默认不填
            // 2 id 添加
            featureDto.setId(device.getId());
            // 3 properties 展示属性信息
//            properties.setName(device.getName());
//            properties.setIcon(device.getImagePath());
            if(device.getStatus().equals("1")){
                properties.setIcon("map_sxt-zxshow.png");
            } else if(device.getStatus().equals("2")){
                properties.setIcon("map_sxt-lxshow.png");
            }
            // 点击后展示详细属性值
            Map<String, Object> map_P = new HashMap<String, Object>();
            // 创建附属信息
      /*      map_P.put("设备名称", device.getName());
            map_P.put("设备编号", device.getCode());
            //IP地址表中没数据，去掉
            map_P.put("监控类型", device.getType());
            map_P.put("安装位置", device.getAddress());
            map_P.put("设备状态", device.getStatus());*/
            //map_P.put("监控设备类型", device.getType());
            properties.addInfo(map_P);
            featureList.add(featureDto);
            featureDto.setProperties(properties);
            // 4 geometry 配置参数
            Geometry geometry = new Geometry();
            featureDto.setGeometry(geometry);
            // 点位信息 测试为点
            geometry.setType("Point");
            // 为中心点赋值
            if (!com.arjjs.ccm.common.utils.StringUtils.isEmpty(device.getCoordinate())) {
                // 获取中心点的值
                String[] centpoint = device.getCoordinate().split(",");
                // 图层中心的
                geoJSON.setCentpoint(centpoint);
                // 图形中心点
                properties.setCoordinateCentre(centpoint);
            }
            // 添加具体数据
            // 封装的list
            List<String> Coordinateslist = new ArrayList<>();
            // 当前是否为空如果为空则进行添加空数组 ，否则进行拆分添加数据
            String[] a = (com.arjjs.ccm.common.utils.StringUtils.isEmpty(device.getCoordinate()) ? (",") : device.getCoordinate()).split(",");
            // 填充数据
            if (a.length < 2) {
                Coordinateslist.add("");
                Coordinateslist.add("");
            } else {
                Coordinateslist.add(a[0]);
                Coordinateslist.add(a[1]);
            }
            // 装配点位
            geometry.setCoordinates(Coordinateslist);
            // 5 geometry 配置参数
            // 配置视频信号信息
          /*  Map<String, String> map_V = new HashMap<String, String>();
            // 协议，设备参数信息
            map_V.put("protocol", device.getProtocol());
            map_V.put("param", device.getParam());
            map_V.put("ip", device.getIp());
            map_V.put("port", device.getPort());
            map_V.put("username", device.getAccount());
            map_V.put("password", device.getPassword());
            map_V.put("typeVidicon", device.getTypeVidicon());
            map_V.put("code", device.getCode());
            properties.setVideo(map_V);*/
        }

        // 添加数据
        geoJSON.setFeatures(featureList);
        // 如果无数据
        if (featureList.size() == 0) {
            return null;
        }
        return geoJSON;
    }



    /**
     * 生成场所特业地图信息点位图
     * @param
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "getBasePlaceMap")
    public GeoJSON getBasePlaceMap() {
        String[] nums = {"01","02","03","08"};        //KTV 03   宾馆 01  02  足浴08  网吧02
        List<CcmPlaceCasino> casinosfindListAll = Lists.newArrayList();
        List<CcmPlaceHotel> hotelfindListAll = Lists.newArrayList();
        for(String num : nums){
            if(!num.equals("01")){
                CcmPlaceCasino ccmPlaceCasino = new CcmPlaceCasino();
                ccmPlaceCasino.setType(num);
                List<CcmPlaceCasino> casinosfindList = ccmPlaceCasinoService.findList(ccmPlaceCasino);
                casinosfindListAll.addAll(casinosfindList);
            }

            if(!num.equals("03") || !num.equals("08")){
                CcmPlaceHotel ccmPlaceHotel = new CcmPlaceHotel();
                ccmPlaceHotel.setType("01");
                List<CcmPlaceHotel> hotelfindList = ccmPlaceHotelService.findList(ccmPlaceHotel);
                hotelfindListAll.addAll(hotelfindList);
            }
        }

        List<EchartType> reslist = Lists.newArrayList();
        for(CcmPlaceCasino ccmPlaceCasino : casinosfindListAll){
            EchartType echartType = new EchartType();
            echartType.setType(ccmPlaceCasino.getType());
            echartType.setValue(ccmPlaceCasino.getId());
            echartType.setValue1(ccmPlaceCasino.getAreaPoint());
            reslist.add(echartType);
        }
        for(CcmPlaceHotel ccmPlaceHotel : hotelfindListAll){
            EchartType echartType = new EchartType();
            echartType.setType(ccmPlaceHotel.getType());
            echartType.setValue(ccmPlaceHotel.getId());
            echartType.setValue1(ccmPlaceHotel.getAreaPoint());
            reslist.add(echartType);
        }

        // 返回对象
        GeoJSON geoJSON = new GeoJSON();
        List<Features> featureList = new ArrayList<Features>();
        // 数组
        for (EchartType echartType : reslist) {
            // 特征,属性
            Features featureDto = new Features();
            Properties properties = new Properties();
            // 1 type 默认不填
            // 2 id 添加
            featureDto.setId(echartType.getValue());
            // 3 properties 展示属性信息
//          properties.setName(resccmPlaceCasino.getCcmBasePlace().getPlaceName());
//          properties.setIcon(device.getImagePath());      //图标
            properties.setIcon("video.png");      //图标
            if(echartType.getType().equals("01")){
                properties.setIcon("map_bgshow.png");      //宾馆
            } else if(echartType.getType().equals("02")){
                properties.setIcon("map_wbshow.png");      //网吧
            } else if(echartType.getType().equals("03")){
                properties.setIcon("map_ktvshow.png");      //KTV
            } else if(echartType.getType().equals("08")){
                properties.setIcon("map_zyshow.png");      //足浴
            }

            // 点击后展示详细属性值
            Map<String, Object> map_P = new HashMap<String, Object>();
            properties.addInfo(map_P);
            featureList.add(featureDto);
            featureDto.setProperties(properties);
            // 4 geometry 配置参数
            Geometry geometry = new Geometry();
            featureDto.setGeometry(geometry);
            // 点位信息 测试为点
            geometry.setType("Point");
            // 为中心点赋值
            if (!com.arjjs.ccm.common.utils.StringUtils.isEmpty(echartType.getValue1())) {
                // 获取中心点的值
                String[] centpoint = echartType.getValue1().split(",");
                // 图层中心的
                geoJSON.setCentpoint(centpoint);
                // 图形中心点
                properties.setCoordinateCentre(centpoint);
            }
            // 添加具体数据
            // 封装的list
            List<String> Coordinateslist = new ArrayList<>();
            // 当前是否为空如果为空则进行添加空数组 ，否则进行拆分添加数据
            String[] a = (com.arjjs.ccm.common.utils.StringUtils.isEmpty(echartType.getValue1()) ? (",") : echartType.getValue1()).split(",");
            // 填充数据
            if (a.length < 2) {
                Coordinateslist.add("");
                Coordinateslist.add("");
            } else {
                Coordinateslist.add(a[0]);
                Coordinateslist.add(a[1]);
            }
            // 装配点位
            geometry.setCoordinates(Coordinateslist);
        }

        // 添加数据
        geoJSON.setFeatures(featureList);
        // 如果无数据
        if (featureList.size() == 0) {
            return null;
        }
        return geoJSON;
    }

    /*
    * 查询出租屋数据
    * */

    @ResponseBody
    @RequestMapping(value = "getLetNum")
    public GeoJSON getLetNum(){
        CcmPopTenant ccmPopTenant = new CcmPopTenant();
        ccmPopTenant.setType("7");
        ccmPopTenant.setHouseType("02");
        //返回对象数据
        List<CcmPopTenant> letList = ccmPopTenantService.findLet(ccmPopTenant);
        // 返回对象
        GeoJSON geoJSON = new GeoJSON();
        List<Features> featureList = new ArrayList<Features>();
        for (CcmPopTenant popTenant : letList) {
            // 特征,属性
            Features featureDto = new Features();
            Properties properties = new Properties();
            // 1 type 默认不填
            // 2 id 添加
            featureDto.setId(popTenant.getId());
            // 3 properties 展示属性信息
        /*    String LetNum="";
            int num = 0;
            if (popTenant.getLetNum()!=null){
                LetNum=popTenant.getLetNum().toString();
                num = popTenant.getLetNum();
            }
            properties.setName(LetNum);
            if(num<100){
                properties.setIcon("map_num1.png");
            } else if(num>=100 && num<400){
                properties.setIcon("map_num2.png");
            } else if(num>=400 && num<700){
                properties.setIcon("map_num3.png");
            } else if(num>=7000){
                properties.setIcon("map_num4.png");
            }*/
            // 点击后展示详细属性值
            Map<String, Object> map_P = new HashMap<String, Object>();
            properties.addInfo(map_P);
            featureList.add(featureDto);
            featureDto.setProperties(properties);
            // 4 geometry 配置参数
            Geometry geometry = new Geometry();
            featureDto.setGeometry(geometry);
            // 点位信息 测试为点
            geometry.setType("Point");
            // 为中心点赋值
            if (!StringUtils.isEmpty(popTenant.getAreaPoint())) {
                // 获取中心点的值
                String[] centpoint = popTenant.getAreaPoint().split(",");
                // 图层中心的
                geoJSON.setCentpoint(centpoint);
                // 图形中心点
                properties.setCoordinateCentre(centpoint);
            }
            // 添加具体数据
            // 封装的list
            List<String> Coordinateslist = new ArrayList<>();
            // 当前是否为空如果为空则进行添加空数组 ，否则进行拆分添加数据
            String[] a = (StringUtils.isEmpty(popTenant.getAreaPoint()) ? (",") : popTenant.getAreaPoint()).split(",");
            // 填充数据
            if (a.length < 2) {
                Coordinateslist.add("");
                Coordinateslist.add("");
            } else {
                Coordinateslist.add(a[0]);
                Coordinateslist.add(a[1]);
            }
            // 装配点位
            geometry.setCoordinates(Coordinateslist);
        }
        // 添加数据
        geoJSON.setFeatures(featureList);
        // 如果无数据
        if (featureList.size() == 0) {
            return null;
        }
        return geoJSON;
    }

    /*
     * 查询警情事件数据
     * */

    @ResponseBody
    @RequestMapping(value = "getAlarm")
    public GeoJSON getAlarmInfo(){
        AlarmHandleInfo alarmHandleInfo = new AlarmHandleInfo();
        ArrayList<AlarmHandleInfo> alarmHandleInfos = new ArrayList<>();
        alarmHandleInfo.setType("7");
        //返回对象数据
        List<AlarmHandleInfo> alarmList = alarmHandleInfoService.findAlarm(alarmHandleInfo);
        // 返回对象
        GeoJSON geoJSON = new GeoJSON();
        List<Features> featureList = new ArrayList<Features>();
        for (AlarmHandleInfo alarminfo : alarmList) {
            double x = alarminfo.getX();
            double y = alarminfo.getY();
            if (x>0&&y>0){
                alarminfo.setAlarmPoint(x+","+y);
            }
            // 特征,属性
            Features featureDto = new Features();
            Properties properties = new Properties();
            // 1 type 默认不填
            // 2 id 添加
            featureDto.setId(alarminfo.getId());
            // 3 properties 展示属性信息
       /*     String alarmNum = "";
            int num = 0;
            if (alarminfo.getAlarmNum() != null) {
                alarmNum = alarminfo.getAlarmNum().toString();
                num =  alarminfo.getAlarmNum();
            }
            properties.setName(alarmNum);
            if(num<100){
                properties.setIcon("map_num1.png");
            } else if(num>=100 && num<400){
                properties.setIcon("map_num2.png");
            } else if(num>=400 && num<700){
                properties.setIcon("map_num3.png");
            } else if(num>=7000){
                properties.setIcon("map_num4.png");
            }*/
            // 点击后展示详细属性值
            Map<String, Object> map_P = new HashMap<String, Object>();
            properties.addInfo(map_P);
            featureList.add(featureDto);
            featureDto.setProperties(properties);
            // 4 geometry 配置参数
            Geometry geometry = new Geometry();
            featureDto.setGeometry(geometry);
            // 点位信息 测试为点
            geometry.setType("Point");
            // 为中心点赋值
            if (!StringUtils.isEmpty(alarminfo.getAlarmPoint())) {
                // 获取中心点的值
                String[] centpoint = alarminfo.getAlarmPoint().split(",");
                // 图层中心的
                geoJSON.setCentpoint(centpoint);
                // 图形中心点
                properties.setCoordinateCentre(centpoint);
                // 添加具体数据
                // 封装的list
                List<String> Coordinateslist = new ArrayList<>();
                // 当前是否为空如果为空则进行添加空数组 ，否则进行拆分添加数据
                String[] a = (StringUtils.isEmpty(alarminfo.getAlarmPoint()) ? (",") : alarminfo.getAlarmPoint()).split(",");
                // 填充数据
                if (a.length < 2) {
                    Coordinateslist.add("");
                    Coordinateslist.add("");
                } else {
                    Coordinateslist.add(a[0]);
                    Coordinateslist.add(a[1]);
                    // 装配点位
                    geometry.setCoordinates(Coordinateslist);
                }

                // 添加数据
                geoJSON.setFeatures(featureList);
                // 如果无数据
                if (featureList.size() == 0) {
                    return null;
                }
            }
        }
        return geoJSON;
    }
}
