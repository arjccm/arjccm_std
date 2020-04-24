package com.arjjs.ccm.modules.ccm.rest.web;

import com.arjjs.ccm.common.utils.StringUtils;
import com.arjjs.ccm.modules.ccm.ccmsys.entity.CcmDevice;
import com.arjjs.ccm.modules.ccm.ccmsys.service.CcmDeviceService;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestResult;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestType;
import com.arjjs.ccm.tool.geoJson.Features;
import com.arjjs.ccm.tool.geoJson.GeoJSON;
import com.arjjs.ccm.tool.geoJson.Geometry;
import com.arjjs.ccm.tool.geoJson.Properties;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(value = "${appPath}/rest/service/ccmRestdeviceive")
@Api(description = "地图监控")
public class CcmRestdeviceive {

    @Autowired
    private CcmDeviceService ccmDeviceService;

    //获取详情
    @ApiOperation(value ="地图监控" )
    @RequestMapping(value = "/findDeviceive", method = RequestMethod.GET)
    public CcmRestResult deviceiveMap() {
        CcmRestResult result = new CcmRestResult();
        CcmDevice ccmDevice = new CcmDevice();
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
            properties.setName(device.getName());
            properties.setIcon(device.getImagePath());
            // 点击后展示详细属性值
            Map<String, Object> map_P = new HashMap<String, Object>();
            // 创建附属信息
            map_P.put("设备名称", device.getName());
            map_P.put("设备编号", device.getCode());
            //IP地址表中没数据，去掉
            map_P.put("监控类型", device.getType());
            map_P.put("安装位置", device.getAddress());
            map_P.put("设备状态", device.getStatus());
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
            if (!StringUtils.isEmpty(device.getCoordinate())) {
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
            String[] a = (StringUtils.isEmpty(device.getCoordinate()) ? (",") : device.getCoordinate()).split(",");
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
            Map<String, String> map_V = new HashMap<String, String>();
            // 协议，设备参数信息
            map_V.put("protocol", device.getProtocol());
            map_V.put("param", device.getParam());
            map_V.put("ip", device.getIp());
            map_V.put("port", device.getPort());
            map_V.put("username", device.getAccount());
            map_V.put("password", device.getPassword());
            map_V.put("typeVidicon", device.getTypeVidicon());
            map_V.put("code", device.getCode());
            properties.setVideo(map_V);
        }

        // 添加数据
        result.setResult(featureList);
        // 如果无数据
        if (featureList.size() == 0) {
            return null;
        }
        result.setCode(CcmRestType.OK);
        return result;
    }
}
