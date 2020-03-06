package com.arjjs.ccm.modules.ccm.rest.service;


import com.arjjs.ccm.common.service.CrudService;
import com.arjjs.ccm.modules.ccm.rest.dao.AlarmHandleInfoDao;
import com.arjjs.ccm.modules.ccm.rest.entity.AlarmHandleInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class AlarmHandleInfoService extends CrudService<AlarmHandleInfoDao, AlarmHandleInfo> {

    //警情事件
    @Autowired
    private AlarmHandleInfoDao alarmHandleInfoDao;


    public List<AlarmHandleInfo> findAlarm(AlarmHandleInfo alarmHandleInfo) {
        return alarmHandleInfoDao.findAlarm(alarmHandleInfo);
    }
}
