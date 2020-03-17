/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.ccmsys.web;

import com.arjjs.ccm.common.config.Global;
import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.utils.StringUtils;
import com.arjjs.ccm.common.web.BaseController;
import com.arjjs.ccm.modules.ccm.ccmsys.entity.CcmMobileDevice;
import com.arjjs.ccm.modules.ccm.ccmsys.service.CcmMobileDeviceService;
import com.arjjs.ccm.modules.flat.userBindingDevice.entity.UserBindingDevice;
import com.arjjs.ccm.modules.flat.userBindingDevice.service.UserBindingDeviceService;
import com.arjjs.ccm.modules.tasks.IntervalsDeleteData;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 移动设备管理Controller
 * @author fu
 * @version 2018-04-20
 */
@Controller
@RequestMapping(value = "${adminPath}/ccmsys/ccmMobileDevice")
public class CcmMobileDeviceController extends BaseController {

	@Autowired
	private CcmMobileDeviceService ccmMobileDeviceService;

	@Autowired
	private UserBindingDeviceService userBindingDeviceService;
	
		@Autowired
	private IntervalsDeleteData intervalsDeleteData;

	@ModelAttribute
	public CcmMobileDevice get(@RequestParam(required=false) String id) {
		CcmMobileDevice entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = ccmMobileDeviceService.get(id);
		}
		if (entity == null){
			entity = new CcmMobileDevice();
		}
		return entity;
	}
	
	@RequiresPermissions("ccmsys:ccmMobileDevice:view")
	@RequestMapping(value = {"list", ""})
	public String list(CcmMobileDevice ccmMobileDevice, HttpServletRequest request, HttpServletResponse response, Model model) {
		//用户类型
		ccmMobileDevice.setUseType("01");
		Page<CcmMobileDevice> page = ccmMobileDeviceService.findPage(new Page<>(request, response), ccmMobileDevice);
		model.addAttribute("page", page);
		return "ccm/ccmsys/ccmMobileDeviceList";
	}

	@RequiresPermissions("ccmsys:ccmMobileDevice:view")
	@RequestMapping(value = "list2")
	public String list2(CcmMobileDevice ccmMobileDevice, HttpServletRequest request, HttpServletResponse response, Model model) {
		//用户类型
		ccmMobileDevice.setUseType("02");
		Page<CcmMobileDevice> page = ccmMobileDeviceService.findPage(new Page<>(request, response), ccmMobileDevice);
		model.addAttribute("page", page);
		return "ccm/ccmsys/ccmMobileDeviceList2";
	}

	@RequiresPermissions("ccmsys:ccmMobileDevice:view")
	@RequestMapping(value = "form")
	public String form(CcmMobileDevice ccmMobileDevice, Model model) {
		//用户类型
		ccmMobileDevice.setUseType("01");
		model.addAttribute("ccmMobileDevice", ccmMobileDevice);
		return "ccm/ccmsys/ccmMobileDeviceForm";
	}

	@RequiresPermissions("ccmsys:ccmMobileDevice:view")
	@RequestMapping(value = "form2")
	public String form2(CcmMobileDevice ccmMobileDevice, Model model) {
		//用户类型
		ccmMobileDevice.setUseType("02");
		model.addAttribute("ccmMobileDevice", ccmMobileDevice);
		return "ccm/ccmsys/ccmMobileDeviceForm2";
	}

	@RequiresPermissions("ccmsys:ccmMobileDevice:edit")
	@RequestMapping(value = "save")
	public String save(CcmMobileDevice ccmMobileDevice, Model model, RedirectAttributes redirectAttributes) {

		if (!beanValidator(model, ccmMobileDevice)){
			return form(ccmMobileDevice, model);
		}
		//用户类型
		ccmMobileDevice.setUseType("01");
		ccmMobileDeviceService.save(ccmMobileDevice);
		// 授权之后，给用户绑定设备
		String userBindId = userBindingDeviceService.findDeviceByPolicePhoneCode(ccmMobileDevice.getDeviceId());
		UserBindingDevice userBindingDevice = new UserBindingDevice();
		String userId = ccmMobileDevice.getvCcmTeam().getId();
		userBindingDevice.setUserId(userId);
		if( userBindId != null){
            userBindingDeviceService.updateBinding(userBindId,userId );
		}else{
            userBindingDevice.setPolicePhoneCode(ccmMobileDevice.getDeviceId());
            userBindingDevice.setDefualtDevice("0");//设备默认为警务通
            userBindingDeviceService.save(userBindingDevice);
		}
		addMessage(redirectAttributes, "保存移动设备管理成功");
		if(ccmMobileDevice.getIsVariable().equals("01")){
			return "redirect:"+Global.getAdminPath()+"/ccmsys/ccmMobileDevice/?repage";
		}else{
//			return "redirect:"+Global.getAdminPath()+"/ccmsys/ccmMobileDevice/list2?repage";
			return "redirect:"+Global.getAdminPath()+"/ccmsys/ccmMobileDevice/?repage";

		}
	}
		@RequiresPermissions("ccmsys:ccmMobileDevice:edit")
	@RequestMapping(value = "save2")
	public String save2(CcmMobileDevice ccmMobileDevice, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, ccmMobileDevice)){
			return form(ccmMobileDevice, model);
		}
		//用户类型
		ccmMobileDevice.setUseType("02");
		ccmMobileDeviceService.save(ccmMobileDevice);
		addMessage(redirectAttributes, "保存移动设备管理成功");
		return "redirect:"+Global.getAdminPath()+"/ccmsys/ccmMobileDevice/list2?repage";
	}


	@RequiresPermissions("ccmsys:ccmMobileDevice:edit")
	@RequestMapping(value = "delete")
	public String delete(CcmMobileDevice ccmMobileDevice, RedirectAttributes redirectAttributes) {
		ccmMobileDeviceService.delete(ccmMobileDevice);
		addMessage(redirectAttributes, "删除移动设备管理成功");
		if("02".equalsIgnoreCase(ccmMobileDevice.getUseType())) {
			return "redirect:"+Global.getAdminPath()+"/ccmsys/ccmMobileDevice/list2?repage";
		}
		return "redirect:"+Global.getAdminPath()+"/ccmsys/ccmMobileDevice/?repage";
	}
	@RequestMapping(value = "test")
	public String test(){
		intervalsDeleteData.deleteLog();
		return  "";
	}

}