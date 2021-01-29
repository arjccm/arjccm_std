/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.org.web;

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
import com.arjjs.ccm.modules.ccm.org.entity.CcmImportArea;
import com.arjjs.ccm.modules.ccm.org.service.CcmImportAreaService;

/**
 * 重点区域Controller
 * @author cby
 * @version 2021-01-18
 */
@Controller
@RequestMapping(value = "${adminPath}/org/ccmImportArea")
public class CcmImportAreaController extends BaseController {

	@Autowired
	private CcmImportAreaService ccmImportAreaService;
	
	@ModelAttribute
	public CcmImportArea get(@RequestParam(required=false) String id) {
		CcmImportArea entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = ccmImportAreaService.get(id);
		}
		if (entity == null){
			entity = new CcmImportArea();
		}
		return entity;
	}
	
	@RequiresPermissions("org:ccmImportArea:view")
	@RequestMapping(value = {"list", ""})
	public String list(CcmImportArea ccmImportArea, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CcmImportArea> page = ccmImportAreaService.findPage(new Page<CcmImportArea>(request, response), ccmImportArea); 
		model.addAttribute("page", page);
		return "ccm/org/ccmImportAreaList";
	}

	@RequiresPermissions("org:ccmImportArea:view")
	@RequestMapping(value = "form")
	public String form(CcmImportArea ccmImportArea, Model model) {
		model.addAttribute("ccmImportArea", ccmImportArea);
		return "ccm/org/ccmImportAreaForm";
	}

	@RequiresPermissions("org:ccmImportArea:edit")
	@RequestMapping(value = "save")
	public String save(CcmImportArea ccmImportArea, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, ccmImportArea)){
			return form(ccmImportArea, model);
		}
		ccmImportAreaService.save(ccmImportArea);
		addMessage(redirectAttributes, "保存重点区域成功");
		return "redirect:"+Global.getAdminPath()+"/org/ccmImportArea/?repage";
	}
	
	@RequiresPermissions("org:ccmImportArea:edit")
	@RequestMapping(value = "delete")
	public String delete(CcmImportArea ccmImportArea, RedirectAttributes redirectAttributes) {
		ccmImportAreaService.delete(ccmImportArea);
		addMessage(redirectAttributes, "删除重点区域成功");
		return "redirect:"+Global.getAdminPath()+"/org/ccmImportArea/?repage";
	}

}