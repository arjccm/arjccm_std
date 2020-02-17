/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.pop.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.arjjs.ccm.modules.sys.utils.UserUtils;
import com.arjjs.ccm.tool.DateTools;
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
import com.arjjs.ccm.modules.ccm.pop.entity.CcmPeopleAntiepidemic;
import com.arjjs.ccm.modules.ccm.pop.service.CcmPeopleAntiepidemicService;

import java.text.SimpleDateFormat;

/**
 * 人员疫情Controller
 * @author yi
 * @version 2020-02-13
 */
@Controller
@RequestMapping(value = "${adminPath}/pop/ccmPeopleAntiepidemic")
public class CcmPeopleAntiepidemicController extends BaseController {

	@Autowired
	private CcmPeopleAntiepidemicService ccmPeopleAntiepidemicService;
	
	@ModelAttribute
	public CcmPeopleAntiepidemic get(@RequestParam(required=false) String id) {
		CcmPeopleAntiepidemic entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = ccmPeopleAntiepidemicService.get(id);
		}
		if (entity == null){
			entity = new CcmPeopleAntiepidemic();
		}
		return entity;
	}
	
	@RequiresPermissions("pop:ccmPeopleAntiepidemic:view")
	@RequestMapping(value = {"list", ""})
	public String list(CcmPeopleAntiepidemic ccmPeopleAntiepidemic, HttpServletRequest request, HttpServletResponse response, Model model) {
		ccmPeopleAntiepidemic.setCreateBy(UserUtils.getUser());
		if(StringUtils.isNotEmpty(ccmPeopleAntiepidemic.getAgeType())){
			if(ccmPeopleAntiepidemic.getAgeType().equals("1")){
				ccmPeopleAntiepidemic.setMaxage(19);
			} else if(ccmPeopleAntiepidemic.getAgeType().equals("2")){
				ccmPeopleAntiepidemic.setMinage(17);
				ccmPeopleAntiepidemic.setMaxage(31);
			} else if(ccmPeopleAntiepidemic.getAgeType().equals("3")){
				ccmPeopleAntiepidemic.setMinage(29);
				ccmPeopleAntiepidemic.setMaxage(61);
			} else if(ccmPeopleAntiepidemic.getAgeType().equals("4")){
				ccmPeopleAntiepidemic.setMinage(59);
			}
		}
		Page<CcmPeopleAntiepidemic> page = ccmPeopleAntiepidemicService.findPage(new Page<CcmPeopleAntiepidemic>(request, response), ccmPeopleAntiepidemic);
		model.addAttribute("page", page);
		return "ccm/pop/ccmPeopleAntiepidemicList";
	}

	@RequiresPermissions("pop:ccmPeopleAntiepidemic:view")
	@RequestMapping(value = "form")
	public String form(CcmPeopleAntiepidemic ccmPeopleAntiepidemic, Model model) {
		model.addAttribute("ccmPeopleAntiepidemic", ccmPeopleAntiepidemic);
		return "ccm/pop/ccmPeopleAntiepidemicForm";
	}

	@RequiresPermissions("pop:ccmPeopleAntiepidemic:edit")
	@RequestMapping(value = "save")
	public String save(CcmPeopleAntiepidemic ccmPeopleAntiepidemic, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, ccmPeopleAntiepidemic)){
			return form(ccmPeopleAntiepidemic, model);
		}
//        if(ccmPeopleAntiepidemic.getComeHainanDate()!=null){
//			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
//			String dateString = formatter.format(ccmPeopleAntiepidemic.getComeHainanDate());
//            String num = DateTools.getTwoDay( DateTools.getStringDateShort(),dateString);
//            if(Integer.parseInt(num)>14){
//				ccmPeopleAntiepidemic.setIsIn14days("01");
//            } else {
//				ccmPeopleAntiepidemic.setIsIn14days("02");
//			}
//        }
		ccmPeopleAntiepidemicService.save(ccmPeopleAntiepidemic);
		addMessage(redirectAttributes, "保存人员疫情成功");
		return "redirect:"+Global.getAdminPath()+"/pop/ccmPeopleAntiepidemic/?repage";
	}
	
	@RequiresPermissions("pop:ccmPeopleAntiepidemic:edit")
	@RequestMapping(value = "delete")
	public String delete(CcmPeopleAntiepidemic ccmPeopleAntiepidemic, RedirectAttributes redirectAttributes) {
		ccmPeopleAntiepidemicService.delete(ccmPeopleAntiepidemic);
		addMessage(redirectAttributes, "删除人员疫情成功");
		return "redirect:"+Global.getAdminPath()+"/pop/ccmPeopleAntiepidemic/?repage";
	}

	@RequiresPermissions("pop:ccmPeopleAntiepidemic:view")
	@RequestMapping(value = "details")
	public String details(CcmPeopleAntiepidemic ccmPeopleAntiepidemic, Model model) {
		model.addAttribute("ccmPeopleAntiepidemic", ccmPeopleAntiepidemic);
		return "ccm/pop/ccmPeopleAntiepidemicDetails";
	}
	
}