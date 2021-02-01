/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.publicity.entity;

import com.arjjs.ccm.modules.sys.entity.User;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.arjjs.ccm.common.persistence.DataEntity;

/**
 * 查看权限审批Entity
 * @author cby
 * @version 2021-01-30
 */
public class CcmDeviceViewApproval extends DataEntity<CcmDeviceViewApproval> {
	
	private static final long serialVersionUID = 1L;
	private User user;		// 申请人
	private String reason;		// 申请原因
	private User approvalId;		// 审批人
	private String approvalResult;		// 审批结果
	private Date approvalTime;		// 审批时间
	private String returnReason;		// 退回原因
	private String returnOpinion;		// 退回意见
	
	public CcmDeviceViewApproval() {
		super();
	}

	public CcmDeviceViewApproval(String id){
		super(id);
	}

	@NotNull(message="申请人不能为空")
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	@Length(min=1, max=255, message="申请原因长度必须介于 1 和 255 之间")
	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}
	
	@NotNull(message="审批人不能为空")
	public User getApprovalId() {
		return approvalId;
	}

	public void setApprovalId(User approvalId) {
		this.approvalId = approvalId;
	}
	
	@Length(min=0, max=2, message="审批结果长度必须介于 0 和 2 之间")
	public String getApprovalResult() {
		return approvalResult;
	}

	public void setApprovalResult(String approvalResult) {
		this.approvalResult = approvalResult;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getApprovalTime() {
		return approvalTime;
	}

	public void setApprovalTime(Date approvalTime) {
		this.approvalTime = approvalTime;
	}
	
	@Length(min=1, max=255, message="退回原因长度必须介于 1 和 255 之间")
	public String getReturnReason() {
		return returnReason;
	}

	public void setReturnReason(String returnReason) {
		this.returnReason = returnReason;
	}
	
	@Length(min=0, max=255, message="退回意见长度必须介于 0 和 255 之间")
	public String getReturnOpinion() {
		return returnOpinion;
	}

	public void setReturnOpinion(String returnOpinion) {
		this.returnOpinion = returnOpinion;
	}
	
}