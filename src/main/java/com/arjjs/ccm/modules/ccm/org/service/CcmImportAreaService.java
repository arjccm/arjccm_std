/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.org.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.service.CrudService;
import com.arjjs.ccm.modules.ccm.org.entity.CcmImportArea;
import com.arjjs.ccm.modules.ccm.org.dao.CcmImportAreaDao;

/**
 * 重点区域Service
 * @author cby
 * @version 2021-01-18
 */
@Service
@Transactional(readOnly = true)
public class CcmImportAreaService extends CrudService<CcmImportAreaDao, CcmImportArea> {

	public CcmImportArea get(String id) {
		return super.get(id);
	}
	
	public List<CcmImportArea> findList(CcmImportArea ccmImportArea) {
		return super.findList(ccmImportArea);
	}
	
	public Page<CcmImportArea> findPage(Page<CcmImportArea> page, CcmImportArea ccmImportArea) {
		return super.findPage(page, ccmImportArea);
	}
	
	@Transactional(readOnly = false)
	public void save(CcmImportArea ccmImportArea) {
		super.save(ccmImportArea);
	}
	
	@Transactional(readOnly = false)
	public void delete(CcmImportArea ccmImportArea) {
		super.delete(ccmImportArea);
	}
	
}