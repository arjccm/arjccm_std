/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.sys.web;

import com.arjjs.ccm.common.config.Global;
import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.utils.StringUtils;
import com.arjjs.ccm.common.web.BaseController;
import com.arjjs.ccm.modules.ccm.sys.entity.SysConfig;
import com.arjjs.ccm.modules.ccm.sys.entity.SysMapConfig;
import com.arjjs.ccm.modules.ccm.sys.service.SysConfigService;
import com.arjjs.ccm.tool.HtmlUtil;
import groovy.util.logging.Slf4j;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;
import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 系统信息配置Controller
 * 
 * @author liang
 * @version 2018-05-10
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/sysConfig")
@Slf4j
public class SysConfigController extends BaseController {

	@Autowired
	private SysConfigService sysConfigService;

	@ModelAttribute
	public SysConfig get(@RequestParam(required = false) String id) {
		SysConfig entity = null;
		if (StringUtils.isNotBlank(id)) {
			entity = sysConfigService.get(id);
		}
		if (entity == null) {
			entity = new SysConfig();
		}
		return entity;
	}

	// 获取地图层级数据
    @RequestMapping(value = "getMapLevelData")
    @ResponseBody
    public String getMapLevelData() {

        SysConfig map_level = sysConfigService.get("map_level");

        return map_level.getParamStr();
    }

	// 配置listForm
	@RequiresPermissions("sys:sysConfig:view")
	@RequestMapping(value = "listForm")
	public String listForm(SysConfig sysConfig, HttpServletRequest request, HttpServletResponse response, Model model) {
		List<SysConfig> list = sysConfigService.findList(sysConfig);
		for (SysConfig s : list) {
			// 系统应用级别
			if ("system_level".equals(s.getId())) {
				SysConfig systemLevel = new SysConfig();
				systemLevel = s;
				model.addAttribute("systemLevel", systemLevel);
			}
			// 日志保存天数
			if ("log_save_config".equals(s.getId())) {
				SysConfig logSaveConfig = new SysConfig();
				logSaveConfig = s;
				model.addAttribute("logSaveConfig", logSaveConfig);
			}
			// 上级域系统设置
			if ("upper_system_config".equals(s.getId())) {
				SysConfig upperSystemConfig = new SysConfig();
				upperSystemConfig = s;
				// 解JSON
				JSONObject jsonObject = JSONObject.fromObject(upperSystemConfig.getParamStr());
				String url = (String) jsonObject.get("url");
				String username = (String) jsonObject.get("username");
				String password = (String) jsonObject.get("password");
				upperSystemConfig.setUrl(url);
				upperSystemConfig.setUsername(username);
				upperSystemConfig.setPassword(password);

				model.addAttribute("upperSystemConfig", upperSystemConfig);
			}
			// 人脸对接系统设置
			if ("face_docking_config".equals(s.getId())) {
				SysConfig faceDockingConfig = new SysConfig();
				faceDockingConfig = s;
				// 解JSON
				JSONObject jsonObject = JSONObject.fromObject(faceDockingConfig.getParamStr());
				if(jsonObject.containsKey("apiUrl")) {
					String apiUrl = jsonObject.getString("apiUrl");
					faceDockingConfig.setApiUrl(apiUrl);
				}
				if(jsonObject.containsKey("appKey")) {
					String appKey = jsonObject.getString("appKey");
					faceDockingConfig.setAppKey(appKey);
				}
				if(jsonObject.containsKey("appSecet")) {
					String appSecet = jsonObject.getString("appSecet");
					faceDockingConfig.setAppSecet(appSecet);
				}
				if(jsonObject.containsKey("svrIp")) {
					String svrIp = jsonObject.getString("svrIp");
					faceDockingConfig.setSvrIp(svrIp);
				}
				if(jsonObject.containsKey("svrPort")) {
					String svrPort = jsonObject.getString("svrPort");
					faceDockingConfig.setSvrPort(svrPort);
				}

				model.addAttribute("faceDockingConfig", faceDockingConfig);
			}
			// 事件预处理系统
			if ("preview_system_config".equals(s.getId())) {
				SysConfig previewSystemConfig = new SysConfig();
				previewSystemConfig = s;
				model.addAttribute("previewSystemConfig", previewSystemConfig);
			}
            // 自定义地图层级
            if ("map_level".equals(s.getId())) {
                SysConfig mapLevel = s;
                // 解JSON
                JSONObject jsonObject = JSONObject.fromObject(mapLevel.getParamStr());
                String quXian = (String) jsonObject.get("quXian");
                String jieDaoMin = (String) jsonObject.get("jieDaoMin");
                String jieDaoMax = (String) jsonObject.get("jieDaoMax");
                String sheQuMin = (String) jsonObject.get("sheQuMin");
                String sheQuMax = (String) jsonObject.get("sheQuMax");
                String wangGeMin = (String) jsonObject.get("wangGeMin");
				String wangGeMax = (String) jsonObject.get("wangGeMax");
				String build = (String) jsonObject.get("build");
                mapLevel.setQuXian(quXian);
                mapLevel.setJieDaoMin(jieDaoMin);
                mapLevel.setJieDaoMax(jieDaoMax);
                mapLevel.setSheQuMin(sheQuMin);
                mapLevel.setSheQuMax(sheQuMax);
                mapLevel.setWangGeMin(wangGeMin);
                mapLevel.setWangGeMax(wangGeMax);
                mapLevel.setBuild(build);
                model.addAttribute("mapLevel", mapLevel);
            }
			// 四色预警设置（天）
			if ("alarm_color_level".equals(s.getId())) {
				SysConfig alarmColorLevel = new SysConfig();
				alarmColorLevel = s;
				// 解JSON
				JSONObject jsonObject = JSONObject.fromObject(alarmColorLevel.getParamStr());
				String green = (String) jsonObject.get("green");
				String yellowMin = (String) jsonObject.get("yellowMin");
				String yellowMax = (String) jsonObject.get("yellowMax");
				String orangeMin = (String) jsonObject.get("orangeMin");
				String orangeMax = (String) jsonObject.get("orangeMax");
				String red = (String) jsonObject.get("red");
				alarmColorLevel.setGreen(green);
				alarmColorLevel.setYellowMin(yellowMin);
				alarmColorLevel.setYellowMax(yellowMax);
				alarmColorLevel.setOrangeMin(orangeMin);
				alarmColorLevel.setOrangeMax(orangeMax);
				alarmColorLevel.setRed(red);
				model.addAttribute("alarmColorLevel", alarmColorLevel);
			}
			// 警情时间检测配置(分钟)
			if ("alarm_check_config".equals(s.getId())) {
				SysConfig alarmCheckConfig = new SysConfig();
				alarmCheckConfig = s;
				// 解JSON
				JSONObject jsonObject = JSONObject.fromObject(alarmCheckConfig.getParamStr());
				String maxDispatchTime = (String) jsonObject.get("maxDispatchTime");
				String maxAcceptTime = (String) jsonObject.get("maxAcceptTime");
				String maxArriveTime = (String) jsonObject.get("maxArriveTime");
				alarmCheckConfig.setMaxDispatchTime(maxDispatchTime);
				alarmCheckConfig.setMaxAcceptTime(maxAcceptTime);
				alarmCheckConfig.setMaxArriveTime(maxArriveTime);
				model.addAttribute("alarmCheckConfig", alarmCheckConfig);
			}
			// 警情分流设置
			if ("alarm_data_flow".equals(s.getId())) {
				SysConfig alarmDataFlow = new SysConfig();
				alarmDataFlow = s;
				// 解JSON
				JSONObject jsonObject = JSONObject.fromObject(alarmDataFlow.getParamStr());
				String flag = (String) jsonObject.get("flag");
				sysConfig.setFlag(flag);
				model.addAttribute("alarmDataFlow", alarmDataFlow);
			}
			// 警情处警单位设置
			if ("alarm_handle_model".equals(s.getId())) {
				SysConfig alarmHandleModel = new SysConfig();
				alarmHandleModel = s;
				// 解JSON
				JSONObject jsonObject = JSONObject.fromObject(alarmHandleModel.getParamStr());
				String flag = (String) jsonObject.get("flag");
				sysConfig.setFlag(flag);
				if ("1".equals(flag)) { // 自动设置处理单位 且默认 handleModel = 1 片区片警制
					sysConfig.setHandleModel("1");
				} else {
					String handleModel = (String) jsonObject.get("handleModel");
					sysConfig.setHandleModel(handleModel);
				}
				model.addAttribute("alarmHandleModel", alarmHandleModel);
			}
			// 警情处警单位设置
			if ("alarm_data_config".equals(s.getId())) {
				SysConfig alarmDataConfig = new SysConfig();
				alarmDataConfig = s;
				// 解JSON
				JSONObject jsonObject = JSONObject.fromObject(alarmDataConfig.getParamStr());
				String alarmFlowFlag = (String) jsonObject.get("alarmFlowFlag");// 警情分流设置标志位 1：自动 0手动
				String alarmHandleFlag = (String) jsonObject.get("alarmHandleFlag");// 警情处警单位设置标志们 1：自动 0手动
				String handleModel = (String) jsonObject.get("handleModel");// 处警模式设置 1： 片区片警制 2 ：抢单模式 0： 无
				sysConfig.setAlarmFlowFlag(alarmFlowFlag);
				sysConfig.setAlarmHandleFlag(alarmHandleFlag);
				if (!"1".equals(handleModel) && !"2".equals(handleModel)) {
					sysConfig.setHandleModel("0");
				} else {
					sysConfig.setHandleModel(handleModel);
				}
				model.addAttribute("alarmDataConfig", alarmDataConfig);
			}
			// 海康视频对接数据
			if ("hikvison_video_ocx_play".equals(s.getId())) {
				SysConfig hikvisonVideoConfig = new SysConfig();
				hikvisonVideoConfig = s;
				// 解JSON
				JSONObject jsonObject = JSONObject.fromObject(hikvisonVideoConfig.getParamStr());
				if(jsonObject.containsKey("hikvisonVideoType")) {
					String hikvisonVideoType = jsonObject.getString("hikvisonVideoType");
					hikvisonVideoConfig.setHikvisonVideoType(hikvisonVideoType);
				}
				if(jsonObject.containsKey("apiUrl")) {
					String apiUrl = jsonObject.getString("apiUrl");
					hikvisonVideoConfig.setApiUrl(apiUrl);
				}
				if(jsonObject.containsKey("appKey")) {
					String appKey = jsonObject.getString("appKey");
					hikvisonVideoConfig.setAppKey(appKey);
				}
				if(jsonObject.containsKey("appSecet")) {
					String appSecet = jsonObject.getString("appSecet");
					hikvisonVideoConfig.setAppSecet(appSecet);
				}
				if(jsonObject.containsKey("svrIp")) {
					String svrIp = jsonObject.getString("svrIp");
					hikvisonVideoConfig.setSvrIp(svrIp);
				}
				if(jsonObject.containsKey("svrPort")) {
					String svrPort = jsonObject.getString("svrPort");
					hikvisonVideoConfig.setSvrPort(svrPort);
				}
				model.addAttribute("hikvisonVideoConfig", hikvisonVideoConfig);
			}
			// 天地视频对接数据
			if ("tiandy_video_ocx_play".equals(s.getId())) {
				SysConfig tiandyVideoConfig = new SysConfig();
				tiandyVideoConfig = s;
				// 解JSON
				JSONObject jsonObject = JSONObject.fromObject(tiandyVideoConfig.getParamStr());
				if(jsonObject.containsKey("tiandyIp")) {
					String tiandyIp = jsonObject.getString("tiandyIp");
					tiandyVideoConfig.setTiandyIp(tiandyIp);
				}
				if(jsonObject.containsKey("tiandyPort")) {
					String tiandyPort = jsonObject.getString("tiandyPort");
					tiandyVideoConfig.setTiandyPort(tiandyPort);
				}
				if(jsonObject.containsKey("tiandyUserName")) {
					String tiandyUserName = jsonObject.getString("tiandyUserName");
					tiandyVideoConfig.setTiandyUserName(tiandyUserName);
				}
				if(jsonObject.containsKey("tiandyPassWord")) {
					String tiandyPassWord = jsonObject.getString("tiandyPassWord");
					tiandyVideoConfig.setTiandyPassWord(tiandyPassWord);
				}
				if(jsonObject.containsKey("tiandyUserId")) {
					String tiandyUserId = jsonObject.getString("tiandyUserId");
					tiandyVideoConfig.setTiandyUserId(tiandyUserId);
				}
				model.addAttribute("tiandyVideoConfig", tiandyVideoConfig);
			}

			// 大华视频对接数据
			if ("dss_video_ocx_play".equals(s.getId())) {
				SysConfig dssVideoConfig = new SysConfig();
				dssVideoConfig = s;
				// 解JSON
				JSONObject jsonObject = JSONObject.fromObject(dssVideoConfig.getParamStr());
				if(jsonObject.containsKey("dssIP")) {
					String dssIP = jsonObject.getString("dssIP");
					dssVideoConfig.setDssIP(dssIP);
				}
				if(jsonObject.containsKey("dssPort")) {
					String dssPort = jsonObject.getString("dssPort");
					dssVideoConfig.setDssPort(dssPort);
				}
				if(jsonObject.containsKey("dssUserName")) {
					String dssUserName = jsonObject.getString("dssUserName");
					dssVideoConfig.setDssUserName(dssUserName);
				}
				if(jsonObject.containsKey("dssPassword")) {
					String dssPassword = jsonObject.getString("dssPassword");
					dssVideoConfig.setDssPassword(dssPassword);
				}
				/*if(jsonObject.containsKey("tiandyUserId")) {
					String tiandyUserId = jsonObject.getString("tiandyUserId");
					tiandyVideoConfig.setTiandyUserId(tiandyUserId);
				}*/
				model.addAttribute("dssVideoConfig", dssVideoConfig);
			}
		}
		return "ccm/sys/sysConfigList";
	}

	//
	@RequiresPermissions("sys:sysConfig:view")
	@RequestMapping(value = { "list", "" })
	public String list(SysConfig sysConfig, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<SysConfig> page = sysConfigService.findPage(new Page<SysConfig>(request, response), sysConfig);
		model.addAttribute("page", page);
		return "ccm/sys/sysConfigList";
	}

	@RequiresPermissions("sys:sysConfig:view")
	@RequestMapping(value = "form")
	public String form(SysConfig sysConfig, Model model) {
		model.addAttribute("sysConfig", sysConfig);
		return "ccm/sys/sysConfigForm";
	}

	@RequiresPermissions("sys:sysConfig:edit")
	@RequestMapping(value = "save")
	public String save(SysConfig sysConfig, Model model, RedirectAttributes redirectAttributes) {
		if ("key_personnel_notice_info_setting".equals(sysConfig.getId())) {
			String newJson = StringEscapeUtils.unescapeHtml4(sysConfig.getParamStr());
			sysConfig.setParamStr(newJson);
		}else {
			if (!beanValidator(model, sysConfig)) {
				return form(sysConfig, model);
			}
		}
		// 上级域系统设置
		if ("upper_system_config".equals(sysConfig.getId())) {
			// 转JSON
			JsonConfig config = new JsonConfig();
			config.setExcludes(new String[] { "createBy", "updateBy", "currentUser", "createDate", "updateDate",
					"remarks", "paramStr", "paramInt", "paramDate", "tableName", "objId", "beginParamDate",
					"endParamDate", "id", "dbName", "delFlag", "global", "isNewRecord", "page", "sqlMap",
					"sysMapConfig", "green", "orangeMin", "orangeMax", "yellowMin", "yellowMax", "red", "maxAcceptTime",
					"maxDispatchTime", "maxArriveTime",
					"hikvisonVideoType","apiUrl", "appKey", "appSecet", "svrIp", "svrPort",
					"tiandyIp","tiandyPort","tiandyUserName","tiandyPassWord","tiandyUserId",
					"dssIP","dssPort","dssUserName","dssPassword"});// 排除
			config.setIgnoreDefaultExcludes(false); // 设置默认忽略
			config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
			String jsonString = JSONArray.fromObject(sysConfig, config).toString(); //
			jsonString = jsonString.substring(1, jsonString.length() - 1);
			sysConfig.setParamStr(jsonString);
		}
        // 自定义地图层级
        if ("map_level".equals(sysConfig.getId())) {
            // 转JSON
            JsonConfig config = new JsonConfig();
            config.setExcludes(new String[]{"createBy", "updateBy", "currentUser", "createDate", "updateDate",
                    "remarks", "paramStr", "paramInt", "paramDate", "tableName", "objId", "beginParamDate",
                    "endParamDate", "id", "dbName", "delFlag", "global", "isNewRecord", "page", "sqlMap", "url",
                    "username", "password", "sysMapConfig", "maxAcceptTime", "maxDispatchTime", "maxArriveTime", "paramStrList",
                    "tiandyIp","tiandyPort","tiandyUserName","tiandyPassWord","tiandyUserId",
					"dssIP","dssPort","dssUserName","dssPassword"});// 排除
            config.setIgnoreDefaultExcludes(false); // 设置默认忽略
            config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
            String jsonString = JSONArray.fromObject(sysConfig, config).toString();
            System.out.println(jsonString);
            jsonString = jsonString.substring(1, jsonString.length() - 1);
            sysConfig.setParamStr(jsonString);
        }
		// 四色预警设置（天）
		if ("alarm_color_level".equals(sysConfig.getId())) {
			// 转JSON
			JsonConfig config = new JsonConfig();
			config.setExcludes(new String[] { "createBy", "updateBy", "currentUser", "createDate", "updateDate",
					"remarks", "paramStr", "paramInt", "paramDate", "tableName", "objId", "beginParamDate",
					"endParamDate", "id", "dbName", "delFlag", "global", "isNewRecord", "page", "sqlMap", "url",
					"username", "password", "sysMapConfig", "maxAcceptTime", "maxDispatchTime", "maxArriveTime",
					"hikvisonVideoType","apiUrl", "appKey", "appSecet", "svrIp", "svrPort",
					"tiandyIp","tiandyPort","tiandyUserName","tiandyPassWord","tiandyUserId",
					"dssIP","dssPort","dssUserName","dssPassword"});// 排除
			config.setIgnoreDefaultExcludes(false); // 设置默认忽略
			config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
			String jsonString = JSONArray.fromObject(sysConfig, config).toString(); //
			jsonString = jsonString.substring(1, jsonString.length() - 1);
			sysConfig.setParamStr(jsonString);
		}
		// 警情时间检测配置(分钟)
		if ("alarm_check_config".equals(sysConfig.getId())) {
			// 转JSON
			JsonConfig config = new JsonConfig();
			config.setExcludes(new String[] { "createBy", "updateBy", "currentUser", "createDate", "updateDate",
					"remarks", "paramStr", "paramInt", "paramDate", "tableName", "objId", "beginParamDate",
					"endParamDate", "id", "dbName", "delFlag", "global", "isNewRecord", "page", "sqlMap", "url",
					"username", "password", "sysMapConfig", "red", "yellowMin", "green", "orangeMax", "orangeMin","yellowMax",
					"hikvisonVideoType","apiUrl", "appKey", "appSecet", "svrIp", "svrPort",
					"tiandyIp","tiandyPort","tiandyUserName","tiandyPassWord","tiandyUserId",
					"dssIP","dssPort","dssUserName","dssPassword"});// 排除
			config.setIgnoreDefaultExcludes(false); // 设置默认忽略
			config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
			String jsonString = JSONArray.fromObject(sysConfig, config).toString(); //
			jsonString = jsonString.substring(1, jsonString.length() - 1);
			sysConfig.setParamStr(jsonString);
		}
		// 警情设置
		if ("alarm_data_config".equals(sysConfig.getId())) {
			JsonConfig config = new JsonConfig();
			config.setExcludes(new String[] { "createBy", "updateBy", "currentUser", "createDate", "updateDate",
					"remarks", "paramStr", "paramInt", "paramDate", "tableName", "objId", "beginParamDate",
					"endParamDate", "id", "dbName", "delFlag", "global", "isNewRecord", "page", "sqlMap", "url",
					"username", "password", "sysMapConfig", "maxAcceptTime", "maxDispatchTime", "maxArriveTime", "red",
					"yellowMin", "green", "orangeMax", "orangeMin", "yellowMax", "flag",
					"hikvisonVideoType","apiUrl", "appKey", "appSecet", "svrIp", "svrPort",
					"tiandyIp","tiandyPort","tiandyUserName","tiandyPassWord","tiandyUserId",
					"dssIP","dssPort","dssUserName","dssPassword"});// 排除
			config.setIgnoreDefaultExcludes(false); // 设置默认忽略
			config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
			String jsonString = JSONArray.fromObject(sysConfig, config).toString(); //
			jsonString = jsonString.substring(1, jsonString.length() - 1);
			sysConfig.setParamStr(jsonString);
		}
		if ("hikvison_video_ocx_play".equals(sysConfig.getId())) {
			JsonConfig config = new JsonConfig();
			config.setExcludes(new String[] { "createBy", "updateBy", "currentUser", "createDate", "updateDate",
					"remarks", "paramStr", "paramInt", "paramDate", "tableName", "objId", "beginParamDate",
					"endParamDate", "id", "dbName", "delFlag", "global", "isNewRecord", "page", "sqlMap", "url",
					"username", "password", "sysMapConfig", "maxAcceptTime", "maxDispatchTime", "maxArriveTime", "red",
					"yellowMin", "green", "orangeMax", "orangeMin", "yellowMax", "flag",
					"alarmFlowFlag", "alarmHandleFlag", "handleModel", "paramStrList","tiandyIp","tiandyPort","tiandyUserName","tiandyPassWord","tiandyUserId",
					"quXian","jieDaoMin","jieDaoMax","sheQuMin","sheQuMax","wangGe",
					"dssIP","dssPort","dssUserName","dssPassword"});// 排除
			config.setIgnoreDefaultExcludes(false); // 设置默认忽略
			config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
			String jsonString = JSONArray.fromObject(sysConfig, config).toString(); //
			jsonString = jsonString.substring(1, jsonString.length() - 1);
			sysConfig.setParamStr(jsonString);
		}
		if ("tiandy_video_ocx_play".equals(sysConfig.getId())) {
			JsonConfig config = new JsonConfig();
			config.setExcludes(new String[] { "createBy", "updateBy", "currentUser", "createDate", "updateDate",
					"remarks", "paramStr", "paramInt", "paramDate", "tableName", "objId", "beginParamDate",
					"endParamDate", "id", "dbName", "delFlag", "global", "isNewRecord", "page", "sqlMap", "url",
					"username", "password", "sysMapConfig", "maxAcceptTime", "maxDispatchTime", "maxArriveTime", "red",
					"yellowMin", "green", "orangeMax", "orangeMin", "yellowMax", "flag",
					"alarmFlowFlag", "alarmHandleFlag", "handleModel", "paramStrList",
					"hikvisonVideoType","apiUrl", "appKey", "appSecet", "svrIp", "svrPort",
					"quXian","jieDaoMin","jieDaoMax","sheQuMin","sheQuMax","wangGe",
					"dssIP","dssPort","dssUserName","dssPassword"});// 排除
			config.setIgnoreDefaultExcludes(false); // 设置默认忽略
			config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
			String jsonString = JSONArray.fromObject(sysConfig, config).toString(); //
			jsonString = jsonString.substring(1, jsonString.length() - 1);
			sysConfig.setParamStr(jsonString);
		}
		if ("dss_video_ocx_play".equals(sysConfig.getId())) {
			JsonConfig config = new JsonConfig();
			config.setExcludes(new String[] { "createBy", "updateBy", "currentUser", "createDate", "updateDate",
					"remarks", "paramStr", "paramInt", "paramDate", "tableName", "objId", "beginParamDate",
					"endParamDate", "id", "dbName", "delFlag", "global", "isNewRecord", "page", "sqlMap", "url", "build", "wangGeMax", "wangGeMin",
					"username", "password", "sysMapConfig", "maxAcceptTime", "maxDispatchTime", "maxArriveTime", "red",
					"yellowMin", "green", "orangeMax", "orangeMin", "yellowMax", "flag",
					"alarmFlowFlag", "alarmHandleFlag", "handleModel", "paramStrList",
					"hikvisonVideoType","apiUrl", "appKey", "appSecet", "svrIp", "svrPort",
					"quXian","jieDaoMin","jieDaoMax","sheQuMin","sheQuMax","wangGe",
					"tiandyIp","tiandyPort","tiandyUserName","tiandyPassWord","tiandyUserId"});// 排除
			config.setIgnoreDefaultExcludes(false); // 设置默认忽略
			config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
			String jsonString = JSONArray.fromObject(sysConfig, config).toString(); //
			jsonString = jsonString.substring(1, jsonString.length() - 1);
			sysConfig.setParamStr(jsonString);
		}
		if ("face_docking_config".equals(sysConfig.getId())) {
			JsonConfig config = new JsonConfig();
			config.setExcludes(new String[] { "createBy", "updateBy", "currentUser", "createDate", "updateDate",
					"remarks", "paramStr", "paramInt", "paramDate", "tableName", "objId", "beginParamDate",
					"endParamDate", "id", "dbName", "delFlag", "global", "isNewRecord", "page", "sqlMap", "url",
					"username", "password", "sysMapConfig", "maxAcceptTime", "maxDispatchTime", "maxArriveTime", "red",
					"yellowMin", "green", "orangeMax", "orangeMin", "yellowMax", "flag",
					"alarmFlowFlag", "alarmHandleFlag", "handleModel", "paramStrList","tiandyIp","tiandyPort","tiandyUserName","tiandyPassWord","tiandyUserId",
					"quXian","jieDaoMin","jieDaoMax","sheQuMin","sheQuMax","wangGe",
					"dssIP","dssPort","dssUserName","dssPassword"});// 排除
			config.setIgnoreDefaultExcludes(false); // 设置默认忽略
			config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
			String jsonString = JSONArray.fromObject(sysConfig, config).toString(); //
			jsonString = jsonString.substring(1, jsonString.length() - 1);
			sysConfig.setParamStr(jsonString);
		}
		sysConfigService.save(sysConfig);
		addMessage(redirectAttributes, "保存系统信息配置'" + sysConfig.getRemarks() + "'成功");
		return "redirect:" + Global.getAdminPath() + "/sys/sysConfig/listForm?repage";
	}

	@RequiresPermissions("sys:sysConfig:edit")
	@RequestMapping(value = "delete")
	public String delete(SysConfig sysConfig, RedirectAttributes redirectAttributes) {
		sysConfigService.delete(sysConfig);
		addMessage(redirectAttributes, "删除系统信息配置成功");
		return "redirect:" + Global.getAdminPath() + "/sys/sysConfig/?repage";
	}

	/**
	 * 地图配置信息表单
	 * 
	 * @param - sysConfig
	 * @param model
	 * @return
	 */
	@RequiresPermissions("sys:sysConfig:view")
	@RequestMapping(value = "mapConfigForm")
	public String mapConfigForm(Model model) {
		SysConfig sysConfig = sysConfigService.get(SysConfig.MAP_CONFIG_ID);
		if (StringUtils.isNotBlank(sysConfig.getParamStr())) {
			JSONObject jsonObject = JSONObject.fromObject(sysConfig.getParamStr());
			if (jsonObject != null && !jsonObject.isEmpty() && !jsonObject.isNullObject()) {
				SysMapConfig sysMapConfig = (SysMapConfig) JSONObject.toBean(jsonObject, SysMapConfig.class);
				sysConfig.setSysMapConfig(sysMapConfig);
			}
		}
		model.addAttribute("systemMapConfig", sysConfig);
		return "ccm/sys/sysMapConfigForm";
	}

	/**
	 * 地图配置信息保存  ArcGISTiledLayer
	 * 
	 * @param -  sysMapConfig
	 * @param model
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("sys:sysConfig:edit")
	@RequestMapping(value = "saveMapConfigInfo")
	public String saveMapConfigInfo(SysConfig sysConfig, Model model, RedirectAttributes redirectAttributes) {
		SysMapConfig sysMapConfig = sysConfig.getSysMapConfig();
		if (sysMapConfig != null) {
			sysConfig.setParamStr(JSONObject.fromObject(sysMapConfig).toString());
		}
		sysConfigService.save(sysConfig);
		addMessage(redirectAttributes, "保存'" + sysConfig.getRemarks() + "'成功");
		return "redirect:" + Global.getAdminPath() + "/sys/sysConfig/mapConfigForm?repage";
	}

	@RequestMapping(value = "getMapConfigWithAJAX")
	@ResponseBody
	public SysConfig getMapConfigWithAJAX(HttpServletRequest request) throws Exception {
		SysConfig sysConfig = sysConfigService.get(SysConfig.MAP_CONFIG_ID);
		if (StringUtils.isNotBlank(sysConfig.getParamStr())) {
			JSONObject jsonObject = JSONObject.fromObject(sysConfig.getParamStr());
			if (jsonObject != null && !jsonObject.isEmpty() && !jsonObject.isNullObject()) {
				SysMapConfig sysMapConfig = (SysMapConfig) JSONObject.toBean(jsonObject, SysMapConfig.class);
				String actualConfigUrl = HtmlUtil.getActualConfigUrl(sysMapConfig.getAppMapUrl());
				logger.info("actualConfigUrl:----------------------------" + actualConfigUrl);
				logger.info("request.getRemoteAddr():----------------------------" + request.getRemoteAddr());
				logger.info("StringUtils.isNotEmpty(actualConfigUrl) :----------------------------" + StringUtils.isNotEmpty(actualConfigUrl) );
				logger.info("actualConfigUr:----------------------------" + actualConfigUrl);
				logger.info("actualConfigUrl.split(\":\")[0].equals(request.getRemoteAddr()) :----------------------------" + actualConfigUrl.split(":")[0].equals(request.getRemoteAddr()) );
				logger.info("actualConfigUrl.split(:)[0] :----------------------------" + actualConfigUrl.split(":")[0]);
				logger.info("request.getRemoteAddr() :----------------------------" + request.getRemoteAddr());
				logger.info("request.getIpAddress() :----------------------------" + HtmlUtil.getIpAddress(request));


				if (StringUtils.isNotEmpty(actualConfigUrl)){ //如果是映射地址
					logger.info("=================================================如果配置了APP映射地址,也就是外网地址===================================================================");
					logger.info("127.0.0.1.equals(request.getRemoteAddr() :----------------------------" + "127.0.0.1".equals(request.getRemoteAddr()));
					logger.info("Global.getConfig(physical_address_server_url).equals(HtmlUtil.getIpAddress(request) :----------------------------" + Global.getConfig("physical_address_server_url").equals(HtmlUtil.getIpAddress(request)));
					logger.info("HtmlUtil.getIpAddress(request).startsWith(Global.getConfig(physical_address_server_url).substring(0,2)):----------------------------" + HtmlUtil.getIpAddress(request).startsWith(Global.getConfig("physical_address_server_url").substring(0,2)));
					logger.info("=================================================如果配置了APP映射地址,也就是外网地址===================================================================");
					if(!"127.0.0.1".equals(request.getRemoteAddr()) &&
							!Global.getConfig("physical_address_server_url").equals(HtmlUtil.getIpAddress(request)) &&
							!HtmlUtil.getIpAddress(request).startsWith(Global.getConfig("physical_address_server_url").substring(0,2))){
						sysMapConfig.setImageMapUrl(HtmlUtil.getMappingUrl(actualConfigUrl,sysMapConfig.getImageMapUrl())); //影像地图url
						sysMapConfig.setElectronicMapUrl(HtmlUtil.getMappingUrl(actualConfigUrl,sysMapConfig.getElectronicMapUrl())); //电子地图url
						sysMapConfig.setKeshihuaMapUrl(HtmlUtil.getMappingUrl(actualConfigUrl,sysMapConfig.getKeshihuaMapUrl()));//可视化地图url
						logger.info("=================================================外网映射地址===================================================================");
						logger.debug("getAppMapUrl"+sysMapConfig.getAppMapUrl());
						logger.debug("电子地图url getElectronicMapUrl"+sysMapConfig.getElectronicMapUrl());
						logger.debug("影像地图url getImageMapUrl"+sysMapConfig.getImageMapUrl());
						logger.debug("可视化地图url getKeshihuaMapUrl"+sysMapConfig.getKeshihuaMapUrl());
						logger.info(("getAppMapUrl"+ sysMapConfig.getAppMapUrl()));
						logger.info("电子地图url getElectronicMapUrl"+sysMapConfig.getElectronicMapUrl());
						logger.info("影像地图url getImageMapUrl"+sysMapConfig.getImageMapUrl());
						logger.info("可视化地图url getKeshihuaMapUrl"+sysMapConfig.getKeshihuaMapUrl());
						logger.info("=================================================外网映射地址===================================================================");
					}else{
						logger.info("=================================================配置地址===================================================================");
						logger.debug("getAppMapUrl"+sysMapConfig.getAppMapUrl());
						logger.debug("电子地图url getElectronicMapUrl"+sysMapConfig.getElectronicMapUrl());
						logger.debug("影像地图url getImageMapUrl"+sysMapConfig.getImageMapUrl());
						logger.debug("可视化地图url getKeshihuaMapUrl"+sysMapConfig.getKeshihuaMapUrl());
						logger.info(("getAppMapUrl"+ sysMapConfig.getAppMapUrl()));
						logger.info("电子地图url getElectronicMapUrl"+sysMapConfig.getElectronicMapUrl());
						logger.info("影像地图url getImageMapUrl"+sysMapConfig.getImageMapUrl());
						logger.info("可视化地图url getKeshihuaMapUrl"+sysMapConfig.getKeshihuaMapUrl());
						logger.info("=================================================配置地址===================================================================");

					}

				}
				sysConfig.setSysMapConfig(sysMapConfig);
			}
		}
		return sysConfig;
	}

	@RequestMapping(value = "getAlarmColorLevelConfig")
	@ResponseBody
	public SysConfig getAlarmColorLevelConfig() {
		SysConfig alarmColorLevel = new SysConfig();
		List<SysConfig> list = sysConfigService.findList(alarmColorLevel);
		for (SysConfig s : list) {
			alarmColorLevel = s;
			if ("alarm_color_level".equals(s.getId())) {
				// 解JSON
				JSONObject jsonObject = JSONObject.fromObject(alarmColorLevel.getParamStr());
				String green = (String) jsonObject.get("green");
				String yellowMin = (String) jsonObject.get("yellowMin");
				String yellowMax = (String) jsonObject.get("yellowMax");
				String orangeMin = (String) jsonObject.get("orangeMin");
				String orangeMax = (String) jsonObject.get("orangeMax");
				String red = (String) jsonObject.get("red");
				alarmColorLevel.setGreen(green);
				alarmColorLevel.setYellowMin(yellowMin);
				alarmColorLevel.setYellowMax(yellowMax);
				alarmColorLevel.setOrangeMin(orangeMin);
				alarmColorLevel.setOrangeMax(orangeMax);
				alarmColorLevel.setRed(red);
				return alarmColorLevel;
			}
		}
		return alarmColorLevel;
	}

}