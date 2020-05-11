package com.arjjs.ccm.modules.ccm.rest.web;

import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.utils.StringUtils;
import com.arjjs.ccm.modules.ccm.ccmsys.entity.CcmDevice;
import com.arjjs.ccm.modules.ccm.ccmsys.service.CcmDeviceService;
import com.arjjs.ccm.modules.ccm.event.entity.CcmEventIncident;
import com.arjjs.ccm.modules.ccm.house.entity.CcmHouseBuildmanage;
import com.arjjs.ccm.modules.ccm.org.entity.SysArea;
import com.arjjs.ccm.modules.ccm.org.service.SysAreaService;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestResult;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestType;
import com.arjjs.ccm.modules.ccm.sys.entity.SysDicts;
import com.arjjs.ccm.modules.ccm.sys.service.SysDictsService;
import com.arjjs.ccm.modules.flat.realtimeSituation.entity.DataList;
import com.arjjs.ccm.modules.sys.entity.Area;
import com.arjjs.ccm.modules.sys.entity.User;
import com.arjjs.ccm.tool.geoJson.Features;
import com.arjjs.ccm.tool.geoJson.GeoJSON;
import com.arjjs.ccm.tool.geoJson.Geometry;
import com.arjjs.ccm.tool.geoJson.Properties;
import com.google.common.collect.Maps;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

@RestController
@RequestMapping(value = "${appPath}/rest/service/ccmRestdeviceive")
@Api(description = "地图监控")
public class CcmRestdeviceive {

    @Autowired
    private SysDictsService sysDictsService;
    @Autowired
    private CcmDeviceService ccmDeviceService;
    @Autowired
    private SysAreaService sysAreaService;


 /**
  * * @see 生成视频地图信息-点位图（分页模式）
  * * @param ccmDevice
  * * @return
  * */
    @ApiOperation(value ="地图监控" )
    @ApiImplicitParam(name = "userId", value = "用户ID", required = true, dataType = "String")
    @RequestMapping(value = "/queryDeviceiveMap", method = RequestMethod.GET)
   public CcmRestResult deviceiveMap(String userId,CcmDevice ccmDevice, HttpServletRequest request, HttpServletResponse response) {

        CcmRestResult result = new CcmRestResult();
        User sessionUser = (User) request.getSession().getAttribute("user");
        if (sessionUser== null) {
            result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
            return result;
        }
        String sessionUserId = sessionUser.getId();
        if (userId== null || "".equals(userId) ||!userId.equals(sessionUserId)) {
            result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
            return result;
        }
            //分页参数处理
            Page pageIn = new Page<CcmEventIncident>(request, response);

            List<SysDicts> sysDicts = sysDictsService.findAllListByType("ccm_device_status");
            Map sysDictsMap = Maps.newHashMap();
            for (SysDicts sysDict : sysDicts) {
                sysDictsMap.put(sysDict.getValue(),sysDict.getLabel());
            }

            // 查询地图视频信息
            List<CcmDevice> ccmdevicelist = new ArrayList<CcmDevice>();

            //可以选择父节点查询
            if(ccmDevice.getArea()!=null&&ccmDevice.getArea().getId()!=null&&!ccmDevice.getArea().getId().equals("")){
                SysArea sysArea = sysAreaService.get(ccmDevice.getArea().getId());
                Area area = new Area();
                area.setId(sysArea.getId());
                area.setParentIds(sysArea.getParentIds());
                ccmDevice.setUserArea(area);
                ccmDevice.setArea(null);
            }
            Page<CcmDevice> page = ccmDeviceService.findPage(pageIn, ccmDevice);
            ccmdevicelist = page.getList();

            // 返回对象
            GeoJSON geoJSON = new GeoJSON();
            geoJSON.setCount(page.getCount());
            geoJSON.setPageNo(page.getPageNo());
            geoJSON.setPageSize(page.getPageSize());

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
                Map<String, Object> map_P = new LinkedHashMap<String, Object>();
                // 创建附属信息
                map_P.put("设备名称", device.getName());
                map_P.put("设备编号", device.getCode());
                //map_P.put("IP地址", device.getIp());
                map_P.put("安装位置", device.getAddress());
                if(StringUtils.isEmpty(device.getStatus())) {
                    map_P.put("设备状态", "未知");
                }else {
                    map_P.put("设备状态", sysDictsMap.get(device.getStatus()));
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
                properties.setVideo(map_V);
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
    }

