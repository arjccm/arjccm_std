package com.arjjs.ccm.modules.ccm.rest.web;

import com.arjjs.ccm.common.web.BaseController;
import com.arjjs.ccm.modules.ccm.pop.service.CcmPeopleService;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestResult;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestType;
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
        Map<String, Object> map = new HashMap<>();
        SearchTab peopleData = ccmPeopleService.getData();

        Integer value1 = Integer.valueOf(peopleData.getValue1());
        Integer value2 = Integer.valueOf(peopleData.getValue2());
        Integer value3 = Integer.valueOf(peopleData.getValue3());
        Integer value4 = Integer.valueOf(peopleData.getValue4());
        Integer gatherNum=value1+value2+value3+value4;
        map.put("gatherNum",gatherNum);
        return result;
    }
}
