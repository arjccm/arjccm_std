package com.arjjs.ccm.modules.ccm.rest.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.arjjs.ccm.common.utils.StringUtils;
import com.arjjs.ccm.modules.ccm.ccmsys.entity.CcmDevice;
import com.arjjs.ccm.modules.ccm.ccmsys.service.CcmDeviceService;
import com.arjjs.ccm.modules.ccm.rest.entity.DssVideoOcx;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.arjjs.ccm.common.web.BaseController;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestResult;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestType;
import com.arjjs.ccm.modules.ccm.rest.entity.HikVideoOcx;
import com.arjjs.ccm.modules.ccm.sys.entity.SysConfig;
import com.arjjs.ccm.modules.ccm.sys.service.SysConfigService;
import com.hikvision.artemis.sdk.ArtemisHttpUtil;
import com.hikvision.artemis.sdk.config.ArtemisConfig;

import net.sf.json.JSONObject;

/**
 *视频接口类
 * 
 * @author pengjianqiang
 * @version 2019-05-15
 */
@Controller
@RequestMapping(value = "${appPath}/rest/video")
public class CcmRestVideo extends BaseController {

	@Autowired
	private SysConfigService sysConfigService;

	@Autowired
	private CcmDeviceService ccmDeviceService;

	
	/**
	 * 能力开放平台的网站路径
	 * TODO 路径不用修改，就是/artemis
	 */
	private static final String ARTEMIS_PATH = "/artemis";
	
	/**
	 * @see  获取海康视频播放ocx的参数
	 * @param 
	 * @return 
	 * @author pengjianqiang
	 * @version 2019-05-15
	 */
	@ResponseBody
	@RequestMapping(value = "/callApiGetSecurity", method = RequestMethod.GET)
	public CcmRestResult callApiGetSecurity(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		CcmRestResult result = new CcmRestResult();

		SysConfig sysConfig = sysConfigService.get("hikvison_video_ocx_play");
		//解JSON
		JSONObject jsonObject = JSONObject.fromObject(sysConfig.getParamStr());
		String apiUrl = (String)jsonObject.get("apiUrl");
		String svrIp = (String)jsonObject.get("svrIp");
		String svrPort = (String)jsonObject.get("svrPort");
		String appKey = (String)jsonObject.get("appKey");
		String appSecet = (String)jsonObject.get("appSecet");
		String hikvisonVideoType = (String)jsonObject.get("hikvisonVideoType");

		HikVideoOcx hikVideoOcx = new HikVideoOcx();
		hikVideoOcx.setSvrIp(svrIp);
		hikVideoOcx.setSvrPort(svrPort);
		hikVideoOcx.setAppKey(appKey);
		hikVideoOcx.setAppSecet(appSecet);
		hikVideoOcx.setHikvisonVideoType(hikvisonVideoType);

		ArtemisConfig.host = apiUrl; // 代理API网关nginx服务器ip端口
		ArtemisConfig.appKey = appKey;  // 秘钥appkey
		ArtemisConfig.appSecret = appSecet;// 秘钥appSecret

		final String getSecurityApi = ARTEMIS_PATH + "/api/artemis/v1/agreementService/securityParam/appKey/" + appKey;
        Map<String, String> path = new HashMap<String, String>(2){
            {
                 put("https://", getSecurityApi);
            }
        };
        //根据appKey获取加密协议调用函数
        String appKeyEncrypt = ArtemisHttpUtil.doGetArtemis(path, null,null,null,null);
		hikVideoOcx.setAppKeyEncrypt(appKeyEncrypt);
		
		result.setCode(CcmRestType.OK);
		result.setResult(hikVideoOcx);
		return result;
	}

	/**
	 * @see  获取大华频播放ocx的参数
	 * @author szl
	 * @version 2020-07-17
	 */
	@ResponseBody
	@RequestMapping(value = "/getDssConfig", method = RequestMethod.GET)
	public CcmRestResult getDssConfig(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		CcmRestResult result = new CcmRestResult();

		SysConfig sysConfig = sysConfigService.get("dss_video_ocx_play");
		//解JSON
		JSONObject jsonObject = JSONObject.fromObject(sysConfig.getParamStr());
		String dssIP = (String)jsonObject.get("dssIP");
		String dssPort = (String)jsonObject.get("dssPort");
		String dssUserName = (String)jsonObject.get("dssUserName");
		String dssPassword = (String)jsonObject.get("dssPassword");

		DssVideoOcx dssVideoOcx = new DssVideoOcx();
		dssVideoOcx.setDssIP(dssIP);
		dssVideoOcx.setDssPort(dssPort);
		dssVideoOcx.setDssUserName(dssUserName);
		dssVideoOcx.setDssPassword(dssPassword);

		result.setCode(CcmRestType.OK);
		result.setResult(dssVideoOcx);
		return result;
	}

	/**
	 * @see  天地获取视频参数
	 * @param
	 * @return
	 * @author cby
	 * @version 2020-12-24
	 */
	@ResponseBody
	@RequestMapping(value = "/getDevice", method = RequestMethod.GET)
	public CcmRestResult getDevice(String id, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		CcmRestResult result = new CcmRestResult();
		CcmDevice entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = ccmDeviceService.get(id);
		}
		if (entity == null){
			entity = new CcmDevice();
		}

		result.setCode(CcmRestType.OK);
		result.setResult(entity);
		return result;
	}
}