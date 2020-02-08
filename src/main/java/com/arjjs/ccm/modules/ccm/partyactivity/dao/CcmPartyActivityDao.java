/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.partyactivity.dao;

import com.arjjs.ccm.common.persistence.CrudDao;
import com.arjjs.ccm.common.persistence.annotation.MyBatisDao;
import com.arjjs.ccm.modules.ccm.partyactivity.entity.CcmPartyActivity;

/**
 * 党员活动管理DAO接口
 * @author maoxb
 * @version 2019-08-13
 */
@MyBatisDao
public interface CcmPartyActivityDao extends CrudDao<CcmPartyActivity> {
	
}