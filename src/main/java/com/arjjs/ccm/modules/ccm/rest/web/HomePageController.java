package com.arjjs.ccm.modules.ccm.rest.web;

import com.arjjs.ccm.modules.ccm.ccmsys.service.CcmDeviceService;
import com.arjjs.ccm.modules.ccm.event.entity.CcmEventIncident;
import com.arjjs.ccm.modules.ccm.event.service.CcmEventIncidentService;
import com.arjjs.ccm.modules.ccm.org.entity.SysArea;
import com.arjjs.ccm.modules.ccm.org.service.SysAreaService;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestResult;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestType;
import com.arjjs.ccm.modules.ccm.rest.entity.HomePage;
import com.arjjs.ccm.modules.ccm.rest.service.CcmRestOfficeService;
import com.arjjs.ccm.modules.pbs.common.web.BaseController;
import com.arjjs.ccm.modules.sys.entity.Dict;
import com.arjjs.ccm.modules.sys.utils.DictUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @Auther: szl
 * @Date: 2021-01-26
 */
@Controller
@RequestMapping(value = "rest/homePage")
public class HomePageController extends BaseController {

    @Autowired
    private  SysAreaService sysAreaService;
    @Autowired
    private  CcmDeviceService ccmDeviceService;
    @Autowired
    private CcmRestOfficeService ccmRestOfficeService;
    @Autowired
    private CcmEventIncidentService eventIncidentService;

    @ResponseBody
    @RequestMapping(value = "/getDeviceNumByArea", method = RequestMethod.GET)
    public CcmRestResult getDeviceNumByArea(){
        CcmRestResult ccmRestResult = new CcmRestResult();
        List<SysArea> areaList = sysAreaService.getAreaIdBytype();
        List<Object> mapList = new ArrayList<>();
        for (SysArea sysArea : areaList) {
            HomePage homePage = new HomePage();
            int deviceNum = ccmDeviceService.getDeviceNumByArea(sysArea.getId());
            homePage.setName(sysArea.getName());
            homePage.setValue(deviceNum);
            mapList.add(homePage);
        }
        ccmRestResult.setCode(CcmRestType.OK);
        ccmRestResult.setResult(mapList);
        return ccmRestResult;
    }

    @ResponseBody
    @RequestMapping(value = "/getUserByArea", method = RequestMethod.GET)
    public CcmRestResult getUserByArea(){
        CcmRestResult ccmRestResult = new CcmRestResult();
        List<SysArea> areaList = sysAreaService.getAreaIdBytype();
        List<Object> mapList = new ArrayList<>();
        for (SysArea sysArea : areaList) {
            HomePage homePage = new HomePage();
            int userNum = ccmRestOfficeService.getOfficeByArea(sysArea.getId());
            homePage.setName(sysArea.getName());
            homePage.setValue(userNum);
            mapList.add(homePage);
        }
        ccmRestResult.setCode(CcmRestType.OK);
        ccmRestResult.setResult(mapList);
        return ccmRestResult;
    }

    @ResponseBody
    @RequestMapping(value = "/getEventIncident", method = RequestMethod.GET)
    public CcmRestResult getEventIncident(){
        CcmRestResult ccmRestResult = new CcmRestResult();
        List<CcmEventIncident> eventIncidentList = eventIncidentService.getEventIncident();
        // 事件级别
        List<Dict> dicts = DictUtils.getDictList("ccm_case_grad");
        Map<String, String> dictMap = dicts.stream().collect(Collectors.toMap(Dict::getValue, Dict::getLabel));
        for (CcmEventIncident ccmEventIncident : eventIncidentList) {
            ccmEventIncident.setEventScale(dictMap.get(ccmEventIncident.getEventScale()));
        }
        ccmRestResult.setCode(CcmRestType.OK);
        ccmRestResult.setResult(eventIncidentList);
        return ccmRestResult;
    }
}
