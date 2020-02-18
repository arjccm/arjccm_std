/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.pop.dao;

import com.arjjs.ccm.common.persistence.CrudDao;
import com.arjjs.ccm.common.persistence.annotation.MyBatisDao;
import com.arjjs.ccm.modules.ccm.pop.entity.CcmPeopleAntiepidemic;
import com.arjjs.ccm.tool.EchartType;

import java.util.List;

/**
 * 人员疫情DAO接口
 * @author yi
 * @version 2020-02-13
 */
@MyBatisDao
public interface CcmPeopleAntiepidemicDao extends CrudDao<CcmPeopleAntiepidemic> {

     //条件查询人员数量
     int countPeopleAntiepidemic(CcmPeopleAntiepidemic CcmPeopleAntiepidemic);

     //根据如琼日期查询统计数量
     List<EchartType> countBycomeHainanDate();


}