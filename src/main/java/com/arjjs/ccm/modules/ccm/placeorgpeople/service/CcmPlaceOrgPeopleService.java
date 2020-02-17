/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.placeorgpeople.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.service.CrudService;
import com.arjjs.ccm.modules.ccm.placeorgpeople.entity.CcmPlaceOrgPeople;
import com.arjjs.ccm.modules.ccm.placeorgpeople.dao.CcmPlaceOrgPeopleDao;

/**
 * 从业人员中间表Service
 * @author cby
 * @version 2020-02-11
 */
@Service
@Transactional(readOnly = true)
public class CcmPlaceOrgPeopleService extends CrudService<CcmPlaceOrgPeopleDao, CcmPlaceOrgPeople> {

	public CcmPlaceOrgPeople get(String id) {
		return super.get(id);
	}
	
	public List<CcmPlaceOrgPeople> findList(CcmPlaceOrgPeople ccmPlaceOrgPeople) {
		return super.findList(ccmPlaceOrgPeople);
	}
	
	public Page<CcmPlaceOrgPeople> findPage(Page<CcmPlaceOrgPeople> page, CcmPlaceOrgPeople ccmPlaceOrgPeople) {
		return super.findPage(page, ccmPlaceOrgPeople);
	}
	
	@Transactional(readOnly = false)
	public void save(CcmPlaceOrgPeople ccmPlaceOrgPeople) {
		super.save(ccmPlaceOrgPeople);
	}
	
	@Transactional(readOnly = false)
	public void delete(CcmPlaceOrgPeople ccmPlaceOrgPeople) {
		super.delete(ccmPlaceOrgPeople);
	}
	
}