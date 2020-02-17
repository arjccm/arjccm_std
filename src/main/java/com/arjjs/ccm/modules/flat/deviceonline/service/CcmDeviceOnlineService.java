/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.flat.deviceonline.service;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import com.arjjs.ccm.modules.flat.deviceonline.entity.CcmUserOnline;
import com.arjjs.ccm.modules.sys.entity.User;
import com.arjjs.ccm.modules.sys.service.SystemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.service.CrudService;
import com.arjjs.ccm.modules.flat.deviceonline.dao.CcmDeviceOnlineDao;
import com.arjjs.ccm.modules.flat.deviceonline.entity.CcmDeviceOnline;

/**
 * 设备在线实体类Service
 * @author lgh
 * @version 2019-07-13
 */
@Service
@Transactional(readOnly = true)
public class CcmDeviceOnlineService extends CrudService<CcmDeviceOnlineDao, CcmDeviceOnline> {

	@Autowired
	private CcmDeviceOnlineDao ccmDeviceOnlineDao;

	private static List<User> user;

	@Autowired
	private SystemService systemService;
	public CcmDeviceOnline getByDeviceId(String deviceId) {
		return ccmDeviceOnlineDao.getByDeviceId(deviceId);
	}

	public CcmDeviceOnline get(String id) {
		return super.get(id);
	}
	
	public List<CcmDeviceOnline> findList(CcmDeviceOnline ccmDeviceOnline) {
		return super.findList(ccmDeviceOnline);
	}
	
	public Page<CcmDeviceOnline> findPage(Page<CcmDeviceOnline> page, CcmDeviceOnline ccmDeviceOnline) {
		return super.findPage(page, ccmDeviceOnline);
	}
	
	@Transactional(readOnly = false)
	public void save(CcmDeviceOnline ccmDeviceOnline) {
		super.save(ccmDeviceOnline);
	}
	
	@Transactional(readOnly = false)
	public void delete(CcmDeviceOnline ccmDeviceOnline) {
		super.delete(ccmDeviceOnline);
	}

	public List<CcmUserOnline> getOnlineUser(){
		if(user==null){
			user = systemService.findUser(new User());
		}

		List<String> collect = user.stream().map(item -> item.getId()).collect(Collectors.toList());

		List<CcmUserOnline> appOnlineUser = ccmDeviceOnlineDao.getAppOnlineUser(collect);
		return appOnlineUser;
	}
	
}