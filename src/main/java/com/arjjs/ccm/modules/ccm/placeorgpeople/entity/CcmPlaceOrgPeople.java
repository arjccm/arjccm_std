/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.placeorgpeople.entity;

import org.hibernate.validator.constraints.Length;

import com.arjjs.ccm.common.persistence.DataEntity;

/**
 * 从业人员中间表Entity
 * @author cby
 * @version 2020-02-11
 */
public class CcmPlaceOrgPeople extends DataEntity<CcmPlaceOrgPeople> {
	
	private static final long serialVersionUID = 1L;
	private String placeOrgId;		// 场所或企业id
	private String peopleId;		// 人员id
	private Integer type;		// 1，场所2，企业
	
	public CcmPlaceOrgPeople() {
		super();
	}

	public CcmPlaceOrgPeople(String id){
		super(id);
	}

	@Length(min=0, max=64, message="场所或企业id长度必须介于 0 和 64 之间")
	public String getPlaceOrgId() {
		return placeOrgId;
	}

	public void setPlaceOrgId(String placeOrgId) {
		this.placeOrgId = placeOrgId;
	}
	
	@Length(min=0, max=64, message="人员id长度必须介于 0 和 64 之间")
	public String getPeopleId() {
		return peopleId;
	}

	public void setPeopleId(String peopleId) {
		this.peopleId = peopleId;
	}
	
	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}
	
}