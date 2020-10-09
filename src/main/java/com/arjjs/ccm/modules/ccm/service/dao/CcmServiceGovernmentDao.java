/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.service.dao;

import com.arjjs.ccm.common.persistence.CrudDao;
import com.arjjs.ccm.common.persistence.annotation.MyBatisDao;
import com.arjjs.ccm.modules.ccm.service.entity.CcmServiceGovernment;

/**
 * 政务查询DAO接口
 * @author cby
 * @version 2020-09-30
 */
@MyBatisDao
public interface CcmServiceGovernmentDao extends CrudDao<CcmServiceGovernment> {
	
}