/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.rest.web;

import com.arjjs.ccm.common.config.Global;
import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.utils.StringUtils;
import com.arjjs.ccm.common.web.BaseController;
import com.arjjs.ccm.modules.ccm.patrol.entity.CcmPatrolMissions;
import com.arjjs.ccm.modules.ccm.patrol.entity.CcmPatrolUnit;
import com.arjjs.ccm.modules.ccm.patrol.service.CcmPatrolMissionsService;
import com.arjjs.ccm.modules.ccm.patrol.service.CcmPatrolUnitService;
import com.arjjs.ccm.modules.ccm.pop.service.CcmPeopleService;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestResult;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestType;
import com.arjjs.ccm.modules.ccm.security.entity.CcmPatrolSecurity;
import com.arjjs.ccm.modules.sys.entity.Office;
import com.arjjs.ccm.modules.sys.entity.User;
import com.arjjs.ccm.modules.sys.service.OfficeService;
import com.arjjs.ccm.modules.sys.service.SystemService;
import com.arjjs.ccm.tool.EntityTools;
import com.arjjs.ccm.tool.LjpTools;
import com.arjjs.ccm.tool.MessageTools;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * 巡逻单位Controller
 *
 * @author lijiupeng
 * @version 2019-07-08
 */
@RequestMapping(value = "${appPath}/rest/ccmPatrolUnit")
@RestController
public class CcmRestUnit extends BaseController {

    @Autowired
    private CcmPatrolUnitService ccmPatrolUnitService;

    @Autowired
    private CcmPatrolMissionsService ccmPatrolMissionsService;

    @Autowired
    private OfficeService officeService;

    @Autowired
    private SystemService systemService;


    /**
     * 巡逻单位任务结束 状态
     */
    private final String END_STATUS_VALUE = "3";
    /**
     * 巡逻任务 安排状态
     */
    private final String ARRANGEMENT_STATUS_VALUE = "2";

    /**
     * 任务类型标识 自定义
     */
    private final String TYPE="patrol_time_unit";


    @RequestMapping(value = "list")
    public CcmRestResult list(String userId, CcmPatrolUnit ccmPatrolUnit, Integer pageNo,Integer pageSize, HttpServletRequest request, HttpServletResponse response) {
        pageSize = 30;
        CcmRestResult result = new CcmRestResult();
        User sessionUser = (User) request.getSession().getAttribute("user");
        if (sessionUser == null) {
            result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
            return result;
        }
        String sessionUserId = sessionUser.getId();
        if (userId == null || "".equals(userId) || !userId.equals(sessionUserId)) {
            result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
            return result;
        }
        if(LjpTools.isExistNullOrZero(pageSize)){
            pageSize=30;
        }
        Page<CcmPatrolUnit> page = null;

        if("admin".equals(sessionUser.getLoginName())){
            page = ccmPatrolUnitService.findPage(new Page<>(pageNo, pageSize), ccmPatrolUnit);
            if (page!=null) {
                result.setResult(page.getList());
            }
            result.setCode(CcmRestType.OK);
            return result;
        }

        CcmPatrolMissions missions = ccmPatrolUnit.getMissions();
        String id =null;
        if (missions != null) {
            id=missions.getId();
        }
        //判断是否是部门负责人
        if (userId.equals(sessionUser.getOffice().getPrimaryPerson().getId())) {
            if(StringUtils.isBlank(id)) {
                CcmPatrolMissions ccmPatrolMissions = new CcmPatrolMissions();
                ccmPatrolMissions.setStatus(ARRANGEMENT_STATUS_VALUE);
                ccmPatrolMissions.setOffice(sessionUser.getOffice().getId());
                Page<CcmPatrolMissions> tempPage = ccmPatrolMissionsService.findPage(new Page<>(pageNo, pageSize), ccmPatrolMissions);
                Set<String> collect = tempPage.getList().stream().map(item -> item.getId()).collect(Collectors.toSet());
                String[] ids = collect.toArray(new String[collect.size()]);
                ccmPatrolUnit.setMissionsIds(ids);
            }else{
                ccmPatrolUnit.setMissionsIds(new String[]{id});
            }
            page = ccmPatrolUnitService.findPage(new Page<>(pageNo, pageSize), ccmPatrolUnit);
        } else {
            ccmPatrolUnit.setUser(sessionUser);
            if(StringUtils.isNotBlank(id)) {
                ccmPatrolUnit.setMissionsIds(new String[]{id});
            }
            page = ccmPatrolUnitService.findPage(new Page<>(pageNo, pageSize), ccmPatrolUnit);
        }

        result.setCode(CcmRestType.OK);
        result.setResult(page.getList());

        return result;
    }

    @RequestMapping(value = "getUser")
    public CcmRestResult getUser(HttpServletRequest request, HttpServletResponse response) {
        CcmRestResult result = new CcmRestResult();
        User sessionUser = (User) request.getSession().getAttribute("user");
        if (sessionUser == null) {
            result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
            return result;
        }
        result.setCode(CcmRestType.OK);
        result.setResult(sessionUser);
        return result;
    }

    @RequestMapping(value = "save")
    public CcmRestResult save(String userId, CcmPatrolUnit ccmPatrolUnit, HttpServletRequest request, HttpServletResponse response) {
        CcmRestResult result = new CcmRestResult();
        User sessionUser = (User) request.getSession().getAttribute("user");
        if (sessionUser == null) {
            result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
            return result;
        }
        String sessionUserId = sessionUser.getId();
        if (userId == null || "".equals(userId) || !userId.equals(sessionUserId)) {
            result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
            return result;
        }
        if(ccmPatrolUnit.getMissions()==null){
            result.setCode(CcmRestType.ERROR_PARAM);
            return result;
        }

        CcmPatrolMissions ccmPatrolMissions = ccmPatrolMissionsService.get(ccmPatrolUnit.getMissions().getId());
        //判断是否是当前部门负责人
        if (userId.equals(sessionUser.getOffice().getPrimaryPerson().getId()) || "admin".equals(sessionUser.getLoginName())) {

            String[] split = ccmPatrolUnit.getUserIds().split(",");
            List<CcmPatrolUnit> ccmPatrolUnits = Lists.newArrayList();
            for (int i = 0; i < split.length; i++) {
                ccmPatrolUnit.setId(null);
                ccmPatrolUnit.setUser(new User(split[i]));
                ccmPatrolUnit.setCreateBy(sessionUser);
                ccmPatrolUnit.setStatus("02");
                ccmPatrolUnit.setUpdateBy(sessionUser);
                ccmPatrolUnit.setDepartureTime(ccmPatrolMissions.getPatrolTime());
                ccmPatrolUnitService.save(ccmPatrolUnit);
                ccmPatrolUnits.add(ccmPatrolUnit);

                //通知到手机APP
                Map<String, String> map = Maps.newHashMap();
                map.put("type","patrol_time_unit");
                map.put("id", ccmPatrolUnit.getId());
                map.put("name", ccmPatrolMissions.getPatrolContent());
                if(MessageTools.sendAppMsgByUserId(split[i], map)){
                    logger.info("巡逻单位任务发送app通知成功：id"+ccmPatrolUnit.getId());
                }else{
                    logger.error("巡逻单位任务发送app通知失败：id"+ccmPatrolUnit.getId());
                }
            }

            result.setCode(CcmRestType.OK);
            result.setResult(ccmPatrolUnits);
            return result;
        } else {
            result.setCode(CcmRestType.ERROR_NO_PERSSION);
            return result;
        }
    }


    @RequestMapping(value = "update")
    public CcmRestResult update(String userId, CcmPatrolUnit ccmPatrolUnit, HttpServletRequest request, HttpServletResponse response) {
        CcmRestResult result = new CcmRestResult();
        User sessionUser = (User) request.getSession().getAttribute("user");
        if (sessionUser == null) {
            result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
            return result;
        }
        String sessionUserId = sessionUser.getId();
        if (userId == null || "".equals(userId) || !userId.equals(sessionUserId)) {
            result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
        }

        //判断是否是当前部门负责人 不是过
        if (userId.equals(sessionUser.getOffice().getPrimaryPerson().getId()) || "admin".equals(sessionUser.getLoginName())) {
            //修改并没有做任何非空 不能修改项判断
            ccmPatrolUnitService.save(ccmPatrolUnit);

            //通知到手机APP
            Map<String, String> map = Maps.newHashMap();
            map.put("type","patrol_time_unit");
            map.put("id", ccmPatrolUnit.getId());

            map.put("name", ccmPatrolMissionsService.get(ccmPatrolUnit.getMissions().getId()).getPatrolContent());
            if(MessageTools.sendAppMsgByUserId(ccmPatrolUnit.getUser().getId(), map)){
                logger.info("巡逻单位任务发送app通知成功：id"+ccmPatrolUnit.getId());
            }else{
                logger.error("巡逻单位任务发送app通知失败：id"+ccmPatrolUnit.getId());
            }

            result.setCode(CcmRestType.OK);
            result.setResult(ccmPatrolUnit);
            return result;
        } else {
            result.setCode(CcmRestType.ERROR_NO_PERSSION);
            return result;
        }
    }

    @RequestMapping(value = "status")
    public CcmRestResult updataStatus(String userId, CcmPatrolUnit ccmPatrolUnit, HttpServletRequest request, HttpServletResponse response) {
        CcmRestResult result = new CcmRestResult();
        User sessionUser = (User) request.getSession().getAttribute("user");
        if (sessionUser == null) {
            result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
            return result;
        }
        String sessionUserId = sessionUser.getId();
        if (userId == null || "".equals(userId) || !userId.equals(sessionUserId)) {
            result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
        }

        //判断传参id 是否正确
        CcmPatrolUnit ccmPatrolUnit1 = ccmPatrolUnitService.get(ccmPatrolUnit.getId());
        if (ccmPatrolUnit1 == null) {
            result.setCode(CcmRestType.ERROR_DB_NOT_EXIST);
            return result;
        }

        //修改状态
        ccmPatrolUnit1.setStatus(ccmPatrolUnit.getStatus());
        //判断是不是当前数据的负责人
        if (ccmPatrolUnit1.getUser().getId().equals(sessionUserId)) {
            ccmPatrolUnitService.save(ccmPatrolUnit1);
            result.setCode(CcmRestType.OK);
            result.setResult(ccmPatrolUnit);
            //判断有没有 单位任务全部结束
            checkUnitStatusAllIsEnd(ccmPatrolUnit1.getMissions().getId());

            Map<String, String> stringStringMap = new HashMap<>();
            stringStringMap.put("id", ccmPatrolUnit1.getId());
            stringStringMap.put("name",ccmPatrolUnit1.getUser().getName()+"完成巡逻任务");
            Office office = officeService.get(ccmPatrolUnit1.getUser().getOffice().getId());
            String id = office.getPrimaryPerson().getId();
            MessageTools.sendAppMsgByUserId(id, stringStringMap);

            return result;
        } else {
            result.setCode(CcmRestType.ERROR_NO_PERSSION);
            return result;
        }

    }


    /**
     * 查看详情
     *
     * @param userId
     * @param id
     * @param req
     * @param resp
     * @return
     */
    @RequestMapping(value = "details")
    @ResponseBody
    public CcmRestResult getDetails(String userId, String id, HttpServletRequest req, HttpServletResponse resp) {


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
        if (id == null || "".equals(id)) {//参数id不对
            result.setCode(CcmRestType.ERROR_PARAM);
            return result;
        }

        CcmPatrolUnit ccmPatrolUnit = ccmPatrolUnitService.get(id);


        result.setCode(CcmRestType.OK);
        result.setResult(ccmPatrolUnit);

        return result;

    }



    /**
     * 查找列表
     *
     * @param userId
     * @param id
     * @param req
     * @param resp
     * @return
     */
    @RequestMapping(value = "findListByTaskId")
    @ResponseBody
    public CcmRestResult findListByTaskId(String userId, String tId, CcmPatrolUnit ccmPatrolUnit, HttpServletRequest req, HttpServletResponse resp) {


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
        if (tId == null || "".equals(tId)) {//参数id不对
            result.setCode(CcmRestType.ERROR_PARAM);
            return result;
        }

        ccmPatrolUnit.setMissionsIds(new String[]{tId});
        List<CcmPatrolUnit> list = ccmPatrolUnitService.findList(ccmPatrolUnit);


        result.setCode(CcmRestType.OK);
        result.setResult(list);

        return result;

    }


    /**
     * 获取单位的人员树
     * @return
     */
    @RequestMapping(value = "getTreeData")
    @ResponseBody
    public CcmRestResult getTreeData(String id){
        CcmRestResult result = new CcmRestResult();

        if(StringUtils.isBlank(id)){
            result.setCode(CcmRestType.ERROR_PARAM);
            return result;
        }
        CcmPatrolMissions ccmPatrolMissions = ccmPatrolMissionsService.get(id);
        if(ccmPatrolMissions==null){
            result.setCode(CcmRestType.ERROR_PARAM);
            return result;
        }

        String officeIds = ccmPatrolMissions.getOffice();
        //部门的ids
        String[] split = officeIds.split(",");

        if(split.length<=0 || StringUtils.isBlank(split[0])){
            result.setCode(CcmRestType.ERROR_NOT_EXIST_CRUCIAL_DATA);
            return result;
        }

        List<Map<String, Object>> mapList = Lists.newArrayList();
        //数据填进去
        for(int i = 0; i < split.length; ++i) {
            Office e = this.officeService.get(split[i]);
            Map<String, Object> map = Maps.newHashMap();
            map.put("id", e.getId());
            map.put("pId", e.getParentId());
            map.put("pIds", e.getParentIds());
            map.put("name", e.getName());
//			if (type != null && "3".equals(type)) {
            map.put("isParent", true);
//			}
            mapList.add(map);

            List<User> userByOfficeId = systemService.findUserByOfficeId(e.getId());

            userByOfficeId.forEach(item->{
                Map<String, Object> tempMap = Maps.newHashMap();
                tempMap.put("id",item.getId());
                tempMap.put("pId",item.getOffice());
                tempMap.put("name",item.getName());
                mapList.add(tempMap);
            });
//			}
        }

        result.setCode(CcmRestType.OK);
        result.setResult(mapList);

        return result;
    }


    /**
     * 判断单位任务是否全部结束 如果全部结束 巡逻任务 状态修改
     *
     * @param mid 巡逻任务id
     */
    private void checkUnitStatusAllIsEnd(String mid) {
        CcmPatrolUnit ccmPatrolUnit = new CcmPatrolUnit();
        ccmPatrolUnit.setMissions(new CcmPatrolMissions(mid));
        List<CcmPatrolUnit> list = ccmPatrolUnitService.findList(ccmPatrolUnit);
        //判断有几个状态为结束的
        List<CcmPatrolUnit> collect = list.stream().filter(item -> item.getStatus().equals(END_STATUS_VALUE)).collect(Collectors.toList());
        if (list.size() == collect.size()) {
            CcmPatrolMissions ccmPatrolMissions = ccmPatrolMissionsService.get(mid);
            ccmPatrolMissions.setStatus(END_STATUS_VALUE);
            ccmPatrolMissionsService.save(ccmPatrolMissions);
        }
    }


}