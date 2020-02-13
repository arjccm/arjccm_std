/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.rest.web;

import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.utils.StringUtils;
import com.arjjs.ccm.common.web.BaseController;
import com.arjjs.ccm.modules.ccm.guard.entity.CcmGuardUnit;
import com.arjjs.ccm.modules.ccm.guard.service.CcmGuardUnitService;
import com.arjjs.ccm.modules.ccm.patrol.entity.CcmPatrolMissions;
import com.arjjs.ccm.modules.ccm.patrol.service.CcmPatrolMissionsService;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestResult;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestType;
import com.arjjs.ccm.modules.ccm.security.entity.CcmPatrolSecurity;
import com.arjjs.ccm.modules.ccm.security.service.CcmPatrolSecurityService;
import com.arjjs.ccm.modules.oa.service.OaNotifyService;
import com.arjjs.ccm.modules.sys.entity.Office;
import com.arjjs.ccm.modules.sys.entity.User;
import com.arjjs.ccm.modules.sys.service.OfficeService;
import com.arjjs.ccm.tool.DateTools;
import com.arjjs.ccm.tool.JobDetailTools;
import com.arjjs.ccm.tool.MessageTools;
import com.arjjs.ccm.tool.SendMessageByQuartz;
import org.quartz.JobDataMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;

/**
 * 警卫任务Controller
 * @author lijiupeng
 * @version 2019-07-05
 */
@Controller
@RequestMapping(value = "${appPath}/rest/security")
public class CcmRestSecurity extends BaseController {

	@Autowired
	private CcmPatrolSecurityService ccmPatrolSecurityService;
	@Autowired
    private CcmGuardUnitService ccmGuardUnitService;
	@Autowired
	private OfficeService officeService;
	@Autowired
	private OaNotifyService oaNotifyService;

	/**
	 * 保存时的出警时间 的容错差 毫秒
	 */
	private final int SECOND=60000;
	/**
	 * 定时任务组的名称
	 */
	private final String GROUP_NAME = "ccmPatrolSecurity";

	/**
	 * 审核状态
	 */
	private final String APPROVED="2";

	//警卫任务安排
	@RequestMapping(value = "arrangement")
	@ResponseBody
	public CcmRestResult arrangement(String userId,CcmPatrolSecurity build,HttpServletRequest req, HttpServletResponse resp,Integer pageNo) {


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


        String id = sessionUser.getOffice().getPrimaryPerson().getId();

        if (!id.equals(sessionUserId)){
            result.setCode(CcmRestType.ERROR_NO_PERSSION);
            return result;
        }
		if (!"admin".equals(sessionUser.getLoginName())) {
			String offId = sessionUser.getOffice().getId();
			build.setOffice(offId);
		}

		Page<CcmPatrolSecurity> page = ccmPatrolSecurityService.findPage(new Page<>(req, resp), build);

		//按部门id查询部门名称
		page.getList().forEach(item->item.setOfficeName(item.getOffice().indexOf(",")!=-1 ?
				idToOfficeName(item.getOffice().split(",")) :
				item.getOffice().length()>0 ? officeService.get(item.getOffice()).getName() :""
		));


		page.setPageNo(pageNo);
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

		CcmPatrolSecurity ccmPatrolSecurity = ccmPatrolSecurityService.get(id);
        if( ccmPatrolSecurity!=null && StringUtils.isNotBlank(ccmPatrolSecurity.getOffice()) ){
            ccmPatrolSecurity.setOfficeName(
                    ccmPatrolSecurity.getOffice().indexOf(",")!=-1 ?
                            idToOfficeName(ccmPatrolSecurity.getOffice().split(",")) :
                            ccmPatrolSecurity.getOffice().length()>0 ? officeService.get(ccmPatrolSecurity.getOffice()).getName() :"");

        }

		result.setCode(CcmRestType.OK);
		result.setResult(ccmPatrolSecurity);

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
	public CcmRestResult save(String userId,CcmPatrolSecurity ccmPatrolSecurity,HttpServletRequest req, HttpServletResponse resp) {
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

		//持久化 获得id
		ccmPatrolSecurityService.save(ccmPatrolSecurity);
		//任务url
		String taskUrl="/security/ccmPatrolSecurity/form?id="+ccmPatrolSecurity.getId();

		if(APPROVED.equals(ccmPatrolSecurity.getAuditingStatus())){

			if((ccmPatrolSecurity.getSecurityTime().getTime()-System.currentTimeMillis())>SECOND){
				JobDataMap jobDataMap=new JobDataMap();
				jobDataMap.put("oaNotifyService",oaNotifyService);
				jobDataMap.put("officeService",officeService);
				jobDataMap.put("ids",ccmPatrolSecurity.getOffice());
				jobDataMap.put("title",ccmPatrolSecurity.getTitle());
				jobDataMap.put("content",ccmPatrolSecurity.getRemarks());
				jobDataMap.put("status","1");
				jobDataMap.put("taskUrl",taskUrl);
				jobDataMap.put("thisId",ccmPatrolSecurity.getId());
				//任务名称
				String name=ccmPatrolSecurity.getId();
				Date time = ccmPatrolSecurity.getSecurityTime();
				String strTime = "";

				try {

					strTime =DateTools.getSecondByDate(time)+" "+ DateTools.getMinuteByDate(time)+" "+DateTools.getHourByDate(time)+" "+DateTools.getDayByDate(time)+" "+DateTools.getMonthByDate(time)+" ? ";

				} catch (Exception e) {
					e.printStackTrace();
				}
				//添加定时任务
				if(JobDetailTools.addJobDeteil(SendMessageByQuartz.class,jobDataMap,name, GROUP_NAME,strTime,0)) {
					logger.info("添加定时通知成功'警卫任务' id:" + ccmPatrolSecurity.getId());
				} else{
					logger.error("添加定时通知失败'警卫任务' id:"+ccmPatrolSecurity.getId());
				}



			}else if((ccmPatrolSecurity.getSecurityTime().getTime()-System.currentTimeMillis())>0){
				//如果小于一分钟立刻下发通知
				MessageTools.sendMessageByOfficePersonInCharge(oaNotifyService,officeService,ccmPatrolSecurity.getOffice(),"警卫任务",ccmPatrolSecurity.getRemarks(),"1",taskUrl);
			}else{
				logger.error("警卫时间不是未来时间，不合法，不发送通知id:"+ccmPatrolSecurity.getId());
			}


		}

		result.setCode(CcmRestType.OK);
		result.setResult(ccmPatrolSecurity);
		return result;
	}


	@RequestMapping(value = "delete")
	@ResponseBody
	public CcmRestResult delete(String userId, CcmPatrolSecurity ccmPatrolSecurity, HttpServletRequest req, HttpServletResponse resp) {
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

		ccmPatrolSecurityService.delete(ccmPatrolSecurity);

		result.setCode(CcmRestType.OK);
		result.setResult(ccmPatrolSecurity);
		return result;
	}


    @RequestMapping(value = "checkTack")
    @ResponseBody
    public CcmRestResult checkTask(String userId, CcmPatrolSecurity ccmPatrolSecurity, HttpServletRequest req, HttpServletResponse resp) {
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

        if(StringUtils.isBlank(ccmPatrolSecurity.getId())){
            result.setCode(CcmRestType.ERROR_PARAM);
            return result;
        }

        CcmGuardUnit ccmPatrolUnit = new CcmGuardUnit();
        ccmPatrolUnit.setSecurity(new CcmPatrolSecurity(ccmPatrolSecurity.getId()));
        List<CcmGuardUnit> list = ccmGuardUnitService.findList(ccmPatrolUnit);


        result.setCode(CcmRestType.OK);
        result.setResult(list);
        return result;
    }



}