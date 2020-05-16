/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.iot.search.web;

import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.modules.ccm.list.entity.CcmList;
import com.arjjs.ccm.modules.ccm.list.service.CcmListService;
import com.arjjs.ccm.modules.iot.search.entity.SearchEntity;
import com.arjjs.ccm.modules.iot.search.entity.SearchVO;
import com.arjjs.ccm.modules.iot.search.service.CcmSearchStaticService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.arjjs.ccm.common.web.BaseController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 静态库检索Controller
 * @author liuyongjian
 * @version 2019-07-24
 */
@Controller
@RequestMapping(value = "${adminPath}/searchlist/iotSearchList")
public class IotsearchlistController extends BaseController {

	@Autowired
	private CcmListService ccmListService;

	@Autowired
	private CcmSearchStaticService ccmSearchStaticService;

	@RequiresPermissions("searchlist:iotSearchList:view")
	@RequestMapping(value = {"list", ""})
	public String list(SearchEntity searchEntity,HttpServletRequest request, HttpServletResponse response, Model model) {
		CcmList ccmList = new CcmList();
		ccmList.setType("02");
		List<CcmList> list = ccmListService.findList(ccmList);
		Page<SearchVO> page = ccmSearchStaticService.findSearchVOPage(new Page<SearchVO>(request, response),searchEntity);
		model.addAttribute("ccmlist",list);
		model.addAttribute("page",page);
		return "iot/search/iotSearchList";
	}

}