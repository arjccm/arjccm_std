package com.arjjs.ccm.modules.ccm.rest.web;

import com.arjjs.ccm.common.config.Global;
import com.arjjs.ccm.common.utils.StringUtils;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestResult;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestType;
import com.arjjs.ccm.modules.sys.entity.User;
import com.arjjs.ccm.modules.sys.service.SystemService;
import com.arjjs.ccm.modules.sys.utils.UserUtils;
import com.arjjs.ccm.tool.CommUtilRest;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@RestController
@RequestMapping(value = "${appPath}/rest/service/my")
@Api(description = "我的")
public class CcmRestUser {

    @Autowired
    private SystemService systemService;

    @ApiOperation(value ="修改密码" )
    @RequestMapping(value = "/modifyPwd", method = RequestMethod.GET)
    public CcmRestResult modifyPwd( String userId, @RequestParam String oldPassword,@RequestParam String newPassword,
                                   HttpServletRequest req,HttpServletResponse resp)throws IOException {
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
        User user = UserUtils.get(userId);
            if (SystemService.validatePassword(oldPassword, user.getPassword())) {
                systemService.updatePasswordById(user.getId(), user.getLoginName(), newPassword);
                result.setCode(CcmRestType.OK);
                result.setMsg("修改密码成功");
                result.setResult(0);
            } else {
                result.setCode(CcmRestType.ERROR_PARAM);
                result.setMsg("修改密码失败，旧密码错误");
                result.setResult(1);
            }
            return result;
        }

    @ApiOperation(value ="个人信息" )
    @RequestMapping(value = "/message", method = RequestMethod.GET)
    public CcmRestResult message( String userId, HttpServletRequest req,
                                 HttpServletResponse resp)throws IOException {
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
        result.setCode(CcmRestType.OK);
        result.setResult(sessionUser);
        return result;
        }
    }

