/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.pop.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.service.CrudService;
import com.arjjs.ccm.modules.ccm.pop.entity.CcmPopCar;
import com.arjjs.ccm.modules.ccm.pop.dao.CcmPopCarDao;

/**
 * 车辆管理Service
 * @author cby
 * @version 2020-12-22
 */
@Service
@Transactional(readOnly = true)
public class CcmPopCarService extends CrudService<CcmPopCarDao, CcmPopCar> {

	public CcmPopCar get(String id) {
		return super.get(id);
	}
	
	public List<CcmPopCar> findList(CcmPopCar ccmPopCar) {
		return super.findList(ccmPopCar);
	}
	
	public Page<CcmPopCar> findPage(Page<CcmPopCar> page, CcmPopCar ccmPopCar) {
		return super.findPage(page, ccmPopCar);
	}
	
	@Transactional(readOnly = false)
	public void save(CcmPopCar ccmPopCar) {
		super.save(ccmPopCar);
	}
	
	@Transactional(readOnly = false)
	public void delete(CcmPopCar ccmPopCar) {
		super.delete(ccmPopCar);
	}
	
}