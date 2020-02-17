package com.arjjs.ccm.modules.ccm.sys.entity;

import com.arjjs.ccm.modules.ccm.pop.entity.CcmPeople;

public class CLS_VO_PeopleControl extends CcmPeople {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String peopleId;		// 人口id
	private String platformUserName;		// 平台用户名
	private String deviceId;		// 设备id
	private String userType;		//用户类型
	
	public String getPlatformUserName() {
		return platformUserName;
	}
	public void setPlatformUserName(String platformUserName) {
		this.platformUserName = platformUserName;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getPeopleId() {
		return peopleId;
	}
	public void setPeopleId(String peopleId) {
		this.peopleId = peopleId;
	}
	public String getDeviceId() {
		return deviceId;
	}
	public void setDeviceId(String deviceId) {
		this.deviceId = deviceId;
	}
	
}
