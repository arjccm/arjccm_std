/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.place.base.entity;

import com.arjjs.ccm.common.persistence.DataEntity;
import com.arjjs.ccm.common.utils.excel.annotation.ExcelField;
import com.arjjs.ccm.modules.sys.entity.Area;
import com.arjjs.ccm.modules.sys.entity.User;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.google.common.collect.Lists;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.validator.constraints.Length;

import java.util.Date;
import java.util.List;

/**
 * 场所信息查询入参
 * 
 * @author maoxb
 * @version 2019-04-23
 */
public class CcmBasePlaceVO {

	private static final long serialVersionUID = 1L;
	private String placeName; // 场所名称 对应表名
	private String[] placeTypes; // 场所类型 对应某一类具体类型

	public String getPlaceName() {
		return placeName;
	}

	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}

	public String[] getPlaceTypes() {
		return placeTypes;
	}

	public void setPlaceTypes(String[] placeTypes) {
		this.placeTypes = placeTypes;
	}
}