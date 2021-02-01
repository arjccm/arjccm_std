/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.publicity.entity;

import com.arjjs.ccm.modules.sys.entity.User;
import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.arjjs.ccm.common.persistence.DataEntity;

/**
 * 历史查看管理Entity
 * @author cby
 * @version 2021-01-30
 */
public class CcmDeviceViewLog extends DataEntity<CcmDeviceViewLog> {
	
	private static final long serialVersionUID = 1L;
	private User viewer;		// 查看人
	private String viewContent;		// 查看内容
	private Date startTime;		// 开始时间
	private Date endTime;		// 结束时间
	private String viewTime;		// 查看时长
	private String viewFrequency;		// 查看频次
	
	public CcmDeviceViewLog() {
		super();
	}

	public CcmDeviceViewLog(String id){
		super(id);
	}

	public User getViewer() {
		return viewer;
	}

	public void setViewer(User viewer) {
		this.viewer = viewer;
	}
	
	@Length(min=0, max=255, message="查看内容长度必须介于 0 和 255 之间")
	public String getViewContent() {
		return viewContent;
	}

	public void setViewContent(String viewContent) {
		this.viewContent = viewContent;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	
	@Length(min=0, max=5, message="查看时长长度必须介于 0 和 5 之间")
	public String getViewTime() {
		return viewTime;
	}

	public void setViewTime(String viewTime) {
		this.viewTime = viewTime;
	}
	
	@Length(min=0, max=5, message="查看频次长度必须介于 0 和 5 之间")
	public String getViewFrequency() {
		return viewFrequency;
	}

	public void setViewFrequency(String viewFrequency) {
		this.viewFrequency = viewFrequency;
	}
	
}