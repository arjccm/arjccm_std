/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.list.service;

import java.util.Date;
import java.util.List;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.arjjs.ccm.common.utils.StringUtils;
import com.arjjs.ccm.modules.ccm.list.entity.CcmListUpload;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestResult;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestType;
import com.arjjs.ccm.modules.ccm.sys.entity.SysConfig;
import com.arjjs.ccm.modules.ccm.sys.service.SysConfigService;
import com.arjjs.ccm.modules.pbs.sys.utils.UserUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.service.CrudService;
import com.arjjs.ccm.modules.ccm.list.entity.CcmList;
import com.arjjs.ccm.modules.ccm.list.dao.CcmListDao;

/**
 * 名单库实体类Service
 * @author jpy
 * @version 2019-06-04
 */
@Service
@Transactional(readOnly = true)
public class CcmListService extends CrudService<CcmListDao, CcmList> {

	@Autowired
	private SysConfigService sysConfigService;
	@Autowired
	private CcmListDao ccmListDao;
	@Autowired
	private CcmListUploadService ccmListUploadService;

	public CcmList get(String id) {
		return super.get(id);
	}
	
	public List<CcmList> findList(CcmList ccmList) {
		return super.findList(ccmList);
	}
	
	public List<CcmList> getList(CcmList ccmList) {
		return dao.getList(ccmList);
	}
	
	public Integer getPeopleCount(CcmList ccmList) {
		return dao.getPeopleCount(ccmList);
	}
	
	public Page<CcmList> findPage(Page<CcmList> page, CcmList ccmList) {
		return super.findPage(page, ccmList);
	}
	
	@Transactional(readOnly = false)
	public void save(CcmList ccmList) {
		if("NO".equals(ccmList.getIsupload())){
			super.save(ccmList);
		}else{
			CcmListUpload upload = new CcmListUpload();
			upload.setTableName("ccm_list");
			upload.setUploadStatus("1");
			if(StringUtils.isNotEmpty(ccmList.getId()) && StringUtils.isNotEmpty(ccmList.getFid())){
				upload.setDataId(ccmList.getId());
				upload.setOperateType("2");
				upload.setRemarks("编辑名单库数据："+ccmList.getName());
				ccmListUploadService.save(upload);
				super.save(ccmList);
			}else{
				super.save(ccmList);
				upload.setDataId(ccmList.getId());
				upload.setOperateType("1");
				upload.setRemarks("新增名单库数据："+ccmList.getName());
				ccmListUploadService.save(upload);
			}
		}
	}
	
	@Transactional(readOnly = false)
	public void delete(CcmList ccmList) {
		CcmListUpload upload = new CcmListUpload();
		upload.setTableName("ccm_list");
		upload.setUploadStatus("1");
		upload.setDataId(ccmList.getId());
		upload.setOperateType("3");
		upload.setRemarks("删除名单库数据："+ccmList.getName());
		ccmListUploadService.save(upload);
		super.delete(ccmList);
	}

	public CcmRestResult getCcmList() {
		CcmRestResult result = new CcmRestResult();
		SysConfig sysConfig = sysConfigService.get("face_docking_config");
		//解JSON
		JSONObject jsonObject = JSONObject.parseObject(sysConfig.getParamStr());
		String url = null;
		if(jsonObject.containsKey("url")) {
			url = jsonObject.getString("url");
		}
		if(StringUtils.isNotEmpty(url)) {
			if(isStopThread) {
				CcmListService.getCcmListThread getCcmListThread = new CcmListService.getCcmListThread();
				getCcmListThread.start();
			}
			result.setCode(CcmRestType.OK);
			result.setResult(null);
		}else {
			result.setCode(CcmRestType.ERROR_PARAM);
			result.setResult(null);
		}
		return result;
	}

	private static boolean isStopThread = true;

	private static final String URL_PATH = "/api/fms/v2/listLib/findListLib";

	class getCcmListThread extends Thread {
		public void run() {
			isStopThread = false;
			SysConfig sysConfig = sysConfigService.get("face_docking_config");
			//解JSON
			JSONObject jsonObject = JSONObject.parseObject(sysConfig.getParamStr());
			String url = jsonObject.getString("url");
			StringBuffer buffer = new StringBuffer();
			buffer.append(url);
			buffer.append(URL_PATH);
			buffer.append("?listLibId=&typeId=");
			int i = 0;
			boolean bool = false;
			try {
				while (!bool) {
					bool = this.getCcmListByUrl(buffer.toString());
					i++;
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				System.out.println("获取名单库结束");
				isStopThread = true;
			}
		}

		public boolean getCcmListByUrl(String url) {
			boolean bool = false;
			String result="";
			//获取httpclient对象
			DefaultHttpClient httpClient = new DefaultHttpClient();
			//获取get请求对象
			HttpGet httpGet = new HttpGet(url);
			try {
				//发起请求
				HttpResponse response = httpClient.execute(httpGet);
				//获取响应中的数据
				HttpEntity entity = response.getEntity();
				//把entity转换成字符串
				result = EntityUtils.toString(entity, "utf-8");
				System.out.println(" ===== >>> " + result);
				JSONObject resJson = JSONObject.parseObject(result);
				if(resJson.containsKey("data") && StringUtils.isNotBlank(resJson.getString("data"))) {
					JSONObject dataJson = JSONObject.parseObject(resJson.getString("data"));
					if(dataJson.containsKey("list") && StringUtils.isNotBlank(dataJson.getString("list"))){
						JSONArray listJson = JSONArray.parseArray(dataJson.getString("list"));
						if (listJson.size() > 0) {
							List<CcmList> list = ccmListDao.findList(new CcmList());
							for (int i = 0; i < listJson.size(); i++) {
								JSONObject ccmListJson = listJson.getJSONObject(i);
								String fid = null;
								if(ccmListJson.containsKey("listLibId")) {
									fid = ccmListJson.getString("listLibId");
								}
								if(StringUtils.isNotBlank(fid)) {
									CcmList ccmList = new CcmList();
									ccmList.setFid(fid);
									boolean isNew = true;
									for (CcmList ccmlist:list) {
										if(fid.equals(ccmlist.getFid())){
											BeanUtils.copyProperties(ccmlist,ccmList);
											isNew = false;
										}
									}
									if(isNew) {
										if(ccmListJson.containsKey("listLibName")) {
											ccmList.setName(ccmListJson.getString("listLibName"));
										}
										if(ccmListJson.containsKey("describe")) {
											ccmList.setDescription(ccmListJson.getString("describe"));
										}
										if(ccmListJson.containsKey("typeId")) {
											 String type = ccmListJson.getString("typeId");
											 if("2".equals(type)){
												 ccmList.setType("01");
											 }else if("3".equals(type)){
												 ccmList.setType("02");
											 }
										}
										ccmList.setIsupload("NO");
										save(ccmList);
									}else {
										if(ccmListJson.containsKey("listLibName")) {
											ccmList.setName(ccmListJson.getString("listLibName"));
										}
										if(ccmListJson.containsKey("describe")) {
											ccmList.setDescription(ccmListJson.getString("describe"));
										}
										if(ccmListJson.containsKey("typeId")) {
											String type = ccmListJson.getString("typeId");
											if("2".equals(type)){
												ccmList.setType("01");
											}else{
												ccmList.setType("02");
											}
										}
										ccmList.setUpdateBy(UserUtils.getUser());
										ccmList.setUpdateDate(new Date());
										ccmList.setIsupload("NO");
										save(ccmList);
									}
								}
							}
						}
					}
				}
				bool = true;
			}catch (Exception e) {
				e.printStackTrace();
				bool = true;
			}
			return bool;
		}
	}
}