/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.worker.dao;

import com.arjjs.ccm.common.persistence.CrudDao;
import com.arjjs.ccm.common.persistence.annotation.MyBatisDao;
import com.arjjs.ccm.modules.ccm.worker.entity.CcmWorkerSign;
import org.apache.ibatis.annotations.Param;
import org.springframework.security.access.method.P;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 社工签到DAO接口
 * @author yiqingxuan
 * @version 2019-06-17
 */
@MyBatisDao
public interface CcmWorkerSignDao extends CrudDao<CcmWorkerSign> {

    CcmWorkerSign getInfo(@Param("id") String id,@Param("date") String date);

     void insertIdaa(CcmWorkerSign ccmWorkerSign) ;

    void signBack(CcmWorkerSign ccmWorkerSign);

    int findClockoutTime(CcmWorkerSign ccmWorkerSign);

    int findByClockinInfo(CcmWorkerSign ccmWorkerSign);

    List<CcmWorkerSign> findByCountMonth(@Param("date") String date, @Param("ccmWorkerSign") CcmWorkerSign ccmWorkerSign);
}