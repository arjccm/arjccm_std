/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.worker.dao;

import com.arjjs.ccm.common.persistence.CrudDao;
import com.arjjs.ccm.common.persistence.annotation.MyBatisDao;
import com.arjjs.ccm.modules.ccm.worker.entity.CcmWorkerSign;

/**
 * 社工签到DAO接口
 * @author yiqingxuan
 * @version 2019-06-17
 */
@MyBatisDao
public interface CcmWorkerSignDao extends CrudDao<CcmWorkerSign> {

     void insertIdaa(CcmWorkerSign ccmWorkerSign) ;

    void signBack(CcmWorkerSign ccmWorkerSign);

    int findClockoutTime(CcmWorkerSign ccmWorkerSign);
}