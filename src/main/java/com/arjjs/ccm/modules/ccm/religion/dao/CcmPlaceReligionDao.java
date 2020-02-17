/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.religion.dao;

import com.arjjs.ccm.common.persistence.CrudDao;
import com.arjjs.ccm.common.persistence.annotation.MyBatisDao;
import com.arjjs.ccm.modules.ccm.religion.entity.CcmPlaceReligion;
import org.apache.ibatis.annotations.Param;

/**
 * 宗教组织DAO接口
 * @author ljd
 * @version 2019-04-29
 */
@MyBatisDao
    public interface CcmPlaceReligionDao extends CrudDao<CcmPlaceReligion> {

    //教堂个数
    Integer statIndexForZj(@Param("i") Integer i);
}