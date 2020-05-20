package com.arjjs.ccm.modules.ccm.rest.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.arjjs.ccm.common.config.Global;
import com.arjjs.ccm.common.utils.StringUtils;
import com.arjjs.ccm.modules.ccm.org.entity.SysArea;
import com.arjjs.ccm.modules.ccm.org.service.SysAreaService;
import com.arjjs.ccm.modules.ccm.place.base.entity.CcmBasePlace;
import com.arjjs.ccm.modules.ccm.place.base.service.CcmBasePlaceService;
import com.arjjs.ccm.modules.ccm.rest.service.CcmRestAreaService;
import com.arjjs.ccm.modules.sys.entity.Area;
import com.arjjs.ccm.tool.CommUtilRest;
import com.arjjs.ccm.tool.geoJson.Features;
import com.arjjs.ccm.tool.geoJson.GeoJSON;
import com.arjjs.ccm.tool.geoJson.Geometry;
import com.arjjs.ccm.tool.geoJson.Properties;
import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.web.BaseController;
import com.arjjs.ccm.modules.ccm.org.entity.CcmOrgNpse;
import com.arjjs.ccm.modules.ccm.org.service.CcmOrgNpseService;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestResult;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestType;
import com.arjjs.ccm.modules.sys.entity.User;

/**
 * 重点场所接口类
 *
 * @author pengjianqiang
 * @version 2018-02-23
 */
@Controller
@RequestMapping(value = "${appPath}/rest/keyPlace")
public class CcmRestKeyPlace extends BaseController {

    @Autowired
    private SysAreaService sysAreaService;
    @Autowired
    private CcmOrgNpseService ccmOrgNpseService;
    @Autowired
    private CcmBasePlaceService ccmBasePlaceService;
    @Autowired
    private CcmRestAreaService ccmRestAreaService;

    /**
     * 查询重点场所详情
     *
     * @param userId
     * @param req
     * @param resp
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/getPlace", method = RequestMethod.GET)
    public CcmRestResult getPlace(String userId, HttpServletRequest req, HttpServletResponse resp, String id) {
        CcmRestResult result = CommUtilRest.getResult(userId, req, resp, id);
        CcmBasePlace ccmBasePlace = ccmBasePlaceService.get(id);
        String file1 = ccmBasePlace.getPlacePicture();
        if (StringUtils.isNotEmpty(file1)) {
            String fileUrl = Global.getConfig("FILE_UPLOAD_URL");
            ccmBasePlace.setPlacePicture(fileUrl + file1);
        }
        result.setCode(CcmRestType.OK);
        result.setResult(ccmBasePlace);
        return result;
    }

    /**
     * 查询重点场所列表
     *
     * @param userId
     * @param ccmBasePlace
     * @param req
     * @param resp
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/queryPlace", method = RequestMethod.GET)
    public CcmRestResult queryPlace(String userId, CcmBasePlace ccmBasePlace, HttpServletRequest req, HttpServletResponse resp) {
        CcmRestResult result = new CcmRestResult();
        User sessionUser = (User) req.getSession().getAttribute("user");
        if (sessionUser == null) {
            result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
            return result;
        }
        String sessionUserId = sessionUser.getId();
        if (userId == null || "".equals(userId) || !userId.equals(sessionUserId)) {
            result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
            return result;
        }
        ccmBasePlace.setCheckUser(sessionUser);
            Page<CcmBasePlace> page = ccmBasePlaceService.findPage(new Page<>(req, resp), ccmBasePlace);

            List<CcmBasePlace> list = page.getList();
            List<CcmBasePlace> resultList = Lists.newArrayList();
            list.forEach(ccmBasePlace1->{
                String file1 = ccmBasePlace1.getPlacePicture();
                if (StringUtils.isNotEmpty(file1)) {
                    String fileUrl = Global.getConfig("FILE_UPLOAD_URL");
                    ccmBasePlace1.setPlacePicture(fileUrl + file1);
                }
                resultList.add(ccmBasePlace1);
            });

            result.setCode(CcmRestType.OK);
            result.setResult(page.getList());
            return result;
    }


    /**
     * @see 生成场所地图信息-点位图（分页模式）
     * @param ccmBasePlace
     * @param model
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/queryPlaceMap",method = RequestMethod.GET)
    public CcmRestResult queryPlaceMap(String userId,CcmBasePlace ccmBasePlace, HttpServletRequest request, HttpServletResponse response) {

        CcmRestResult result = new CcmRestResult();
        User sessionUser = (User) request.getSession().getAttribute("user");
        if (sessionUser == null) {
            result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
            return result;
        }
        String sessionUserId = sessionUser.getId();
        if (userId == null || "".equals(userId) || !userId.equals(sessionUserId)) {
            result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
            return result;
        }
        ccmBasePlace.setCheckUser(sessionUser);

        //分页参数处理
        Page pageIn = new Page<CcmBasePlace>(request, response);
        // 查询地图场所信息
        List<CcmBasePlace> ccmBasePlacelist = new ArrayList<CcmBasePlace>();
        //可以选择父节点查询
        if(ccmBasePlace.getArea()!=null&&ccmBasePlace.getArea().getId()!=null&&!ccmBasePlace.getArea().getId().equals("")){
            SysArea sysArea = sysAreaService.get(ccmBasePlace.getArea().getId());
            Area area = new Area();
            area.setId(sysArea.getId());
            area.setParentIds(sysArea.getParentIds());
            ccmBasePlace.setUserArea(area);
            ccmBasePlace.setArea(null);
        }
        Page<CcmBasePlace> page = ccmBasePlaceService.findPage(pageIn, ccmBasePlace);
        ccmBasePlacelist = page.getList();

        // 返回对象
        GeoJSON geoJSON = new GeoJSON();

        geoJSON.setCount(page.getCount());
        geoJSON.setPageNo(page.getPageNo());
        geoJSON.setPageSize(page.getPageSize());

        List<Features> featureList = new ArrayList<Features>();
        // 数组
        for (CcmBasePlace basePlace : ccmBasePlacelist) {
            String fileUrl = Global.getConfig("FILE_UPLOAD_URL");
            if(StringUtils.isNotEmpty(basePlace.getPlacePicture())){
                basePlace.setPlacePicture(fileUrl + basePlace.getPlacePicture());
            }
            Area area = basePlace.getArea();
            // 特征,属性
            Features featureDto = new Features();
            Properties properties = new Properties();
            // 1 type 默认不填
            // 2 id 添加
            featureDto.setId(basePlace.getId());
            // 3 properties 展示属性信息
            properties.setName(basePlace.getPlaceName());
            properties.setIcon(basePlace.getPlacePicture());
            // 点击后展示详细属性值
            Map<String, Object> map_P = new HashMap<String, Object>();
            // 创建附属信息
            map_P.put("场所名称", basePlace.getPlaceName());
            map_P.put("重点属性", basePlace.getKeyPoint());
            map_P.put("场所面积", basePlace.getPlaceArea());
            map_P.put("场所用途", basePlace.getPlaceUse());
            map_P.put("负责人姓名", basePlace.getLeaderName());
            map_P.put("负责人电话", basePlace.getLeaderContact());
            map_P.put("主管单位名称", basePlace.getGoverningBodyName());
            map_P.put("地址", basePlace.getAddress());
            map_P.put("场所类型", basePlace.getPlaceType());
            map_P.put("场所图片", basePlace.getPlacePicture());
            if (area!=null&&area.getName()!=null){
                map_P.put("gridComAddress", area.getName() + "");
            }else {
                map_P.put("gridComAddress", "" + "");
            }
            properties.addInfo(map_P);
            featureList.add(featureDto);
            featureDto.setProperties(properties);
            // 4 geometry 配置参数
            Geometry geometry = new Geometry();
            featureDto.setGeometry(geometry);
            // 点位信息 测试为点
            geometry.setType("Point");
            // 为中心点赋值
            if (!StringUtils.isEmpty(basePlace.getAreaPoint())) {
                // 获取中心点的值
                String[] centpoint = basePlace.getAreaPoint().split(",");
                geoJSON.setCentpoint(centpoint);
                // 添加图形中心点位信息
                properties.setCoordinateCentre(centpoint);
            }

            List<String> Coordinateslist = new ArrayList<>();
            // 当前是否为空如果为空则进行添加空数组 ，否则进行拆分添加数据
            String[] a = (StringUtils.isEmpty(basePlace.getAreaPoint()) ? (",") : basePlace.getAreaPoint()).split(",");
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
            result.setResult("");
        }else {
            result.setResult(geoJSON);
        }
        result.setCode(CcmRestType.OK);
        return result;
    }


    /**
     * 修改重点场所信息
     *
     * @param userId
     * @param ccmBasePlace
     * @param req
     * @param resp
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/modifyPlace", method = RequestMethod.POST)
    public CcmRestResult modifyPlace(String userId, CcmBasePlace ccmBasePlace, HttpServletRequest req, HttpServletResponse resp) {

        CcmRestResult result = CommUtilRest.getResult(userId, req, resp, ccmBasePlace.getId());
        CcmBasePlace ccmBasePlaceDB = ccmBasePlaceService.get(ccmBasePlace.getId());
        if (null !=ccmBasePlace.getPlaceName()) {
            ccmBasePlaceDB.setPlaceName(ccmBasePlace.getPlaceName());
        }
        if (null !=ccmBasePlace.getRelevanceOrg()) {
            ccmBasePlaceDB.setRelevanceOrg(ccmBasePlace.getRelevanceOrg());
        }
        if (null !=ccmBasePlace.getKeyPoint()) {
            ccmBasePlaceDB.setKeyPoint(ccmBasePlace.getKeyPoint());
        }
        if (null !=ccmBasePlace.getWorkerNumber()) {
            ccmBasePlaceDB.setWorkerNumber(ccmBasePlace.getWorkerNumber());
        }
        if (null !=ccmBasePlace.getPlaceUse()) {
            ccmBasePlaceDB.setPlaceUse(ccmBasePlace.getPlaceUse());
        }
        if (null !=ccmBasePlace.getPlaceArea()) {
            ccmBasePlaceDB.setPlaceArea(ccmBasePlace.getPlaceArea());
        }
        if (null !=ccmBasePlace.getLeaderName()) {
            ccmBasePlaceDB.setLeaderName(ccmBasePlace.getLeaderName());
        }
        if (null !=ccmBasePlace.getLeaderIdCard()) {
            ccmBasePlaceDB.setLeaderIdCard(ccmBasePlace.getLeaderIdCard());
        }
        if (null !=ccmBasePlace.getLeaderContact()) {
            ccmBasePlaceDB.setLeaderContact(ccmBasePlace.getLeaderContact());
        }
        if (null != ccmBasePlace.getCreateTime()) {
            ccmBasePlaceDB.setCreateTime(ccmBasePlace.getCreateTime());
        }
        if (null != ccmBasePlace.getArea()) {
            ccmBasePlaceDB.setAdministrativeDivision(ccmBasePlace.getArea().getId());
        }
        if (null !=ccmBasePlace.getAddress()){
            ccmBasePlaceDB.setAddress(ccmBasePlace.getAddress());
        }
        if (null !=ccmBasePlace.getGoverningBodyName()) {
            ccmBasePlaceDB.setGoverningBodyName(ccmBasePlace.getGoverningBodyName());
        }
        if (null !=ccmBasePlace.getRemarks()) {
            ccmBasePlaceDB.setRemarks(ccmBasePlace.getRemarks());
        }

        // 添加图片处理代码
        String images = ccmBasePlace.getPlacePicture();
        if (null !=images) {
            if(images.contains(Global.getConfig("FILE_UPLOAD_URL"))) {
                ccmBasePlaceDB.setPlacePicture(images.split(Global.getConfig("FILE_UPLOAD_URL"))[1]);
            }else {
                ccmBasePlaceDB.setPlacePicture(images);
            }
        }

        // CommUtilRest.updateDataWithPart(ccmBasePlace, ccmBasePlaceDB);

        ccmBasePlaceDB.setCreateBy(new User(userId));

        ccmBasePlace.setUpdateBy(new User(userId));
        ccmBasePlaceService.save(ccmBasePlaceDB);
        result.setCode(CcmRestType.OK);
        result.setResult("成功");
        return result;

    }


    /**
     * @param id ID
     * @return
     * @author pengjianqiang
     * @version 2018-02-23
     * @see 获取单个重点场所信息
     */
    @ResponseBody
    @RequestMapping(value = "/get", method = RequestMethod.GET)
    public CcmRestResult get(String userId, HttpServletRequest req, HttpServletResponse resp, String id) throws IOException {
        CcmRestResult result = new CcmRestResult();
        User sessionUser = (User) req.getSession().getAttribute("user");
        if (sessionUser == null) {
            result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
            return result;
        }
        String sessionUserId = sessionUser.getId();
        if (userId == null || "".equals(userId) || !userId.equals(sessionUserId)) {
            result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
            return result;
        }
        if (id == null || "".equals(id)) {//参数id不对
            result.setCode(CcmRestType.ERROR_PARAM);
            return result;
        }

        CcmOrgNpse ccmOrgNpse = ccmOrgNpseService.get(id);
        String fileUrl = Global.getConfig("FILE_UPLOAD_URL");
        if(StringUtils.isNotEmpty(ccmOrgNpse.getImages())){
            ccmOrgNpse.setImages(fileUrl + ccmOrgNpse.getImages());
        }
        result.setCode(CcmRestType.OK);
        result.setResult(ccmOrgNpse);

        return result;
    }

    /**
     * @param ccmOrgNpse(compImpoType 企业重点类型)
     * @param pageNo                  页码
     * @param pageSize                分页大小
     * @return
     * @author pengjianqiang
     * @version 2018-02-23
     * @see 查询重点场所信息
     */
    @ResponseBody
    @RequestMapping(value = "/query", method = RequestMethod.GET)
    public CcmRestResult query(String userId, CcmOrgNpse ccmOrgNpse, HttpServletRequest req, HttpServletResponse resp) throws IOException {
        CcmRestResult result = new CcmRestResult();
        User sessionUser = (User) req.getSession().getAttribute("user");
        if (sessionUser == null) {
            result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
            return result;
        }
        String sessionUserId = sessionUser.getId();
        if (userId == null || "".equals(userId) || !userId.equals(sessionUserId)) {
            result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
            return result;
        }
        ccmOrgNpse.setCheckUser(sessionUser);
        Page<CcmOrgNpse> page = ccmOrgNpseService.findPage(new Page<CcmOrgNpse>(req, resp), ccmOrgNpse);
        String fileUrl = Global.getConfig("FILE_UPLOAD_URL");
        for(int f=0;f<page.getList().size();f++){
            if (StringUtils.isNotEmpty(page.getList().get(f).getImages())) {
                page.getList().get(f).setImages(fileUrl + page.getList().get(f).getImages());
            }
        }
        result.setCode(CcmRestType.OK);
        result.setResult(page.getList());

        return result;
    }

    /**
     * @param
     * @return
     * @author fuxinshuang
     * @version 2018-03-06
     * @see 保存重点场所信息
     */
    @ResponseBody
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public CcmRestResult modify(String userId, CcmOrgNpse ccmOrgNpse, HttpServletRequest req, HttpServletResponse resp) throws IOException {
        CcmRestResult result = new CcmRestResult();
        User sessionUser = (User) req.getSession().getAttribute("user");
        if (sessionUser == null) {
            result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
            return result;
        }
        String sessionUserId = sessionUser.getId();
        if (userId == null || "".equals(userId) || !userId.equals(sessionUserId)) {
            result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
            return result;
        }
        if (ccmOrgNpse.getId() != null && !"".equals(ccmOrgNpse.getId())) {
            CcmOrgNpse ccmOrgNpseDB = ccmOrgNpseService.get(ccmOrgNpse.getId());
            if (ccmOrgNpseDB == null) {//从数据库中没有取到对应数据
                result.setCode(CcmRestType.ERROR_DB_NOT_EXIST);
            }
        }
        if (ccmOrgNpse.getCreateBy() == null) {
            ccmOrgNpse.setCreateBy(new User(userId));
        }
        ccmOrgNpse.setUpdateBy(new User(userId));
        ccmOrgNpseService.save(ccmOrgNpse);
        result.setCode(CcmRestType.OK);
        result.setResult("成功");
        return result;

    }


}