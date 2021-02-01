/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.publicity.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.service.CrudService;
import com.arjjs.ccm.modules.ccm.publicity.entity.CcmDeviceViewApproval;
import com.arjjs.ccm.modules.ccm.publicity.dao.CcmDeviceViewApprovalDao;

/**
 * 查看权限审批Service
 * @author cby
 * @version 2021-01-30
 */
@Service
@Transactional(readOnly = true)
public class CcmDeviceViewApprovalService extends CrudService<CcmDeviceViewApprovalDao, CcmDeviceViewApproval> {

	public CcmDeviceViewApproval get(String id) {
		return super.get(id);
	}
	
	public List<CcmDeviceViewApproval> findList(CcmDeviceViewApproval ccmDeviceViewApproval) {
		return super.findList(ccmDeviceViewApproval);
	}
	
	public Page<CcmDeviceViewApproval> findPage(Page<CcmDeviceViewApproval> page, CcmDeviceViewApproval ccmDeviceViewApproval) {
		return super.findPage(page, ccmDeviceViewApproval);
	}
	
	@Transactional(readOnly = false)
	public void save(CcmDeviceViewApproval ccmDeviceViewApproval) {
		super.save(ccmDeviceViewApproval);
	}
	
	@Transactional(readOnly = false)
	public void delete(CcmDeviceViewApproval ccmDeviceViewApproval) {
		super.delete(ccmDeviceViewApproval);
	}
	
}