package com.arjjs.ccm.modules.ccm.rest.entity;

import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.util.Date;

public class AlarmHandle  implements Serializable {// NOTE:警情处理表 :bph_alarm_handle

	private static final long serialVersionUID = 1L;
	
	private String id;
	private String alarmId;
	private String handleCode;
	private String handlePoliceId;
	private String task;
	private double destinyX;
	private double destinyY;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date   dispatchTime;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date   receiveTime;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date   arriveTime;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date   finishTime;
	private double receiveX;
	private double receiveY;
	private double arriveX;
	private double arriveY;
	private double finishX;
	private double finishY;
	private String handleResult;
	private String status;
	private String planId;
	private String stepId;
	private String actionId;
	//private String createBy;
	//@JSONField(format="yyyy-MM-dd HH:mm:ss")
	//private Date   createDate;
	//private String updateBy;
	//@JSONField(format="yyyy-MM-dd HH:mm:ss")
	//private Date   updateDate;
	private String remarks;
	private String delFlag;
	
	public String getId() {
		return id == null ? "" : id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAlarmId() {
		return alarmId == null ? "" : alarmId;
	}
	public void setAlarmId(String alarmId) {
		this.alarmId = alarmId;
	}
	public String getHandleCode() {
		return handleCode == null ? "" : handleCode;
	}
	public void setHandleCode(String handleCode) {
		this.handleCode = handleCode;
	}
	public String getHandlePoliceId() {
		return handlePoliceId == null ? "" : handlePoliceId;
	}
	public void setHandlePoliceId(String handlePoliceId) {
		this.handlePoliceId = handlePoliceId;
	}
	public String getTask() {
		return task == null ? "" : task;
	}
	public void setTask(String task) {
		this.task = task;
	}
	public double getDestinyX() {
		return destinyX;
	}
	public void setDestinyX(double destinyX) {
		this.destinyX = destinyX;
	}
	public double getDestinyY() {
		return destinyY;
	}
	public void setDestinyY(double destinyY) {
		this.destinyY = destinyY;
	}
	public Date getDispatchTime() {
		return dispatchTime == null ? new Date() : dispatchTime;
	}
	public void setDispatchTime(Date dispatchTime) {
		this.dispatchTime = dispatchTime;
	}
	public Date getReceiveTime() {
		return receiveTime == null ? new Date() : receiveTime;
	}
	public void setReceiveTime(Date receiveTime) {
		this.receiveTime = receiveTime;
	}
	public Date getArriveTime() {
		return arriveTime == null ? new Date() : arriveTime;
	}
	public void setArriveTime(Date arriveTime) {
		this.arriveTime = arriveTime;
	}
	public Date getFinishTime() {
		return finishTime == null ? new Date() : finishTime;
	}
	public void setFinishTime(Date finishTime) {
		this.finishTime = finishTime;
	}
	public double getReceiveX() {
		return receiveX;
	}
	public void setReceiveX(double receiveX) {
		this.receiveX = receiveX;
	}
	public double getReceiveY() {
		return receiveY;
	}
	public void setReceiveY(double receiveY) {
		this.receiveY = receiveY;
	}
	public double getArriveX() {
		return arriveX;
	}
	public void setArriveX(double arriveX) {
		this.arriveX = arriveX;
	}
	public double getArriveY() {
		return arriveY;
	}
	public void setArriveY(double arriveY) {
		this.arriveY = arriveY;
	}
	public double getFinishX() {
		return finishX;
	}
	public void setFinishX(double finishX) {
		this.finishX = finishX;
	}
	public double getFinishY() {
		return finishY;
	}
	public void setFinishY(double finishY) {
		this.finishY = finishY;
	}
	public String getHandleResult() {
		return handleResult == null ? "" : handleResult;
	}
	public void setHandleResult(String handleResult) {
		this.handleResult = handleResult;
	}
	public String getStatus() {
		return status == null ? "" : status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPlanId() {
		return planId == null ? "" : planId;
	}
	public void setPlanId(String planId) {
		this.planId = planId;
	}
	public String getStepId() {
		return stepId == null ? "" : stepId;
	}
	public void setStepId(String stepId) {
		this.stepId = stepId;
	}
	public String getActionId() {
		return actionId == null ? "" : actionId;
	}
	public void setActionId(String actionId) {
		this.actionId = actionId;
	}
	public String getRemarks() {
		return remarks == null ? "" : remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getDelFlag() {
		return delFlag == null ? "" : delFlag;
	}
	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}
	
}
