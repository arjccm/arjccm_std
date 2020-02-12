/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.flat.deviceonline.entity;

import com.arjjs.ccm.common.persistence.DataEntity;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.hibernate.validator.constraints.Length;

import java.io.UnsupportedEncodingException;
import java.util.Date;

/**
 * 设备在线实体类Entity
 * @author lgh
 * @version 2019-07-13
 */
public class CcmUserOnline {

	private String uid;        // 用户id
	private String status;        // 登录状态
	private Integer date;

	public Integer getDate() {
		return date;
	}

	public void setDate(Integer date) {
		if (date > 60) {
				this.status = "[离线]";
		} else if (date < 60) {
				this.status = "[在线]";
		}
		this.date = date;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getStatus() {
		return status;
	}
}