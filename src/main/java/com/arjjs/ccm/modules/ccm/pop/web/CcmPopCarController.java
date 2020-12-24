/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.pop.web;

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
import com.arjjs.ccm.modules.ccm.pop.entity.CcmPopCar;
import com.arjjs.ccm.modules.ccm.pop.service.CcmPopCarService;

/**
 * 车辆管理Controller
 * @author cby
 * @version 2020-12-22
 */
@Controller
@RequestMapping(value = "${adminPath}/pop/ccmPopCar")
public class CcmPopCarController extends BaseController {

	@Autowired
	private CcmPopCarService ccmPopCarService;
	
	@ModelAttribute
	public CcmPopCar get(@RequestParam(required=false) String id) {
		CcmPopCar entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = ccmPopCarService.get(id);
		}
		if (entity == null){
			entity = new CcmPopCar();
		}
		return entity;
	}
	
	@RequiresPermissions("pop:ccmPopCar:view")
	@RequestMapping(value = {"list", ""})
	public String list(CcmPopCar ccmPopCar, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CcmPopCar> page = ccmPopCarService.findPage(new Page<CcmPopCar>(request, response), ccmPopCar); 
		model.addAttribute("page", page);
		return "ccm/pop/ccmPopCarList";
	}

	@RequiresPermissions("pop:ccmPopCar:view")
	@RequestMapping(value = "form")
	public String form(CcmPopCar ccmPopCar, Model model) {
		model.addAttribute("ccmPopCar", ccmPopCar);
		return "ccm/pop/ccmPopCarForm";
	}

	@RequiresPermissions("pop:ccmPopCar:edit")
	@RequestMapping(value = "save")
	public String save(CcmPopCar ccmPopCar, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, ccmPopCar)){
			return form(ccmPopCar, model);
		}
		ccmPopCarService.save(ccmPopCar);
		addMessage(redirectAttributes, "保存车辆管理成功");
		return "redirect:"+Global.getAdminPath()+"/pop/ccmPopCar/?repage";
	}
	
	@RequiresPermissions("pop:ccmPopCar:edit")
	@RequestMapping(value = "delete")
	public String delete(CcmPopCar ccmPopCar, RedirectAttributes redirectAttributes) {
		ccmPopCarService.delete(ccmPopCar);
		addMessage(redirectAttributes, "删除车辆管理成功");
		return "redirect:"+Global.getAdminPath()+"/pop/ccmPopCar/?repage";
	}

}