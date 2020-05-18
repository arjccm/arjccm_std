/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.ccmsys.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.service.CrudService;
import com.arjjs.ccm.modules.ccm.ccmsys.dao.CcmMobileDeviceDao;
import com.arjjs.ccm.modules.ccm.ccmsys.entity.CcmMobileDevice;
import com.arjjs.ccm.modules.ccm.fence.entity.CcmElectronicFence;
import com.arjjs.ccm.tool.Result;

import org.springframework.util.StringUtils;


/**
 * 移动设备管理Service
 * @author fu
 * @version 2018-04-20
 */
@Service
@Transactional(readOnly = true)
public class CcmMobileDeviceService extends CrudService<CcmMobileDeviceDao, CcmMobileDevice> {
	@Autowired
	private CcmMobileDeviceDao dao;


	public CcmMobileDevice get(String id) {
		return super.get(id);
	}
	
	public List<CcmMobileDevice> findList(CcmMobileDevice ccmMobileDevice) {
		return super.findList(ccmMobileDevice);
	}
	
	public Page<CcmMobileDevice> findPage(Page<CcmMobileDevice> page, CcmMobileDevice ccmMobileDevice) {
		return super.findPage(page, ccmMobileDevice);
	}
	
	@Transactional(readOnly = false)
	public void save(CcmMobileDevice ccmMobileDevice) {
		super.save(ccmMobileDevice);
	}
	
	@Transactional(readOnly = false)
	public void delete(CcmMobileDevice ccmMobileDevice) {
		super.delete(ccmMobileDevice);
	}

	public CcmMobileDevice findByDeviceId(String deviceId) {
		return dao.findByDeviceId(deviceId);
	}
	public CcmMobileDevice findByDeviceIdAndUserId(String deviceId,String userId) {
		return dao.findByDeviceIdAndUserId(deviceId, userId);
	}

	//App电子围栏
	@Transactional(readOnly = false)
	public boolean updateCoordinates(CcmMobileDevice ccmMobileDevice) {
		return dao.updateCoordinates(ccmMobileDevice) > 0;
	}
	
	//查询待上传的数据
	public List<CcmMobileDevice> findListApp(CcmMobileDevice ccmMobileDevice) {
		return dao.findListApp(ccmMobileDevice);
	}
	
	
	@Transactional(readOnly = false)
	public Result updateAppDevice(CcmElectronicFence ccmElectronicFence) {
		Result res = new Result();
//		if(StringUtils.isEmpty(ccmElectronicFence) ||  StringUtils.isEmpty(ccmElectronicFence.getMobileInfo())
//				|| StringUtils.isEmpty(ccmElectronicFence.getMobileInfo().getId())) {
//			res.setRet(res.ERROR_PARAM);
//			return res;
//		}
//		//获取原来的绑定id列表
//		CcmMobileDevice objectOld = findDeviceListByElecId(ccmElectronicFence.getId());
//		String[] deviceIdArrayOld = null;
//		if(!StringUtils.isEmpty(objectOld)) {//原来设置了
//			deviceIdArrayOld = objectOld.getId().split(",");
//		}
//		//获取新设置的id数组
//		String[] deviceIdArray = ccmElectronicFence.getMobileInfo().getId().split(",");
//		//数组比较，老的不在新的里面的id数组
//		String[] notInArray = notInArray(deviceIdArray,deviceIdArrayOld);
//		CcmMobileDevice object = null;
//		//将不在的置空
//		for(String id : notInArray) {
//			object = new CcmMobileDevice();
//			object.setId(id);//手机id
//			object.setElecFenceId("");//电子围栏id
//			dao.updateElecFenceId(object);
//		}
//		//更新新的绑定关系
//		for(String id : deviceIdArray) {
//			object = new CcmMobileDevice();
//			object.setId(id);//手机id
//			object.setElecFenceId(ccmElectronicFence.getId());//电子围栏id
//			dao.updateElecFenceId(object);
//		}
		return res;
	}
	
	/**
	 * @desc 根据电子围栏id获取关联的设备列表
	 * @param id
	 * @return
	 */
	@Transactional(readOnly = false)
	public CcmMobileDevice findDeviceListByElecId(String id) {
		List<CcmMobileDevice> list = dao.findDeviceListByElecId(id);
		CcmMobileDevice object = new CcmMobileDevice();
		String appId = "",deviceId = "";
		for(CcmMobileDevice item : list) {
			if(appId.equalsIgnoreCase("")) {
				appId = item.getId();
			}else {
				appId = appId + "," + item.getId();
			}
			if(deviceId.equalsIgnoreCase("")) {
				deviceId = item.getDeviceId();
			}else {
				deviceId = deviceId + "," + item.getDeviceId();
			}
		}
		object.setId(appId);
		object.setDeviceId(deviceId);
		return object;
	}
	
	
	public static String[] notInArray(String[] arr1,String[] arr2){
		String[] res = null;
		if(arr1 != arr2 && arr1.length > 0 && arr2.length > 0){
			Map<String,Object> map = new HashMap<String, Object>();
			List<String> list = new ArrayList<String>();
			for(int i = 0; i < arr1.length; i ++){
				map.put(arr1[i], i);
			}
			for(int i = 0; i < arr2.length; i ++){
				if(!map.containsKey(arr2[i])){
					list.add(arr2[i]);
				}
			}
			if(list.size() > 0){
				res = new String[list.size()];
				list.toArray(res);
				return res;
			}
		}
		return res;
	}
	
	@Transactional(readOnly = false)
	public Result delElecInfoByElecId(String id) {
		Result res = new Result();
		if("".equalsIgnoreCase(id)) {
			res.setRet(res.ERROR_PARAM);
			return res;
		}
		//先读取出设备idlist。然后置空
		CcmMobileDevice objectOld = findDeviceListByElecId(id);
		String[] deviceIdArrayOld = null;
		if(StringUtils.isEmpty(objectOld)) {//原来设置了
			return res;
		}
		deviceIdArrayOld = objectOld.getId().split(",");
		CcmMobileDevice object = null;
		CcmElectronicFence elec = null;
		for(String appId : deviceIdArrayOld) {
			object = new CcmMobileDevice();
			object.setId(appId);//手机id
			elec = new CcmElectronicFence();
			elec.setId("");
			object.setElecFenceInfo(elec);
			dao.updateElecFenceId(object);
		}
		return res;
	}
	
	@Transactional(readOnly = false)
	public CcmMobileDevice getElecFenceInfoByUid(CcmMobileDevice ccmMobileDevice) {
		
		return dao.findAppElecInfoById(ccmMobileDevice);
	}

	public String findByUserId(String userId) {
		return dao.findByUserId(userId);
	}
}