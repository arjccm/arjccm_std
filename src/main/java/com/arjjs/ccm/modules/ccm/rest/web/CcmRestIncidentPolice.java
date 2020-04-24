package com.arjjs.ccm.modules.ccm.rest.web;

import com.arjjs.ccm.common.utils.StringUtils;
import com.arjjs.ccm.modules.ccm.ccmsys.entity.CcmDeviceArea;
import com.arjjs.ccm.modules.ccm.event.entity.CcmEventIncident;
import com.arjjs.ccm.modules.ccm.event.service.CcmEventIncidentService;
import com.arjjs.ccm.modules.ccm.org.entity.CcmOrgArea;
import com.arjjs.ccm.modules.ccm.org.service.CcmOrgAreaService;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestResult;
import com.arjjs.ccm.modules.pbs.sys.utils.UserUtils;
import com.arjjs.ccm.modules.sys.entity.Area;
import com.arjjs.ccm.modules.sys.entity.User;
import com.arjjs.ccm.tool.Tool;
import com.google.common.collect.Lists;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping(value = "${appPath}/rest/service/ccmIncidentPolice")
@Api(description = "一键报警接口")
public class CcmRestIncidentPolice {

    @Autowired
    private CcmOrgAreaService ccmOrgAreaService;
    @Autowired
    private CcmEventIncidentService ccmEventIncidentService;

    //获取详情
    @ApiOperation(value ="一键报警" )
    @RequestMapping(value = "/insertIncident", method = RequestMethod.GET)
    public CcmRestResult insertIncident(@RequestParam String userId, @RequestParam String areaPoint,@RequestParam String happenPlace) {
        CcmRestResult result = new CcmRestResult();
        CcmEventIncident ccmEventIncident = new CcmEventIncident();
        User user = UserUtils.get(userId);

        List<CcmOrgArea> orgAreaList = ccmOrgAreaService.getAreaMap(new CcmOrgArea());
        List<CcmDeviceArea> resultList = Lists.newArrayList();
        this.sortList(resultList, orgAreaList, "0", true);
        List<String> pointList = Lists.newArrayList();
        if(StringUtils.isNotBlank(areaPoint)) {
            String[] pointInfo = areaPoint.split(",");
            double lat = Double.valueOf(pointInfo[0]);
            double lon = Double.valueOf(pointInfo[1]);
            String areaId = this.getDeviceAreaId(resultList, pointList, lat, lon);
            Area area = new Area();
            if(StringUtils.isNotBlank(areaId)) {
                area.setId(areaId);
                ccmEventIncident.setArea(area);
            }
            ccmEventIncident.setCaseName(user.getName()+"提交的一键报警求助");
            ccmEventIncident.setHappenDate(new Date());
            ccmEventIncident.setCasePlace(areaId);
            ccmEventIncident.setHappenPlace(happenPlace);
            ccmEventIncident.setAreaPoint(areaPoint);
            ccmEventIncident.setEventKind("09");
            ccmEventIncident.setEventScale("03");
            ccmEventIncident.setEventType("05");
            ccmEventIncident.setCaseCondition(user.getName()+"提交一键报警求助，或遇突发事件等紧急情况，需要尽快核实并支援");
            ccmEventIncident.setCulPapercode("01");
            ccmEventIncident.setTypeSolve(0);
            ccmEventIncident.setStatus("01");
            ccmEventIncident.setEventSort("99");
            ccmEventIncident.setProperty("99");
            ccmEventIncident.setCaseScope("01");
            ccmEventIncident.setReportType("0");
            ccmEventIncidentService.save(ccmEventIncident,user);
        }
        result.setMsg("OK");
        return result;
    }

    public void sortList(List<CcmDeviceArea> list, List<CcmOrgArea> sourcelist, String parentId, boolean cascade) {
        for(int i = 0; i < sourcelist.size(); ++i) {
            CcmOrgArea e = (CcmOrgArea)sourcelist.get(i);
            if (e.getAreaParentId() != null && e.getAreaParentId().equals(parentId)) {
                CcmDeviceArea ccmDeviceArea = new CcmDeviceArea();
                ccmDeviceArea.setId(e.getAreaId());
                ccmDeviceArea.setAreaMap(e.getAreaMap());
                List<CcmDeviceArea> childrenList = Lists.newArrayList();
                ccmDeviceArea.setChildrenList(childrenList);
                list.add(ccmDeviceArea);
                if (cascade) {
                    for(int j = 0; j < sourcelist.size(); ++j) {
                        CcmOrgArea child = (CcmOrgArea)sourcelist.get(j);
                        if (child.getAreaParentId() != null && child.getAreaParentId().equals(e.getAreaId())) {
                            sortList(childrenList, sourcelist, e.getAreaId(), true);
                            break;
                        }
                    }
                }
            }
        }
    }

    public String getDeviceAreaId(List<CcmDeviceArea> resultList, List<String> pointList, double lat, double lon) {
        String areaId = null;
        for (int i = 0; i < resultList.size(); i++) {
            CcmDeviceArea ccmDeviceArea = resultList.get(i);
            if(ccmDeviceArea != null) {
                List<CcmDeviceArea> childrenList = ccmDeviceArea.getChildrenList();
                if(childrenList.size() > 0) {
                    areaId = getDeviceAreaId(childrenList,pointList,lat,lon);
                    if(StringUtils.isBlank(areaId)) {
                        areaId = isInPolygon(pointList, ccmDeviceArea, lat, lon);
                    }
                }else {
                    areaId = isInPolygon(pointList, ccmDeviceArea, lat, lon);
                }
                if(StringUtils.isNotBlank(areaId)) {
                    break;
                }
            }
        }
        return areaId;
    }

    public String isInPolygon(List<String> pointList,CcmDeviceArea ccmDeviceArea, double lat, double lon) {
        boolean flag = false;
        String areaId = null;
        String areaMap = ccmDeviceArea.getAreaMap();
        if(StringUtils.isNotBlank(areaMap)) {
            String[] point = areaMap.split(";");
            pointList.addAll(Arrays.asList(point));
            double[] latList = new double[pointList.size()];
            double[] lonList = new double[pointList.size()];
            for(int i = 0; i < pointList.size(); i++) {
                String[] pointInfo = pointList.get(i).split(",");
                if(pointInfo.length==2){
                    latList[i] = Double.valueOf(pointInfo[0]);
                    lonList[i] = Double.valueOf(pointInfo[1]);
                }
            }
            flag = Tool.isInPolygon(lon, lat, lonList, latList);
            if(flag) {
                areaId = ccmDeviceArea.getId();
            }
        }
        return areaId;
    }
}
