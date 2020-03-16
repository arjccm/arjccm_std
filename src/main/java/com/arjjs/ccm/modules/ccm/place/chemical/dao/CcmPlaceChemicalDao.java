/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.place.chemical.dao;

import com.arjjs.ccm.common.persistence.CrudDao;
import com.arjjs.ccm.common.persistence.annotation.MyBatisDao;
import com.arjjs.ccm.modules.ccm.place.chemical.entity.CcmPlaceChemical;

/**
 * 危化品经营DAO接口
 * @author ljd
 * @version 2019-04-29
 */
@MyBatisDao
public interface CcmPlaceChemicalDao extends CrudDao<CcmPlaceChemical> {
	
}