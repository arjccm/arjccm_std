/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.iot.face.service;

import java.util.List;

import com.arjjs.ccm.common.utils.StringUtils;
import com.arjjs.ccm.modules.ccm.list.entity.CcmListUpload;
import com.arjjs.ccm.modules.ccm.list.service.CcmListUploadService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.service.CrudService;
import com.arjjs.ccm.modules.iot.face.entity.CcmFaceControl;
import com.arjjs.ccm.modules.iot.face.dao.CcmFaceControlDao;

/**
 * 人脸布控实体类Service
 * @author lgh
 * @version 2019-06-05
 */
@Service
@Transactional(readOnly = true)
public class CcmFaceControlService extends CrudService<CcmFaceControlDao, CcmFaceControl> {

	@Autowired
	private CcmFaceControlDao ccmFaceControlDao;
	@Autowired
	private CcmListUploadService ccmListUploadService;

	public CcmFaceControl get(String id) {
		return super.get(id);
	}
	
	public List<CcmFaceControl> findList(CcmFaceControl ccmFaceControl) {
		return super.findList(ccmFaceControl);
	}
	
	public Page<CcmFaceControl> findPage(Page<CcmFaceControl> page, CcmFaceControl ccmFaceControl) {
		return super.findPage(page, ccmFaceControl);
	}
	
	@Transactional(readOnly = false)
	public void save(CcmFaceControl ccmFaceControl) {
		if(StringUtils.isNotEmpty(ccmFaceControl.getId())){
			//布控没有修改，所以先撤控，再新增布控
			CcmFaceControl ccmFaceControldelete = new CcmFaceControl();
			BeanUtils.copyProperties(ccmFaceControl,ccmFaceControldelete);
			delete(ccmFaceControldelete);
			ccmFaceControl.setId(null);
		}
		super.save(ccmFaceControl);
		CcmListUpload upload = new CcmListUpload();
		upload.setTableName("ccm_face_control");
		upload.setUploadStatus("1");
		upload.setDataId(ccmFaceControl.getId());
		upload.setOperateType("1");
		upload.setRemarks("新增人脸布控数据数据：" + ccmFaceControl.getName());
		ccmListUploadService.save(upload);
	}
	
	@Transactional(readOnly = false)
	public void delete(CcmFaceControl ccmFaceControl) {
		CcmListUpload upload = new CcmListUpload();
		upload.setTableName("ccm_face_control");
		upload.setUploadStatus("1");
		upload.setDataId(ccmFaceControl.getId());
		upload.setOperateType("3");
		upload.setRemarks("撤除人脸布控数据数据：" + ccmFaceControl.getName());
		ccmListUploadService.save(upload);
		super.delete(ccmFaceControl);
	}

	@Transactional(readOnly = false)
	public void deleteByIdent(CcmFaceControl ccmFaceControl) {
		this.ccmFaceControlDao.deleteByIdent(ccmFaceControl);
	}
	
}