/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.service.service;

import java.util.List;

import com.arjjs.ccm.common.utils.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.service.CrudService;
import com.arjjs.ccm.modules.ccm.service.entity.CcmServiceGovernment;
import com.arjjs.ccm.modules.ccm.service.dao.CcmServiceGovernmentDao;

/**
 * 政务查询Service
 * @author cby
 * @version 2020-09-30
 */
@Service
@Transactional(readOnly = true)
public class CcmServiceGovernmentService extends CrudService<CcmServiceGovernmentDao, CcmServiceGovernment> {

	public CcmServiceGovernment get(String id) {
		return super.get(id);
	}
	
	public List<CcmServiceGovernment> findList(CcmServiceGovernment ccmServiceGovernment) {
		if(StringUtils.isNotEmpty(ccmServiceGovernment.getTitle())){
			ccmServiceGovernment.setTitle("%"+ccmServiceGovernment.getTitle()+"%");
		}
		if(StringUtils.isNotEmpty(ccmServiceGovernment.getContent())){
			ccmServiceGovernment.setContent("%"+ccmServiceGovernment.getContent()+"%");
		}
		if(StringUtils.isNotEmpty(ccmServiceGovernment.getDept())){
			ccmServiceGovernment.setDept("%"+ccmServiceGovernment.getDept()+"%");
		}
		return super.findList(ccmServiceGovernment);
	}
	
	public Page<CcmServiceGovernment> findPage(Page<CcmServiceGovernment> page, CcmServiceGovernment ccmServiceGovernment) {
		if(StringUtils.isNotEmpty(ccmServiceGovernment.getTitle())){
			ccmServiceGovernment.setTitle("%"+ccmServiceGovernment.getTitle()+"%");
		}
		if(StringUtils.isNotEmpty(ccmServiceGovernment.getContent())){
			ccmServiceGovernment.setContent("%"+ccmServiceGovernment.getContent()+"%");
		}
		if(StringUtils.isNotEmpty(ccmServiceGovernment.getDept())){
			ccmServiceGovernment.setDept("%"+ccmServiceGovernment.getDept()+"%");
		}
		return super.findPage(page, ccmServiceGovernment);
	}
	
	@Transactional(readOnly = false)
	public void save(CcmServiceGovernment ccmServiceGovernment) {
		super.save(ccmServiceGovernment);
	}
	
	@Transactional(readOnly = false)
	public void delete(CcmServiceGovernment ccmServiceGovernment) {
		super.delete(ccmServiceGovernment);
	}
	
}