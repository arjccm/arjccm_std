/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.placeorgpeople.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.arjjs.ccm.modules.ccm.pop.entity.CcmPeople;
import com.arjjs.ccm.modules.ccm.pop.service.CcmPeopleService;
import com.arjjs.ccm.tool.CommUtil;
import com.arjjs.ccm.tool.Pagecount;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.arjjs.ccm.common.config.Global;
import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.web.BaseController;
import com.arjjs.ccm.common.utils.StringUtils;
import com.arjjs.ccm.modules.ccm.placeorgpeople.entity.CcmPlaceOrgPeople;
import com.arjjs.ccm.modules.ccm.placeorgpeople.service.CcmPlaceOrgPeopleService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * 从业人员中间表Controller
 * @author cby
 * @version 2020-02-11
 */
@Controller
@RequestMapping(value = "${adminPath}/placeorgpeople/ccmPlaceOrgPeople")
public class CcmPlaceOrgPeopleController extends BaseController {

	@Autowired
	private CcmPlaceOrgPeopleService ccmPlaceOrgPeopleService;
	@Autowired
	private CcmPeopleService ccmPeopleService;
	
	@ModelAttribute
	public CcmPlaceOrgPeople get(@RequestParam(required=false) String id) {
		CcmPlaceOrgPeople entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = ccmPlaceOrgPeopleService.get(id);
		}
		if (entity == null){
			entity = new CcmPlaceOrgPeople();
		}
		return entity;
	}
	
	//从业人员查询
	@RequestMapping(value = {"list", ""})
	public String list(@RequestParam(required = false) String type,
					   @RequestParam(required = false) String placeOrgId, HttpServletRequest request, HttpServletResponse response, Model model) {
		CcmPeople people = new CcmPeople();
		people.setMore5(type);
		people.setMore3(placeOrgId);
		Page<CcmPeople> page = ccmPeopleService.findPlaceOfPop(new Page<CcmPeople>(request, response), people);
        model.addAttribute("type", type);
        model.addAttribute("placeOrgId", placeOrgId);
		model.addAttribute("page", page);
		return "ccm/placeorgpeople/ccmPeopleListForPlace";
	}

    //跳转从业人员添加页面
	@RequestMapping(value = "toaddPeople")
	public String form(CcmPlaceOrgPeople ccmPlaceOrgPeople, CcmPeople ccmpeople, Model model) {
		model.addAttribute("ccmPlaceOrgPeople", ccmPlaceOrgPeople);
		model.addAttribute("ccmPeople", ccmpeople);
		return "ccm/placeorgpeople/addPeopleForm";
	}

	//跳转从业人员修改页面
	@RequestMapping(value = "toUpdatePeople")
	public String form(@RequestParam(required = false) String peopleId, Model model) {
		CcmPeople ccmPeople = ccmPeopleService.get(peopleId);
		CcmPlaceOrgPeople ccmPlaceOrgPeople = new CcmPlaceOrgPeople();
		ccmPlaceOrgPeople.setPeopleId(peopleId);
		List<CcmPlaceOrgPeople> list = ccmPlaceOrgPeopleService.findList(ccmPlaceOrgPeople);
		ccmPeople.setMore2(list.get(0).getId());
		ccmPeople.setMore3(list.get(0).getPlaceOrgId());
		ccmPeople.setMore4(list.get(0).getPeopleId());
		ccmPeople.setMore5(list.get(0).getType().toString());
		model.addAttribute("ccmPlaceOrgPeople", list.get(0));
		model.addAttribute("ccmPeople", ccmPeople);
		return "ccm/placeorgpeople/updatePeopleForm";
	}

	//修改从业人员--保存
	@RequestMapping(value = "saveUpdatePeople")
	public String update(CcmPeople ccmpeople, String placeid, Integer placetype, Model model, RedirectAttributes redirectAttributes, HttpServletResponse response) {
		ccmPeopleService.save(ccmpeople);
		CcmPlaceOrgPeople ccmPlaceOrgPeople = new CcmPlaceOrgPeople();
		ccmPlaceOrgPeople.setPeopleId(ccmpeople.getId());
		List<CcmPlaceOrgPeople> list = ccmPlaceOrgPeopleService.findList(ccmPlaceOrgPeople);
		addMessage(redirectAttributes, "修改从业人员成功");
		return "redirect:"+Global.getAdminPath()+"/placeorgpeople/ccmPlaceOrgPeople/list?placeOrgId="+list.get(0).getPlaceOrgId()+"&type="+list.get(0).getType()+"";
	}

	// 添加从业人员--保存
	@RequestMapping(value = "savePeople")
	public void save(CcmPeople ccmpeople, String placeid, Integer placetype, Model model, RedirectAttributes redirectAttributes, HttpServletResponse response) {
		CcmPlaceOrgPeople ccmPlaceOrgPeople = new CcmPlaceOrgPeople();
		ccmPlaceOrgPeople.setPlaceOrgId(placeid);
		ccmPlaceOrgPeople.setType(placetype);
		if (!beanValidator(model, ccmpeople)){
//			return form(ccmPlaceOrgPeople, ccmpeople, model);
		}
		ccmPeopleService.save(ccmpeople);
		ccmPlaceOrgPeople.setPeopleId(ccmpeople.getId());
		List<CcmPlaceOrgPeople> list = ccmPlaceOrgPeopleService.findList(ccmPlaceOrgPeople);
		if(list.size()>0){
			CcmPlaceOrgPeople placeOrgPeople = list.get(0);
			ccmPlaceOrgPeopleService.save(placeOrgPeople);
		}else{
			ccmPlaceOrgPeopleService.save(ccmPlaceOrgPeople);
		}
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		CommUtil.openWinExpDiv(out, "保存从业人员成功");
	}
	
	//删除从业人员
	@RequestMapping(value = "deletePeople")
	public String delete(CcmPlaceOrgPeople ccmPlaceOrgPeople, RedirectAttributes redirectAttributes) {
	    CcmPlaceOrgPeople placeOrgPeople = ccmPlaceOrgPeopleService.get(ccmPlaceOrgPeople.getId());
		ccmPlaceOrgPeopleService.delete(ccmPlaceOrgPeople);
		addMessage(redirectAttributes, "删除从业人员成功");
		return "redirect:"+Global.getAdminPath()+"/placeorgpeople/ccmPlaceOrgPeople/list?placeOrgId="+placeOrgPeople.getPlaceOrgId()+"&type="+placeOrgPeople.getType()+"";
	}

    // 从业人员批量添加--查询
    @RequestMapping(value = "listPopAdd")
    public String listPopAdd(@RequestParam(required = false) String placeType,
							 @RequestParam(required = false) String placeOrgId, CcmPeople ccmPeople, HttpServletRequest request, HttpServletResponse response, Model model) {
		ccmPeople.setMore5(placeType);
		ccmPeople.setMore3(placeOrgId);
		// 查询 人员列表
		Pagecount page = new Pagecount<CcmPeople>(request, response);
		int countnum = page.getPageSize()*8;
		if(page.getPageNo()>= 6){
			countnum+=page.getPageNo()/6*page.getPageSize()*8;
		}
		page.setCount(countnum);
		page.initialize();
		ccmPeople.setMinnum((page.getPageNo()-1)*page.getPageSize());
		ccmPeople.setMaxnum(page.getPageSize());
        List<CcmPeople> list = ccmPeopleService.findPlaceOfPopAdd(ccmPeople);
		page.setList(list);
        model.addAttribute("page", page);
        model.addAttribute("ccmPeople", ccmPeople);
		model.addAttribute("type", placeType);
		model.addAttribute("placeOrgId", placeOrgId);
        return "ccm/placeorgpeople/ccmPlaceOfPopListAdd";
    }
	// 从业人员批量添加--保存
	@ResponseBody
	@RequestMapping(value = "savePopAdd")
	public List<String> savePopAdd(@RequestParam(required = false) String peopleId,
								   @RequestParam(required = false) String placeOrgId,
								   @RequestParam(required = false) String type,
								   CcmPeople ccmPeople, Model model,
								   RedirectAttributes redirectAttributes) {
		CcmPlaceOrgPeople ccmPlaceOrgPeople = new CcmPlaceOrgPeople();
		ccmPlaceOrgPeople.setPlaceOrgId(placeOrgId);
		ccmPlaceOrgPeople.setPeopleId(peopleId);
		ccmPlaceOrgPeople.setType(Integer.parseInt(type));
		List<CcmPlaceOrgPeople> place = ccmPlaceOrgPeopleService.findList(ccmPlaceOrgPeople);
		if(place.size()>0){
			for(int i=0;i<place.size();i++){
				ccmPlaceOrgPeopleService.delete(place.get(i));
			}
			ccmPlaceOrgPeopleService.save(ccmPlaceOrgPeople);
		}else{
			ccmPlaceOrgPeopleService.save(ccmPlaceOrgPeople);
		}
		List<String> list = new ArrayList<>();
		list.add(ccmPlaceOrgPeople.getId());
		list.add("添加从业人员成功");
		return list;
	}
}