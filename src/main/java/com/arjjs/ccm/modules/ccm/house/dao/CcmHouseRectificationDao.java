/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.house.dao;

import com.arjjs.ccm.common.persistence.CrudDao;
import com.arjjs.ccm.common.persistence.annotation.MyBatisDao;
import com.arjjs.ccm.modules.ccm.house.entity.CcmHouseRectification;
import org.apache.ibatis.annotations.Param;
import org.springframework.security.access.method.P;

import java.util.Date;
import java.util.List;

/**
 * 社区矫正人员DAO接口
 * @author arj
 * @version 2018-01-04
 */
@MyBatisDao
public interface CcmHouseRectificationDao extends CrudDao<CcmHouseRectification> {
	
	public CcmHouseRectification getItemByPeopleId(String id);

    List<CcmHouseRectification> getRectificationByDate(@Param("date") Date date);
}