/**
 * Copyright &copy; 2012-2018 All rights reserved.
 */
package com.arjjs.ccm.modules.plm.logistics.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
import com.arjjs.ccm.common.utils.StringUtils;
import com.arjjs.ccm.common.web.BaseController;
import com.arjjs.ccm.modules.plm.logistics.entity.PlmRoom;
import com.arjjs.ccm.modules.plm.logistics.entity.PlmRoomApply;
import com.arjjs.ccm.modules.plm.logistics.entity.PlmRoomApplyResource;
import com.arjjs.ccm.modules.plm.logistics.service.PlmRoomApplyResourceService;
import com.arjjs.ccm.modules.plm.logistics.service.PlmRoomMeetingApplyService;
import com.arjjs.ccm.modules.plm.logistics.service.PlmRoomService;
import com.arjjs.ccm.modules.sys.utils.UserUtils;
import com.arjjs.ccm.tool.CommUtil;

/**
 * 
 * @ClassName:  PlmRoomMeetingApplyResourceController 
 * @Description : 附件列表
 * @author：
 * @date： 2019年8月1日下午5:18:51
 */
@Controller
@RequestMapping(value = "${adminPath}/logistics/plmRoomMeetingApplyResource")
public class PlmRoomMeetingApplyResourceController extends BaseController {

	@Autowired
	private PlmRoomMeetingApplyService plmRoomApplyService;
	@Autowired
	private PlmRoomApplyResourceService plmRoomApplyResourceService;
	@Autowired
	private PlmRoomService plmRoomService;
	
	@ModelAttribute
	public PlmRoomApplyResource get(@RequestParam(required = false) String id) {
		PlmRoomApplyResource entity = null;
		if (StringUtils.isNotBlank(id)) {
			entity = plmRoomApplyResourceService.get(id);
		}
		if (entity == null) {
			entity = new PlmRoomApplyResource();
		}
		return entity;
	}

	
	/**
	 * 
	 * @Title: 通过用户id 查询会议记录
	 * @Description : 会议议题、会议材料、座位分布图、会议通知、会议方案、会议议程、会议纪要、领导讲话稿、新闻报道、会议照片、视频材料
	 * @author：
	 * @date： 2019年7月31日下午8:23:55
	 * @param plmRoom
	 * @param model
	 * @return
	 */
	@RequiresPermissions("logistics:plmRoom:view")
	@RequestMapping(value = "getroombyuserId")
	public String getroombyuserId(PlmRoomApply plmRoomApply, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<PlmRoomApply> page = plmRoomApplyService.getroombyuserId(new Page<PlmRoomApply>(request,response), plmRoomApply);
		List<PlmRoom> list = plmRoomService.findList(new PlmRoom());
		model.addAttribute("plmRoomApply", plmRoomApply);
		model.addAttribute("roomlist", list);
		model.addAttribute("user", UserUtils.getUser());
		model.addAttribute("page", page);
		return "plm/logistics/plmRoomMeetingArrangeList";
	}
	
	
	@RequiresPermissions("logistics:plmRoom:view")
	@RequestMapping(value = "getroomresource")
	public String getroomresource(PlmRoomApply plmRoomApply, HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("meetingId", plmRoomApply.getId());
		model.addAttribute("plmRoomApplyResource", new PlmRoomApplyResource());
		return "plm/logistics/plmRoomMeetingArrangeFrom";
	}
	
	@RequiresPermissions("logistics:plmRoom:view")
	@RequestMapping(value = "saveroomresource")
	public void saveroomresource(PlmRoomApplyResource plmRoomApplyResource, HttpServletResponse response) {
		plmRoomApplyResourceService.save(plmRoomApplyResource);
		PrintWriter out = null;
		try {
			out = response.getWriter();
			CommUtil.openWinExpDiv(out, "提交成功");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequiresPermissions("logistics:plmRoom:view")
	@RequestMapping(value = "findlistresource")
	public String findlistresource(PlmRoomApplyResource plmRoomApplyResource, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<PlmRoomApplyResource> page = plmRoomApplyResourceService.findPage(new Page<PlmRoomApplyResource>(request,response), plmRoomApplyResource);
		String str = Global.getConfig("FILE_UPLOAD_URL");
		model.addAttribute("path", str);
		model.addAttribute("page", page);
		return "plm/logistics/plmRoomMeetingResourceList";
	}
	
	@RequiresPermissions("logistics:plmRoom:view")
	@RequestMapping(value = "deletesource")
	public void deletesource(PlmRoomApplyResource plmRoomApplyResource, HttpServletResponse response) {
		plmRoomApplyResourceService.delete(plmRoomApplyResource);
		PrintWriter out = null;
		try {
			out = response.getWriter();
			CommUtil.openWinExpDiv(out, "删除成功");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequiresPermissions("logistics:plmRoom:view")
	@RequestMapping(value = "form")
	public String form(PlmRoomApply plmRoomApply, String update, Model model) {
		List<PlmRoom> list = plmRoomService.findList(new PlmRoom());
		if(StringUtils.isNotEmpty(plmRoomApply.getId())) {
			PlmRoomApply result = plmRoomApplyService.get(plmRoomApply.getId());
			model.addAttribute("plmRoomApply", result);
			model.addAttribute("roomlist", list);
		}else {
			model.addAttribute("plmRoomApply", plmRoomApply);
			model.addAttribute("roomlist", list);
		}
		model.addAttribute("update", update);
		return "plm/meet/plmRoomApplyForm";
	}

	@RequiresPermissions("logistics:plmRoom:edit")
	@RequestMapping(value = "save")
	public String save(PlmRoomApply plmRoomApply, Model model, RedirectAttributes redirectAttributes, HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (!beanValidator(model, plmRoomApply)){
			return form(plmRoomApply, "ok", model);
		}
		if (StringUtils.isEmpty(plmRoomApply.getId())) {
			PlmRoomApply meet = new PlmRoomApply();
			meet.setRoom(plmRoomApply.getRoom());
			meet.setStartTime(plmRoomApply.getStartTime());
			meet.setEndTime(plmRoomApply.getEndTime());
			List<PlmRoomApply> list = plmRoomApplyService.getroombyuserIdlist(meet);
			if(list.size()!=0) {
				addMessage(redirectAttributes, "保存会议安排失败！该会议室所填时间段已有会议安排！");
				return "redirect:"+Global.getAdminPath()+"/logistics/plmRoomMeetingApplyResource/getroombyuserId?repage";
			}
		}
		plmRoomApplyService.saveMeet(plmRoomApply);
		addMessage(redirectAttributes, "保存会议安排成功");
		return "redirect:"+Global.getAdminPath()+"/logistics/plmRoomMeetingApplyResource/getroombyuserId?repage";
	}
	
	@RequiresPermissions("logistics:plmRoom:edit")
	@RequestMapping(value = "delete")
	public String delete(PlmRoomApply plmRoomApply, RedirectAttributes redirectAttributes) {
		plmRoomApplyService.delete(plmRoomApply);
		addMessage(redirectAttributes, "删除会议安排成功");
		return "redirect:"+Global.getAdminPath()+"/logistics/plmRoomMeetingApplyResource/getroombyuserId?repage";
	}
}