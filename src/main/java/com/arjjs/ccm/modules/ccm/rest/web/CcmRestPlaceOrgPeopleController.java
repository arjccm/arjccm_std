/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.rest.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.arjjs.ccm.modules.ccm.pop.entity.CcmPeople;
import com.arjjs.ccm.modules.ccm.pop.service.CcmPeopleService;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestResult;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestType;
import com.arjjs.ccm.modules.pbs.sys.utils.UserUtils;
import com.arjjs.ccm.modules.sys.entity.User;
import com.arjjs.ccm.tool.CommUtil;
import com.arjjs.ccm.tool.Pagecount;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
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
@RequestMapping(value = "${appPath}/rest/ccmplacergeople")
public class CcmRestPlaceOrgPeopleController extends BaseController {

	@Autowired
	private CcmPlaceOrgPeopleService ccmPlaceOrgPeopleService;
	@Autowired
	private CcmPeopleService ccmPeopleService;
	
    //APP从业人员查询
	@ResponseBody
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public CcmRestResult list(String type, String placeOrgId, String userId, HttpServletRequest request, HttpServletResponse response, Model model) {
		CcmRestResult result = new CcmRestResult();

		User sessionUser = (User) request.getSession().getAttribute("user");
		if (sessionUser== null) {
			result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
			return result;
		}
		String sessionUserId = sessionUser.getId();
		if (userId== null || "".equals(userId) ||!userId.equals(sessionUserId)) {
			result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
			return result;
		}
		CcmPeople people = new CcmPeople();
		people.setMore5(type);
		people.setMore3(placeOrgId);
		String fileUrl = Global.getConfig("FILE_UPLOAD_URL");

		Page<CcmPeople> page = ccmPeopleService.findPlaceOfPop(new Page<CcmPeople>(request, response), people);
		for (CcmPeople ccmPeople : page.getList()) {
			if(StringUtils.isNotEmpty(ccmPeople.getImages())){
				ccmPeople.setImages(fileUrl + ccmPeople.getImages());
			}
		}
		result.setCode(CcmRestType.OK);
		if(page.getList()==null||page.getList().size()<=0) {
			result.setResult("");
		}else {
			result.setResult(page.getList());
		}
		return result;
	}

	//APP从业人员修改跳转
	@ResponseBody
	@RequestMapping(value = "toUpdatePeople", method = RequestMethod.GET)
	public CcmRestResult form(String userId, String peopleId,HttpServletRequest req, HttpServletResponse resp) {
		CcmRestResult result = new CcmRestResult();
		User sessionUser = (User) req.getSession().getAttribute("user");
		if (sessionUser== null) {
			result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
			return result;
		}
		String sessionUserId = sessionUser.getId();
		if (userId== null || "".equals(userId) ||!userId.equals(sessionUserId)) {
			result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
			return result;
		}
		if (peopleId == null || "".equals(peopleId)) {//参数id不对
			result.setCode(CcmRestType.ERROR_PARAM);
			return result;
		}
		CcmPeople ccmPeople = ccmPeopleService.get(peopleId);
		CcmPlaceOrgPeople ccmPlaceOrgPeople = new CcmPlaceOrgPeople();
		ccmPlaceOrgPeople.setPeopleId(peopleId);
		List<CcmPlaceOrgPeople> list = ccmPlaceOrgPeopleService.findList(ccmPlaceOrgPeople);
		ccmPeople.setMore2(list.get(0).getId());
		ccmPeople.setMore3(list.get(0).getPlaceOrgId());
		ccmPeople.setMore4(list.get(0).getPeopleId());
		ccmPeople.setMore5(list.get(0).getType().toString());
		String fileUrl = Global.getConfig("FILE_UPLOAD_URL");
		if(StringUtils.isNotEmpty(ccmPeople.getImages())){
			ccmPeople.setImages(fileUrl + ccmPeople.getImages());
		}
		result.setCode(CcmRestType.OK);
		result.setResult(ccmPeople);

		return result;
	}

	//APP从业人员修改保存接口
	@ResponseBody
	@RequestMapping(value = "saveUpdatePeople", method = RequestMethod.POST)
	public CcmRestResult update(CcmPeople ccmpeople, String userId, RedirectAttributes redirectAttributes, HttpServletResponse response, HttpServletRequest request) {
		CcmRestResult result = new CcmRestResult();
		User sessionUser = (User) request.getSession().getAttribute("user");
		if (sessionUser== null) {
			result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
			return result;
		}
		String sessionUserId = sessionUser.getId();
		if (userId== null || "".equals(userId) ||!userId.equals(sessionUserId)) {
			result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
			return result;
		}
		ccmPeopleService.save(ccmpeople);
		CcmPlaceOrgPeople ccmPlaceOrgPeople = new CcmPlaceOrgPeople();
		ccmPlaceOrgPeople.setPeopleId(ccmpeople.getId());
		List<CcmPlaceOrgPeople> list = ccmPlaceOrgPeopleService.findList(ccmPlaceOrgPeople);
		result.setCode(CcmRestType.OK);
		result.setResult("成功");
		return result;
	}
	
    //APP从业人员删除接口
	@ResponseBody
	@RequestMapping(value = "deletePeople", method = RequestMethod.POST)
	public CcmRestResult delete(String more2, String userId, RedirectAttributes redirectAttributes, HttpServletRequest request) {
        CcmRestResult result = new CcmRestResult();
        User sessionUser = (User) request.getSession().getAttribute("user");
        if (sessionUser== null) {
            result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
            return result;
        }
        String sessionUserId = sessionUser.getId();
        if (userId== null || "".equals(userId) ||!userId.equals(sessionUserId)) {
            result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
            return result;
        }
	    CcmPlaceOrgPeople placeOrgPeople = ccmPlaceOrgPeopleService.get(more2);
		ccmPlaceOrgPeopleService.delete(placeOrgPeople);
		result.setCode(CcmRestType.OK);
		result.setResult("成功");
		return result;
	}

	// 添加从业人员--保存
	@ResponseBody
	@RequestMapping(value = "savePeople", method = RequestMethod.POST)
	public CcmRestResult save(CcmPeople ccmpeople, String userId, Model model, RedirectAttributes redirectAttributes, HttpServletResponse response, HttpServletRequest request) {
		CcmRestResult result = new CcmRestResult();
		User sessionUser = (User) request.getSession().getAttribute("user");
		if (sessionUser== null) {
			result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
			return result;
		}
		String sessionUserId = sessionUser.getId();
		if (userId== null || "".equals(userId) ||!userId.equals(sessionUserId)) {
			result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
			return result;
		}
		CcmPlaceOrgPeople ccmPlaceOrgPeople = new CcmPlaceOrgPeople();
		ccmPlaceOrgPeople.setPlaceOrgId(ccmpeople.getMore3());
		ccmPlaceOrgPeople.setType(Integer.parseInt(ccmpeople.getMore5()));
		if (!beanValidator(model, ccmpeople)){
//			return form(ccmPlaceOrgPeople, ccmpeople, model);
		}
		ccmpeople.setMore3("");
		ccmpeople.setMore5("");
		ccmpeople.setCreateBy(UserUtils.get(userId));
		ccmpeople.setUpdateBy(UserUtils.get(userId));
		ccmPeopleService.save(ccmpeople);
		ccmPlaceOrgPeople.setPeopleId(ccmpeople.getId());
		List<CcmPlaceOrgPeople> list = ccmPlaceOrgPeopleService.findList(ccmPlaceOrgPeople);
		if(list.size()>0){
			CcmPlaceOrgPeople placeOrgPeople = list.get(0);
			ccmPlaceOrgPeopleService.save(placeOrgPeople);
		}else{
			ccmPlaceOrgPeopleService.save(ccmPlaceOrgPeople);
		}
		result.setCode(CcmRestType.OK);
		result.setResult("成功");
		return result;
	}

	// 从业人员批量添加--查询
	@ResponseBody
	@RequestMapping(value = "listPopAdd", method = RequestMethod.GET)
	public CcmRestResult listPopAdd(@RequestParam(required = false) String placeType,
							 @RequestParam(required = false) String placeOrgId, CcmPeople ccmPeople, String userId, HttpServletRequest request, HttpServletResponse response, Model model) {
		CcmRestResult result = new CcmRestResult();
		User sessionUser = (User) request.getSession().getAttribute("user");
		if (sessionUser== null) {
			result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
			return result;
		}
		String sessionUserId = sessionUser.getId();
		if (userId== null || "".equals(userId) ||!userId.equals(sessionUserId)) {
			result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
			return result;
		}
		ccmPeople.setMore5(placeType);
		ccmPeople.setMore3(placeOrgId);
		Pagecount page = new Pagecount<CcmPeople>(request, response);
		int countnum = page.getPageSize()*8;
		if(page.getPageNo()>= 6){
			countnum+=page.getPageNo()/6*page.getPageSize()*8;
		}
		page.setCount(countnum);
		page.initialize();
		ccmPeople.setMinnum((page.getPageNo()-1)*page.getPageSize());
		ccmPeople.setMaxnum(page.getPageSize());
		// 查询 人员列表
		List<CcmPeople> list = ccmPeopleService.findPlaceOfPopAdd(ccmPeople);
		String fileUrl = Global.getConfig("FILE_UPLOAD_URL");
		for (CcmPeople people : list) {
			if(StringUtils.isNotEmpty(people.getImages())){
				people.setImages(fileUrl + people.getImages());
			}
		}
		result.setCode(CcmRestType.OK);
		if(list.size()<=0) {
			result.setResult("");
		}else {
			result.setResult(list);
		}
		return result;
	}
	// 从业人员批量添加--保存
	@ResponseBody
	@RequestMapping(value = "savePopAdd", method = RequestMethod.POST)
	public CcmRestResult savePopAdd(@RequestParam(required = false) String peopleId,
								   @RequestParam(required = false) String placeOrgId,
								   @RequestParam(required = false) String type,
								   CcmPeople ccmPeople, Model model, String userId,
								   RedirectAttributes redirectAttributes, HttpServletRequest request) {
		CcmRestResult result = new CcmRestResult();
		User sessionUser = (User) request.getSession().getAttribute("user");
		if (sessionUser== null) {
			result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
			return result;
		}
		String sessionUserId = sessionUser.getId();
		if (userId== null || "".equals(userId) ||!userId.equals(sessionUserId)) {
			result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
			return result;
		}
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
		result.setCode(CcmRestType.OK);
		result.setResult(ccmPlaceOrgPeople.getId());
		return result;
	}
}