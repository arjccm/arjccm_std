package com.arjjs.ccm.modules.sys.dao;

import com.arjjs.ccm.common.persistence.annotation.MyBatisDao;

import java.util.Date;

@MyBatisDao
public interface LogDelDao {

    /**
     * 按时间真删数据
     * @param date
     */
    void deleteTrue(Date date);
}
