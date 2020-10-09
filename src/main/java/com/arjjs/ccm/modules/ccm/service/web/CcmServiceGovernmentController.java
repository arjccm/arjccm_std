/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.service.web;

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
import com.arjjs.ccm.modules.ccm.service.entity.CcmServiceGovernment;
import com.arjjs.ccm.modules.ccm.service.service.CcmServiceGovernmentService;

/**
 * 政务查询Controller
 * @author cby
 * @version 2020-09-30
 */
@Controller
@RequestMapping(value = "${adminPath}/service/ccmServiceGovernment")
public class CcmServiceGovernmentController extends BaseController {

	@Autowired
	private CcmServiceGovernmentService ccmServiceGovernmentService;
	
	@ModelAttribute
	public CcmServiceGovernment get(@RequestParam(required=false) String id) {
		CcmServiceGovernment entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = ccmServiceGovernmentService.get(id);
		}
		if (entity == null){
			entity = new CcmServiceGovernment();
		}
		return entity;
	}
	
	@RequiresPermissions("service:ccmServiceGovernment:view")
	@RequestMapping(value = {"list", ""})
	public String list(CcmServiceGovernment ccmServiceGovernment, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CcmServiceGovernment> page = ccmServiceGovernmentService.findPage(new Page<CcmServiceGovernment>(request, response), ccmServiceGovernment); 
		model.addAttribute("page", page);
		return "ccm/service/ccmServiceGovernmentList";
	}

	@RequiresPermissions("service:ccmServiceGovernment:view")
	@RequestMapping(value = "form")
	public String form(CcmServiceGovernment ccmServiceGovernment, Model model) {
		model.addAttribute("ccmServiceGovernment", ccmServiceGovernment);
		return "ccm/service/ccmServiceGovernmentForm";
	}

	@RequiresPermissions("service:ccmServiceGovernment:edit")
	@RequestMapping(value = "save")
	public String save(CcmServiceGovernment ccmServiceGovernment, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, ccmServiceGovernment)){
			return form(ccmServiceGovernment, model);
		}
		ccmServiceGovernmentService.save(ccmServiceGovernment);
		addMessage(redirectAttributes, "保存政务查询成功");
		return "redirect:"+Global.getAdminPath()+"/service/ccmServiceGovernment/?repage";
	}
	
	@RequiresPermissions("service:ccmServiceGovernment:edit")
	@RequestMapping(value = "delete")
	public String delete(CcmServiceGovernment ccmServiceGovernment, RedirectAttributes redirectAttributes) {
		ccmServiceGovernmentService.delete(ccmServiceGovernment);
		addMessage(redirectAttributes, "删除政务查询成功");
		return "redirect:"+Global.getAdminPath()+"/service/ccmServiceGovernment/?repage";
	}

}