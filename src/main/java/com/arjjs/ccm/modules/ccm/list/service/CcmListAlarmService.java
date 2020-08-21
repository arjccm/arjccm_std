/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.list.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.service.CrudService;
import com.arjjs.ccm.modules.ccm.list.entity.CcmListAlarm;
import com.arjjs.ccm.modules.ccm.list.dao.CcmListAlarmDao;

/**
 * 布控预警展示Service
 * @author cby
 * @version 2020-08-21
 */
@Service
@Transactional(readOnly = true)
public class CcmListAlarmService extends CrudService<CcmListAlarmDao, CcmListAlarm> {

	public CcmListAlarm get(String id) {
		return super.get(id);
	}
	
	public List<CcmListAlarm> findList(CcmListAlarm ccmListAlarm) {
		return super.findList(ccmListAlarm);
	}
	
	public Page<CcmListAlarm> findPage(Page<CcmListAlarm> page, CcmListAlarm ccmListAlarm) {
		return super.findPage(page, ccmListAlarm);
	}
	
	@Transactional(readOnly = false)
	public void save(CcmListAlarm ccmListAlarm) {
		super.save(ccmListAlarm);
	}
	
	@Transactional(readOnly = false)
	public void delete(CcmListAlarm ccmListAlarm) {
		super.delete(ccmListAlarm);
	}
	
}