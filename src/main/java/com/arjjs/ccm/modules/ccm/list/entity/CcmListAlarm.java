/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.list.entity;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.arjjs.ccm.common.persistence.DataEntity;

/**
 * 布控预警展示Entity
 * @author cby
 * @version 2020-08-21
 */
public class CcmListAlarm extends DataEntity<CcmListAlarm> {

	private static final long serialVersionUID = 1L;
	private Date alarmTime;		// 预警时间
	private String bkgPicUrl;		// 预警图片(大)
	private String facePicUrl;		// 预警图片(脸)
	private String controlId;		// 布控id
	private String humanId;		// 告警人员id
	private String indexCode;		// 抓拍机编号
	private String similarity;		// 相似度

	private String controlName;
	private Date startTime;
	private Date endTime;

	public CcmListAlarm() {
		super();
	}

	public CcmListAlarm(String id){
		super(id);
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getAlarmTime() {
		return alarmTime;
	}

	public void setAlarmTime(Date alarmTime) {
		this.alarmTime = alarmTime;
	}

	public String getBkgPicUrl() {
		return bkgPicUrl;
	}

	public void setBkgPicUrl(String bkgPicUrl) {
		this.bkgPicUrl = bkgPicUrl;
	}

	public String getFacePicUrl() {
		return facePicUrl;
	}

	public void setFacePicUrl(String facePicUrl) {
		this.facePicUrl = facePicUrl;
	}

	public String getControlId() {
		return controlId;
	}

	public void setControlId(String controlId) {
		this.controlId = controlId;
	}

	public String getHumanId() {
		return humanId;
	}

	public void setHumanId(String humanId) {
		this.humanId = humanId;
	}

	public String getIndexCode() {
		return indexCode;
	}

	public void setIndexCode(String indexCode) {
		this.indexCode = indexCode;
	}

	public String getSimilarity() {
		return similarity;
	}

	public void setSimilarity(String similarity) {
		this.similarity = similarity;
	}

	public String getControlName() {
		return controlName;
	}

	public void setControlName(String controlName) {
		this.controlName = controlName;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
}