package com.arjjs.ccm.modules.ccm.rest.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.arjjs.ccm.tool.LjpTools;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.web.BaseController;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestResult;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestType;
import com.arjjs.ccm.modules.oa.entity.OaNotify;
import com.arjjs.ccm.modules.oa.service.OaNotifyService;
import com.arjjs.ccm.modules.sys.entity.User;

/**
 * 工作职责 我的通告查询接口
 * 
 * @author arj
 * @version 2018-03-12
 */
@Controller
@RequestMapping(value = "${appPath}/rest/oa/oaNotify")
public class CcmRestOaNotify extends BaseController {

	@Autowired
	private OaNotifyService oaNotifyService;

	/**
	 * @see 获取单个工作职责
	 * @param id
	 *            工作职责ID
	 * @return
	 * @author arj
	 * @version 2018-03-12
	 */

	@ResponseBody
	@RequestMapping(value = "/get", method = RequestMethod.GET)
	public CcmRestResult get(String userId, HttpServletRequest req, HttpServletResponse resp, String id)
			throws IOException {

		CcmRestResult result = new CcmRestResult();
		User sessionUser = (User) req.getSession().getAttribute("user");
		if (sessionUser == null) {
			result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
			return result;
		}
		String sessionUserId = sessionUser.getId();
		if (userId == null || "".equals(userId) || !userId.equals(sessionUserId)) {
			result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
			return result;
		}
		if (LjpTools.isExistBlank(userId,id)) {// 参数id不对
			result.setCode(CcmRestType.ERROR_PARAM);
			return result;
		}


		OaNotify oaNotify = oaNotifyService.get(id);
		if (oaNotify == null) {
			result.setCode(CcmRestType.OK);
			return result;
		}
		// oaNotify.setId(id);
		oaNotifyService.updateReadFlag(oaNotify, sessionUser);// app跟新我的通告状态
		oaNotify = oaNotifyService.getRecordList(oaNotify);// app查询我的通告

		result.setCode(CcmRestType.OK);
		result.setResult(oaNotify);

		return result;
	}

	/**
	 * @see 查询服务信息
	 * @param pageNo
	 *            页码
	 * @param pageSiz
	 *            分页大小
	 * @return
	 * @author arj
	 * @version 2018-03-12
	 */
	@ResponseBody
	@RequestMapping(value = "/query", method = RequestMethod.GET)
	public CcmRestResult query(String userId, HttpServletRequest req, HttpServletResponse resp, Integer pageNo,
			OaNotify oaNotify) throws IOException {
		CcmRestResult result = new CcmRestResult();
		User sessionUser = (User) req.getSession().getAttribute("user");
		if (sessionUser == null) {
			result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
			return result;
		}
		String sessionUserId = sessionUser.getId();
		if (userId == null || "".equals(userId) || !userId.equals(sessionUserId)) {
			result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
			return result;
		}
		if (userId == null || "".equals(userId)) {// 参数id不对
			result.setCode(CcmRestType.ERROR_PARAM);
			return result;
		}

		oaNotify.setSelf(true);
		oaNotify.setId(userId);// userId借用id
		Page<OaNotify> page = oaNotifyService.findApp(new Page<OaNotify>(req, resp), oaNotify);
		page.setPageNo(pageNo);
		result.setCode(CcmRestType.OK);
	    result.setResult(page.getList());
		return result;
	}

}