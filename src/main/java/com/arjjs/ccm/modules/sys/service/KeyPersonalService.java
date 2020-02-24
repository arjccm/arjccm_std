package com.arjjs.ccm.modules.sys.service;

import com.arjjs.ccm.modules.sys.dao.KeyPersonalDao;
import com.arjjs.ccm.modules.sys.entity.KeyPersonal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Service
@Transactional(readOnly = true)
public class KeyPersonalService {

    @Autowired
    private KeyPersonalDao keyPersonalDao;

    public List<KeyPersonal> findPersonal(Date time,String array) {

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String format = simpleDateFormat.format(time);

        return  keyPersonalDao.findPersonal(format,array.split(","));

    }

    public List<KeyPersonal> findPersonalKJ(String time1, String time2,String array) {
        return  keyPersonalDao.findPersonalKJ(time1,time2,array.split(","));
    }

    public List<KeyPersonal> findPersonalFu(String array) {
        return keyPersonalDao.findPersonalFu(array.split(","));
    }
}
