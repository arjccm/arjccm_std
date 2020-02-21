package com.arjjs.ccm.modules.sys.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

public class KeyPersonal {
    private String name; //姓名
    private Date alarmDate;  //时间alarm_date
    private String address;  //位置
    private String time;

    public KeyPersonal() {
    }

    public String getName() {
        return name;
    }
    public String getTime() {
        return time;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getAlarmDate() {
        return alarmDate;
    }

    public void setAlarmDate(Date alarmRate) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM-dd HH:mm:ss");
        this.time = simpleDateFormat.format(alarmRate);
        this.alarmDate = alarmRate;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setTime(String time) {
        this.time = time;
    }
}
