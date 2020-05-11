package com.arjjs.ccm.modules.ccm.rest.web;

import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.web.BaseController;
import com.arjjs.ccm.modules.ccm.org.entity.CcmOrgNpse;
import com.arjjs.ccm.modules.ccm.org.service.CcmOrgAreaService;
import com.arjjs.ccm.modules.ccm.org.service.CcmOrgNpseService;
import com.arjjs.ccm.modules.ccm.pop.service.CcmPeopleService;
import com.arjjs.ccm.modules.ccm.pop.service.CcmPopTenantService;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestResult;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestType;
import com.arjjs.ccm.modules.pbs.sys.utils.UserUtils;
import com.arjjs.ccm.modules.sys.entity.User;
import com.arjjs.ccm.tool.SearchTab;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * app首页数据展示
 */
@Controller
@RequestMapping(value = "${appPath}/rest/Data")
@Api(description = "首页数据展示")
public class CcmRestData extends BaseController {

    @Autowired
    private CcmPeopleService ccmPeopleService;
    @Autowired
    private CcmOrgAreaService ccmOrgAreaService;
    @Autowired
    private CcmPopTenantService ccmPopTenantService;
    @Autowired
    private CcmOrgNpseService ccmOrgNpseService;

    @ResponseBody
    @RequestMapping(value="/getData", method = RequestMethod.GET)
    public CcmRestResult get(String userId, HttpServletRequest req, HttpServletResponse resp) throws IOException {

        logger.info("当前正在执行的类名为》》》"+Thread.currentThread().getStackTrace()[1].getClassName());
        logger.info("当前正在执行的方法名为》》》"+Thread.currentThread().getStackTrace()[1].getMethodName());
        logger.info("当前方法运行参数为》》》id : " + userId + "  userId : " + userId);
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
        CcmOrgNpse ccmOrgNpse = new CcmOrgNpse();
        ccmOrgNpse.setCheckUser(sessionUser);
        Map<String, Object> map = new HashMap<>();
        String areaId = ccmOrgAreaService.getAreaId(userId);
        SearchTab peopleData = ccmPeopleService.getData(areaId);
        Integer peoNum = ccmOrgAreaService.getPeoNum(userId);

        //户籍，流动，外籍，未落户人口数量
        Integer value1 = Integer.valueOf(peopleData.getValue1());
        Integer value2 = Integer.valueOf(peopleData.getValue2());
        Integer value3 = Integer.valueOf(peopleData.getValue3());
        Integer value4 = Integer.valueOf(peopleData.getValue4());
        //已采集人数
        Integer gatherNum=value1+value2+value3+value4;
        //待采集人数
        Integer noGatherNum;
        if (peoNum<gatherNum){
            noGatherNum=0;
        }else {
            noGatherNum=peoNum-gatherNum;
        }
        //特殊人群
        ccmPeopleService.getSpecialNum(areaId);
        Integer specialPeople=33;
        //走访记录
        Integer interview=10;
        //已走访
        Integer alreadyInterview=4;

        SearchTab popTenantNum = ccmPopTenantService.getPopTenantNum(areaId);
        //房屋
        Integer houseNum=Integer.valueOf(popTenantNum.getValue1());
        //出租房
        Integer rentalHousing=Integer.valueOf(popTenantNum.getValue2());;
        //单位
        List<CcmOrgNpse> list = ccmOrgNpseService.findList(ccmOrgNpse);
        Integer organization=list.size();
        //问题处理
        Integer issueNum=40;
        //已处理问题
        Integer alreadyIssue=12;
        map.put("gatherNum",gatherNum);
        map.put("noGatherNum",noGatherNum);
        map.put("specialPeople",specialPeople);
        map.put("interview",interview);
        map.put("alreadyInterview",alreadyInterview);
        map.put("houseNum",houseNum);
        map.put("rentalHousing",rentalHousing);
        map.put("organization",organization);
        map.put("issueNum",issueNum);
        map.put("alreadyIssue",alreadyIssue);
        result.setCode(CcmRestType.OK);
        result.setResult(map);
        return result;
    }
}
