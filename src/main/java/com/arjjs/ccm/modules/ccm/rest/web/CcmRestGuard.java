/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.rest.web;

import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.utils.JedisUtils;
import com.arjjs.ccm.common.utils.StringUtils;
import com.arjjs.ccm.common.web.BaseController;
import com.arjjs.ccm.modules.ccm.guard.entity.CcmGuardUnit;
import com.arjjs.ccm.modules.ccm.guard.service.CcmGuardUnitService;
import com.arjjs.ccm.modules.ccm.patrol.entity.CcmPatrolMissions;
import com.arjjs.ccm.modules.ccm.patrol.entity.CcmPatrolUnit;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestResult;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestType;
import com.arjjs.ccm.modules.ccm.security.entity.CcmPatrolSecurity;
import com.arjjs.ccm.modules.ccm.security.service.CcmPatrolSecurityService;
import com.arjjs.ccm.modules.oa.service.OaNotifyService;
import com.arjjs.ccm.modules.sys.entity.Office;
import com.arjjs.ccm.modules.sys.entity.User;
import com.arjjs.ccm.modules.sys.service.OfficeService;
import com.arjjs.ccm.modules.sys.service.SystemService;
import com.arjjs.ccm.tool.DateTools;
import com.arjjs.ccm.tool.JobDetailTools;
import com.arjjs.ccm.tool.MessageTools;
import com.arjjs.ccm.tool.SendMessageByQuartz;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import org.apache.poi.ss.formula.functions.T;
import org.quartz.JobDataMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 警卫单位Controller
 *
 * @author lijiupeng
 * @version 2019-07-08
 */
@RequestMapping(value = "${appPath}/rest/CcmGuardUnit")
@RestController
public class CcmRestGuard extends BaseController {

    @Autowired
    private CcmGuardUnitService ccmGuardUnitService;

    @Autowired
    private CcmPatrolSecurityService ccmPatrolSecurityService;

    @Autowired
    private OfficeService officeService;
    @Autowired
    private SystemService systemService;
    @Autowired
    private OaNotifyService oaNotifyService;

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
    private static final String TYPE = "guard_time_unit";
    /**
     * 定时任务组的名称
     */
    final String GROUP_NAME = "ccmPatrolSecurity";

    @RequestMapping(value = "list")
    public CcmRestResult list(String userId, CcmGuardUnit ccmGuardUnit, Integer pageNo, String sid, HttpServletRequest request, HttpServletResponse response) {

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
        Page<CcmGuardUnit> page=null;

        if("admin".equals(sessionUser.getLoginName())){
            page = ccmGuardUnitService.findPage(new Page<>(pageNo, 30), ccmGuardUnit);
            if (page!=null) {
                result.setResult(page.getList());
            }
            result.setCode(CcmRestType.OK);
            return result;
        }

        CcmPatrolSecurity security = ccmGuardUnit.getSecurity();
        String id=null;
        if(security!=null){
           id=security.getId();
        }

        //判断是否是部门负责人
        if (userId.equals(sessionUser.getOffice().getPrimaryPerson().getId())) {
            if(StringUtils.isBlank(id)){
            CcmPatrolSecurity ccmPatrolSecurity = new CcmPatrolSecurity();
            ccmPatrolSecurity.setStatus(ARRANGEMENT_STATUS_VALUE);
            ccmPatrolSecurity.setOffice(sessionUser.getOffice().getId());
            List<CcmPatrolSecurity> tempPage = ccmPatrolSecurityService.findList(ccmPatrolSecurity);
            Set<String> collect = tempPage.stream().map(item -> item.getId()).collect(Collectors.toSet());
            String[] ids = collect.toArray(new String[collect.size()]);

            ccmGuardUnit.setSecurityIds(ids.length==0 ? null : ids);
            }else{
                ccmGuardUnit.setSecurityIds(new String[]{id});
            }
            if (ccmGuardUnit.getSecurityIds()!=null) {
                page = ccmGuardUnitService.findPage(new Page<>(pageNo, 30), ccmGuardUnit);
                //警卫路线 没到到时间不显示
                for (CcmGuardUnit guardUnit : page.getList()) {
                    if (guardUnit.getDepartureTime().getTime()>System.currentTimeMillis()) {
                        guardUnit.setGuardLine("");
                    }
                }
            }

        } else {
                ccmGuardUnit.setUser(sessionUser);
            if(StringUtils.isNotBlank(id)){
                ccmGuardUnit.setSecurityIds(new String[]{id});
            }
            page = ccmGuardUnitService.findPage(new Page<>(pageNo, 30), ccmGuardUnit);
            //警卫任务 没到到时间不显示
            for (CcmGuardUnit guardUnit : page.getList()) {
                if (guardUnit.getDepartureTime().getTime()>System.currentTimeMillis()) {
                    guardUnit.setGuardLine("");
                }
            }
        }

        if (page!=null) {
            result.setResult(page.getList());
        }
        result.setCode(CcmRestType.OK);

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
    public CcmRestResult save(String userId, CcmGuardUnit ccmGuardUnit, HttpServletRequest request, HttpServletResponse response) {
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

            CcmPatrolSecurity ccmPatrolSecurity=ccmPatrolSecurityService.get(ccmGuardUnit.getSecurity().getId());
            String[] split = ccmGuardUnit.getUserIds().split(",");
            List<CcmGuardUnit> ccmGuardUnits = Lists.newArrayList();
            for (int i = 0; i < split.length; i++) {
                ccmGuardUnit.setId(null);
                User user = new User(split[i]);
                ccmGuardUnit.setUser(user);
                ccmGuardUnit.setCreateBy(user);
                ccmGuardUnit.setUpdateBy(user);
                //警卫单位进行中状态
                ccmGuardUnit.setStatus("02");
                ccmGuardUnit.setSecurity(ccmPatrolSecurity);
                ccmGuardUnit.setDepartureTime(ccmPatrolSecurity.getSecurityTime());
                ccmGuardUnitService.save(ccmGuardUnit);
                ccmGuardUnits.add(ccmGuardUnit);
                //通知到手机APP
                Map<String, String> map = Maps.newHashMap();
                map.put("type",TYPE);
                map.put("id", ccmGuardUnit.getId());
                map.put("name", ccmPatrolSecurityService.get(ccmGuardUnit.getSecurity().getId()).getTitle());
                if(MessageTools.sendAppMsgByUserId(split[i], map)){
                    logger.info("警卫单位任务发送app通知成功：id"+ccmGuardUnit.getId());
                }else {
                    logger.error("警卫单位任务发送app通知失败：id" + ccmGuardUnit.getId());
                }

            }
            if (ccmPatrolSecurity.getSecurityTime().getTime()>System.currentTimeMillis()) {
                String taskUrl = "/security/ccmPatrolSecurity/form?id=" + ccmPatrolSecurity.getId();
                JobDataMap jobDataMap = new JobDataMap();
                jobDataMap.put("oaNotifyService", oaNotifyService);
                jobDataMap.put("officeService", officeService);
                jobDataMap.put("userIds", ccmPatrolSecurity.getOffice());
                jobDataMap.put("title", ccmPatrolSecurity.getTitle());
                jobDataMap.put("content", ccmPatrolSecurity.getGuardLine());
                jobDataMap.put("status", "1");
                jobDataMap.put("taskUrl", taskUrl);
                jobDataMap.put("thisId", ccmPatrolSecurity.getId());
                String strTime = "";
                Date time = ccmPatrolSecurity.getSecurityTime();
                try {
                    strTime = DateTools.getSecondByDate(time) + " " + DateTools.getMinuteByDate(time) + " " + DateTools.getHourByDate(time) + " " + DateTools.getDayByDate(time) + " " + DateTools.getMonthByDate(time) + " ? ";
                } catch (Exception e) {
                    e.printStackTrace();
                }
                //添加定时任务
                if (JobDetailTools.addJobDeteil(SendMessageByQuartz.class, jobDataMap, ccmGuardUnit.getId(), GROUP_NAME, strTime, 0)) {
                    logger.info("添加定时通知成功'警卫路线' id:" + ccmPatrolSecurity.getId());
                } else {
                    logger.error("添加定时通知失败'警卫路线' id:" + ccmPatrolSecurity.getId());
                }
            }

            result.setCode(CcmRestType.OK);
            result.setResult(ccmGuardUnits);
            return result;
        } else {
            result.setCode(CcmRestType.ERROR_NO_PERSSION);
            return result;
        }

    }


    @RequestMapping(value = "update")
    public CcmRestResult update(String userId, CcmGuardUnit ccmGuardUnit, HttpServletRequest request, HttpServletResponse response) {
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
            ccmGuardUnitService.save(ccmGuardUnit);
            result.setCode(CcmRestType.OK);
            result.setResult(ccmGuardUnit);

            //通知到手机APP
            Map<String, String> map = Maps.newHashMap();
            map.put("type",TYPE);
            map.put("id", ccmGuardUnit.getId());
            map.put("name", ccmPatrolSecurityService.get(ccmGuardUnit.getSecurity().getId()).getTitle());
            if(MessageTools.sendAppMsgByUserId(ccmGuardUnit.getUser().getId(), map)){
                logger.info("警卫单位任务发送app通知成功：id"+ccmGuardUnit.getId());
            }else{
                logger.error("警卫单位任务发送app通知失败：id"+ccmGuardUnit.getId());
            }
            return result;
        } else {
            result.setCode(CcmRestType.ERROR_NO_PERSSION);
            return result;
        }

    }


    @RequestMapping(value = "status")
    public CcmRestResult updataStatus(String userId, CcmGuardUnit ccmGuardUnit, HttpServletRequest request, HttpServletResponse response) {
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
        CcmGuardUnit ccmGuardUnit1 = ccmGuardUnitService.get(ccmGuardUnit.getId());
        if (ccmGuardUnit1 == null) {
            result.setCode(CcmRestType.ERROR_DB_NOT_EXIST);
            return result;
        }

        //修改状态
        ccmGuardUnit1.setStatus(ccmGuardUnit.getStatus());
        //判断是不是当前数据的负责人
        if (ccmGuardUnit1.getUser().getId().equals(sessionUserId)) {
            ccmGuardUnitService.save(ccmGuardUnit1);
            result.setCode(CcmRestType.OK);
            result.setResult(ccmGuardUnit);
            //判断有没有 单位任务全部结束
            checkUnitStatusAllIsEnd(ccmGuardUnit1.getSecurity().getId());
            Map<String, String> stringStringMap = new HashMap<>();
            stringStringMap.put("id", ccmGuardUnit1.getId());
            stringStringMap.put("name",ccmGuardUnit1.getUser().getName()+"完成巡逻任务");
            Office office = officeService.get(ccmGuardUnit1.getUser().getOffice().getId());
            String id1 = office.getPrimaryPerson().getId();
            MessageTools.sendAppMsgByUserId(id1, stringStringMap);
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

        CcmGuardUnit ccmGuardUnit = ccmGuardUnitService.get(id);


        result.setCode(CcmRestType.OK);
        result.setResult(ccmGuardUnit);
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
        CcmPatrolSecurity ccmPatrolSecurity = ccmPatrolSecurityService.get(id);
        if(ccmPatrolSecurity==null){
            result.setCode(CcmRestType.ERROR_PARAM);
            return result;
        }

        String officeIds = ccmPatrolSecurity.getOffice();
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
        CcmGuardUnit ccmGuardUnit = new CcmGuardUnit();
        ccmGuardUnit.setSecurity(new CcmPatrolSecurity(mid));
        List<CcmGuardUnit> list = ccmGuardUnitService.findList(ccmGuardUnit);
        //判断有几个状态为结束的
        List<CcmGuardUnit> collect = list.stream().filter(item -> item.getStatus().equals(END_STATUS_VALUE)).collect(Collectors.toList());

        if (list.size() == collect.size()) {
            CcmPatrolSecurity ccmPatrolSecurity = ccmPatrolSecurityService.get(mid);
            ccmPatrolSecurity.setStatus(END_STATUS_VALUE);
            ccmPatrolSecurityService.save(ccmPatrolSecurity);
        }
    }


}