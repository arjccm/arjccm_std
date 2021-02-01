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
import com.arjjs.ccm.modules.ccm.publicity.entity.CcmDeviceViewApproval;
import com.arjjs.ccm.modules.ccm.publicity.service.CcmDeviceViewApprovalService;

/**
 * 查看权限审批Controller
 * @author cby
 * @version 2021-01-30
 */
@Controller
@RequestMapping(value = "${adminPath}/publicity/ccmDeviceViewApproval")
public class CcmDeviceViewApprovalController extends BaseController {

	@Autowired
	private CcmDeviceViewApprovalService ccmDeviceViewApprovalService;
	
	@ModelAttribute
	public CcmDeviceViewApproval get(@RequestParam(required=false) String id) {
		CcmDeviceViewApproval entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = ccmDeviceViewApprovalService.get(id);
		}
		if (entity == null){
			entity = new CcmDeviceViewApproval();
		}
		return entity;
	}
	
	@RequiresPermissions("publicity:ccmDeviceViewApproval:view")
	@RequestMapping(value = {"list", ""})
	public String list(CcmDeviceViewApproval ccmDeviceViewApproval, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CcmDeviceViewApproval> page = ccmDeviceViewApprovalService.findPage(new Page<CcmDeviceViewApproval>(request, response), ccmDeviceViewApproval); 
		model.addAttribute("page", page);
		return "ccm/publicity/ccmDeviceViewApprovalList";
	}

	@RequiresPermissions("publicity:ccmDeviceViewApproval:view")
	@RequestMapping(value = "form")
	public String form(CcmDeviceViewApproval ccmDeviceViewApproval, Model model) {
		model.addAttribute("ccmDeviceViewApproval", ccmDeviceViewApproval);
		return "ccm/publicity/ccmDeviceViewApprovalForm";
	}

	@RequiresPermissions("publicity:ccmDeviceViewApproval:edit")
	@RequestMapping(value = "save")
	public String save(CcmDeviceViewApproval ccmDeviceViewApproval, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, ccmDeviceViewApproval)){
			return form(ccmDeviceViewApproval, model);
		}
		ccmDeviceViewApprovalService.save(ccmDeviceViewApproval);
		addMessage(redirectAttributes, "保存查看权限审批成功");
		return "redirect:"+Global.getAdminPath()+"/publicity/ccmDeviceViewApproval/?repage";
	}
	
	@RequiresPermissions("publicity:ccmDeviceViewApproval:edit")
	@RequestMapping(value = "delete")
	public String delete(CcmDeviceViewApproval ccmDeviceViewApproval, RedirectAttributes redirectAttributes) {
		ccmDeviceViewApprovalService.delete(ccmDeviceViewApproval);
		addMessage(redirectAttributes, "删除查看权限审批成功");
		return "redirect:"+Global.getAdminPath()+"/publicity/ccmDeviceViewApproval/?repage";
	}

}