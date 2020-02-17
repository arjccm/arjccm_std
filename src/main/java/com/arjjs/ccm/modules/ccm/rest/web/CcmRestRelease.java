package com.arjjs.ccm.modules.ccm.rest.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.arjjs.ccm.modules.ccm.house.entity.CcmHouseRelease;
import com.arjjs.ccm.modules.ccm.house.service.CcmHouseReleaseService;
import com.arjjs.ccm.modules.ccm.log.entity.CcmLogTail;
import com.arjjs.ccm.modules.ccm.log.service.CcmLogTailService;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestResult;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestType;
import com.arjjs.ccm.modules.sys.entity.User;

/**
 * 帮教人员记录查询app接口
 * 
 * @author UserLi
 *
 */
@Controller
@RequestMapping(value = "${appPath}/rest/release")
public class CcmRestRelease {

	@Autowired
	private CcmHouseReleaseService ccmHouseReleaseService;
	@Autowired
	private CcmLogTailService ccmLogTailService;

	@ResponseBody
	@RequestMapping(value = "/query", method = RequestMethod.GET)
	public CcmRestResult get(String userId, String peopleId, HttpServletRequest req, HttpServletResponse resp)
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
		if (peopleId == null || "".equals(peopleId)) {// 参数peopleId不对
			result.setCode(CcmRestType.ERROR_PARAM);
			return result;
		}

		CcmHouseRelease cRelease = ccmHouseReleaseService.getByPeopleId(peopleId);

		CcmLogTail ccmLogTail = new CcmLogTail();
		ccmLogTail.setRelevanceId(cRelease.getId());

		List<CcmLogTail> list = ccmLogTailService.findList(ccmLogTail);

		result.setCode(CcmRestType.OK);
		result.setResult(list);
		result.setReturnFlag(true);

		return result;
	}

}
