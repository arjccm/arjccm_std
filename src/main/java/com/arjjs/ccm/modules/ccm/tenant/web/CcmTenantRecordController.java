/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.tenant.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.arjjs.ccm.modules.ccm.pop.entity.CcmPeople;
import com.arjjs.ccm.modules.ccm.pop.entity.CcmPopTenant;
import com.arjjs.ccm.modules.ccm.pop.service.CcmPeopleService;
import com.arjjs.ccm.modules.sys.utils.UserUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.arjjs.ccm.common.config.Global;
import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.web.BaseController;
import com.arjjs.ccm.common.utils.StringUtils;
import com.arjjs.ccm.modules.ccm.tenant.entity.CcmTenantRecord;
import com.arjjs.ccm.modules.ccm.tenant.service.CcmTenantRecordService;
import com.arjjs.ccm.tool.CommUtil;
import sun.misc.BASE64Decoder;

/**
 * 历史租客记录表Controller
 * @author lgh
 * @version 2019-04-20
 */
@Controller
@RequestMapping(value = "${adminPath}/tenant/ccmTenantRecord")
public class CcmTenantRecordController extends BaseController {

	@Autowired
	private CcmPeopleService ccmPeopleService;
	@Autowired
	private CcmTenantRecordService ccmTenantRecordService;
	
	@ModelAttribute
	public CcmTenantRecord get(@RequestParam(required=false) String id) {
		CcmTenantRecord entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = ccmTenantRecordService.get(id);
		}
		if (entity == null){
			entity = new CcmTenantRecord();
		}
		return entity;
	}
	
	@RequiresPermissions("tenant:ccmTenantRecord:view")
	@RequestMapping(value = {"{houseId}"})
	public String list(CcmTenantRecord ccmTenantRecord, HttpServletRequest request, HttpServletResponse response, Model model, @PathVariable(value = "houseId") String houseId) {
		ccmTenantRecord.setHouseId(houseId);
		Page<CcmTenantRecord> page = ccmTenantRecordService.findPage(new Page<CcmTenantRecord>(request, response), ccmTenantRecord); 
		model.addAttribute("page", page);
		return "ccm/tenant/ccmTenantRecordList";
	}

	@RequiresPermissions("tenant:ccmTenantRecord:view")
	@RequestMapping(value = "form")
	public String form(CcmTenantRecord ccmTenantRecord,String pid, Model model) {
		List<CcmTenantRecord> getlist = ccmTenantRecordService.findList(ccmTenantRecord);
		if(getlist.size()>0) {
			ccmTenantRecord = getlist.get(0);
		}
		CcmPeople ccmPeople = new CcmPeople();
		ccmPeople.setId(pid);
		ccmTenantRecord.setCcmPeople(ccmPeople);
		model.addAttribute("ccmTenantRecord", ccmTenantRecord);
		return "ccm/tenant/ccmTenantRecordForm";
	}

	@RequiresPermissions("tenant:ccmTenantRecord:edit")
	@RequestMapping(value = "save")
	public void save(CcmTenantRecord ccmTenantRecord, Model model, RedirectAttributes redirectAttributes,HttpServletResponse response) {
		if (!beanValidator(model, ccmTenantRecord)){
		//	return form(ccmTenantRecord, model);
		}
		List<CcmTenantRecord> list = ccmTenantRecordService.findList(ccmTenantRecord);
		if (list.size() > 1) {
			for (int i = 0; i < list.size(); i++) {
				for (int j = 0; j < list.size() - i - 1; j++) {// 注意第二重循环的条件 
					long a =list.get(j).getLiveDate().getTime();
					long b = list.get(j + 1).getLiveDate().getTime();
					if (a > b) {
						CcmTenantRecord temp = list.get(j);
						list.set(j, list.get(j + 1));
						list.set(j + 1, temp);
					}
				}
			}
			CcmTenantRecord ccmTenantRecord2 = list.get(list.size() - 1);
			ccmTenantRecord2.setLiveDate(ccmTenantRecord.getLiveDate());
			ccmTenantRecord2.setLeaveDate(ccmTenantRecord.getLeaveDate());
			ccmTenantRecord2.setRemarks(ccmTenantRecord.getRemarks());
			ccmTenantRecordService.save(ccmTenantRecord2);
		}else {
			ccmTenantRecord.setCreateBy(UserUtils.getUser());
			ccmTenantRecord.setUpdateBy(UserUtils.getUser());
			ccmTenantRecord.setDelFlag("0");
			ccmTenantRecord.setCreateDate(new Date());
			ccmTenantRecord.setUpdateDate(new Date());
			ccmTenantRecord.setId(UUID.randomUUID().toString());
			ccmTenantRecordService.findSave(ccmTenantRecord);
		}
		CcmPeople ccmPeople = ccmPeopleService.get(ccmTenantRecord.getCcmPeople().getId());
		String houseIdString = ccmPeople.getRoomId().getId();
		CcmPopTenant ccmPopTenant = new CcmPopTenant(); // 移除房屋ID
		ccmPeople.setRoomId(ccmPopTenant);
		ccmPeopleService.save(ccmPeople);
		//addMessage(redirectAttributes, "保存历史租客记录成功");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
			CommUtil.openWinExpDiv(out, "保存历史租客记录成功");
		//return "redirect:"+Global.getAdminPath()+"/tenant/ccmTenantRecord/?repage";
	}
	
	@RequiresPermissions("tenant:ccmTenantRecord:edit")
	@RequestMapping(value = "delete")
	public String delete(CcmTenantRecord ccmTenantRecord, RedirectAttributes redirectAttributes) {
		ccmTenantRecordService.delete(ccmTenantRecord);
		addMessage(redirectAttributes, "删除历史租客记录成功");
		return "redirect:"+Global.getAdminPath()+"/tenant/ccmTenantRecord/?repage";
	}

}