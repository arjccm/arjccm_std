/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.iot.search.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

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
import org.activiti.engine.impl.bpmn.data.SimpleDataInputAssociation;
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
		String url = null;
		if(jsonObject.containsKey("url")) {
			url = jsonObject.getString("url") + "/api/fms/v2/human/findStaticHuman";
		}
		String param = "pageNo=" + page.getPageNo() + "&pageSize" + page.getPageSize();
		if(StringUtils.isNotEmpty(searchEntity.getListId())){
			param = param + "&listLibIds=" + searchEntity.getListId();
		}
		if(searchEntity.getMinThreshold()!=null){
			param = param + "&similarityMin=" + searchEntity.getMinThreshold();
		}
		if(searchEntity.getMaxThreshold()!=null){
			param = param + "&similarityMax=" + searchEntity.getMaxThreshold();
		}
		if(StringUtils.isNotEmpty(searchEntity.getImagesUrl())){
			String fileUrl = Global.getConfig("FILE_UPLOAD_URL");
			param = param + "&picUrl=" + fileUrl + searchEntity.getImagesUrl();
		}
		String result = Tool.sendPost(url,param);
		JSONObject data = JSONObject.parseObject(result);
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
		return page;
	}

	public Page<SearchGrabberVO> findSearchGrabberVOPage(Page<SearchGrabberVO> page, SearchEntity searchEntity) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SysConfig sysConfig = sysConfigService.get("face_docking_config");
		//解JSON
		JSONObject jsonObject = JSONObject.parseObject(sysConfig.getParamStr());
		String url = null;
		if(jsonObject.containsKey("url")) {
			url = jsonObject.getString("url") + "/api/fms/v2/human/findSnapHuman";
		}
		String param = "pageNo=" + page.getPageNo() + "&pageSize" + page.getPageSize();
		if(StringUtils.isNotEmpty(searchEntity.getListId())){
			param = param + "&deviceCodes=" + searchEntity.getListId();
		}
		if(searchEntity.getMinThreshold()!=null){
			param = param + "&similarityMin=" + searchEntity.getMinThreshold();
		}
		if(searchEntity.getMaxThreshold()!=null){
			param = param + "&similarityMax=" + searchEntity.getMaxThreshold();
		}
		if(searchEntity.getStartTime()!=null){
			String begin = format.format(searchEntity.getStartTime());
			param = param + "&beginDate=" + begin;
		}
		if(searchEntity.getEndTime()!=null){
			String end = format.format(searchEntity.getEndTime());
			param = param + "&endDate=" + end;
		}
		if(StringUtils.isNotEmpty(searchEntity.getImagesUrl())){
			String fileUrl = Global.getConfig("FILE_UPLOAD_URL");
			param = param + "&picUrl=" + fileUrl + searchEntity.getImagesUrl();
		}
		String result = Tool.sendPost(url,param);
		JSONObject data = JSONObject.parseObject(result);
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
		return page;
	}
}