/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.worker.entity;

import com.arjjs.ccm.modules.sys.entity.User;
import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.arjjs.ccm.common.persistence.DataEntity;

/**
 * 社工签到Entity
 * @author yiqingxuan
 * @version 2019-06-17
 */
public class CcmWorkerSign extends DataEntity<CcmWorkerSign> {
	
	private static final long serialVersionUID = 1L;
	private String id;
	private User user;		// 人员ID
	private Date clockinTime;    //签到时间
	private Date clockoutTime;    //签退时间
	private Date beginSignDate;		// 开始 签到时间
	private Date endSignDate;		// 结束 签到时间
	private String clockinType;      //签到平台标识  app  pc
	private String clockoutType;      //签退平台标识  app  pc
	private String clockinAreaPoint;  //签到坐标点  app  pc
	private String clockoutAreaPoint;  //签退坐标点  app  pc
	private String clockinAreaName;    //签到时地点（app计算地点名称，pc时计算客户端ip）
	private String clockoutAreaName;    //签退时地点（app计算地点名称，pc时计算客户端ip）
	private String areaPoint;  //中心点
	private String delFlag;		//删除标记
	private User createBy;	//创建者id
	private Date  createDate;   //创建时间
	private User updateBy;     //更新者
	private Date updateDate;   //更新时间
	private String manHour;  //每日工时

	public String getManHour() {
		return manHour;
	}

	public void setManHour(String manHour) {
		this.manHour = manHour;
	}

	@Override
	public User getUpdateBy() {
		return updateBy;
	}

	@Override
	public void setUpdateBy(User updateBy) {
		this.updateBy = updateBy;
	}

	@Override
	public Date getUpdateDate() {
		return updateDate;
	}

	@Override
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	@Override
	public String getDelFlag() {
		return delFlag;
	}

	@Override
	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

	@Override
	public User getCreateBy() {
		return createBy;
	}

	@Override
	public void setCreateBy(User createBy) {
		this.createBy = createBy;
	}

	@Override
	public Date getCreateDate() {
		return createDate;
	}

	@Override
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Override
	public String getId() {
		return id;
	}

	@Override
	public void setId(String id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getClockinTime() {
		return clockinTime;
	}

	public void setClockinTime(Date clockinTime) {
		this.clockinTime = clockinTime;
	}
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getClockoutTime() {
		return clockoutTime;
	}

	public void setClockoutTime(Date clockoutTime) {
		this.clockoutTime = clockoutTime;
	}
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getBeginSignDate() {
		return beginSignDate;
	}

	public void setBeginSignDate(Date beginSignDate) {
		this.beginSignDate = beginSignDate;
	}
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getEndSignDate() {
		return endSignDate;
	}

	public void setEndSignDate(Date endSignDate) {
		this.endSignDate = endSignDate;
	}

	public String getClockinType() {
		return clockinType;
	}

	public void setClockinType(String clockinType) {
		this.clockinType = clockinType;
	}

	public String getClockoutType() {
		return clockoutType;
	}

	public void setClockoutType(String clockoutType) {
		this.clockoutType = clockoutType;
	}

	public String getClockinAreaPoint() {
		return clockinAreaPoint;
	}

	public void setClockinAreaPoint(String clockinAreaPoint) {
		this.clockinAreaPoint = clockinAreaPoint;
	}

	public String getClockoutAreaPoint() {
		return clockoutAreaPoint;
	}

	public void setClockoutAreaPoint(String clockoutAreaPoint) {
		this.clockoutAreaPoint = clockoutAreaPoint;
	}

	public String getClockinAreaName() {
		return clockinAreaName;
	}

	public void setClockinAreaName(String clockinAreaName) {
		this.clockinAreaName = clockinAreaName;
	}

	public String getClockoutAreaName() {
		return clockoutAreaName;
	}

	public void setClockoutAreaName(String clockoutAreaName) {
		this.clockoutAreaName = clockoutAreaName;
	}

	public String getAreaPoint() {
		return areaPoint;
	}

	public void setAreaPoint(String areaPoint) {
		this.areaPoint = areaPoint;
	}


}