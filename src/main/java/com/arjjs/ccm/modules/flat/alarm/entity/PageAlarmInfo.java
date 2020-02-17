package com.arjjs.ccm.modules.flat.alarm.entity;

import java.util.List;

public class PageAlarmInfo {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8344890745938458051L;
	
	private  Integer count;
	
	private List<BphAlarmInfo> alarmList;
	
	
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public List<BphAlarmInfo> getAlarmList() {
		return alarmList;
	}
	public void setAlarmList(List<BphAlarmInfo> alarmList) {
		this.alarmList = alarmList;
	}
}
