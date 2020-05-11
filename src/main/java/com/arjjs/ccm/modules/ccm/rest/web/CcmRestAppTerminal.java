package com.arjjs.ccm.modules.ccm.rest.web;


import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.web.BaseController;
import com.arjjs.ccm.modules.ccm.patrol.entity.CcmTracingpoint;
import com.arjjs.ccm.modules.ccm.patrol.service.CcmTracingpointService;
import com.arjjs.ccm.modules.ccm.pop.entity.CcmPeople;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestResult;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestType;
import com.arjjs.ccm.modules.sys.entity.User;
import com.arjjs.ccm.tool.geoJson.GeoJSON;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping(value = "${appPath}/rest/appTerminal")
@Api(description = "app终端")
public class CcmRestAppTerminal extends BaseController {

    @Autowired
    private CcmTracingpointService ccmTracingpointService;

    /**
     * @see 移动设备点位历史轨迹
     * @param CcmMobileDevice
     * @param model
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/queryTerminalMap", method = RequestMethod.GET)
    public CcmRestResult deviceMobileTrace(String userId,CcmTracingpoint ccmTracingpoint,HttpServletRequest req, HttpServletResponse resp ) throws IOException {

        logger.info("当前正在执行的类名为》》》"+Thread.currentThread().getStackTrace()[1].getClassName());
        logger.info("当前正在执行的方法名为》》》"+Thread.currentThread().getStackTrace()[1].getMethodName());
        logger.info("当前方法运行参数为》》》CcmHouseBuildmanage : " + String.valueOf(ccmTracingpoint) + "  userId : " + userId);

        User sessionUser = (User) req.getSession().getAttribute("user");
        ccmTracingpoint.setUser(sessionUser);
        CcmRestResult result = new CcmRestResult();
        if (sessionUser== null) {
            result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
            return result;
        }
        String sessionUserId = sessionUser.getId();
        if (userId== null || "".equals(userId) ||!userId.equals(sessionUserId)) {
            result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
            return result;
        }
        if (ccmTracingpoint == null) {
            return null;
        }
        if (null == ccmTracingpoint.getBeginCurDate() || "".equals(ccmTracingpoint.getBeginCurDate())) {//开始时间为空的话，默认赋值今天
            Date beginDate = new Date();
            beginDate.setHours(0);
            beginDate.setMinutes(0);
            beginDate.setSeconds(0);
            ccmTracingpoint.setBeginCurDate(beginDate);
        }
        if (null == ccmTracingpoint.getEndCurDate() || "".equals(ccmTracingpoint.getEndCurDate())) {
            Date endDate = new Date();
            ccmTracingpoint.setEndCurDate(endDate);
        }
        Page<CcmTracingpoint> page = ccmTracingpointService.findPage(new Page<CcmTracingpoint>(req, resp), ccmTracingpoint);
        List<CcmTracingpoint> tlist = page.getList();
        Map<String, Object> map = new HashMap<>();
       map.put("Count",page.getCount());
       map.put("PageNo",page.getPageNo());
       map.put("PageSize",page.getPageSize());
       map.put("tlist",tlist);

        if(tlist.size()>0){
            result.setResult(map);
        }else{
            result.setResult("");
        }
        result.setCode(CcmRestType.OK);
        // 输出结果
        return result;
    }

}
