package com.arjjs.ccm.modules.ccm.rest.web;

import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.utils.StringUtils;
import com.arjjs.ccm.common.web.BaseController;
import com.arjjs.ccm.modules.ccm.patrol.entity.CcmPatrolMissions;
import com.arjjs.ccm.modules.ccm.patrol.service.CcmPatrolMissionsService;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestResult;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestType;
import com.arjjs.ccm.modules.ccm.security.entity.CcmPatrolSecurity;
import com.arjjs.ccm.modules.ccm.security.service.CcmPatrolSecurityService;
import com.arjjs.ccm.modules.flat.relief.entity.CcmReliefTask;
import com.arjjs.ccm.modules.flat.relief.service.CcmReliefTaskService;
import com.arjjs.ccm.modules.flat.unit.entity.CcmReliefUnit;
import com.arjjs.ccm.modules.flat.unit.service.CcmReliefUnitService;
import com.arjjs.ccm.modules.sys.entity.Office;
import com.arjjs.ccm.modules.sys.entity.User;
import com.arjjs.ccm.modules.sys.service.OfficeService;
import com.arjjs.ccm.modules.sys.service.SystemService;
import com.arjjs.ccm.modules.sys.utils.UserUtils;
import com.arjjs.ccm.tool.EntityTools;
import com.arjjs.ccm.tool.MessageTools;
import com.arjjs.ccm.tool.Tree;
import com.fay.tree.service.IFayTreeNode;
import com.fay.tree.util.FayTreeUtil;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequestMapping(value = "${appPath}/rest/spare")
public class CcmRestSpare extends BaseController {
    @Autowired
    private CcmReliefTaskService ccmReliefTaskService;
    @Autowired
    private OfficeService officeService;
    @Autowired
    private CcmReliefUnitService ccmReliefUnitService;
    @Autowired
    private SystemService systemService;
    @Autowired
    private CcmPatrolSecurityService ccmPatrolSecurityService;
    @Autowired
    private CcmPatrolMissionsService ccmPatrolMissionsService;

    private final String END_STATUS_VALUE="3";

    private final String ARRANGEMENT_STATUS_VALUE="2";
    /**
     * 任务列表
     * @param userId
     * @param req
     * @param resp
     * @param pageNo
     * @param ccmReliefTask
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/query", method = RequestMethod.GET)
    public CcmRestResult taskList(String userId, Integer pageNo, CcmReliefTask ccmReliefTask, HttpServletRequest req, HttpServletResponse resp) {
        CcmRestResult result = new CcmRestResult();
        //1、接口访问权限
        User sessionUser = (User) req.getSession().getAttribute("user");
        if (sessionUser == null){
            result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
            return result;
        }
        String sessionUserId = sessionUser.getId();
        if (userId == null || "".equals(userId)) {// 参数id不对
            result.setCode(CcmRestType.ERROR_PARAM);
            return result;
        }
        if (!userId.equals(sessionUserId)) {
            result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
            return result;
        }
        //2、根据用户显示不同的list
        //1)、如果是admin用户 直接取出所有的数据
        Page<CcmReliefTask> page = null;
        if ("admin".equals(sessionUser.getLoginName())) {
           page  = ccmReliefTaskService.findPage(new Page<>(pageNo, 30), ccmReliefTask);
        } else {
            //2）、如果是单位负责人只显示自己下发到自己单位的任务 不是则什么都不显示
            if (sessionUser.getOffice().getPrimaryPerson() != null && userId.equals(sessionUser.getOffice().getPrimaryPerson().getId())) {
                ccmReliefTask.setReliefDept(sessionUser.getOffice().getId());
                page = ccmReliefTaskService.findApp(new Page<>(pageNo, 30), ccmReliefTask);
            }
        }
        result.setCode(CcmRestType.OK);
        if (page != null) {
            page.getList()
                    .forEach(item -> item
                            .setReliefDeptName(item.getReliefDept().indexOf(",") != -1 ? idToOfficeName(item.getReliefDept().split(","))
                                    : item.getReliefDept().length() > 0 ? officeService.get(item.getReliefDept()).getName() : ""));
            result.setResult(page.getList());
        } else {
            result.setResult(null);
        }
        return result;
    }
    /**
     * 备勤任务详情
     */
    @ResponseBody
    @RequestMapping(value = "/taskdetail", method = RequestMethod.GET)
    public CcmRestResult taskDetail(String userId, String uuid, HttpServletRequest req, HttpServletResponse resp) {
        CcmRestResult result = new CcmRestResult();
        //1、验证权限
        User sessionUser = (User) req.getSession().getAttribute("user");
        if (sessionUser == null){
            result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
            return result;
        }
        String sessionUserId = sessionUser.getId();
        if (userId == null || "".equals(userId) || !userId.equals(sessionUserId)) {
            result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
            return result;
        }
        if (userId == null || "".equals(userId)) {// 参数id不对
            result.setCode(CcmRestType.ERROR_PARAM);
            return result;
        }
        CcmReliefTask ccmReliefTask = ccmReliefTaskService.get(uuid);
        result.setCode(CcmRestType.OK);
        result.setResult(ccmReliefTask);
        return result;
    }
    /**
     *
     * 备勤单位分配情况
     */
    @ResponseBody
    @RequestMapping(value = "/unit", method = RequestMethod.GET)
    public CcmRestResult unit(String userId, Integer pageNo, HttpServletRequest req, HttpServletResponse resp, CcmReliefUnit ccmReliefUnit) {
        CcmRestResult result = new CcmRestResult();
        //1、验证权限
        User sessionUser = (User) req.getSession().getAttribute("user");
        if (sessionUser == null){
            result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
            return result;
        }
        String sessionUserId = sessionUser.getId();
        if (userId == null || "".equals(userId) || !userId.equals(sessionUserId)) {
            result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
            return result;
        }
        if (userId == null || "".equals(userId)) {// 参数id不对
            result.setCode(CcmRestType.ERROR_PARAM);
            return result;
        }
        //2、根据用户显示不同的数据
        //管理员显示所有
        Page<CcmReliefUnit> page = null;
        if ("admin".equals(sessionUser.getLoginName())) {
            page = ccmReliefUnitService.findPage(new Page<>(req, resp), ccmReliefUnit);
        } else if(sessionUser.getOffice().getPrimaryPerson() != null && userId.equals(sessionUser.getOffice().getPrimaryPerson().getId())){
            //负责人显示本单位所有
            ccmReliefUnit.setMore1(sessionUser.getOffice().getId());
            page = ccmReliefUnitService.findPage(new Page<>(req, resp), ccmReliefUnit);
        }else {
            //民警只显示自己的
            ccmReliefUnit.setUser(sessionUser);
            page = ccmReliefUnitService.findPage(new Page<>(req, resp), ccmReliefUnit);
        }
        page.getList().forEach(item -> item.setUserName(item.getUser().getId().indexOf(",") != -1 ?
                idToUserName(item.getUser().getId().split(",")) :
                item.getUser().getId().length() > 0 ? systemService.getUser(item.getUser().getId()).getName() : ""
        ));

        List<CcmReliefUnit> list = page.getList();
        for (CcmReliefUnit reliefUnit : list) {
            if (StringUtils.isNotEmpty(reliefUnit.getMissionsId())) {
                reliefUnit.setMissionName(ccmReliefTaskService.get(reliefUnit.getMissionsId()).getTaskName());
            }
        }
        result.setCode(CcmRestType.OK);
        if (page != null && page.getList().size() > 0) {
            page.setPageNo(pageNo);
            result.setResult(list);
        } else {
            result.setResult(null);
        }
        return result;
    }

    /**
     *
     * 备勤单位分配情况
     */
    @ResponseBody
    @RequestMapping(value = "/unitmission", method = RequestMethod.GET)
    public CcmRestResult unitmission(String userId, String missionId, Integer pageNo, HttpServletRequest req, HttpServletResponse resp, CcmReliefUnit ccmReliefUnit) {
        CcmRestResult result = new CcmRestResult();
        //1、验证权限
        User sessionUser = (User) req.getSession().getAttribute("user");
        if (sessionUser == null){
            result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
            return result;
        }
        String sessionUserId = sessionUser.getId();
        if (userId == null || "".equals(userId)) {// 参数id不对
            result.setCode(CcmRestType.ERROR_PARAM);
            return result;
        }
        if (userId == null || "".equals(userId) || !userId.equals(sessionUserId)) {
            result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
            return result;
        }
        if (missionId == null || "".equals(missionId)) {

        } else {
            ccmReliefUnit.setMissionsId(missionId);
        }
        if (userId.equals(sessionUser.getOffice().getPrimaryPerson().getId()) || "admin".equals(sessionUser.getLoginName())) {

        } else {
            ccmReliefUnit.setUser(sessionUser);
        }

        Page<CcmReliefUnit> page = ccmReliefUnitService.findPage(new Page<>(req, resp), ccmReliefUnit);
        page.getList().forEach(item -> item.setUserName(item.getUser().getId().indexOf(",") != -1 ?
                idToUserName(item.getUser().getId().split(",")) :
                item.getUser().getId().length() > 0 ? systemService.getUser(item.getUser().getId()).getName() : ""
        ));
        List<CcmReliefUnit> list = page.getList();
        for (CcmReliefUnit reliefUnit : list) {
            if (StringUtils.isNotEmpty(reliefUnit.getMissionsId())) {
                reliefUnit.setMissionName(ccmReliefTaskService.get(reliefUnit.getMissionsId()).getTaskName());
            }
        }

        result.setCode(CcmRestType.OK);
        page.setPageNo(pageNo);
        result.setResult(page.getList());
        return result;
    }

    /**
     * 单位详情
     *
     */
     @ResponseBody
    @RequestMapping(value = "unitdetail")
    public CcmRestResult unitDetail(String userId, String uuid, HttpServletRequest req, HttpServletResponse resp) {
        CcmRestResult result = new CcmRestResult();
        //1、验证权限
        User sessionUser = (User) req.getSession().getAttribute("user");
        if (sessionUser == null){
            result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
            return result;
        }
        String sessionUserId = sessionUser.getId();
        if (userId == null || "".equals(userId) || !userId.equals(sessionUserId)) {
            result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
            return result;
        }
        if (userId == null || "".equals(userId)) {// 参数id不对
            result.setCode(CcmRestType.ERROR_PARAM);
            return result;
        }
         CcmReliefUnit ccmReliefUnit = ccmReliefUnitService.get(uuid);

        result.setCode(CcmRestType.OK);
        result.setResult(ccmReliefUnit);
        return result;
    }

    /**
     * 备勤安排
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/save", method = RequestMethod.POST)
    public CcmRestResult modify(String userId,CcmReliefUnit ccmReliefUnit,HttpServletRequest req, HttpServletResponse resp) {
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
        if (ccmReliefUnit.getId()!= null && !"".equals(ccmReliefUnit.getId())) { //修改
            CcmReliefUnit unitDB = ccmReliefUnitService.get(ccmReliefUnit.getId());
            if (unitDB == null ) {//从数据库中没有取到对应数据
                result.setCode(CcmRestType.ERROR_DB_NOT_EXIST);
                return result;
            }
            CcmReliefTask ccmReliefTask = ccmReliefTaskService.get(ccmReliefUnit.getMissionsId());
            if (ccmReliefTask == null) {
                result.setCode(CcmRestType.ERROR_DB_NOT_EXIST);
                return result;
            }
            ccmReliefUnitService.save(ccmReliefUnit);
            Map<String, String> map = Maps.newHashMap();
            map.put("type", "spare_time_unit");
            map.put("id", ccmReliefUnit.getId());
            map.put("name", ccmReliefUnit.getMissionName());
            MessageTools.sendAppMsgByUserId(ccmReliefUnit.getUser().getId(), map);
        } else {
            String userIds = ccmReliefUnit.getUser().toString();
            String[] userIdArr = userIds.split(",");
            for (int i = 0; i <userIdArr.length ; i++) {
                ccmReliefUnit.setId(null);
                ccmReliefUnit.setMore1(UserUtils.get(userIdArr[i]).getOffice().getId());
                ccmReliefUnit.setUser(UserUtils.get(userIdArr[i]));
                ccmReliefUnit.setStatus("02");
                ccmReliefUnitService.save(ccmReliefUnit);

                Map<String, String> map = Maps.newHashMap();
                map.put("type", "spare_time_unit");
                map.put("id", ccmReliefUnit.getId());
                map.put("name", ccmReliefUnit.getMissionName());
                MessageTools.sendAppMsgByUserId(userIdArr[i], map);
            }
        }
        result.setCode(CcmRestType.OK);
        result.setResult(ccmReliefUnit);
        return result;
    }

    /**
     * 备勤状态修改
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/status", method = RequestMethod.POST)
    public CcmRestResult status(String userId, String status, String id, HttpServletRequest req, HttpServletResponse resp) {
        CcmRestResult result = new CcmRestResult();
        //1、验证
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
        //2、
        CcmReliefUnit ccmReliefUnit = ccmReliefUnitService.get(id);
        if (ccmReliefUnit == null) {
            result.setCode(CcmRestType.ERROR_DB_NOT_EXIST);
            return result;
        }

        ccmReliefUnit.setStatus(status);
        if (sessionUserId.equals(ccmReliefUnit.getUser().getId())) {
            ccmReliefUnitService.save(ccmReliefUnit);
            result.setCode(CcmRestType.OK);
            result.setResult(ccmReliefUnit);
            //判断有没有 单位任务全部结束
            checkUnitStatusAllIsEnd(ccmReliefUnit.getMissionsId());

            Map<String, String> stringStringMap = new HashMap<>();
            stringStringMap.put("id", ccmReliefUnit.getId());
            stringStringMap.put("name",ccmReliefUnit.getUser().getName()+"完成巡逻任务");
            Office office = officeService.get(ccmReliefUnit.getUser().getOffice().getId());
            String id1 = office.getPrimaryPerson().getId();
            MessageTools.sendAppMsgByUserId(id1, stringStringMap);
            return result;
        } else {
            result.setCode(CcmRestType.ERROR_NO_PERSSION);
            return result;
        }

    }

    /**
     * 获取单位的人员树
     *
     * @return
     */
    @RequestMapping(value = "getTreeData")
    @ResponseBody
    public CcmRestResult getTreeData(String userId, String id, String type ,HttpServletRequest req, HttpServletResponse resp) {
        CcmRestResult result = new CcmRestResult();
        //1、验证
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
        if (StringUtils.isBlank(id)) {
            return null;
        }
        String officeIds = "";
        switch(type) {
            case "relieftask":
                CcmReliefTask ccmReliefTask = ccmReliefTaskService.get(id);
                if (EntityTools.isEmpty(ccmReliefTask)) {
                    return null;
                }
                officeIds = ccmReliefTask.getReliefDept();
                break;
            case "guard":
                CcmPatrolSecurity ccmPatrolSecurity = ccmPatrolSecurityService.get(id);
                if(ccmPatrolSecurity==null){
                    result.setCode(CcmRestType.ERROR_PARAM);
                    return result;
                }
                officeIds = ccmPatrolSecurity.getOffice();
                break;
            case "patrol":
                CcmPatrolMissions ccmPatrolMissions = ccmPatrolMissionsService.get(id);
                if(ccmPatrolMissions==null){
                    result.setCode(CcmRestType.ERROR_PARAM);
                    return result;
                }
                officeIds = ccmPatrolMissions.getOffice();
                break;
        }

        //部门的ids
        String split[] = null;
        if (sessionUser.isAdmin()) {
            if (officeIds.indexOf(",") != -1) {
                split = officeIds.split(",");
            } else if (officeIds.length() > 0) {
                split = new String[1];
                split[0] = officeIds;
            } else {
                return null;
            }
        } else {
            split = new String[1];
            split[0] =sessionUser.getOffice().getId();
        }

        List<IFayTreeNode> listTree = new ArrayList<IFayTreeNode>();
        //数据填进去
        for (int i = 0; i < split.length; ++i) {
            Office e = this.officeService.get(split[i]);
            boolean spread = true;//树形节点展开状态
            Tree tree = new Tree(e.getId(), e.getParentId(), e.getName(), "","", spread);
            listTree.add(tree);

            List<User> userByOfficeId = systemService.findUserByOfficeId(e.getId());

            userByOfficeId.forEach(item -> {
                Tree tree1 = new Tree(item.getId(),e.getId(), item.getName(), "","", false);
                listTree.add(tree1);
            });

        }
        Object data = FayTreeUtil.getTreeInJsonObject(listTree);
        result.setCode(CcmRestType.OK);
        result.setResult(data);
        return result;
    }

    @RequestMapping(value = "getUserType")
    @ResponseBody
    public CcmRestResult getUserType(String userId, String type ,HttpServletRequest req, HttpServletResponse resp) {
        CcmRestResult result = new CcmRestResult();
        //1、验证
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
        Map<String, Boolean> map = Maps.newHashMap();
        map.put("isResponsalbe", false);
        if ("admin".equals(sessionUser.getLoginName())) {
            map.put("isResponsalbe", true);
        } else {
            if (sessionUser.getOffice().getPrimaryPerson() != null && userId.equals(sessionUser.getOffice().getPrimaryPerson().getId())) {
                map.put("isResponsalbe", true);
            }
        }
        result.setCode(CcmRestType.OK);
        result.setResult(map);
        return result;
    }

    private String idToUserName(String[] strings) {
        StringBuffer name = new StringBuffer();
        for (int i = 0; i < strings.length; i++) {

            User user = systemService.getUser(strings[i]);
            if (user == null) {
                continue;
            }
            if (name.length() > 0) {
                name.append(",");
            }
            name.append(user.getName());
        }
        return name.toString();
    }

    private String idToOfficeName(String[] strings) {
        String name = "";
        for (int i = 0; i < strings.length; i++) {
            Office office = officeService.get(strings[i]);
            if (office == null) {
                return null;
            }
            if (i == 0) {
                name = office.getName();
            } else {
                name += "," + office.getName();
            }
        }
        return name;
    }


    private void checkUnitStatusAllIsEnd(String mid){
        CcmReliefUnit ccmReliefUnit = new CcmReliefUnit();
        ccmReliefUnit.setMissionsId(mid);
        List<CcmReliefUnit> list = ccmReliefUnitService.findList(ccmReliefUnit);
        //判断有几个状态为结束的
        List<CcmReliefUnit> collect = list.stream().filter(item -> item.getStatus().equals(ARRANGEMENT_STATUS_VALUE)).collect(Collectors.toList());

        if(list.size() == collect.size()){ //都结束了改变任务状态
            CcmReliefTask ccmReliefTask = ccmReliefTaskService.get(mid);
            ccmReliefTask.setReviewStatus(END_STATUS_VALUE);
            ccmReliefTaskService.save(ccmReliefTask);
        }
    }

}
