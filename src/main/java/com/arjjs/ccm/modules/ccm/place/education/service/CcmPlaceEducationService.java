/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.place.education.service;

import java.util.List;

import com.arjjs.ccm.modules.ccm.place.education.dao.CcmPlaceEducationDao;
import com.arjjs.ccm.modules.ccm.place.education.entity.CcmPlaceEducation;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.service.CrudService;

/**
 * 文化教育场所Service
 * @author ljd
 * @version 2019-04-26
 */
@Service
@Transactional(readOnly = true)
public class CcmPlaceEducationService extends CrudService<CcmPlaceEducationDao, CcmPlaceEducation> {

	public CcmPlaceEducation get(String id) {
		return super.get(id);
	}
	
	public CcmPlaceEducation get2(String basePlaceId) {
		return super.get(basePlaceId);
	}
	
	public List<CcmPlaceEducation> findList(CcmPlaceEducation ccmPlaceEducation) {
		return super.findList(ccmPlaceEducation);
	}
	
	public Page<CcmPlaceEducation> findPage(Page<CcmPlaceEducation> page, CcmPlaceEducation ccmPlaceEducation) {
		return super.findPage(page, ccmPlaceEducation);
	}
	
	@Transactional(readOnly = false)
	public void save(CcmPlaceEducation ccmPlaceEducation) {
		super.save(ccmPlaceEducation);
	}
	
	@Transactional(readOnly = false)
	public void delete(CcmPlaceEducation ccmPlaceEducation) {
		super.delete(ccmPlaceEducation);
	}
	
}