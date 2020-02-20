package com.arjjs.ccm.modules.sys.dao;

import com.arjjs.ccm.common.persistence.CrudDao;
import com.arjjs.ccm.common.persistence.annotation.MyBatisDao;
import com.arjjs.ccm.modules.sys.entity.KeyPersonal;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@MyBatisDao
public interface KeyPersonalDao extends CrudDao<KeyPersonal> {

    List<KeyPersonal> findPersonal(@Param("time") String time);


    List<KeyPersonal> findPersonalKJ(@Param("time1") String time1, @Param("time2") String time2);
}
