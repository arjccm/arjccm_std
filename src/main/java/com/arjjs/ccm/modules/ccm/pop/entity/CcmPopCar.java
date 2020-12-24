/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.pop.entity;

import org.hibernate.validator.constraints.Length;

import com.arjjs.ccm.common.persistence.DataEntity;

/**
 * 车辆管理Entity
 * @author cby
 * @version 2020-12-22
 */
public class CcmPopCar extends DataEntity<CcmPopCar> {
	
	private static final long serialVersionUID = 1L;
	private String jdchphm;		// 机动车号牌号码
	private String jdchpzldm;		// 机动车号牌种类代码 cmny_vehile_plate_type
	private String jdchpysdm;		// 机动车号牌颜色代码 cmny_plate_color
	private String jdccllxdm;		// 机动车车辆类型代码 cmny_vehile_type
	private String zwppmc;		// 中文品牌名称
	private String clxh;		// 车辆型号
	private String clcd;		// 车辆长度
	private String clkd;		// 车辆宽度
	private String clgd;		// 车辆高度
	private String jdccsysdm;		// 机动车车身颜色代码 cmny_vehile_collor
	private String jyqk;		// 机动车简要情况
	private String xp;		// 机动车图片
	private String czXm;		// 车主_姓名
	private String czGmsfzhm;		// 车主_公民身份证号
	private String czLxdh;		// 车主_ 联系电 话
	private String djrXm;		// 登记人_姓名
	private String djrLxdh;		// 登记人_联系电话
	
	public CcmPopCar() {
		super();
	}

	public CcmPopCar(String id){
		super(id);
	}

	@Length(min=0, max=15, message="机动车号牌号码长度必须介于 0 和 15 之间")
	public String getJdchphm() {
		return jdchphm;
	}

	public void setJdchphm(String jdchphm) {
		this.jdchphm = jdchphm;
	}
	
	@Length(min=0, max=100, message="机动车号牌种类代码 cmny_vehile_plate_type长度必须介于 0 和 100 之间")
	public String getJdchpzldm() {
		return jdchpzldm;
	}

	public void setJdchpzldm(String jdchpzldm) {
		this.jdchpzldm = jdchpzldm;
	}
	
	@Length(min=0, max=100, message="机动车号牌颜色代码 cmny_plate_color长度必须介于 0 和 100 之间")
	public String getJdchpysdm() {
		return jdchpysdm;
	}

	public void setJdchpysdm(String jdchpysdm) {
		this.jdchpysdm = jdchpysdm;
	}
	
	@Length(min=0, max=100, message="机动车车辆类型代码 cmny_vehile_type长度必须介于 0 和 100 之间")
	public String getJdccllxdm() {
		return jdccllxdm;
	}

	public void setJdccllxdm(String jdccllxdm) {
		this.jdccllxdm = jdccllxdm;
	}
	
	@Length(min=0, max=100, message="中文品牌名称长度必须介于 0 和 100 之间")
	public String getZwppmc() {
		return zwppmc;
	}

	public void setZwppmc(String zwppmc) {
		this.zwppmc = zwppmc;
	}
	
	@Length(min=0, max=100, message="车辆型号长度必须介于 0 和 100 之间")
	public String getClxh() {
		return clxh;
	}

	public void setClxh(String clxh) {
		this.clxh = clxh;
	}
	
	@Length(min=0, max=100, message="车辆长度长度必须介于 0 和 100 之间")
	public String getClcd() {
		return clcd;
	}

	public void setClcd(String clcd) {
		this.clcd = clcd;
	}
	
	@Length(min=0, max=100, message="车辆宽度长度必须介于 0 和 100 之间")
	public String getClkd() {
		return clkd;
	}

	public void setClkd(String clkd) {
		this.clkd = clkd;
	}
	
	@Length(min=0, max=100, message="车辆高度长度必须介于 0 和 100 之间")
	public String getClgd() {
		return clgd;
	}

	public void setClgd(String clgd) {
		this.clgd = clgd;
	}
	
	@Length(min=0, max=100, message="机动车车身颜色代码 cmny_vehile_collor长度必须介于 0 和 100 之间")
	public String getJdccsysdm() {
		return jdccsysdm;
	}

	public void setJdccsysdm(String jdccsysdm) {
		this.jdccsysdm = jdccsysdm;
	}
	
	@Length(min=0, max=100, message="机动车简要情况长度必须介于 0 和 100 之间")
	public String getJyqk() {
		return jyqk;
	}

	public void setJyqk(String jyqk) {
		this.jyqk = jyqk;
	}
	
	@Length(min=0, max=150, message="机动车图片长度必须介于 0 和 150 之间")
	public String getXp() {
		return xp;
	}

	public void setXp(String xp) {
		this.xp = xp;
	}
	
	@Length(min=0, max=50, message="车主_姓名长度必须介于 0 和 50 之间")
	public String getCzXm() {
		return czXm;
	}

	public void setCzXm(String czXm) {
		this.czXm = czXm;
	}
	
	@Length(min=0, max=18, message="车主_公民身份证号长度必须介于 0 和 18 之间")
	public String getCzGmsfzhm() {
		return czGmsfzhm;
	}

	public void setCzGmsfzhm(String czGmsfzhm) {
		this.czGmsfzhm = czGmsfzhm;
	}
	
	@Length(min=0, max=18, message="车主_ 联系电 话长度必须介于 0 和 18 之间")
	public String getCzLxdh() {
		return czLxdh;
	}

	public void setCzLxdh(String czLxdh) {
		this.czLxdh = czLxdh;
	}
	
	@Length(min=1, max=50, message="登记人_姓名长度必须介于 1 和 50 之间")
	public String getDjrXm() {
		return djrXm;
	}

	public void setDjrXm(String djrXm) {
		this.djrXm = djrXm;
	}
	
	@Length(min=0, max=18, message="登记人_联系电话长度必须介于 0 和 18 之间")
	public String getDjrLxdh() {
		return djrLxdh;
	}

	public void setDjrLxdh(String djrLxdh) {
		this.djrLxdh = djrLxdh;
	}
	
}