/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.rest.web;

import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.utils.StringUtils;
import com.arjjs.ccm.common.web.BaseController;
import com.arjjs.ccm.modules.ccm.patrol.entity.CcmPatrolMissions;
import com.arjjs.ccm.modules.ccm.patrol.entity.CcmPatrolUnit;
import com.arjjs.ccm.modules.ccm.patrol.service.CcmPatrolMissionsService;
import com.arjjs.ccm.modules.ccm.patrol.service.CcmPatrolUnitService;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestResult;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestType;
import com.arjjs.ccm.modules.oa.service.OaNotifyService;
import com.arjjs.ccm.modules.sys.entity.Office;
import com.arjjs.ccm.modules.sys.entity.User;
import com.arjjs.ccm.modules.sys.service.OfficeService;
import com.arjjs.ccm.modules.sys.utils.UserUtils;
import com.arjjs.ccm.tool.MessageTools;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * 巡逻任务Controller
 * @author lijiupeng
 * @version 2019-07-05
 */
@Controller
@RequestMapping(value = "${appPath}/rest/ccmPatrolMissions")
public class CcmRestMissions extends BaseController {

	@Autowired
	private CcmPatrolMissionsService ccmPatrolMissionsService;

	@Autowired
	private CcmPatrolUnitService ccmPatrolUnitService;
	@Autowired
	private OfficeService officeService;
	@Autowired
	private OaNotifyService oaNotifyService;

	/**
	 * 任务类型标识 自定义
	 */
	private final String TYPE="patrol_time_task";

	//巡逻任务安排
	@RequestMapping(value = "arrangement")
	@ResponseBody
	public CcmRestResult arrangement(String userId,Integer pageNo,Integer pageSize, CcmPatrolMissions build,HttpServletRequest req, HttpServletResponse resp) {

		pageSize = 30;
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


		Office office = sessionUser.getOffice();
		if(office==null){
			result.setCode(CcmRestType.ERROR_NOT_EXIST_CRUCIAL_DATA);
			return result;
		}
		User primaryPerson = office.getPrimaryPerson();
		if(primaryPerson==null){
			result.setCode(CcmRestType.ERROR_NOT_EXIST_CRUCIAL_DATA);
			return result;
		}
		String id = primaryPerson.getId();
		if(id==null){
			result.setCode(CcmRestType.ERROR_NOT_EXIST_CRUCIAL_DATA);
			return result;
		}
		Page<CcmPatrolMissions> page = null;
		Page<CcmPatrolMissions> pageParam = new Page<>();
		pageParam.setPageSize(pageSize);
		pageParam.setPageNo(pageNo);
		if ("admin".equals(sessionUser.getLoginName())) {
			page = ccmPatrolMissionsService.findPage(pageParam, build);
		} else {
			if (id.equals(sessionUserId)) {
				build.setOffice(office.getId());
				page = ccmPatrolMissionsService.findPage(pageParam, build);
			}
		}

		if(page==null){
			result.setResult(Lists.newArrayList());
			result.setCode(CcmRestType.OK);
			return result;
		}

		//按部门id查询部门名称
		page.getList().forEach(item->item.setOfficeName(item.getOffice().indexOf(",")!=-1 ?
				idToOfficeName(item.getOffice().split(",")) :
				item.getOffice().length()>0 ? officeService.get(item.getOffice()).getName() :""
		));

		result.setCode(CcmRestType.OK);
		result.setResult(page.getList());

		return result;

	}

	/**
	 * 	查看详情
	 * @param userId
	 * @param id
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "details")
	@ResponseBody
	public CcmRestResult getDetails(String userId,String id,HttpServletRequest req, HttpServletResponse resp){


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

		CcmPatrolMissions ccmPatrolMissions = ccmPatrolMissionsService.get(id);

		ccmPatrolMissions.setOfficeName(
				ccmPatrolMissions.getOffice().indexOf(",")!=-1 ?
						idToOfficeName(ccmPatrolMissions.getOffice().split(",")) :
						ccmPatrolMissions.getOffice().length()>0 ? officeService.get(ccmPatrolMissions.getOffice()).getName() :"");

		result.setCode(CcmRestType.OK);
		result.setResult(ccmPatrolMissions);

		return result;

	}


	/**
	 *如果为null 则没有权限查询
	 */
	private String idToOfficeName(String [] strings){
		String name="";
		for (int i = 0; i < strings.length; i++) {

			Office office = officeService.get(strings[i]);
			if(office==null){
				return null;
			}
			if(i==0){
				name=office.getName();
			}else{
				name+=","+office.getName();
			}
		}
		return name;
	}




	@RequestMapping(value = "save")
	@ResponseBody
	public CcmRestResult save(String userId,CcmPatrolMissions ccmPatrolMissions,HttpServletRequest req, HttpServletResponse resp) {
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

		ccmPatrolMissionsService.save(ccmPatrolMissions);
		String officeIds = ccmPatrolMissions.getOffice();
		String taskUrl="/patrol/ccmPatrolMissions/details2?id="+ccmPatrolMissions.getId();
		//发送通知
		MessageTools.sendMessageByOfficePersonInCharge(
				oaNotifyService,officeService,officeIds,ccmPatrolMissions.getPatrolContent(),ccmPatrolMissions.getRemarks(),"1",taskUrl);

		//通知到手机APP
		Map<String, Object> map = Maps.newHashMap();
		map.put("type",TYPE);
		map.put("id", ccmPatrolMissions.getId());
		map.put("name", ccmPatrolMissions.getPatrolContent());
		MessageTools.sendAppMsgByOfficeId(officeService, ccmPatrolMissions.getOffice(), map);
		result.setCode(CcmRestType.OK);
		result.setResult(ccmPatrolMissions);
		return result;
	}


	@RequestMapping(value = "delete")
	@ResponseBody
	public CcmRestResult delete(String userId, CcmPatrolMissions ccmPatrolMissions, HttpServletRequest req, HttpServletResponse resp) {
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

		ccmPatrolMissionsService.delete(ccmPatrolMissions);

		result.setCode(CcmRestType.OK);
		result.setResult(ccmPatrolMissions);
		return result;
	}

	@RequestMapping(value = "checkTack")
	@ResponseBody
	public CcmRestResult checkTask(String userId, CcmPatrolMissions ccmPatrolMissions, HttpServletRequest req, HttpServletResponse resp) {
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

		if(StringUtils.isBlank(ccmPatrolMissions.getId())){
			result.setCode(CcmRestType.ERROR_PARAM);
			return result;
		}


		CcmPatrolUnit ccmPatrolUnit = new CcmPatrolUnit();
		ccmPatrolUnit.setMissionsIds(new String[]{ccmPatrolMissions.getId()});
		List<CcmPatrolUnit> list = ccmPatrolUnitService.findList(ccmPatrolUnit);



		result.setCode(CcmRestType.OK);
		result.setResult(list);
		return result;
	}



}