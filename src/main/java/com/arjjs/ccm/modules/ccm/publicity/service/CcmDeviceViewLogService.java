/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.publicity.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.service.CrudService;
import com.arjjs.ccm.modules.ccm.publicity.entity.CcmDeviceViewLog;
import com.arjjs.ccm.modules.ccm.publicity.dao.CcmDeviceViewLogDao;

/**
 * 历史查看管理Service
 * @author cby
 * @version 2021-01-30
 */
@Service
@Transactional(readOnly = true)
public class CcmDeviceViewLogService extends CrudService<CcmDeviceViewLogDao, CcmDeviceViewLog> {

	public CcmDeviceViewLog get(String id) {
		return super.get(id);
	}
	
	public List<CcmDeviceViewLog> findList(CcmDeviceViewLog ccmDeviceViewLog) {
		return super.findList(ccmDeviceViewLog);
	}
	
	public Page<CcmDeviceViewLog> findPage(Page<CcmDeviceViewLog> page, CcmDeviceViewLog ccmDeviceViewLog) {
		return super.findPage(page, ccmDeviceViewLog);
	}
	
	@Transactional(readOnly = false)
	public void save(CcmDeviceViewLog ccmDeviceViewLog) {
		super.save(ccmDeviceViewLog);
	}
	
	@Transactional(readOnly = false)
	public void delete(CcmDeviceViewLog ccmDeviceViewLog) {
		super.delete(ccmDeviceViewLog);
	}
	
}