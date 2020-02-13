package com.arjjs.ccm.modules.ccm.rest.web;

import com.arjjs.ccm.common.web.BaseController;
import com.arjjs.ccm.modules.ccm.ccmsys.entity.CcmMobileDevice;
import com.arjjs.ccm.modules.ccm.ccmsys.service.CcmMobileDeviceService;
import com.arjjs.ccm.modules.ccm.fence.entity.CcmElecfenceAlarm;
import com.arjjs.ccm.modules.ccm.fence.service.CcmElecfenceAlarmService;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestResult;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestType;
import com.arjjs.ccm.modules.ccm.sys.entity.SysDicts;
import com.arjjs.ccm.modules.ccm.sys.service.SysDictsService;
import com.arjjs.ccm.modules.oa.service.OaNotifyService;
import com.arjjs.ccm.modules.sys.entity.User;
import com.arjjs.ccm.modules.sys.service.OfficeService;
import com.arjjs.ccm.tool.CommUtil;
import com.arjjs.ccm.tool.MessageTools;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * app设备接口类
 * 
 * @author fuxinshuang
 * @version 2018-03-29
 */
@Controller
@RequestMapping(value = "${appPath}/rest/ccmMobileDevice")
@Api(description = "app设备接口类")
public class CcmRestCcmMobileDevice extends BaseController {

	@Autowired
	private CcmMobileDeviceService ccmMobileDeviceService;
	
	@Autowired
	private CcmElecfenceAlarmService ccmElecfenceAlarmService;
	@Autowired
	private OaNotifyService oaNotifyService;
	@Autowired
	private OfficeService officeService;
	@Autowired
	private SysDictsService sysDictsService;

	/**
	 * @see app设备（支持新增和编辑,数据同步用）
	 * @param 
	 * @return 
	 * @author liangwanmin
	 * @version 2018-05-21
	 */
	@ResponseBody
	@RequestMapping(value="/saveSyn", method = RequestMethod.POST)
	@ApiOperation(value = "app设备（支持新增和编辑,数据同步用）")
	@ApiImplicitParams({ @ApiImplicitParam(name = "userId", value = "用户 id", paramType = "form"),
			@ApiImplicitParam(name = "JsonString", value = "json数据", paramType = "query")})
	public CcmRestResult saveSyn(String userId, @RequestBody CcmMobileDevice ccmMobileDevice, String JsonString, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		CcmRestResult result = new CcmRestResult();
		if (userId == null || "".equals(userId)) {
			userId = "1";
		}
		if (JsonString==null || "".equals(JsonString)) {
			return result;
		}else {
			JsonString = java.net.URLDecoder.decode(JsonString, "UTF-8");
			JsonString = JsonString.replace("&quot;","\"");
		}
		List<CcmMobileDevice> list = new ArrayList<>();
		list = CommUtil.getListByArray(CcmMobileDevice.class, JsonString);
		for(CcmMobileDevice c:list){
			CcmMobileDevice ccmMobileDevice1 = ccmMobileDeviceService.get(c.getId());
			if(ccmMobileDevice1!=null){
				c.setIsNewRecord(false);
				ccmMobileDeviceService.save(c);
			}else{
				c.setIsNewRecord(true);
				ccmMobileDeviceService.save(c);
			}
			
		}
		

		result.setCode(CcmRestType.OK);
		result.setResult("成功");
		return result;
		
	}
	/**
	 * @see 根据用户id获取人员的地图位置及围栏信息
	 * @param 
	 * @return 
	 * @author 唐昭晖
	 * @version 
	 */
	@ResponseBody
	@RequestMapping(value="/getElecFenceInfoByUid", method = RequestMethod.GET)
	public CcmRestResult getElecFenceInfoByUid(CcmMobileDevice ccmMobileDevice,HttpServletRequest req, HttpServletResponse resp) throws IOException {
		CcmRestResult result = new CcmRestResult();
		if(StringUtils.isEmpty(ccmMobileDevice)) {
			result.setCode(CcmRestType.ERROR_PARAM);
			return result;
		}
		if(StringUtils.isEmpty(ccmMobileDevice.getDeviceId())) {
			result.setCode(CcmRestType.ERROR_PARAM);
			return result;
		}

		CcmMobileDevice object = ccmMobileDeviceService.getElecFenceInfoByUid(ccmMobileDevice);
		result.setResult(object);
		result.setCode(CcmRestType.OK);
		return result;
	}
	
	/**
	 * @see 上报移动设备报警信息
	 * @param 
	 * @return 
	 * @author 唐昭晖
	 * @version 
	 */
	@ResponseBody
	@RequestMapping(value="saveElecfenceAlarmInfo", method = RequestMethod.POST)
	public CcmRestResult saveElecfenceAlarmInfo(CcmElecfenceAlarm ccmElecfenceAlarm, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		CcmRestResult result = new CcmRestResult();
		if(ccmElecfenceAlarm==null) {
			result.setCode(CcmRestType.ERROR_PARAM);
			return result;
		}
		if(StringUtils.isEmpty(ccmElecfenceAlarm.getCcmDevice().getDeviceId())) {
			result.setCode(CcmRestType.ERROR_PARAM);
			return result;
		}
		if(StringUtils.isEmpty(ccmElecfenceAlarm.getUserId())) {
			result.setCode(CcmRestType.ERROR_PARAM);
			return result;
		}
		ccmElecfenceAlarm.setCreateBy(new User(ccmElecfenceAlarm.getUserId()));
		ccmElecfenceAlarm.setUpdateBy(new User(ccmElecfenceAlarm.getUserId()));
		ccmElecfenceAlarmService.save(ccmElecfenceAlarm);
		// fence_alarm_rule 字典type
		List<SysDicts> fence_alarm_rule = sysDictsService.findAllListByType("fence_alarm_rule");
		//拿出相同的label
		List<SysDicts> collect = fence_alarm_rule.stream().filter(item -> item.getValue().equals(ccmElecfenceAlarm.getAlarmType())).collect(Collectors.toList());
		String title="警报";
		if(collect.size()>0){
			SysDicts sysDicts = collect.get(0);
			title=sysDicts.getLabel()+"警报";
		}
		MessageTools.sendMessageByUser(oaNotifyService,officeService,ccmElecfenceAlarm.getUserId(),title,ccmElecfenceAlarm.getRemarks(),"");
		result.setCode(CcmRestType.OK);
		return result;
	}
}