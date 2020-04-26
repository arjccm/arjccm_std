/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.rest.entity;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.io.Serializable;

/**
 * 房间用户信息Entity
 * @author m
 * @version 2020-04-23
 */
@ApiModel
public class CcmUserGroupRelationship implements Serializable {

	private static final long serialVersionUID = 233007889396655754L;

	@ApiModelProperty(name="id",hidden = true)
	private String id;
	private String groupId;		// 房间号
	private String userId;		// 用户ID

	public CcmUserGroupRelationship() {
	}

	public CcmUserGroupRelationship(String groupId) {
		this.groupId = groupId;
	}

	public CcmUserGroupRelationship(String groupId, String userId) {
		this.groupId = groupId;
		this.userId = userId;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
}