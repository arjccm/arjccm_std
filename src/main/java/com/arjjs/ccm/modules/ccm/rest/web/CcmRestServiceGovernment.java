package com.arjjs.ccm.modules.ccm.rest.web;

import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.utils.StringUtils;
import com.arjjs.ccm.modules.ccm.ask.entity.CcmAskLeader;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestResult;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestType;
import com.arjjs.ccm.modules.ccm.service.entity.CcmServiceGovernment;
import com.arjjs.ccm.modules.ccm.service.service.CcmServiceGovernmentService;
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

/**
 * @author cby
 * @title: CcmRestServiceGovernment
 * @description: TODO
 * @date 2020/10/10 10:14
 */
@Controller
@RequestMapping(value = "${appPath}/rest/serviceGovernment")
public class CcmRestServiceGovernment extends BaseController {

    @Autowired
    private CcmServiceGovernmentService ccmServiceGovernmentService;

    /**
     * @see  查询政务查询列表
     * @param userId  用户Id
     * @param pageNo  页码
     * @param pageSize  分页大小
     * @return
     * @version 2018-02-03
     */
    @ResponseBody
    @RequestMapping(value="/query", method = RequestMethod.GET)
    public CcmRestResult query(String userId, CcmServiceGovernment ccmServiceGovernment, HttpServletRequest req, HttpServletResponse resp) throws IOException {
        logger.info("当前正在执行的类名为》》》"+Thread.currentThread().getStackTrace()[1].getClassName());
        logger.info("当前正在执行的方法名为》》》"+Thread.currentThread().getStackTrace()[1].getMethodName());
        logger.info("当前方法运行参数为》》》 userId : " + userId +"  ccmServiceGovernment : " + String.valueOf(ccmServiceGovernment));
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

        Page<CcmServiceGovernment> page = ccmServiceGovernmentService.findPage(new Page<CcmServiceGovernment>(req, resp), ccmServiceGovernment);

        result.setCode(CcmRestType.OK);
        result.setResult(page.getList());
        return result;
    }

    /**
     * @see  获取单个政务查询信息
     * @param id  政务查询ID
     * @return
     * @version 2018-02-03
     */
    @ResponseBody
    @RequestMapping(value="/get", method = RequestMethod.GET)
    public CcmRestResult get(String userId,HttpServletRequest req, HttpServletResponse resp, String id) throws IOException {
        logger.info("当前正在执行的类名为》》》"+Thread.currentThread().getStackTrace()[1].getClassName());
        logger.info("当前正在执行的方法名为》》》"+Thread.currentThread().getStackTrace()[1].getMethodName());
        logger.info("当前方法运行参数为》》》 政务查询id : " + id + "  userId : " + userId);
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

        CcmServiceGovernment ccmServiceGovernment = ccmServiceGovernmentService.get(id);

        result.setCode(CcmRestType.OK);
        result.setResult(ccmServiceGovernment);

        return result;
    }

    /**
     * @see  修改政务查询信息
     * @param
     * @return
     * @author fuxinshuang
     * @version 2018-02-03
     */
    @ResponseBody
    @RequestMapping(value="/save", method = RequestMethod.POST)
    public CcmRestResult modify(String userId, CcmServiceGovernment ccmServiceGovernment, HttpServletRequest req, HttpServletResponse resp) throws IOException {
        logger.info("当前正在执行的类名为》》》"+Thread.currentThread().getStackTrace()[1].getClassName());
        logger.info("当前正在执行的方法名为》》》"+Thread.currentThread().getStackTrace()[1].getMethodName());
        logger.info("当前方法运行参数为》》》userId : " + userId +"  ccmServiceGovernment : " + String.valueOf(ccmServiceGovernment));
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
        if(StringUtils.isEmpty(ccmServiceGovernment.getId())){
            ccmServiceGovernment.setCreateBy(new User(userId));
            ccmServiceGovernment.setUpdateBy(new User(userId));
        }else{
            ccmServiceGovernment.setUpdateBy(new User(userId));
        }
        ccmServiceGovernmentService.save(ccmServiceGovernment);
        result.setCode(CcmRestType.OK);
        result.setResult("成功");
        return result;
    }

    /**
     * @see  删除政务查询信息（数据同步用）
     * @param
     * @return
     * @version 2018-05-17
     */
    @ResponseBody
    @RequestMapping(value="/delete", method = RequestMethod.POST)
    public CcmRestResult delete(String userId, CcmServiceGovernment ccmServiceGovernment,HttpServletRequest req, HttpServletResponse resp) throws IOException {
        logger.info("当前正在执行的类名为》》》"+Thread.currentThread().getStackTrace()[1].getClassName());
        logger.info("当前正在执行的方法名为》》》"+Thread.currentThread().getStackTrace()[1].getMethodName());
        logger.info("当前方法运行参数为》》》userId : " + userId +"  ccmServiceGovernment : " + String.valueOf(ccmServiceGovernment));
        CcmRestResult result = new CcmRestResult();
        ccmServiceGovernmentService.delete(ccmServiceGovernment);
        result.setCode(CcmRestType.OK);
        result.setResult("成功");
        return result;

    }
}
