/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.ask.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.arjjs.ccm.modules.pbs.sys.utils.UserUtils;
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
import com.arjjs.ccm.modules.ccm.ask.entity.CcmAskLeader;
import com.arjjs.ccm.modules.ccm.ask.service.CcmAskLeaderService;

/**
 * 领导请示Controller
 * @author cby
 * @version 2020-09-30
 */
@Controller
@RequestMapping(value = "${adminPath}/ask/ccmAskLeader")
public class CcmAskLeaderController extends BaseController {

	@Autowired
	private CcmAskLeaderService ccmAskLeaderService;
	
	@ModelAttribute
	public CcmAskLeader get(@RequestParam(required=false) String id) {
		CcmAskLeader entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = ccmAskLeaderService.get(id);
		}
		if (entity == null){
			entity = new CcmAskLeader();
		}
		return entity;
	}
	
	@RequiresPermissions("ask:ccmAskLeader:view")
	@RequestMapping(value = {"list", ""})
	public String list(CcmAskLeader ccmAskLeader, String type, HttpServletRequest request, HttpServletResponse response, Model model) {
		if("1".equals(type)){
			ccmAskLeader.setCreateBy(UserUtils.getUser());
		}else{
			ccmAskLeader.setLeader(UserUtils.getUser());
			ccmAskLeader.setReplyStatus("01");
		}
		Page<CcmAskLeader> page = ccmAskLeaderService.findPage(new Page<CcmAskLeader>(request, response), ccmAskLeader); 
		model.addAttribute("page", page);
		if("1".equals(type)){
			return "ccm/ask/ccmAskLeaderList";
		}else{
			return "ccm/ask/ccmAskLeaderReplyList";
		}
	}

	@RequiresPermissions("ask:ccmAskLeader:view")
	@RequestMapping(value = "form")
	public String form(CcmAskLeader ccmAskLeader, Model model) {
		model.addAttribute("ccmAskLeader", ccmAskLeader);
		return "ccm/ask/ccmAskLeaderForm";
	}

	@RequiresPermissions("ask:ccmAskLeader:view")
	@RequestMapping(value = "reply")
	public String reply(CcmAskLeader ccmAskLeader, Model model) {
		model.addAttribute("ccmAskLeader", ccmAskLeader);
		return "ccm/ask/ccmAskLeaderReplyForm";
	}

	@RequiresPermissions("ask:ccmAskLeader:edit")
	@RequestMapping(value = "save")
	public String save(String type, CcmAskLeader ccmAskLeader, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, ccmAskLeader)){
			return form(ccmAskLeader, model);
		}
		ccmAskLeaderService.save(ccmAskLeader,type);
		addMessage(redirectAttributes, "保存领导请示成功");
		return "redirect:"+Global.getAdminPath()+"/ask/ccmAskLeader/?repage";
	}
	
	@RequiresPermissions("ask:ccmAskLeader:edit")
	@RequestMapping(value = "delete")
	public String delete(CcmAskLeader ccmAskLeader, RedirectAttributes redirectAttributes) {
		ccmAskLeaderService.delete(ccmAskLeader);
		addMessage(redirectAttributes, "删除领导请示成功");
		return "redirect:"+Global.getAdminPath()+"/ask/ccmAskLeader/?repage";
	}

}