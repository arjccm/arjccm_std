/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.list.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.arjjs.ccm.modules.iot.face.entity.CcmFaceControl;
import com.arjjs.ccm.modules.iot.face.service.CcmFaceControlService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.arjjs.ccm.common.config.Global;
import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.web.BaseController;
import com.arjjs.ccm.common.utils.StringUtils;
import com.arjjs.ccm.modules.ccm.list.entity.CcmListAlarm;
import com.arjjs.ccm.modules.ccm.list.service.CcmListAlarmService;

import java.util.List;

/**
 * 布控预警展示Controller
 * @author cby
 * @version 2020-08-21
 */
@Controller
@RequestMapping(value = "${adminPath}/list/ccmListAlarm")
public class CcmListAlarmController extends BaseController {

	@Autowired
	private CcmListAlarmService ccmListAlarmService;

	@Autowired
	private CcmFaceControlService ccmFaceControlService;
	
	@ModelAttribute
	public CcmListAlarm get(@RequestParam(required=false) String id) {
		CcmListAlarm entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = ccmListAlarmService.get(id);
		}
		if (entity == null){
			entity = new CcmListAlarm();
		}
		return entity;
	}
	
	@RequiresPermissions("list:ccmListAlarm:view")
	@RequestMapping(value = {"list", ""})
	public String list(CcmListAlarm ccmListAlarm, HttpServletRequest request, HttpServletResponse response, Model model) {
		List<CcmFaceControl> controls = ccmFaceControlService.findList(new CcmFaceControl());
		Page<CcmListAlarm> page = ccmListAlarmService.findPage(new Page<CcmListAlarm>(request, response), ccmListAlarm);
		model.addAttribute("controls", controls);
		model.addAttribute("page", page);
		return "ccm/list/ccmListAlarmList";
	}

	@RequiresPermissions("list:ccmListAlarm:view")
	@RequestMapping(value = "form")
	public String form(CcmListAlarm ccmListAlarm, Model model) {
		model.addAttribute("ccmListAlarm", ccmListAlarm);
		return "ccm/list/ccmListAlarmForm";
	}

	@RequiresPermissions("list:ccmListAlarm:edit")
	@RequestMapping(value = "save")
	public String save(CcmListAlarm ccmListAlarm, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, ccmListAlarm)){
			return form(ccmListAlarm, model);
		}
		ccmListAlarmService.save(ccmListAlarm);
		addMessage(redirectAttributes, "保存布控预警成功");
		return "redirect:"+Global.getAdminPath()+"/list/ccmListAlarm/?repage";
	}
	
	@RequiresPermissions("list:ccmListAlarm:edit")
	@RequestMapping(value = "delete")
	public String delete(CcmListAlarm ccmListAlarm, RedirectAttributes redirectAttributes) {
		ccmListAlarmService.delete(ccmListAlarm);
		addMessage(redirectAttributes, "删除布控预警成功");
		return "redirect:"+Global.getAdminPath()+"/list/ccmListAlarm/?repage";
	}

}