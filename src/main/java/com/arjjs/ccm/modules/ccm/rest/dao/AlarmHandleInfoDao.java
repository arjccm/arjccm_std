package com.arjjs.ccm.modules.ccm.rest.dao;

import com.arjjs.ccm.common.persistence.CrudDao;
import com.arjjs.ccm.common.persistence.annotation.MyBatisDao;
import com.arjjs.ccm.modules.ccm.rest.entity.AlarmHandleInfo;
import java.util.List;

@MyBatisDao
public interface AlarmHandleInfoDao extends CrudDao<AlarmHandleInfo> {

    List<AlarmHandleInfo> findAlarm(AlarmHandleInfo alarmHandleInfo);

}
