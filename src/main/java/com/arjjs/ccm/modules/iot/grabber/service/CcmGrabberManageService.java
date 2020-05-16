/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.iot.grabber.service;

import java.util.Date;
import java.util.List;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.arjjs.ccm.common.utils.StringUtils;
import com.arjjs.ccm.modules.ccm.list.entity.CcmListUpload;
import com.arjjs.ccm.modules.ccm.list.service.CcmListUploadService;
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
import com.arjjs.ccm.modules.iot.grabber.entity.CcmGrabberManage;
import com.arjjs.ccm.modules.iot.grabber.dao.CcmGrabberManageDao;

/**
 * 抓拍机管理Service
 * @author cby
 * @version 2019-07-25
 */
@Service
@Transactional(readOnly = true)
public class CcmGrabberManageService extends CrudService<CcmGrabberManageDao, CcmGrabberManage> {

	@Autowired
	private CcmGrabberManageDao ccmGrabberManageDao;
	@Autowired
	private SysConfigService sysConfigService;
	@Autowired
	private CcmListUploadService ccmListUploadService;

	@Transactional(readOnly = false)
	public void updateState(CcmGrabberManage ccmGrabberManage) {
		ccmGrabberManageDao.updateState(ccmGrabberManage);
	}
	
	public CcmGrabberManage get(String id) {
		return super.get(id);
	}
	
	public List<CcmGrabberManage> findList(CcmGrabberManage ccmGrabberManage) {
		return super.findList(ccmGrabberManage);
	}
	
	public Page<CcmGrabberManage> findPage(Page<CcmGrabberManage> page, CcmGrabberManage ccmGrabberManage) {
		return super.findPage(page, ccmGrabberManage);
	}
	
	@Transactional(readOnly = false)
	public void save(CcmGrabberManage ccmGrabberManage) {
		if("NO".equals(ccmGrabberManage.getIsupload())){
			super.save(ccmGrabberManage);
		}else{
			CcmListUpload upload = new CcmListUpload();
			upload.setTableName("ccm_grabber_manage");
			upload.setUploadStatus("1");
			if(StringUtils.isNotEmpty(ccmGrabberManage.getId())){
				upload.setDataId(ccmGrabberManage.getId());
				upload.setOperateType("2");
				upload.setRemarks("编辑抓拍机数据：" + ccmGrabberManage.getGrabberName());
				ccmListUploadService.save(upload);
				super.save(ccmGrabberManage);
			}else{
				super.save(ccmGrabberManage);
				upload.setDataId(ccmGrabberManage.getId());
				upload.setOperateType("1");
				upload.setRemarks("新增抓拍机数据：" + ccmGrabberManage.getGrabberName());
				ccmListUploadService.save(upload);
			}
		}
	}
	
	@Transactional(readOnly = false)
	public void delete(CcmGrabberManage ccmGrabberManage) {
		CcmListUpload upload = new CcmListUpload();
		upload.setTableName("ccm_grabber_manage");
		upload.setUploadStatus("1");
		upload.setDataId(ccmGrabberManage.getId());
		upload.setOperateType("3");
		upload.setRemarks("删除抓拍机数据：" + ccmGrabberManage.getGrabberName());
		ccmListUploadService.save(upload);
		super.delete(ccmGrabberManage);
	}

	public int getCount(CcmGrabberManage ccmGrabberManage) {
		return ccmGrabberManageDao.getCount(ccmGrabberManage);
	}

	public CcmRestResult getGrabberList() {
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
				CcmGrabberManageService.getGrabberListThread getGrabberListThread = new CcmGrabberManageService.getGrabberListThread();
				getGrabberListThread.start();
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

	private static final String URL_PATH = "/api/fms/v2/resource/findCamera";


	class getGrabberListThread extends Thread {
		public void run() {
			isStopThread = false;
			SysConfig sysConfig = sysConfigService.get("face_docking_config");
			//解JSON
			JSONObject jsonObject = JSONObject.parseObject(sysConfig.getParamStr());
			String url = jsonObject.getString("url");
			StringBuffer buffer = new StringBuffer();
			buffer.append(url);
			buffer.append(URL_PATH);
			int i = 0;
			boolean bool = false;
			try {
				while (!bool) {
					int num = i+1;
					bool = this.getStaticCcmListPeopleByUrl(buffer.toString() + "?pageNo="+num+"&pageSize=10");
					i++;
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				System.out.println("获取名单人员结束");
				isStopThread = true;
			}
		}

		public boolean getStaticCcmListPeopleByUrl(String url) {
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
							List<CcmGrabberManage> list = ccmGrabberManageDao.findList(new CcmGrabberManage());
							for (int i = 0; i < listJson.size(); i++) {
								JSONObject grabberJson = listJson.getJSONObject(i);
								String code = null;
								if(grabberJson.containsKey("deviceCode")) {
									code = grabberJson.getString("deviceCode");
								}
								if(StringUtils.isNotBlank(code)) {
									CcmGrabberManage grabber = new CcmGrabberManage();
									grabber.setGrabberNum(code);
									boolean isNew = true;
									for (CcmGrabberManage ccmGrabberManage:list) {
										if(code.equals(ccmGrabberManage.getGrabberNum())){
											BeanUtils.copyProperties(ccmGrabberManage,grabber);
											isNew = false;
										}
									}
									if(grabberJson.containsKey("cameraIp")) {
										grabber.setGrabberIp(grabberJson.getString("cameraIp"));
									}
									if(grabberJson.containsKey("cameraName")) {
										grabber.setGrabberName(grabberJson.getString("cameraName"));
									}
									if(grabberJson.containsKey("cameraPort")) {
										grabber.setGrabberPort(grabberJson.getString("cameraPort"));
									}
									if(grabberJson.containsKey("cameraType")) {
										grabber.setGrabberType(grabberJson.getString("cameraType"));
									}
									if(grabberJson.containsKey("channelNo")) {
										grabber.setGrabberPassway(grabberJson.getString("channelNo"));
									}
									if(grabberJson.containsKey("indexCode")) {
										grabber.setResourcesNum(grabberJson.getString("indexCode"));
									}
									if(grabberJson.containsKey("latitude")) {
										grabber.setGrabberLatitude(grabberJson.getString("latitude"));
									}
									if(grabberJson.containsKey("longitude")) {
										grabber.setGrabberLongitude(grabberJson.getString("longitude"));
									}
									if(grabberJson.containsKey("password")) {
										grabber.setPassword(grabberJson.getString("password"));
									}
									if(grabberJson.containsKey("regionId")) {
										grabber.setRemarks(grabberJson.getString("regionId"));
									}
									if(grabberJson.containsKey("userName")) {
										grabber.setUsername(grabberJson.getString("userName"));
									}
									if(grabberJson.containsKey("relationPoint")) {
										grabber.setMonitorNum(grabberJson.getString("relationPoint"));
									}
									grabber.setIsupload("NO");
									if(!isNew) {
										grabber.setUpdateBy(UserUtils.getUser());
										grabber.setUpdateDate(new Date());
									}else{

									}
									save(grabber);
								}
							}
						}else {
							bool = true;
						}
					}
				}else {
					bool = true;
				}
			}catch (Exception e) {
				e.printStackTrace();
				bool = true;
			}
			return bool;
		}
	}
}