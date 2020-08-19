/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.iot.search.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.arjjs.ccm.common.config.Global;
import com.arjjs.ccm.common.utils.StringUtils;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestResult;
import com.arjjs.ccm.modules.ccm.sys.entity.SysConfig;
import com.arjjs.ccm.modules.ccm.sys.service.SysConfigService;
import com.arjjs.ccm.modules.iot.search.entity.SearchEntity;
import com.arjjs.ccm.modules.iot.search.entity.SearchGrabberVO;
import com.arjjs.ccm.modules.iot.search.entity.SearchVO;
import com.arjjs.ccm.tool.Tool;
import com.hikvision.artemis.sdk.ArtemisHttpUtil;
import com.hikvision.artemis.sdk.config.ArtemisConfig;
import org.activiti.engine.impl.bpmn.data.SimpleDataInputAssociation;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.service.CrudService;
import com.arjjs.ccm.modules.iot.search.entity.CcmSearchStatic;
import com.arjjs.ccm.modules.iot.search.dao.CcmSearchStaticDao;

/**
 * 静态库检索Service
 * @author cby
 * @version 2020-05-14
 */
@Service
@Transactional(readOnly = true)
public class CcmSearchStaticService extends CrudService<CcmSearchStaticDao, CcmSearchStatic> {

	@Autowired
	private SysConfigService sysConfigService;
	/**
	 * 能力开放平台的网站路径
	 * TODO 路径不用修改，就是/artemis
	 */
	private static final String ARTEMIS_PATH = "/artemis";

	private static final String URL_STATIC_PATH = "/api/fms/v2/human/findStaticHuman";

	private static final String URL_SNAP_PATH = "/api/fms/v2/human/findSnapHuman";

	public CcmSearchStatic get(String id) {
		return super.get(id);
	}

	public List<CcmSearchStatic> findList(CcmSearchStatic ccmSearchStatic) {
		return super.findList(ccmSearchStatic);
	}

	public Page<CcmSearchStatic> findPage(Page<CcmSearchStatic> page, CcmSearchStatic ccmSearchStatic) {
		return super.findPage(page, ccmSearchStatic);
	}

	@Transactional(readOnly = false)
	public void save(CcmSearchStatic ccmSearchStatic) {
		super.save(ccmSearchStatic);
	}

	@Transactional(readOnly = false)
	public void delete(CcmSearchStatic ccmSearchStatic) {
		super.delete(ccmSearchStatic);
	}

	public Page<SearchVO> findSearchVOPage(Page<SearchVO> page, SearchEntity searchEntity) {
		SysConfig sysConfig = sysConfigService.get("face_docking_config");
		//解JSON
		JSONObject jsonObject = JSONObject.parseObject(sysConfig.getParamStr());
		String apiUrl = jsonObject.getString("apiUrl");
		String appKey = jsonObject.getString("appKey");
		String appSecet = jsonObject.getString("appSecet");
		if(StringUtils.isNotEmpty(apiUrl) && StringUtils.isNotEmpty(appKey) && StringUtils.isNotEmpty(appSecet)) {
			ArtemisConfig.host = apiUrl; // 代理API网关nginx服务器ip端口
			ArtemisConfig.appKey = appKey;  // 秘钥appkey
			ArtemisConfig.appSecret = appSecet;// 秘钥appSecret
			final String getCamsApi = ARTEMIS_PATH + URL_STATIC_PATH;
			Map<String,Object> bodys = new HashMap<String,Object>();//get请求的查询参数
			bodys.put("pageNo", page.getPageNo());
			bodys.put("pageSize", page.getPageSize());
			if(StringUtils.isNotEmpty(searchEntity.getListId())){
				bodys.put("listLibIds", searchEntity.getListId());
			}
			if(searchEntity.getMinThreshold()!=null){
				bodys.put("similarityMin", searchEntity.getMinThreshold());
			}
			if(searchEntity.getMaxThreshold()!=null){
				bodys.put("similarityMax", searchEntity.getMaxThreshold());
			}
			if(StringUtils.isNotEmpty(searchEntity.getImagesUrl())){
				String fileUrl = Global.getConfig("FILE_UPLOAD_URL");
				bodys.put("picUrl", fileUrl + searchEntity.getImagesUrl());
			}
			Map<String, String> path = new HashMap<String, String>(2){
				{
					put("https://", getCamsApi);
				}
			};
			System.out.println(" ===== >>>>>> " + JSONObject.toJSONString(bodys));
			String result = ArtemisHttpUtil.doPostStringArtemis(path, JSONObject.toJSONString(bodys), null,null,"application/json",null);
			System.out.println(" ===== >>>>>> " + result);
			JSONObject data = JSONObject.parseObject(result);
			if(data!=null){
                if(data.containsKey("code") && "0".equals(data.getString("code"))){
                    JSONObject dataJson = JSONObject.parseObject(data.getString("data"));
                    List<SearchVO> list = JSONObject.parseArray(dataJson.getString("list"),SearchVO.class);
                    Long count = dataJson.getLong("total");
                    page.setList(list);
                    page.setCount(count);
                }else{
                    List<SearchVO> faillist = new ArrayList<>();
                    page.setList(faillist);
                    page.setCount(0);
                    page.setMessage("暂无数据");
                }
            }else{
                List<SearchVO> faillist = new ArrayList<>();
                page.setList(faillist);
                page.setCount(0);
                page.setMessage("暂无数据");
            }
		}else{
			List<SearchVO> faillist = new ArrayList<>();
			page.setList(faillist);
			page.setCount(0);
			page.setMessage("配置信息为空");
			return page;
		}
		return page;
	}

	public Page<SearchGrabberVO> findSearchGrabberVOPage(Page<SearchGrabberVO> page, SearchEntity searchEntity) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SysConfig sysConfig = sysConfigService.get("face_docking_config");
		//解JSON
		JSONObject jsonObject = JSONObject.parseObject(sysConfig.getParamStr());
		String apiUrl = jsonObject.getString("apiUrl");
		String appKey = jsonObject.getString("appKey");
		String appSecet = jsonObject.getString("appSecet");
		if(StringUtils.isNotEmpty(apiUrl) && StringUtils.isNotEmpty(appKey) && StringUtils.isNotEmpty(appSecet) && StringUtils.isNotEmpty(searchEntity.getListId())) {
			ArtemisConfig.host = apiUrl; // 代理API网关nginx服务器ip端口
			ArtemisConfig.appKey = appKey;  // 秘钥appkey
			ArtemisConfig.appSecret = appSecet;// 秘钥appSecret
			final String getCamsApi = ARTEMIS_PATH + URL_SNAP_PATH;
			Map<String,Object> bodys = new HashMap<String,Object>();//get请求的查询参数
			bodys.put("pageNo", page.getPageNo());
			bodys.put("pageSize", page.getPageSize());
			if(StringUtils.isNotEmpty(searchEntity.getListId())){
				bodys.put("deviceCodes", searchEntity.getListId());
			}
			if(searchEntity.getMinThreshold()!=null){
				bodys.put("similarityMin", searchEntity.getMinThreshold());
			}
			if(searchEntity.getMaxThreshold()!=null){
				bodys.put("similarityMax", searchEntity.getMaxThreshold());
			}
			if(searchEntity.getStartTime()!=null){
				String begin = format.format(searchEntity.getStartTime());
				bodys.put("beginDate", begin);
			}
			if(searchEntity.getEndTime()!=null){
				String end = format.format(searchEntity.getEndTime());
				bodys.put("endDate", end);
			}
			if(StringUtils.isNotEmpty(searchEntity.getImagesUrl())){
				String fileUrl = Global.getConfig("FILE_UPLOAD_URL");
				bodys.put("picUrl", fileUrl + searchEntity.getImagesUrl());
			}
			Map<String, String> path = new HashMap<String, String>(2){
				{
					put("https://", getCamsApi);
				}
			};
			System.out.println(" ===== >>>>>> " + JSONObject.toJSONString(bodys));
			String result = ArtemisHttpUtil.doPostStringArtemis(path, JSONObject.toJSONString(bodys), null,null,"application/json",null);
			System.out.println(" ===== >>>>>> " + result);
			JSONObject data = JSONObject.parseObject(result);
			if(data!=null){
                if(data.containsKey("code") && "0".equals(data.getString("code"))){
                    JSONObject dataJson = JSONObject.parseObject(data.getString("data"));
                    List<SearchGrabberVO> list = JSONObject.parseArray(dataJson.getString("list"),SearchGrabberVO.class);
                    Long count = dataJson.getLong("total");
                    page.setList(list);
                    page.setCount(count);
                }else{
                    List<SearchGrabberVO> faillist = new ArrayList<>();
                    page.setList(faillist);
                    page.setCount(0);
                    page.setMessage("暂无数据");
                }
            }else{
                List<SearchGrabberVO> faillist = new ArrayList<>();
                page.setList(faillist);
                page.setCount(0);
                page.setMessage("暂无数据");
            }
		}else{
			List<SearchGrabberVO> faillist = new ArrayList<>();
			page.setList(faillist);
			page.setCount(0);
			page.setMessage("配置信息为空");
			return page;
		}
		return page;
	}
}