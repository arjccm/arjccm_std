/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.list.entity;

import org.hibernate.validator.constraints.Length;

import com.arjjs.ccm.common.persistence.DataEntity;

/**
 * 人脸对接上传记录Entity
 * @author cby
 * @version 2020-05-08
 */
public class CcmListUpload extends DataEntity<CcmListUpload> {
	
	private static final long serialVersionUID = 1L;
	private String tableName;		// 所在表
	private String dataId;		// 记录id
	private String operateType;		// 操作类型
	private String param;		// 备用参数
	private String uploadStatus;		// 上传状态
	
	public CcmListUpload() {
		super();
	}

	public CcmListUpload(String id){
		super(id);
	}

	@Length(min=0, max=64, message="所在表长度必须介于 0 和 64 之间")
	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	
	@Length(min=0, max=64, message="记录id长度必须介于 0 和 64 之间")
	public String getDataId() {
		return dataId;
	}

	public void setDataId(String dataId) {
		this.dataId = dataId;
	}
	
	@Length(min=0, max=1, message="操作类型长度必须介于 0 和 1 之间")
	public String getOperateType() {
		return operateType;
	}

	public void setOperateType(String operateType) {
		this.operateType = operateType;
	}
	
	@Length(min=0, max=128, message="备用参数长度必须介于 0 和 128 之间")
	public String getParam() {
		return param;
	}

	public void setParam(String param) {
		this.param = param;
	}
	
	@Length(min=0, max=1, message="上传状态长度必须介于 0 和 1 之间")
	public String getUploadStatus() {
		return uploadStatus;
	}

	public void setUploadStatus(String uploadStatus) {
		this.uploadStatus = uploadStatus;
	}
	
}