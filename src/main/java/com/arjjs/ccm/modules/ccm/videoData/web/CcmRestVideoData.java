package com.arjjs.ccm.modules.ccm.videoData.web;

import com.arjjs.ccm.common.web.BaseController;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestResult;
import com.arjjs.ccm.modules.ccm.videoData.service.CcmDssVideoService;
import com.arjjs.ccm.modules.ccm.videoData.service.CcmRestVideoDataService;
import com.arjjs.ccm.modules.ccm.videoData.service.CcmTiandyVideoService;
import com.arjjs.ccm.modules.iot.grabber.service.CcmGrabberManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 视频对接监控点位
 * @author jiaopanyu
 * @version 2019-08-08
 */
@Controller
@RequestMapping(value = "${appPath}/videoData")
public class CcmRestVideoData extends BaseController {
	@Autowired
	private CcmRestVideoDataService ccmRestVideoDataService;
	@Autowired
	private CcmTiandyVideoService ccmTiandyVideoService;
	@Autowired
	private CcmDssVideoService ccmDssVideoService;
	@Autowired
	private CcmGrabberManageService ccmGrabberManageService;

	@ResponseBody
	@RequestMapping(value = "/getCameras", method = RequestMethod.GET)
	public CcmRestResult getCameras(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		CcmRestResult result = ccmRestVideoDataService.getHIKCameras();
		return result;
	}
	@ResponseBody
	@RequestMapping(value = "/getTiandyCameras", method = RequestMethod.GET)
	public CcmRestResult getTiandyCameras(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		CcmRestResult result = ccmTiandyVideoService.getCameras();
		return result;
	}
	@ResponseBody
	@RequestMapping(value = "/getDssCameras", method = RequestMethod.GET)
	public CcmRestResult getDssCameras(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		CcmRestResult result = ccmDssVideoService.getDssCameras();
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/getGrabberList", method = RequestMethod.GET)
	public CcmRestResult getGrabberList(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		CcmRestResult result = ccmGrabberManageService.getGrabberList();
		return result;
	}
}
