/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.service.entity;

import org.hibernate.validator.constraints.Length;

import com.arjjs.ccm.common.persistence.DataEntity;

/**
 * 政务查询Entity
 * @author cby
 * @version 2020-09-30
 */
public class CcmServiceGovernment extends DataEntity<CcmServiceGovernment> {
	
	private static final long serialVersionUID = 1L;
	private String type;		// 政务类型
	private String title;		// 事项标题
	private String content;		// 事项内容
	private String dept;		// 部门
	
	public CcmServiceGovernment() {
		super();
	}

	public CcmServiceGovernment(String id){
		super(id);
	}

	@Length(min=0, max=2, message="政务类型长度必须介于 0 和 2 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@Length(min=1, max=64, message="事项标题长度必须介于 1 和 64 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Length(min=0, max=512, message="事项内容长度必须介于 0 和 512 之间")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	@Length(min=0, max=64, message="部门长度必须介于 0 和 64 之间")
	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}
	
}