/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.publicity.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.arjjs.ccm.modules.ccm.publicity.entity.CcmDeviceViewLog;
import com.arjjs.ccm.modules.ccm.publicity.service.CcmDeviceViewLogService;

/**
 * 历史查看管理Controller
 * @author cby
 * @version 2021-01-30
 */
@Controller
@RequestMapping(value = "${adminPath}/publicity/ccmDeviceViewLog")
public class CcmDeviceViewLogController extends BaseController {

	@Autowired
	private CcmDeviceViewLogService ccmDeviceViewLogService;
	
	@ModelAttribute
	public CcmDeviceViewLog get(@RequestParam(required=false) String id) {
		CcmDeviceViewLog entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = ccmDeviceViewLogService.get(id);
		}
		if (entity == null){
			entity = new CcmDeviceViewLog();
		}
		return entity;
	}
	
	@RequiresPermissions("publicity:ccmDeviceViewLog:view")
	@RequestMapping(value = {"list", ""})
	public String list(CcmDeviceViewLog ccmDeviceViewLog, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CcmDeviceViewLog> page = ccmDeviceViewLogService.findPage(new Page<CcmDeviceViewLog>(request, response), ccmDeviceViewLog); 
		model.addAttribute("page", page);
		return "ccm/publicity/ccmDeviceViewLogList";
	}

	@RequiresPermissions("publicity:ccmDeviceViewLog:view")
	@RequestMapping(value = "form")
	public String form(CcmDeviceViewLog ccmDeviceViewLog, Model model) {
		model.addAttribute("ccmDeviceViewLog", ccmDeviceViewLog);
		return "ccm/publicity/ccmDeviceViewLogForm";
	}

	@RequiresPermissions("publicity:ccmDeviceViewLog:edit")
	@RequestMapping(value = "save")
	public String save(CcmDeviceViewLog ccmDeviceViewLog, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, ccmDeviceViewLog)){
			return form(ccmDeviceViewLog, model);
		}
		ccmDeviceViewLogService.save(ccmDeviceViewLog);
		addMessage(redirectAttributes, "保存历史查看管理成功");
		return "redirect:"+Global.getAdminPath()+"/publicity/ccmDeviceViewLog/?repage";
	}
	
	@RequiresPermissions("publicity:ccmDeviceViewLog:edit")
	@RequestMapping(value = "delete")
	public String delete(CcmDeviceViewLog ccmDeviceViewLog, RedirectAttributes redirectAttributes) {
		ccmDeviceViewLogService.delete(ccmDeviceViewLog);
		addMessage(redirectAttributes, "删除历史查看管理成功");
		return "redirect:"+Global.getAdminPath()+"/publicity/ccmDeviceViewLog/?repage";
	}

}