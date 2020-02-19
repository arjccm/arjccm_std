/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.pop.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import javax.validation.constraints.NotNull;

import com.arjjs.ccm.common.persistence.DataEntity;

/**
 * 人员疫情Entity
 * @author yi
 * @version 2020-02-13
 */
public class CcmPeopleAntiepidemic extends DataEntity<CcmPeopleAntiepidemic> {

	private static final long serialVersionUID = 1L;
	private String telephone;		// 电话号码
	private String telPosion;		// 基站位置
	private String name;		// 姓名
	private String sex;		// 性别
	private String idNumber;		// 身份证号
	private String domicile;		// 户籍地
	private String habitation;		// 在琼居住地
	private Date leaveHubeiDate;		// 离鄂时间
	private Date comeHainanDate;		// 入琼时间
	private String isIn14days;		// 是否14天以内
	private String isLeftHainan;		// 是否离岛
	private Date leftDate;		// 离岛时间
	private String health;		// 身体状况
	private String doesTakeSteps;		// 有无采取措施
	private String takeSteps;		// 采取何种措施
	private String isTransferHc;		// 是否移交卫健委
	private String telephoneHome;		// 手机归属地
	private String distributeCity;		// 下发所属市县
	private String distributeNo;		// 下发数据批次
	private String checkName;		// 核查人
	private String checkTel;		// 核查人联系方式
	private Date checkDate;		// 核查时间
	private String reportName;		// 上报人
	private String reportDepartment;		// 上报人所属单位
	private Date reportDate;		// 上报时间
	private String reportStatus;		// 上报状态
	private String belongBureau;		// 所属市局
	private String belongSubBureau;		// 所属分局
	private String belongPoliceStation;		// 所属派出所
	private String dataType;		// 数据类型
	private String dataStatus;		// 数据状态
	private String areaGridId;		// 网格id
	private String areaPoint;		// 坐标
	private String transportation;  //交通工具
	private String cohabitant;     //同居住人员
	private String address;      //住院或集中观察地址
	private String info;     //开展网格化服务管理情况
	private Date autoUpdatetime;      //自动更新时间
	private int age;   //年龄
	private String ageType;  //年龄段
	private int minage;     //最小年龄
	private int maxage;     //最大年龄


	public CcmPeopleAntiepidemic() {
		super();
	}

	public CcmPeopleAntiepidemic(String id){
		super(id);
	}

	@Length(min=0, max=32, message="电话号码长度必须介于 0 和 32 之间")
	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	@Length(min=0, max=64, message="基站位置长度必须介于 0 和 64 之间")
	public String getTelPosion() {
		return telPosion;
	}

	public void setTelPosion(String telPosion) {
		this.telPosion = telPosion;
	}

	@Length(min=0, max=32, message="姓名长度必须介于 0 和 32 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Length(min=0, max=2, message="性别长度必须介于 0 和 2 之间")
	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	@Length(min=0, max=32, message="身份证号长度必须介于 0 和 32 之间")
	public String getIdNumber() {
		return idNumber;
	}

	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}

	@Length(min=0, max=128, message="户籍地长度必须介于 0 和 128 之间")
	public String getDomicile() {
		return domicile;
	}

	public void setDomicile(String domicile) {
		this.domicile = domicile;
	}

	@Length(min=0, max=128, message="在琼居住地长度必须介于 0 和 128 之间")
	public String getHabitation() {
		return habitation;
	}

	public void setHabitation(String habitation) {
		this.habitation = habitation;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getLeaveHubeiDate() {
		return leaveHubeiDate;
	}

	public void setLeaveHubeiDate(Date leaveHubeiDate) {
		this.leaveHubeiDate = leaveHubeiDate;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getComeHainanDate() {
		return comeHainanDate;
	}

	public void setComeHainanDate(Date comeHainanDate) {
		this.comeHainanDate = comeHainanDate;
	}

	@Length(min=0, max=2, message="是否14天以内长度必须介于 0 和 2 之间")
	public String getIsIn14days() {
		return isIn14days;
	}

	public void setIsIn14days(String isIn14days) {
		this.isIn14days = isIn14days;
	}

	@Length(min=0, max=2, message="是否离岛长度必须介于 0 和 2 之间")
	public String getIsLeftHainan() {
		return isLeftHainan;
	}

	public void setIsLeftHainan(String isLeftHainan) {
		this.isLeftHainan = isLeftHainan;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getLeftDate() {
		return leftDate;
	}

	public void setLeftDate(Date leftDate) {
		this.leftDate = leftDate;
	}

	@Length(min=0, max=64, message="身体状况长度必须介于 0 和 64 之间")
	public String getHealth() {
		return health;
	}

	public void setHealth(String health) {
		this.health = health;
	}

	@Length(min=0, max=2, message="有无采取措施长度必须介于 0 和 2 之间")
	public String getDoesTakeSteps() {
		return doesTakeSteps;
	}

	public void setDoesTakeSteps(String doesTakeSteps) {
		this.doesTakeSteps = doesTakeSteps;
	}

	@Length(min=0, max=128, message="采取何种措施长度必须介于 0 和 128 之间")
	public String getTakeSteps() {
		return takeSteps;
	}

	public void setTakeSteps(String takeSteps) {
		this.takeSteps = takeSteps;
	}

	@Length(min=0, max=2, message="是否移交卫健委长度必须介于 0 和 2 之间")
	public String getIsTransferHc() {
		return isTransferHc;
	}

	public void setIsTransferHc(String isTransferHc) {
		this.isTransferHc = isTransferHc;
	}

	@Length(min=0, max=16, message="手机归属地长度必须介于 0 和 16 之间")
	public String getTelephoneHome() {
		return telephoneHome;
	}

	public void setTelephoneHome(String telephoneHome) {
		this.telephoneHome = telephoneHome;
	}

	@Length(min=0, max=32, message="下发所属市县长度必须介于 0 和 32 之间")
	public String getDistributeCity() {
		return distributeCity;
	}

	public void setDistributeCity(String distributeCity) {
		this.distributeCity = distributeCity;
	}

	@Length(min=0, max=16, message="下发数据批次长度必须介于 0 和 16 之间")
	public String getDistributeNo() {
		return distributeNo;
	}

	public void setDistributeNo(String distributeNo) {
		this.distributeNo = distributeNo;
	}

	@Length(min=0, max=32, message="核查人长度必须介于 0 和 32 之间")
	public String getCheckName() {
		return checkName;
	}

	public void setCheckName(String checkName) {
		this.checkName = checkName;
	}

	@Length(min=0, max=32, message="核查人联系方式长度必须介于 0 和 32 之间")
	public String getCheckTel() {
		return checkTel;
	}

	public void setCheckTel(String checkTel) {
		this.checkTel = checkTel;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCheckDate() {
		return checkDate;
	}

	public void setCheckDate(Date checkDate) {
		this.checkDate = checkDate;
	}

	@Length(min=0, max=32, message="上报人长度必须介于 0 和 32 之间")
	public String getReportName() {
		return reportName;
	}

	public void setReportName(String reportName) {
		this.reportName = reportName;
	}

	@Length(min=0, max=64, message="上报人所属单位长度必须介于 0 和 64 之间")
	public String getReportDepartment() {
		return reportDepartment;
	}

	public void setReportDepartment(String reportDepartment) {
		this.reportDepartment = reportDepartment;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
//	@NotNull(message="上报时间不能为空")
	public Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}

	@Length(min=0, max=2, message="上报状态长度必须介于 0 和 2 之间")
	public String getReportStatus() {
		return reportStatus;
	}

	public void setReportStatus(String reportStatus) {
		this.reportStatus = reportStatus;
	}

	@Length(min=0, max=32, message="所属市局长度必须介于 0 和 32 之间")
	public String getBelongBureau() {
		return belongBureau;
	}

	public void setBelongBureau(String belongBureau) {
		this.belongBureau = belongBureau;
	}

	@Length(min=0, max=32, message="所属分局长度必须介于 0 和 32 之间")
	public String getBelongSubBureau() {
		return belongSubBureau;
	}

	public void setBelongSubBureau(String belongSubBureau) {
		this.belongSubBureau = belongSubBureau;
	}

	@Length(min=0, max=32, message="所属派出所长度必须介于 0 和 32 之间")
	public String getBelongPoliceStation() {
		return belongPoliceStation;
	}

	public void setBelongPoliceStation(String belongPoliceStation) {
		this.belongPoliceStation = belongPoliceStation;
	}

	@Length(min=0, max=2, message="数据类型长度必须介于 0 和 2 之间")
	public String getDataType() {
		return dataType;
	}

	public void setDataType(String dataType) {
		this.dataType = dataType;
	}

	@Length(min=0, max=2, message="数据状态长度必须介于 0 和 2 之间")
	public String getDataStatus() {
		return dataStatus;
	}

	public void setDataStatus(String dataStatus) {
		this.dataStatus = dataStatus;
	}

	@Length(min=0, max=64, message="网格id长度必须介于 0 和 64 之间")
	public String getAreaGridId() {
		return areaGridId;
	}

	public void setAreaGridId(String areaGridId) {
		this.areaGridId = areaGridId;
	}

	@Length(min=0, max=64, message="坐标长度必须介于 0 和 64 之间")
	public String getAreaPoint() {
		return areaPoint;
	}

	public void setAreaPoint(String areaPoint) {
		this.areaPoint = areaPoint;
	}

	public String getTransportation() {
		return transportation;
	}

	public void setTransportation(String transportation) {
		this.transportation = transportation;
	}

	public String getCohabitant() {
		return cohabitant;
	}

	public void setCohabitant(String cohabitant) {
		this.cohabitant = cohabitant;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public Date getAutoUpdatetime() {
		return autoUpdatetime;
	}

	public void setAutoUpdatetime(Date autoUpdatetime) {
		this.autoUpdatetime = autoUpdatetime;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getAgeType() {
		return ageType;
	}

	public void setAgeType(String ageType) {
		this.ageType = ageType;
	}

	public int getMinage() {
		return minage;
	}

	public void setMinage(int minage) {
		this.minage = minage;
	}

	public int getMaxage() {
		return maxage;
	}

	public void setMaxage(int maxage) {
		this.maxage = maxage;
	}
}