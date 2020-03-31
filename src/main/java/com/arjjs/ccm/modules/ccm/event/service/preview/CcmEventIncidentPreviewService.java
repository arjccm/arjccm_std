/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.event.service.preview;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import com.arjjs.ccm.modules.sys.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.service.CrudService;
import com.arjjs.ccm.modules.ccm.event.dao.preview.CcmEventIncidentPreviewDao;
import com.arjjs.ccm.modules.ccm.event.entity.preview.CcmEventIncidentPreview;

/**
 * 事件预处理Service
 * @author lgh
 * @version 2019-05-06
 */
@Service
@Transactional(readOnly = true)
public class CcmEventIncidentPreviewService extends CrudService<CcmEventIncidentPreviewDao, CcmEventIncidentPreview> {

	@Autowired
	private CcmEventIncidentPreviewDao dao;

	public CcmEventIncidentPreview get(String id) {
		return super.get(id);
	}
	
	public List<CcmEventIncidentPreview> findList(CcmEventIncidentPreview ccmEventIncidentPreview) {
		return super.findList(ccmEventIncidentPreview);
	}
	
	public Page<CcmEventIncidentPreview> findPage(Page<CcmEventIncidentPreview> page, CcmEventIncidentPreview ccmEventIncidentPreview) {
		return super.findPage(page, ccmEventIncidentPreview);
	}
	
	@Transactional(readOnly = false)
	public void save(CcmEventIncidentPreview ccmEventIncidentPreview, User user) {
		boolean isNew = false;
		if (ccmEventIncidentPreview.getId() == null || "".equals(ccmEventIncidentPreview.getId())) {//无主键ID，则是新记录
			isNew = true;
			String id = UUID.randomUUID().toString();
			ccmEventIncidentPreview.setId(id);
			ccmEventIncidentPreview.setCreateBy(user);
			ccmEventIncidentPreview.setCreateDate(new Date());
			ccmEventIncidentPreview.setUpdateBy(user);
			ccmEventIncidentPreview.setUpdateDate(new Date());
			ccmEventIncidentPreview.setDelFlag("0");
			dao.insert(ccmEventIncidentPreview);
		} else {
			super.save(ccmEventIncidentPreview);
		}
	}
	
	@Transactional(readOnly = false)
	public void delete(CcmEventIncidentPreview ccmEventIncidentPreview) {
		super.delete(ccmEventIncidentPreview);
	}
	
}