/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.rest.entity;

import com.arjjs.ccm.common.persistence.DataEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import java.util.List;

/**
 * 用户好友分组Entity
 * @author fu
 * @version 2018-06-12
 */
@ApiModel(value = "用户好友分组Entity")
public class CcmUserGroup extends DataEntity<CcmUserGroup> {

	@NotBlank(message = "当前登陆人ID不能为空")
	@ApiModelProperty(value = "当前登陆人ID")
	private String  userId;
	@ApiModelProperty(value = "分组名称")
	private String groupname;		// 分组名称
	@ApiModelProperty(value = "群组头像")
	private String avatar;		// 群组头像
	@ApiModelProperty(value = "/群组下用户")
	private List<CcmRestChatUser> list;	//群组下用户
	@ApiModelProperty(value = "用于满足app插件格式要求")
	private String type;	//用于满足app插件格式要求
	@ApiModelProperty(value = "用户列表")
	private List<String> userList;
	@ApiModelProperty(value = "群主id")
	private String groupOwnerId;//群主id

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getGroupOwnerId() {
		return groupOwnerId;
	}

	public void setGroupOwnerId(String groupOwnerId) {
		this.groupOwnerId = groupOwnerId;
	}

	public List<String> getUserList() {
		return userList;
	}

	public void setUserList(List<String> userList) {
		this.userList = userList;
	}

	public CcmUserGroup() {
		super();
	}

	public CcmUserGroup(String id){
		super(id);
	}


	
	@Length(min=1, max=256, message="群组头像长度必须介于 1 和 256 之间")
	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public List<CcmRestChatUser> getList() {
		return list;
	}


	public void setList(List<CcmRestChatUser> list) {
		this.list = list;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}

	public String getGroupname() {
		return groupname;
	}

	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}
}