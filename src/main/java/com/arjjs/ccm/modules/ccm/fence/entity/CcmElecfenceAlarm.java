package com.arjjs.ccm.modules.ccm.fence.entity;

import java.util.Date;

import com.arjjs.ccm.common.persistence.DataEntity;
import com.arjjs.ccm.modules.ccm.ccmsys.entity.CcmMobileDevice;
import com.arjjs.ccm.modules.ccm.pop.entity.CcmPeople;
import com.arjjs.ccm.modules.ccm.view.entity.VSpecialPeople;


/**
 * 电子围栏报警实体类Entity
 * @author arj0704
 * @version 2019-05-31
 */
public class CcmElecfenceAlarm extends DataEntity<CcmElecfenceAlarm>{
	private static final long serialVersionUID = 1L;
	private String alarmType;//报警类型
	private VSpecialPeople ccmPeople;//人口信息
	private CcmMobileDevice ccmDevice;//设备信息
	private Date alarmTime;		// 报警时间
	private String userId; //用户id
	private String x; //经度
	private String y; //纬度
	private long isCheck;//是否核实
	private String userName;//用户名
	private Date beginCreateDate;		// 开始 创建时间
	private Date endCreateDate;		// 结束 创建时间
	
	
	public Date getBeginCreateDate() {
		return beginCreateDate;
	}
	public void setBeginCreateDate(Date beginCreateDate) {
		this.beginCreateDate = beginCreateDate;
	}
	public Date getEndCreateDate() {
		return endCreateDate;
	}
	public void setEndCreateDate(Date endCreateDate) {
		this.endCreateDate = endCreateDate;
	}
	public String getAlarmType() {
		return alarmType;
	}
	public void setAlarmType(String alarmType) {
		this.alarmType = alarmType;
	}
	public VSpecialPeople getCcmPeople() {
		return ccmPeople;
	}
	public void setCcmPeople(VSpecialPeople vSpecialPeople) {
		this.ccmPeople = vSpecialPeople;
	}
	public CcmMobileDevice getCcmDevice() {
		return ccmDevice;
	}
	public void setCcmDevice(CcmMobileDevice ccmDevice) {
		this.ccmDevice = ccmDevice;
	}
	public Date getAlarmTime() {
		return alarmTime;
	}
	public void setAlarmTime(Date alarmTime) {
		this.alarmTime = alarmTime;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getX() {
		return x;
	}
	public void setX(String x) {
		this.x = x;
	}
	public String getY() {
		return y;
	}
	public void setY(String y) {
		this.y = y;
	}
	public long getIsCheck() {
		return isCheck;
	}
	public void setIsCheck(long isCheck) {
		this.isCheck = isCheck;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
}
