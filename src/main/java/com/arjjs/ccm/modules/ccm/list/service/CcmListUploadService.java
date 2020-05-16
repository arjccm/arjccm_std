/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.list.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.service.CrudService;
import com.arjjs.ccm.modules.ccm.list.entity.CcmListUpload;
import com.arjjs.ccm.modules.ccm.list.dao.CcmListUploadDao;

/**
 * 人脸对接上传记录Service
 * @author cby
 * @version 2020-05-08
 */
@Service
@Transactional(readOnly = true)
public class CcmListUploadService extends CrudService<CcmListUploadDao, CcmListUpload> {

	public CcmListUpload get(String id) {
		return super.get(id);
	}
	
	public List<CcmListUpload> findList(CcmListUpload ccmListUpload) {
		return super.findList(ccmListUpload);
	}
	
	public Page<CcmListUpload> findPage(Page<CcmListUpload> page, CcmListUpload ccmListUpload) {
		return super.findPage(page, ccmListUpload);
	}
	
	@Transactional(readOnly = false)
	public void save(CcmListUpload ccmListUpload) {
		super.save(ccmListUpload);
	}
	
	@Transactional(readOnly = false)
	public void delete(CcmListUpload ccmListUpload) {
		super.delete(ccmListUpload);
	}
	
}