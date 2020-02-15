/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.pop.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.service.CrudService;
import com.arjjs.ccm.modules.ccm.pop.entity.CcmPeopleAntiepidemic;
import com.arjjs.ccm.modules.ccm.pop.dao.CcmPeopleAntiepidemicDao;

/**
 * 人员疫情Service
 * @author yi
 * @version 2020-02-13
 */
@Service
@Transactional(readOnly = true)
public class CcmPeopleAntiepidemicService extends CrudService<CcmPeopleAntiepidemicDao, CcmPeopleAntiepidemic> {

	public CcmPeopleAntiepidemic get(String id) {
		return super.get(id);
	}
	
	public List<CcmPeopleAntiepidemic> findList(CcmPeopleAntiepidemic ccmPeopleAntiepidemic) {
		return super.findList(ccmPeopleAntiepidemic);
	}
	
	public Page<CcmPeopleAntiepidemic> findPage(Page<CcmPeopleAntiepidemic> page, CcmPeopleAntiepidemic ccmPeopleAntiepidemic) {
		return super.findPage(page, ccmPeopleAntiepidemic);
	}
	
	@Transactional(readOnly = false)
	public void save(CcmPeopleAntiepidemic ccmPeopleAntiepidemic) {
		super.save(ccmPeopleAntiepidemic);
	}
	
	@Transactional(readOnly = false)
	public void delete(CcmPeopleAntiepidemic ccmPeopleAntiepidemic) {
		super.delete(ccmPeopleAntiepidemic);
	}
	
}