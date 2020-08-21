/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.list.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.arjjs.ccm.common.utils.StringUtils;
import com.arjjs.ccm.modules.ccm.list.dao.CcmListDao;
import com.arjjs.ccm.modules.ccm.list.entity.CcmList;
import com.arjjs.ccm.modules.ccm.list.entity.CcmListUpload;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestResult;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestType;
import com.arjjs.ccm.modules.ccm.sys.entity.SysConfig;
import com.arjjs.ccm.modules.ccm.sys.service.SysConfigService;
import com.arjjs.ccm.modules.pbs.sys.utils.UserUtils;
import com.hikvision.artemis.sdk.ArtemisHttpUtil;
import com.hikvision.artemis.sdk.config.ArtemisConfig;
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
import com.arjjs.ccm.modules.ccm.list.entity.CcmListPeople;
import com.arjjs.ccm.modules.ccm.list.dao.CcmListPeopleDao;

/**
 * 静态库和黑名单人员实体类Service
 * @author jpy
 * @version 2019-06-05
 */
@Service
@Transactional(readOnly = true)
public class CcmListPeopleService extends CrudService<CcmListPeopleDao, CcmListPeople> {

	@Autowired
	private SysConfigService sysConfigService;
	@Autowired
	private CcmListPeopleDao ccmListPeopleDao;
	@Autowired
	private CcmListDao ccmListDao;
	@Autowired
	private CcmListUploadService ccmListUploadService;

	private static String getType = "";

	private static boolean isStopThread = true;

	/**
	 * 能力开放平台的网站路径
	 * TODO 路径不用修改，就是/artemis
	 */
	private static final String ARTEMIS_PATH = "/artemis";

	private static final String URL_BLACK_PATH = "/api/fms/v2/blacklist/findRecord";
	private static final String URL_STATIC_PATH = "/api/fms/v2/staticlist/findRecord";

	public CcmListPeople get(String id) {
		return super.get(id);
	}

	public List<CcmListPeople> findList(CcmListPeople ccmListPeople) {
		return super.findList(ccmListPeople);
	}

	public Page<CcmListPeople> findPage(Page<CcmListPeople> page, CcmListPeople ccmListPeople) {
		return super.findPage(page, ccmListPeople);
	}

	@Transactional(readOnly = false)
	public void save(CcmListPeople ccmListPeople) {
		if("NO".equals(ccmListPeople.getIsupload())){
			super.save(ccmListPeople);
		}else{
			CcmListUpload upload = new CcmListUpload();
			upload.setTableName("ccm_list_people");
			upload.setUploadStatus("1");
			if(StringUtils.isNotEmpty(ccmListPeople.getId()) && StringUtils.isNotEmpty(ccmListPeople.getFid())){
				upload.setDataId(ccmListPeople.getId());
				upload.setOperateType("2");
				upload.setRemarks("编辑名单库人员数据：" + ccmListPeople.getName());
				ccmListUploadService.save(upload);
				super.save(ccmListPeople);
			}else{
				super.save(ccmListPeople);
				upload.setDataId(ccmListPeople.getId());
				upload.setOperateType("1");
				upload.setRemarks("新增名单库人员数据：" + ccmListPeople.getName());
				ccmListUploadService.save(upload);
			}
		}
	}

	@Transactional(readOnly = false)
	public void delete(CcmListPeople ccmListPeople) {
		CcmListUpload upload = new CcmListUpload();
		upload.setTableName("ccm_list_people");
		upload.setUploadStatus("1");
		upload.setDataId(ccmListPeople.getId());
		upload.setOperateType("3");
		upload.setRemarks("删除名单库人员数据："+ccmListPeople.getName());
		ccmListUploadService.save(upload);
		super.delete(ccmListPeople);
	}

	public CcmRestResult getCcmListPeople(CcmListPeople ccmListPeople) {
		getType = ccmListPeople.getType();
		CcmRestResult result = new CcmRestResult();
		SysConfig sysConfig = sysConfigService.get("face_docking_config");
		//解JSON
		JSONObject jsonObject = JSONObject.parseObject(sysConfig.getParamStr());
		String apiUrl = null;
		if(jsonObject.containsKey("apiUrl")) {
			apiUrl = jsonObject.getString("apiUrl");
		}
		String appKey = null;
		if(jsonObject.containsKey("appKey")) {
			appKey = jsonObject.getString("appKey");
		}
		String appSecet = null;
		if(jsonObject.containsKey("appSecet")) {
			appSecet = jsonObject.getString("appSecet");
		}
		if(StringUtils.isNotEmpty(apiUrl) && StringUtils.isNotEmpty(appKey) && StringUtils.isNotEmpty(appSecet)) {
			if(isStopThread) {
				CcmListPeopleService.getCcmListPeopleThread getCcmListPeopleThread = new CcmListPeopleService.getCcmListPeopleThread();
				getCcmListPeopleThread.start();
			}
			result.setCode(CcmRestType.OK);
			result.setResult(null);
		}else {
			result.setCode(CcmRestType.ERROR_PARAM);
			result.setResult(null);
		}
		return result;
	}



	class getCcmListPeopleThread extends Thread {
		public void run() {
			isStopThread = false;
			SysConfig sysConfig = sysConfigService.get("face_docking_config");
			//解JSON
			JSONObject jsonObject = JSONObject.parseObject(sysConfig.getParamStr());
			String apiUrl = jsonObject.getString("apiUrl");
			String appKey = jsonObject.getString("appKey");
			String appSecet = jsonObject.getString("appSecet");
			CcmList ccmList = new CcmList();
			if("01".equals(getType)){
				ccmList.setType(getType);
			}
			int i = 0;
			boolean bool = false;
			List<CcmList> list = ccmListDao.findList(ccmList);
			try {
				if("01".equals(getType)){
					if(list.size()>0){
						for(int j = 0; j<list.size() ; j++){
							bool = false;
							i = 0;
							while (!bool) {
								int num = i+1;
								bool = this.getBlackCcmListPeopleByUrl(apiUrl,appKey,appSecet,String.valueOf(num),list.get(j).getFid());
								i++;
							}
						}
					}
				}else{
					while (!bool) {
						int num = i+1;
						bool = this.getStaticCcmListPeopleByUrl(apiUrl,appKey,appSecet,String.valueOf(num));
						i++;
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				System.out.println("获取名单人员结束");
				isStopThread = true;
			}
		}

		public boolean getStaticCcmListPeopleByUrl(String apiUrl,String appKey,String appSecet,String page) {
			boolean bool = false;
			ArtemisConfig.host = apiUrl; // 代理API网关nginx服务器ip端口
			ArtemisConfig.appKey = appKey;  // 秘钥appkey
			ArtemisConfig.appSecret = appSecet;// 秘钥appSecret
			final String getCamsApi = ARTEMIS_PATH + URL_STATIC_PATH;
			Map<String,String> querys = new HashMap<String,String>();//get请求的查询参数
			querys.put("start", page);
			querys.put("size", String.valueOf(20));
			Map<String, String> path = new HashMap<String, String>(2){
				{
					put("https://", getCamsApi);
				}
			};
			try {
				System.out.println(" ===== >>> " + JSONObject.toJSONString(querys));
				String result = ArtemisHttpUtil.doGetArtemis(path, querys,null,null,null);
				System.out.println(" ===== >>> " + result);
				JSONObject resJson = JSONObject.parseObject(result);
				if(resJson.containsKey("data") && StringUtils.isNotBlank(resJson.getString("data"))) {
					JSONArray listJson = JSONArray.parseArray(resJson.getString("data"));
					if (listJson.size() > 0) {
						CcmListPeople people = new CcmListPeople();
						people.setType("02");
						List<CcmListPeople> list = findList(people);
						for (int i = 0; i < listJson.size(); i++) {
							JSONObject ccmListPeopleJson = listJson.getJSONObject(i);
							String fid = null;
							if(ccmListPeopleJson.containsKey("humanId")) {
								fid = ccmListPeopleJson.getString("humanId");
							}
							if(StringUtils.isNotBlank(fid)) {
								CcmListPeople ccmListPeople = new CcmListPeople();
								ccmListPeople.setFid(fid);
								boolean isNew = true;
								for (CcmListPeople ccmlistpeople:list) {
									if(fid.equals(ccmlistpeople.getFid())){
										BeanUtils.copyProperties(ccmlistpeople,ccmListPeople);
										isNew = false;
									}
								}
								ccmListPeople.setIsupload("NO");
								if(ccmListPeopleJson.containsKey("humanAddress")) {
									ccmListPeople.setRemarks(ccmListPeopleJson.getString("humanAddress"));
								}
								if(ccmListPeopleJson.containsKey("credentialsNum")) {
									ccmListPeople.setPapersNumber(ccmListPeopleJson.getString("credentialsNum"));
								}
								if(ccmListPeopleJson.containsKey("facePicUrl")) {
									ccmListPeople.setImg(ccmListPeopleJson.getString("facePicUrl"));
								}
								if(ccmListPeopleJson.containsKey("humanName")) {
									ccmListPeople.setName(ccmListPeopleJson.getString("humanName"));
								}
								if(ccmListPeopleJson.containsKey("credentialsType")) {
									ccmListPeople.setName(ccmListPeopleJson.getString("credentialsType"));
								}
								if(ccmListPeopleJson.containsKey("sex")) {
									if("1".equals(ccmListPeopleJson.getString("sex"))){
										ccmListPeople.setSex("0");
									}else if("2".equals(ccmListPeopleJson.getString("sex"))){
										ccmListPeople.setSex("1");
									}else{
										ccmListPeople.setSex("9");
									}
								}
								if(ccmListPeopleJson.containsKey("listLibId")) {
									String listId = "";
									String[] staticIds = ccmListPeopleJson.getString("listLibId").split(",");
									for (String staticId:staticIds) {
										if(StringUtils.isNotEmpty(staticId)){
											CcmList giveFid = new CcmList();
											giveFid.setFid(staticId);
											CcmList ccmList = ccmListDao.getByFid(giveFid);
											if(StringUtils.isNotEmpty(ccmList.getId())){
												listId = listId + ccmList.getId() + ",";
											}
										}
									}
									ccmListPeople.setListId(listId);
								}
								if(!isNew) {
									ccmListPeople.setUpdateBy(UserUtils.getUser());
									ccmListPeople.setUpdateDate(new Date());
								}
								save(ccmListPeople);
								if(isNew){
									list.add(ccmListPeople);
								}
							}
						}
					}else {
						bool = true;
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

		public boolean getBlackCcmListPeopleByUrl(String apiUrl,String appKey,String appSecet,String page, String ids) {
			boolean bool = false;
			ArtemisConfig.host = apiUrl; // 代理API网关nginx服务器ip端口
			ArtemisConfig.appKey = appKey;  // 秘钥appkey
			ArtemisConfig.appSecret = appSecet;// 秘钥appSecret
			final String getCamsApi = ARTEMIS_PATH + URL_BLACK_PATH;
			Map<String,String> querys = new HashMap<String,String>();//get请求的查询参数
			querys.put("start", page);
			querys.put("size", String.valueOf(20));
			querys.put("listLibIds", ids);
			Map<String, String> path = new HashMap<String, String>(2){
				{
					put("https://", getCamsApi);
				}
			};
			try {
				System.out.println(" ===== >>> " + JSONObject.toJSONString(querys));
				String result = ArtemisHttpUtil.doGetArtemis(path, querys,null,null,null);
				System.out.println(" ===== >>> " + result);
				JSONObject resJson = JSONObject.parseObject(result);
				if(resJson.containsKey("data") && StringUtils.isNotBlank(resJson.getString("data"))) {
					JSONArray listJson = JSONArray.parseArray(resJson.getString("data"));
					if (listJson.size() > 0) {
						CcmListPeople people = new CcmListPeople();
						people.setType("01");
						List<CcmListPeople> list = findList(people);
						for (int i = 0; i < listJson.size(); i++) {
							JSONObject ccmListBlackJson = listJson.getJSONObject(i);
							String fid = null;
							if(ccmListBlackJson.containsKey("humanId")) {
								fid = ccmListBlackJson.getString("humanId");
							}
							if(StringUtils.isNotBlank(fid)) {
								CcmListPeople ccmListPeople = new CcmListPeople();
								ccmListPeople.setFid(fid);
								boolean isNew = true;
								for (CcmListPeople ccmlistpeople:list) {
									if(fid.equals(ccmlistpeople.getFid())){
										BeanUtils.copyProperties(ccmlistpeople,ccmListPeople);
										isNew = false;
									}
								}
								if(ccmListBlackJson.containsKey("credentialsNum")) {
									ccmListPeople.setPapersNumber(ccmListBlackJson.getString("credentialsNum"));
								}
								if(ccmListBlackJson.containsKey("facePicUrl")) {
									ccmListPeople.setImg(ccmListBlackJson.getString("facePicUrl"));
								}
								if(ccmListBlackJson.containsKey("sex")) {
									if("1".equals(ccmListBlackJson.getString("sex"))){
										ccmListPeople.setSex("0");
									}else if("2".equals(ccmListBlackJson.getString("sex"))){
										ccmListPeople.setSex("1");
									}else{
										ccmListPeople.setSex("9");
									}
								}
								if(ccmListBlackJson.containsKey("credentialsType")) {
									ccmListPeople.setName(ccmListBlackJson.getString("credentialsType"));
								}
								if(ccmListBlackJson.containsKey("listLibId")) {
									String listId = "";
									String[] blackIds = ccmListBlackJson.getString("listLibId").split(",");
									for (String blackId:blackIds) {
										if(StringUtils.isNotEmpty(blackId)){
											CcmList giveFid = new CcmList();
											giveFid.setFid(blackId);
											CcmList ccmList = ccmListDao.getByFid(giveFid);
											if(StringUtils.isNotEmpty(ccmList.getId())){
												listId = listId + ccmList.getId() + ",";
											}
										}
									}
									ccmListPeople.setListId(listId);
								}
								if(ccmListBlackJson.containsKey("humanName")) {
									ccmListPeople.setName(ccmListBlackJson.getString("humanName"));
								}
								ccmListPeople.setIsupload("NO");
								if(!isNew) {
									ccmListPeople.setUpdateBy(UserUtils.getUser());
									ccmListPeople.setUpdateDate(new Date());
								}
								save(ccmListPeople);
								if(isNew){
									list.add(ccmListPeople);
								}
							}
						}
					}else{
						bool = true;
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