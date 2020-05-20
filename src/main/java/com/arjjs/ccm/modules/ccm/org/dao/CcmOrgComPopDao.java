/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.org.dao;

import com.arjjs.ccm.common.persistence.CrudDao;
import com.arjjs.ccm.common.persistence.annotation.MyBatisDao;
import com.arjjs.ccm.modules.ccm.org.entity.CcmOrgComPop;
import com.arjjs.ccm.modules.ccm.org.entity.SysArea;
import com.arjjs.ccm.tool.SearchTab;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 公共机构人员DAO接口
 * @author liang
 * @version 2018-05-11
 */
@MyBatisDao
public interface CcmOrgComPopDao extends CrudDao<CcmOrgComPop> {
	//社区民警/辅警
	int findPop();
	
	List<SearchTab> getnumOfWorkPower();
	
	List<SearchTab> getnumOfWorkPowerForOne();
	
	SearchTab getnumOfWorkPowerForTwo(SysArea area);

	List<SearchTab> getnumOfWorkPower7(@Param("enname") String enname);

	List<SearchTab> getnumOfWorkPower6();
}