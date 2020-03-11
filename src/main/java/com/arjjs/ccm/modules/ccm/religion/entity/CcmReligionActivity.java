/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.religion.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import javax.validation.constraints.NotNull;

import com.arjjs.ccm.common.persistence.DataEntity;

/**
 * 宗教活动表Entity
 * @author lgh
 * @version 2020-02-11
 */
public class CcmReligionActivity extends DataEntity<CcmReligionActivity> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 活动名称
	private Date beginDate;		// 开始日期
	private Date endDate;		// 结束日期
	private String host;		// 活动主办方
	private String address;		// 活动地点
	private String head;		// 活动负责人
	private String headCard;		// 负责人身份证号码
	private String headPhone;		// 负责人联系方式
	private String number;		// 活动参加人数
	private String scale;		// 活动规模
	private String type;		// 活动类型
	
	public CcmReligionActivity() {
		super();
	}

	public CcmReligionActivity(String id){
		super(id);
	}

	@Length(min=1, max=64, message="活动名称长度必须介于 1 和 64 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="活动开始日期不能为空")
	public Date getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="活动结束日期不能为空")
	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	
	@Length(min=0, max=64, message="活动主办方长度必须介于 0 和 64 之间")
	public String getHost() {
		return host;
	}

	public void setHost(String host) {
		this.host = host;
	}
	
	@Length(min=0, max=64, message="活动地点长度必须介于 0 和 64 之间")
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	@Length(min=0, max=16, message="活动负责人长度必须介于 0 和 16 之间")
	public String getHead() {
		return head;
	}

	public void setHead(String head) {
		this.head = head;
	}
	
	@Length(min=0, max=32, message="负责人身份证号码长度必须介于 0 和 32 之间")
	public String getHeadCard() {
		return headCard;
	}

	public void setHeadCard(String headCard) {
		this.headCard = headCard;
	}
	
	@Length(min=0, max=16, message="负责人联系方式长度必须介于 0 和 16 之间")
	public String getHeadPhone() {
		return headPhone;
	}

	public void setHeadPhone(String headPhone) {
		this.headPhone = headPhone;
	}
	
	@Length(min=0, max=5, message="活动参加人数长度必须介于 0 和 5 之间")
	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}
	
	@Length(min=0, max=2, message="活动规模长度必须介于 0 和 2 之间")
	public String getScale() {
		return scale;
	}

	public void setScale(String scale) {
		this.scale = scale;
	}
	
	@Length(min=0, max=2, message="活动类型长度必须介于 0 和 2 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
}