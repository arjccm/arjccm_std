/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.iot.search.entity;

import org.hibernate.validator.constraints.Length;

import com.arjjs.ccm.common.persistence.DataEntity;

/**
 * 静态库检索Entity
 * @author cby
 * @version 2020-05-14
 */
public class CcmSearchStatic extends DataEntity<CcmSearchStatic> {
	
	private static final long serialVersionUID = 1L;
	private String rolllist;		// 名单库
	private String valuecontrast;		// 模型对比阈值段
	private String photo;		// 图片
	
	public CcmSearchStatic() {
		super();
	}

	public CcmSearchStatic(String id){
		super(id);
	}

	@Length(min=0, max=255, message="名单库长度必须介于 0 和 255 之间")
	public String getRolllist() {
		return rolllist;
	}

	public void setRolllist(String rolllist) {
		this.rolllist = rolllist;
	}
	
	@Length(min=0, max=255, message="模型对比阈值段长度必须介于 0 和 255 之间")
	public String getValuecontrast() {
		return valuecontrast;
	}

	public void setValuecontrast(String valuecontrast) {
		this.valuecontrast = valuecontrast;
	}
	
	@Length(min=0, max=255, message="图片长度必须介于 0 和 255 之间")
	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
}