package com.arjjs.ccm.modules.ccm.religion.dao; /**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */

import com.arjjs.ccm.common.persistence.CrudDao;
import com.arjjs.ccm.common.persistence.annotation.MyBatisDao;
import com.arjjs.ccm.modules.ccm.religion.entity.CcmReligionActivity;
import com.arjjs.ccm.tool.EchartType;

import java.util.List;

/**
 * 宗教活动表DAO接口
 * @author lgh
 * @version 2020-02-11
 */
@MyBatisDao
public interface CcmReligionActivityDao extends CrudDao<CcmReligionActivity> {
    /**
     * 根据规模查询
     * @return
     */
    List<EchartType> findByScale();

    /**
     * 根据类型查询
     * @return
     */
    List<EchartType> findByType();
	
}