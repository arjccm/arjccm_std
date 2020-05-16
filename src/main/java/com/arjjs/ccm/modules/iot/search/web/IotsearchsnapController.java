/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.iot.search.web;

import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.web.BaseController;
import com.arjjs.ccm.modules.iot.grabber.entity.CcmGrabberManage;
import com.arjjs.ccm.modules.iot.grabber.service.CcmGrabberManageService;
import com.arjjs.ccm.modules.iot.search.entity.SearchEntity;
import com.arjjs.ccm.modules.iot.search.entity.SearchGrabberVO;
import com.arjjs.ccm.modules.iot.search.service.CcmSearchStaticService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 抓拍库检索Controller
 * @author liuyongjian
 * @version 2019-07-24
 */
@Controller
@RequestMapping(value = "${adminPath}/searchsnap/iotSearchSnap")
public class IotsearchsnapController extends BaseController {

	@Autowired
	private CcmGrabberManageService CcmGrabberManageService;

	@Autowired
	private CcmSearchStaticService ccmSearchStaticService;

	@RequiresPermissions("searchsnap:iotSearchSnap:view")
	@RequestMapping(value = {"list", ""})
	public String list(SearchEntity searchEntity, HttpServletRequest request, HttpServletResponse response, Model model) {
		CcmGrabberManage grabber = new CcmGrabberManage();
		List<CcmGrabberManage> list = CcmGrabberManageService.findList(grabber);
		Page<SearchGrabberVO> page = ccmSearchStaticService.findSearchGrabberVOPage(new Page<SearchGrabberVO>(request, response),searchEntity);
		model.addAttribute("grabber",list);
		model.addAttribute("page",page);
		return "iot/search/iotSearchSnap";
	}

}