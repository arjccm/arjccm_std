package com.arjjs.ccm.modules.ccm.rest.web;

import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.utils.StringUtils;
import com.arjjs.ccm.modules.ccm.ask.entity.CcmAskLeader;
import com.arjjs.ccm.modules.ccm.ask.service.CcmAskLeaderService;
import com.arjjs.ccm.modules.ccm.pop.entity.CcmPopTenant;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestResult;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestType;
import com.arjjs.ccm.modules.pbs.common.config.Global;
import com.arjjs.ccm.modules.pbs.common.web.BaseController;
import com.arjjs.ccm.modules.pbs.sys.utils.UserUtils;
import com.arjjs.ccm.modules.sys.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

/**
 * @author cby
 * @title: CcmRestAskLeader
 * @description: TODO
 * @date 2020/10/9 18:02
 */
@Controller
@RequestMapping(value = "${appPath}/rest/askLeader")
public class CcmRestAskLeader extends BaseController {

    @Autowired
    private CcmAskLeaderService ccmAskLeaderService;

    /**
     * @see  查询领导请示列表
     * @param type  类型
     * @param userId  用户Id
     * @param pageNo  页码
     * @param pageSize  分页大小
     * @return
     * @version 2018-02-03
     */
    @ResponseBody
    @RequestMapping(value="/query", method = RequestMethod.GET)
    public CcmRestResult query(String type, String userId, CcmAskLeader ccmAskLeader, HttpServletRequest req, HttpServletResponse resp) throws IOException {
        logger.info("当前正在执行的类名为》》》"+Thread.currentThread().getStackTrace()[1].getClassName());
        logger.info("当前正在执行的方法名为》》》"+Thread.currentThread().getStackTrace()[1].getMethodName());
        logger.info("当前方法运行参数为》》》 type: " + type + " userId : " + userId +"  ccmAskLeader : " + String.valueOf(ccmAskLeader));
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
        if("1".equals(type)){
            ccmAskLeader.setCreateBy(UserUtils.get(userId));
        }else{
            ccmAskLeader.setLeader(UserUtils.get(userId));
            ccmAskLeader.setReplyStatus("01");
        }
        Page<CcmAskLeader> page = ccmAskLeaderService.findPage(new Page<CcmAskLeader>(req, resp), ccmAskLeader);

        result.setCode(CcmRestType.OK);
        result.setResult(page.getList());
        return result;
    }

    /**
     * @see  获取单个领导请示信息
     * @param id  领导请示ID
     * @return
     * @version 2018-02-03
     */
    @ResponseBody
    @RequestMapping(value="/get", method = RequestMethod.GET)
    public CcmRestResult get(String userId,HttpServletRequest req, HttpServletResponse resp, String id) throws IOException {
        logger.info("当前正在执行的类名为》》》"+Thread.currentThread().getStackTrace()[1].getClassName());
        logger.info("当前正在执行的方法名为》》》"+Thread.currentThread().getStackTrace()[1].getMethodName());
        logger.info("当前方法运行参数为》》》领导请示id : " + id + "  userId : " + userId);
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
        if (id == null || "".equals(id)) {//参数id不对
            result.setCode(CcmRestType.ERROR_PARAM);
            return result;
        }

        CcmAskLeader ccmAskLeader = ccmAskLeaderService.get(id);

        result.setCode(CcmRestType.OK);
        result.setResult(ccmAskLeader);
        return result;
    }

    /**
     * @see  修改/回复领导请示信息
     * @param
     * @return
     * @author fuxinshuang
     * @version 2018-02-03
     */
    @ResponseBody
    @RequestMapping(value="/save", method = RequestMethod.POST)
    public CcmRestResult modify(String userId, CcmAskLeader ccmAskLeader, String type, HttpServletRequest req, HttpServletResponse resp) throws IOException {
        logger.info("当前正在执行的类名为》》》"+Thread.currentThread().getStackTrace()[1].getClassName());
        logger.info("当前正在执行的方法名为》》》"+Thread.currentThread().getStackTrace()[1].getMethodName());
        logger.info("当前方法运行参数为》》》userId : " + userId +"  ccmAskLeader : " + String.valueOf(ccmAskLeader));
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
        if(StringUtils.isEmpty(ccmAskLeader.getId())){
            ccmAskLeader.setCreateBy(new User(userId));
            ccmAskLeader.setCreateDate(new Date());
            ccmAskLeader.setUpdateBy(new User(userId));
            ccmAskLeader.setUpdateDate(new Date());
        }else{
            CcmAskLeader param = ccmAskLeaderService.get(ccmAskLeader.getId());
            ccmAskLeader.setCreateBy(param.getCreateBy());
            ccmAskLeader.setCreateDate(param.getCreateDate());
            ccmAskLeader.setUpdateBy(new User(userId));
            ccmAskLeader.setUpdateDate(new Date());
        }
        ccmAskLeaderService.save(ccmAskLeader,type);
        result.setCode(CcmRestType.OK);
        result.setResult("成功");
        return result;
    }

    /**
     * @see  删除领导请示信息（数据同步用）
     * @param
     * @return
     * @version 2018-05-17
     */
    @ResponseBody
    @RequestMapping(value="/delete", method = RequestMethod.POST)
    public CcmRestResult delete(String userId, CcmAskLeader ccmAskLeader,HttpServletRequest req, HttpServletResponse resp) throws IOException {
        logger.info("当前正在执行的类名为》》》"+Thread.currentThread().getStackTrace()[1].getClassName());
        logger.info("当前正在执行的方法名为》》》"+Thread.currentThread().getStackTrace()[1].getMethodName());
        logger.info("当前方法运行参数为》》》userId : " + userId +"  ccmAskLeader : " + String.valueOf(ccmAskLeader));
        CcmRestResult result = new CcmRestResult();
        ccmAskLeaderService.delete(ccmAskLeader);
        result.setCode(CcmRestType.OK);
        result.setResult("成功");
        return result;
    }
}
