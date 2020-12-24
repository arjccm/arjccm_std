/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.pop.dao;

import com.arjjs.ccm.common.persistence.CrudDao;
import com.arjjs.ccm.common.persistence.annotation.MyBatisDao;
import com.arjjs.ccm.modules.ccm.pop.entity.CcmPopCar;

/**
 * 车辆管理DAO接口
 * @author cby
 * @version 2020-12-22
 */
@MyBatisDao
public interface CcmPopCarDao extends CrudDao<CcmPopCar> {
	
}