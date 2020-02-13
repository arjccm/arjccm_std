package com.arjjs.ccm.modules.ccm.fence.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.web.BaseController;
import com.arjjs.ccm.modules.ccm.fence.entity.CcmElecfenceAlarm;
import com.arjjs.ccm.modules.ccm.fence.service.CcmElecfenceAlarmService;

/**
 * 电子围栏报警日志实体类Controller
 * @author arj0704
 * @version 2019-08-02
 */
@Controller
@RequestMapping(value = "${adminPath}/fenceAlarm/ccmElecfenceAlarm")
public class ccmElecfenceAlarmController extends BaseController{
	
	@Autowired
	private CcmElecfenceAlarmService ccmElecfenceAlarmService;
	
	@RequiresPermissions("fenceAlarm:ccmElecfenceAlarm:view")
	@RequestMapping(value = {"list", ""})
	public String list(CcmElecfenceAlarm ccmElecfenceAlarm, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CcmElecfenceAlarm> page = ccmElecfenceAlarmService.findPage(new Page<CcmElecfenceAlarm>(request, response), ccmElecfenceAlarm); 
		model.addAttribute("page", page);
		return "ccm/fence/ccmElecFenceAlarmlogList";
	}
}
