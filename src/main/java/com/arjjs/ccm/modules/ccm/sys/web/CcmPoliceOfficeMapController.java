package com.arjjs.ccm.modules.ccm.sys.web;


import com.arjjs.ccm.modules.ccm.org.entity.CcmOrgArea;
import com.arjjs.ccm.modules.ccm.org.service.CcmOrgAreaService;
import com.arjjs.ccm.modules.ccm.pop.service.CcmPeopleService;
import com.arjjs.ccm.tool.geoJson.Features;
import com.arjjs.ccm.tool.geoJson.GeoJSON;
import com.arjjs.ccm.tool.geoJson.Geometry;
import com.arjjs.ccm.tool.geoJson.Properties;
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


    /**
     * 查询重点人员数据
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "getKeyPeopleNum")
    public GeoJSON getKeyPeopleNum(){
        CcmOrgArea ccmOrgArea = new CcmOrgArea();
        ccmOrgArea.setType("5");
        List<CcmOrgArea>  resOrgArealist = ccmOrgAreaService.findList(ccmOrgArea);
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
            properties.setName(resccmOrgArea.getKeyPersonnelNum().toString());
            properties.setIcon("box.png");
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




}
