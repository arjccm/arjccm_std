/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.org.entity;

import org.hibernate.validator.constraints.Length;
import com.arjjs.ccm.modules.sys.entity.Area;
import javax.validation.constraints.NotNull;

import com.arjjs.ccm.common.persistence.DataEntity;

/**
 * 重点区域Entity
 * @author cby
 * @version 2021-01-18
 */
public class CcmImportArea extends DataEntity<CcmImportArea> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 重点区域名称
	private Area area;		// 所属区域
	private Area userArea;
	private String areaDescription;		// 重点区域概述
	private String areaMap;		// 区域图
	private String areaPoint;		// 中心点

	private Integer popNum;
	private Integer buildNum;
	private Integer partNum;
	private Integer eventNum;
	
	public CcmImportArea() {
		super();
	}

	public CcmImportArea(String id){
		super(id);
	}

	@Length(min=1, max=64, message="重点区域名称长度必须介于 1 和 64 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@NotNull(message="所属区域不能为空")
	public Area getArea() {
		return area;
	}

	public void setArea(Area area) {
		this.area = area;
	}
	
	@Length(min=0, max=255, message="重点区域概述长度必须介于 0 和 255 之间")
	public String getAreaDescription() {
		return areaDescription;
	}

	public void setAreaDescription(String areaDescription) {
		this.areaDescription = areaDescription;
	}
	
	public String getAreaMap() {
		return areaMap;
	}

	public void setAreaMap(String areaMap) {
		this.areaMap = areaMap;
	}
	
	@Length(min=1, max=40, message="中心点长度必须介于 1 和 40 之间")
	public String getAreaPoint() {
		return areaPoint;
	}

	public void setAreaPoint(String areaPoint) {
		this.areaPoint = areaPoint;
	}

	public Area getUserArea() {
		return userArea;
	}

	public void setUserArea(Area userArea) {
		this.userArea = userArea;
	}

	public Integer getPopNum() {
		return popNum;
	}

	public void setPopNum(Integer popNum) {
		this.popNum = popNum;
	}

	public Integer getBuildNum() {
		return buildNum;
	}

	public void setBuildNum(Integer buildNum) {
		this.buildNum = buildNum;
	}

	public Integer getPartNum() {
		return partNum;
	}

	public void setPartNum(Integer partNum) {
		this.partNum = partNum;
	}

	public Integer getEventNum() {
		return eventNum;
	}

	public void setEventNum(Integer eventNum) {
		this.eventNum = eventNum;
	}
}