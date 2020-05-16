/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.iot.search.dao;

import com.arjjs.ccm.common.persistence.CrudDao;
import com.arjjs.ccm.common.persistence.annotation.MyBatisDao;
import com.arjjs.ccm.modules.iot.search.entity.CcmSearchStatic;

/**
 * 静态库检索DAO接口
 * @author cby
 * @version 2020-05-14
 */
@MyBatisDao
public interface CcmSearchStaticDao extends CrudDao<CcmSearchStatic> {
	
}