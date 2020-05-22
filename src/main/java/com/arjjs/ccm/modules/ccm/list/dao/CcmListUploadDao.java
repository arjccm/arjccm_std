/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.list.dao;

import com.arjjs.ccm.common.persistence.CrudDao;
import com.arjjs.ccm.common.persistence.annotation.MyBatisDao;
import com.arjjs.ccm.modules.ccm.list.entity.CcmListUpload;

/**
 * 人脸对接上传记录DAO接口
 * @author cby
 * @version 2020-05-08
 */
@MyBatisDao
public interface CcmListUploadDao extends CrudDao<CcmListUpload> {
	
}