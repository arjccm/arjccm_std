/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.placeorgpeople.dao;

import com.arjjs.ccm.common.persistence.CrudDao;
import com.arjjs.ccm.common.persistence.annotation.MyBatisDao;
import com.arjjs.ccm.modules.ccm.placeorgpeople.entity.CcmPlaceOrgPeople;

/**
 * 从业人员中间表DAO接口
 * @author cby
 * @version 2020-02-11
 */
@MyBatisDao
public interface CcmPlaceOrgPeopleDao extends CrudDao<CcmPlaceOrgPeople> {
	
}