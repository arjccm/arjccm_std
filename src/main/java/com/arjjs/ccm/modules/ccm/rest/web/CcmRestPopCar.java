package com.arjjs.ccm.modules.ccm.rest.web;

import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.modules.ccm.pop.entity.CcmPopCar;
import com.arjjs.ccm.modules.ccm.pop.service.CcmPopCarService;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestResult;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestType;
import com.arjjs.ccm.modules.sys.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author cby
 * @title: CcmRestPopCar
 * @description: TODO
 * @date 2020/12/22 16:03
 */
@RestController
@RequestMapping("${appPath}/rest/popcar")
public class CcmRestPopCar {
    @Autowired
    private CcmPopCarService ccmPopCarService;

    /**
     * @see  获取单个车辆信息
     * @param id  ID
     * @return
     * @author cby
     * @version 2020/12/22 16:03
     */
    @ResponseBody
    @RequestMapping(value="/get", method = RequestMethod.GET)
    public CcmRestResult get(String userId, HttpServletRequest req, HttpServletResponse resp, String id) throws IOException {
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

        CcmPopCar ccmPopCar = ccmPopCarService.get(id);

        result.setCode(CcmRestType.OK);
        result.setResult(ccmPopCar);

        return result;
    }

    /**
     * @see  查询车辆信息
     * @param pageNo 页码
     * @param pageSize 分页大小
     * @return
     * @author cby
     * @version 2020/12/22 16:03
     */
    @ResponseBody
    @RequestMapping(value="/query", method = RequestMethod.GET)
    public CcmRestResult query(String userId,CcmPopCar ccmPopCar, HttpServletRequest req, HttpServletResponse resp) throws IOException {
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

        Page<CcmPopCar> page = ccmPopCarService.findPage(new Page<CcmPopCar>(req, resp), ccmPopCar);

        result.setCode(CcmRestType.OK);
        if(page.getList().size()>0){
            result.setResult(page.getList());
        }else{
            result.setResult("");
        }

        return result;
    }

    /**
     * @see  修改车辆信息
     * @param
     * @return
     * @author cby
     * @version 2020/12/22 16:03
     */
    @ResponseBody
    @RequestMapping(value="/save", method = RequestMethod.POST)
    public CcmRestResult modify(String userId,CcmPopCar ccmPopCar,HttpServletRequest req, HttpServletResponse resp) throws IOException {
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
        if (ccmPopCar.getId()!= null && !"".equals(ccmPopCar.getId())) {
            CcmPopCar ccmPopCarDB = ccmPopCarService.get(ccmPopCar.getId());
            if (ccmPopCarDB == null ) {//从数据库中没有取到对应数据
                result.setCode(CcmRestType.ERROR_DB_NOT_EXIST);
            }
        }
        if (ccmPopCar.getCreateBy()== null) {
            ccmPopCar.setCreateBy(new User(userId));
        }
        ccmPopCar.setUpdateBy(new User(userId));
        ccmPopCarService.save(ccmPopCar);
        result.setCode(CcmRestType.OK);
        result.setResult("成功");
        return result;

    }



    /**
     * @see  保存车辆信息（支持新增和编辑,数据同步用）
     * @author cby
     * @version 2020/12/22 16:03
     */
    @ResponseBody
    @RequestMapping(value="/savePopCarSyn", method = RequestMethod.POST)
    public CcmRestResult savePopCarSyn(String userId,CcmPopCar ccmPopCar,HttpServletRequest req, HttpServletResponse resp) throws IOException {
        CcmRestResult result = new CcmRestResult();
        if (userId == null || "".equals(userId)) {
            userId = "1";
        }

        User user = new User(userId);
        ccmPopCar.setCreateBy(user);
        ccmPopCar.setCreateDate(new Date());
        ccmPopCar.setUpdateBy(user);
        ccmPopCar.setUpdateDate(new Date());

        ccmPopCarService.save(ccmPopCar);
        result.setCode(CcmRestType.OK);
        result.setResult("成功");
        return result;

    }
    /**
     * @see  删除车辆信息（数据同步用）
     * @author liangwanmin
     * @version 2018-05-29
     */
    @ResponseBody
    @RequestMapping(value="/deletePopCarSyn", method = RequestMethod.POST)
    public CcmRestResult deletePopCarSyn(String userId,CcmPopCar ccmPopCar,HttpServletRequest req, HttpServletResponse resp) throws IOException {
        CcmRestResult result = new CcmRestResult();
        ccmPopCarService.delete(ccmPopCar);
        result.setCode(CcmRestType.OK);
        result.setResult("成功");
        return result;

    }
}
