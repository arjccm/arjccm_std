/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.place.casino.dao;

import com.arjjs.ccm.common.persistence.CrudDao;
import com.arjjs.ccm.common.persistence.annotation.MyBatisDao;
import com.arjjs.ccm.modules.ccm.place.casino.entity.CcmPlaceCasino;

import java.util.List;

/**
 * 娱乐场所DAO接口
 * @author ljd
 * @version 2019-04-25
 */
@MyBatisDao
public interface CcmPlaceCasinoDao extends CrudDao<CcmPlaceCasino> {
    //统计网吧、Ktv、足浴个数
    List<Integer> countCasino();

}