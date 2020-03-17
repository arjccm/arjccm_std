/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.pop.service;

import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.service.CrudService;
import com.arjjs.ccm.common.utils.StringUtils;
import com.arjjs.ccm.modules.ccm.ccmsys.entity.CcmUploadLog;
import com.arjjs.ccm.modules.ccm.ccmsys.service.CcmUploadLogService;
import com.arjjs.ccm.modules.ccm.house.dao.*;
import com.arjjs.ccm.modules.ccm.house.entity.*;
import com.arjjs.ccm.modules.ccm.house.service.*;
import com.arjjs.ccm.modules.ccm.org.service.SysAreaService;
import com.arjjs.ccm.modules.ccm.pop.dao.CcmPeopleDao;
import com.arjjs.ccm.modules.ccm.pop.dao.CcmPopBehindDao;
import com.arjjs.ccm.modules.ccm.pop.entity.*;
import com.arjjs.ccm.modules.ccm.sys.entity.CcmAreaPointVo;
import com.arjjs.ccm.modules.ccm.sys.entity.SysDicts;
import com.arjjs.ccm.modules.ccm.tenant.entity.CcmTenantRecord;
import com.arjjs.ccm.modules.ccm.tenant.service.CcmTenantRecordService;
import com.arjjs.ccm.modules.sys.entity.User;
import com.arjjs.ccm.modules.sys.utils.UserUtils;
import com.arjjs.ccm.tool.EchartType;
import com.arjjs.ccm.tool.SysConfigInit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.arjjs.ccm.tool.SearchTab;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 实有人口Service
 * 
 * @author liang
 * @version 2018-01-04
 */
@Service
@Transactional(readOnly = true)
public class CcmPeopleService extends CrudService<CcmPeopleDao, CcmPeople> {

	@Autowired
	private CcmPeopleDao ccmPeopleDao;
	@Autowired
	private CcmPopBehindDao ccmPopBehindDao;
	@Autowired
	private CcmPopBehindService ccmPopBehindService;
	@Autowired
	private CcmHouseAidsDao ccmHouseAidsDao;
	@Autowired
	private CcmHouseAidsService ccmHouseAidsService;
	@Autowired
	private CcmHouseDangerousDao ccmHouseDangerousDao;
	@Autowired
	private CcmHouseDangerousService ccmHouseDangerousService;
	@Autowired
	private CcmHouseDrugsDao ccmHouseDrugsDao;
	@Autowired
	private CcmHouseDrugsService ccmHouseDrugsService;
	@Autowired
	private CcmHouseHeresyDao ccmHouseHeresyDao;
	@Autowired
	private CcmHouseHeresyService ccmHouseHeresyService;
	@Autowired
	private CcmHouseKymDao ccmHouseKymDao;
	@Autowired
	private CcmHouseKymService ccmHouseKymService;
	@Autowired
	private CcmHousePetitionDao ccmHousePetitionDao;
	@Autowired
	private CcmHousePetitionService ccmHousePetitionService;
	@Autowired
	private CcmHousePsychogenyDao ccmHousePsychogenyDao;
	@Autowired
	private CcmHousePsychogenyService ccmHousePsychogenyService;
	@Autowired
	private CcmHouseRectificationDao ccmHouseRectificationDao;
	@Autowired
	private CcmHouseRectificationService ccmHouseRectificationService;
	@Autowired
	private CcmHouseReleaseDao ccmHouseReleaseDao;
	@Autowired
	private CcmHouseReleaseService ccmHouseReleaseService;

	@Autowired
	private CcmHouseBuildmanageService ccmHouseBuildmanageService;

	@Autowired
	private SysAreaService sysAreaService;
	@Autowired
	private CcmPopTenantService ccmPopTenantService;
	
		@Autowired
	private CcmHarmNationalSecurityService ccmHarmNationalSecurityService;
	@Autowired
	private CcmSeriousCriminalOffenseService ccmSeriousCriminalOffenseService;
	@Autowired
	private CcmHouseDeliberatelyIllegalService ccmHouseDeliberatelyIllegalService;
	@Autowired
	private CcmTenantRecordService ccmTenantRecordService;
	
	//上传上级平台记录
	@Autowired
	private CcmUploadLogService ccmUploadLogService;
	
	// 人员信息弹框
	public CcmPeople getHousePopForm(CcmPeople ccmPeople) {
		ccmPeople = ccmPeopleDao.getHousePopForm(ccmPeople);
		return ccmPeople;
	}

	// getNation
	public String getNation(CcmPeople ccmPeople) {
		return ccmPeopleDao.getNation(ccmPeople);
	}

	// getRelation
	public String getRelation(CcmPeople ccmPeople) {
		return ccmPeopleDao.getRelation(ccmPeople);
	}

	// 楼栋-房屋-住户信息弹框
	public List<CcmPeople> getHousePopList(CcmPeople ccmPeople) {
		return ccmPeopleDao.getHousePopList(ccmPeople);
	}

	// 校园周边重点人员列表
	public Page<CcmPeople> findPagePop(Page<CcmPeople> page, CcmPeople ccmPeople) {
		ccmPeople.setPage(page);
		page.setList(ccmPeopleDao.findPagePop(ccmPeople));
		return page;
	}

	// 户籍户号调用
	public Page<CcmPeople> listAccount(Page<CcmPeople> page, CcmPeople ccmPeople) {
		ccmPeople.setPage(page);
		page.setList(ccmPeopleDao.listAccount(ccmPeople));
		return page;
	}

	//
	public CcmPeople get(String id) {
		return super.get(id);
	}

	public List<CcmPeople> findList(CcmPeople ccmPeople) {
		return super.findList(ccmPeople);
	}

	public List<CcmPeople> findListBylimit(CcmPeople ccmPeople){
		return ccmPeopleDao.findListBylimit(ccmPeople);
	}


	public Page<CcmPeople> findPage(Page<CcmPeople> page, CcmPeople ccmPeople) {
		return super.findPage(page, ccmPeople);
	}
	/**
	 * @see 党员
	 * @param user
	 * @return
	 */
	public Page<CcmPeople> findCommunistPage(Page<CcmPeople> page, CcmPeople ccmPeople) {
		ccmPeople.setPage(page);
		page.setList(ccmPeopleDao.findCommunistList(ccmPeople));
		return page;
	}
	
	public List<EchartType> selectPopNumAllByPolitics() {
		return ccmPeopleDao.selectPopNumAllByPolitics();
	}
	
	
	public List<EchartType> selectPopNumAllByRectification() {
		return ccmPeopleDao.selectPopNumAllByRectification();
	}
	/**
	 * @see 老年人
	 * @param user
	 * @return
	 */
	public Page<CcmPeople> findOlderPage(Page<CcmPeople> page, CcmPeople ccmPeople) {
		ccmPeople.setPage(page);
		page.setList(ccmPeopleDao.findOlderPage(ccmPeople));
		return page;
	}
	public List<CcmPeople> findOlderList(CcmPeople ccmPeople) {
		return ccmPeopleDao.findOlderPage(ccmPeople);
	}
	@Transactional(readOnly = false)
	public void save(CcmPeople ccmPeople) {
		boolean isNew = false;
		if (ccmPeople.getId() == null || "".equals(ccmPeople.getId())) {//无主键ID，则是新记录
			isNew = true;
		}
		if (ccmPeople.getIsNewRecord()) {//指定了是新增记录，则算新记录
			isNew = true;
		}
		
		//人口数据为新增的时候，给户籍状态一个默认值
		if(StringUtils.isEmpty(ccmPeople.getPersonType()) && isNew) {
			ccmPeople.setPersonType("01");
		}

		//租客记录
		if(StringUtils.isNotEmpty(ccmPeople.getId())) {
			CcmPeople people = get(ccmPeople.getId());
			if(!ccmPeople.getRoomId().getId().equals(people.getRoomId().getId())) {
				//删除旧的数据
				deletePeopleOfHouse(people.getId(), people.getRoomId().getId(), people.getBuildId().getId(), people.getAreaGridId().getId());
				// 把新增的数据记录到租客记录表里面
				CcmTenantRecord ccmTenantRecord = new CcmTenantRecord();
				ccmTenantRecord.setHouseId(ccmPeople.getRoomId().getId());
				ccmTenantRecord.setIdCard(ccmPeople.getIdent());
				ccmTenantRecord.setName(ccmPeople.getName());
				ccmTenantRecord.setPhoneNumber(ccmPeople.getTelephone());
				if(UserUtils.getUser()==null){
					ccmTenantRecord.setCreateBy(UserUtils.get("1"));
					ccmTenantRecord.setUpdateBy(UserUtils.get("1"));
				}else{
					ccmTenantRecord.setCreateBy(UserUtils.getUser());
					ccmTenantRecord.setUpdateBy(UserUtils.getUser());
				}
				ccmTenantRecord.setCreateDate(new Date());
				ccmTenantRecord.setUpdateDate(new Date());
				ccmTenantRecord.setDelFlag("0");
				ccmTenantRecord.setLiveDate(new Date());
				ccmTenantRecord.setLeaveDate(new Date());
				ccmTenantRecordService.save(ccmTenantRecord);
			}
		}else{
			// 把新增的数据记录到租客记录表里面
			CcmTenantRecord ccmTenantRecord = new CcmTenantRecord();
			ccmTenantRecord.setHouseId(ccmPeople.getRoomId().getId());
			ccmTenantRecord.setIdCard(ccmPeople.getIdent());
			ccmTenantRecord.setName(ccmPeople.getName());
			ccmTenantRecord.setPhoneNumber(ccmPeople.getTelephone());
			if(UserUtils.getUser()==null){
				ccmTenantRecord.setCreateBy(UserUtils.get("1"));
				ccmTenantRecord.setUpdateBy(UserUtils.get("1"));
			}else{
				ccmTenantRecord.setCreateBy(UserUtils.getUser());
				ccmTenantRecord.setUpdateBy(UserUtils.getUser());
			}
			ccmTenantRecord.setCreateDate(new Date());
			ccmTenantRecord.setUpdateDate(new Date());
			ccmTenantRecord.setDelFlag("0");
			ccmTenantRecord.setLiveDate(new Date());
			ccmTenantRecord.setLeaveDate(new Date());
			ccmTenantRecordService.save(ccmTenantRecord);
		}

		super.save(ccmPeople);
		
		//上传上级平台记录
		if (!SysConfigInit.UPPER_URL.equals("")) {//有上级平台地址时，才存入上传上级平台记录的日志
			CcmUploadLog uploadLog = new CcmUploadLog();
			if (isNew) {//新增数据
				uploadLog.setOperateType("1");
				uploadLog.setRemarks("新增人口数据：" + ccmPeople.getName());
			} else {//编辑数据
				uploadLog.setOperateType("2");
				uploadLog.setRemarks("编辑人口数据：" + ccmPeople.getName());
			}
			uploadLog.setTableName("ccm_people");
			uploadLog.setDataId(ccmPeople.getId());
			uploadLog.setUploadStatus("1");
			User user = UserUtils.getUser();
			if (user == null || StringUtils.isBlank(user.getId())){
				uploadLog.setCreateBy(new User("1"));
				uploadLog.setUpdateBy(new User("1"));
			}
			ccmUploadLogService.save(uploadLog);
		}
	}

	@Transactional(readOnly = false)
	public void delete(CcmPeople ccmPeople) {
		ccmPeople = ccmPeopleDao.get(ccmPeople.getId());
		super.delete(ccmPeople);
		//1
		if(ccmPeople.getIsBehind()!=null && ccmPeople.getIsBehind()==1){
			CcmPopBehind ccmPopBehind = new CcmPopBehind();
			ccmPopBehind.setPeopleId(ccmPeople.getId());
			List<CcmPopBehind> list1 = ccmPopBehindService.findList(ccmPopBehind);
			for(CcmPopBehind l1:list1){
				ccmPopBehindDao.delete(l1);
			}
		}
		//2
		if(ccmPeople.getIsAids()!=null && ccmPeople.getIsAids()==1){
			CcmHouseAids ccmHouseAids = new CcmHouseAids();
			ccmHouseAids.setPeopleId(ccmPeople.getId());
			List<CcmHouseAids> list2 = ccmHouseAidsService.findList(ccmHouseAids);
			for(CcmHouseAids l2:list2){
				ccmHouseAidsDao.delete(l2);
			}
		}
		//3
		if(ccmPeople.getIsDangerous()!=null && ccmPeople.getIsDangerous()==1){
			CcmHouseDangerous ccmHouseDangerous = new CcmHouseDangerous();
			ccmHouseDangerous.setPeopleId(ccmPeople.getId());
			List<CcmHouseDangerous> list3 = ccmHouseDangerousService.findList(ccmHouseDangerous);
			for(CcmHouseDangerous l3:list3){
				ccmHouseDangerousDao.delete(l3);
			}
		}
		//4
		if(ccmPeople.getIsDrugs()!=null && ccmPeople.getIsDrugs()==1){
			CcmHouseDrugs ccmHouseDrugs = new CcmHouseDrugs();
			ccmHouseDrugs.setPeopleId(ccmPeople.getId());
			List<CcmHouseDrugs> list4 = ccmHouseDrugsService.findList(ccmHouseDrugs);
			for(CcmHouseDrugs l4:list4){
				ccmHouseDrugsDao.delete(l4);
			}
		}
		//5
		if(ccmPeople.getIsHeresy()!=null && ccmPeople.getIsHeresy()==1){
			CcmHouseHeresy ccmHouseHeresy = new CcmHouseHeresy();
			ccmHouseHeresy.setPeopleId(ccmPeople.getId());
			List<CcmHouseHeresy> list5 = ccmHouseHeresyService.findList(ccmHouseHeresy);
			for(CcmHouseHeresy l5:list5){
				ccmHouseHeresyDao.delete(l5);
			}
		}
		//6
		if(ccmPeople.getIsKym()!=null && ccmPeople.getIsKym()==1){
			CcmHouseKym ccmHouseKym = new CcmHouseKym();
			ccmHouseKym.setPeopleId(ccmPeople.getId());
			List<CcmHouseKym> list6 = ccmHouseKymService.findList(ccmHouseKym);
			for(CcmHouseKym l6:list6){
				ccmHouseKymDao.delete(l6);
			}
		}
		//7
		if(ccmPeople.getIsVisit()!=null && ccmPeople.getIsVisit()==1){
			CcmHousePetition ccmHousePetition = new CcmHousePetition();
			ccmHousePetition.setPeopleId(ccmPeople.getId());
			List<CcmHousePetition> list7 = ccmHousePetitionService.findList(ccmHousePetition);
			for(CcmHousePetition l7:list7){
				ccmHousePetitionDao.delete(l7);
			}
		}
		//8
		if(ccmPeople.getIsPsychogeny()!=null && ccmPeople.getIsPsychogeny()==1){
			CcmHousePsychogeny ccmHousePsychogeny = new CcmHousePsychogeny();
			ccmHousePsychogeny.setPeopleId(ccmPeople.getId());
			List<CcmHousePsychogeny> list8 = ccmHousePsychogenyService.findList(ccmHousePsychogeny);
			for(CcmHousePsychogeny l8:list8){
				ccmHousePsychogenyDao.delete(l8);
			}
		}
		//9
		if(ccmPeople.getIsRectification()!=null && ccmPeople.getIsRectification()==1){
			CcmHouseRectification ccmHouseRectification = new CcmHouseRectification();
			ccmHouseRectification.setPeopleId(ccmPeople.getId());
			List<CcmHouseRectification> list9 = ccmHouseRectificationService.findList(ccmHouseRectification);
			for(CcmHouseRectification l9:list9){
				ccmHouseRectificationDao.delete(l9);
			}
		}
		//10
		if(ccmPeople.getIsRelease()!=null && ccmPeople.getIsRelease()==1){
			CcmHouseRelease ccmHouseRelease = new CcmHouseRelease();
			ccmHouseRelease.setPeopleId(ccmPeople.getId());
			List<CcmHouseRelease> list10 = ccmHouseReleaseService.findList(ccmHouseRelease);
			for(CcmHouseRelease l10:list10){
				ccmHouseReleaseDao.delete(l10);
			}
		}
		
		//上传上级平台记录
		if (!SysConfigInit.UPPER_URL.equals("")) {//有上级平台地址时，才存入上传上级平台记录的日志
			CcmUploadLog uploadLog = new CcmUploadLog();
			uploadLog.setOperateType("3");
			uploadLog.setRemarks("删除人口数据：" + ccmPeople.getName());
			uploadLog.setTableName("ccm_people");
			uploadLog.setDataId(ccmPeople.getId());
			uploadLog.setUploadStatus("1");
			User user = UserUtils.getUser();
			if (user == null || StringUtils.isBlank(user.getId())){
				uploadLog.setCreateBy(new User("1"));
				uploadLog.setUpdateBy(new User("1"));
			}
			ccmUploadLogService.save(uploadLog);
		}
	}

	/**
	 * @see 返回 以整月 下的 list求和数
	 * @param user
	 * @return
	 */
	public List<EchartType> getListByMon(User user, CcmPeople ccmPeople) {
		return ccmPeopleDao.getListByMon(user, ccmPeople);
	}

	/**
	 * @see 返回 以整日 下的 list求和数
	 * @param user
	 * @return
	 */
	public List<EchartType> getListByDay(User user, CcmPeople ccmPeople) {
		return ccmPeopleDao.getListByDay(user, ccmPeople);
	}

	// 查询指定的重点人员
	public List<CcmPeople> findSpeList(CcmPeople ccmPeople) {
		return ccmPeopleDao.findSpeList(ccmPeople);
	}

	// 查询指定的 人员身份证是否可以存入数据库
	public boolean checkPeopleIden(CcmPeople ccmPeople) {
		return ccmPeopleDao.checkPeopleIden(ccmPeople) == 0 ? false : true;
	}

	// 查询相关户籍家庭人口
	public List<CcmPeople> listAccount(CcmPeople ccmPeople){
		return ccmPeopleDao.listAccount(ccmPeople);
	}

	//导出实有人口数据---老年人
	public List<CcmPeople> findOlder(CcmPeople ccmPeople) {
		return ccmPeopleDao.findOlderPage(ccmPeople);
	}

	//导出实有人口数据---党员
	public List<CcmPeople> findCommunist(CcmPeople ccmPeople) {
		return ccmPeopleDao.findCommunistList(ccmPeople);
	}

	//特殊关怀人员数量
	public int findListNum(CcmPeople ccmPeople) {
		return ccmPeopleDao.findListNum(ccmPeople);
	}

	//数组查询id
	public List<CcmPeople> findListLimite(CcmPeople ccmPeople2) {
//		return ccmPeopleDao.findListLimite(ccmPeople2);
		return ccmPeopleDao.findListLimite_V2(ccmPeople2);
	}

	//特殊关怀
	public Page<CcmPeople> findCarePage(Page<CcmPeople> page, CcmPeople ccmPeople) {
		ccmPeople.setPage(page);
		page.setList(ccmPeopleDao.findCareList(ccmPeople));
		return page;
	}
	
	public Page<CcmPeople> findPopRoomPage(Page<CcmPeople> page, CcmPeople ccmPeople) {
		ccmPeople.setPage(page);
		page.setList(ccmPeopleDao.housePopListAdd(ccmPeople));
		return page;
	}
	
	public List<CcmPeople> findCareList(CcmPeople ccmPeople) {
		return ccmPeopleDao.findCareList(ccmPeople);
	}
	
	//导出特殊关怀查询
	public List<CcmPeopleExport> findAllCareList(CcmPeople ccmPeople2) {
		return ccmPeopleDao.findAllCareList(ccmPeople2);
	}

	// 特殊关怀First
	public Page<CcmPeople> findCareFirst(Page<CcmPeople> page, CcmPeople ccmPeople) {
		ccmPeople.setPage(page);
		page.setList(ccmPeopleDao.findCareFirst(ccmPeople));
		return page;
	}

	//常住人口
	public Page<CcmPeople> findPermanentPage(Page<CcmPeople> page, CcmPeople ccmPeople) {
		ccmPeople.setPage(page);
		page.setList(ccmPeopleDao.findPermanentList(ccmPeople));
		return page;
	}

	//常住人口
	public List<CcmPeople> findPermanentListBylimit(CcmPeople ccmPeople) {
		return ccmPeopleDao.findPermanentListBylimit(ccmPeople);
	}



	/**
	 * 区域内人员统计
	 */
	public int countSelect(List<String> coordianteList){
		return ccmPeopleDao.countSelect(coordianteList);
	}
	/**
	 * zhanghao
	 * @param 事件周边嫌疑人
	 * @return
	 */
	public List<CcmPeople> locatingSuspects(List<String> coordianteList) {
		return ccmPeopleDao.locatingSuspects(coordianteList);
	}
	
	//数组查询id  V2 版本
	public List<CcmPeople> findListLimite_V2(CcmPeople ccmPeople2) {
		return ccmPeopleDao.findListLimite_V2(ccmPeople2);
	}

	public List<CcmPeople> getByIdent(String string){

		return ccmPeopleDao.getByIdent(string);

	}
	
	@Transactional(readOnly = false)
	public void updatePeople(CcmPeople ccmPeople) {
		ccmPeopleDao.updatePeople(ccmPeople);
	}

	public int findCount() {
		int count = ccmPeopleDao.findCount();
		return count;
	}

	public List<CcmPeople> queryPeopleInfo(Page page) {
		List<CcmPeople> list = page.getList();
		List<CcmPeople> ccmPeoplelist = new ArrayList<CcmPeople>();
		for (CcmPeople people:list) {
			CcmPeople peoplePojo = get(people);
//			//区域
//			if (peoplePojo.getAreaComId() != null && StringUtils.isNotBlank(peoplePojo.getAreaComId().getId())){
//				SysArea sysAreaCom = sysAreaService.get(peoplePojo.getAreaComId().getId());
//			}
//			//网格
//			if (peoplePojo.getAreaGridId() != null && StringUtils.isNotBlank(peoplePojo.getAreaGridId().getId())){
//
//				SysArea sysAreaGrid = sysAreaService.get(peoplePojo.getAreaGridId().getId());
//			}
//			//楼幢
//			if (peoplePojo.getBuildId() != null && StringUtils.isNotBlank(peoplePojo.getBuildId().getId() ) ){
//				CcmHouseBuildmanage ccmHouseBuildmanage = ccmHouseBuildmanageService.get(peoplePojo.getBuildId().getId());
//			}
//			//房屋
//			if (peoplePojo.getRoomId() != null && StringUtils.isNotBlank(peoplePojo.getRoomId().getId())){
//				CcmPopTenant ccmPopTenant = ccmPopTenantService.get( peoplePojo.getRoomId().getId());
//			}
			ccmPeoplelist.add(peoplePojo);
		}
		return ccmPeoplelist;
	}

	/**
	 * 根据sn号查询重点人员信息
	 *
	 * @param snNum
	 * @return
	 */
	public CcmPeople getInfoBySnNum(String snNum) {
		return ccmPeopleDao.getInfoBySnNum(snNum);
	}

	public List<CcmPeople> findListBuildBox(CcmPeople ccmPeople) {
		return ccmPeopleDao.findListBuildBox(ccmPeople);
	}

	
	public CcmPeople peopleSexCount(CcmPeople ccmPeople) {
		return ccmPeopleDao.peopleSexCount(ccmPeople);
	}

	public Map<String, Object> peopleBirthdayCount(List<SysDicts> list) {
		Calendar c = Calendar.getInstance();
		c.set(Calendar.YEAR,(c.get(Calendar.YEAR)-c.get(Calendar.YEAR)%10));
		c.set(Calendar.MONTH, 11);
		c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
		c.set(Calendar.HOUR_OF_DAY, c.getActualMaximum(Calendar.HOUR_OF_DAY));
		c.set(Calendar.MINUTE, 59);
		c.set(Calendar.SECOND, 59);
		Date date1 = c.getTime();
		c.set(Calendar.YEAR,(c.get(Calendar.YEAR)-10));
		Date date2 = c.getTime();
		c.set(Calendar.YEAR,(c.get(Calendar.YEAR)-10));
		Date date3 = c.getTime();
		c.set(Calendar.YEAR,(c.get(Calendar.YEAR)-10));
		Date date4 = c.getTime();
		CcmPeople people = new CcmPeople();
		String[] year = new String[5];
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy");
		people.setBeginBirthday(date1);
		year[4] = formatter.format(date1)+"-now";
		List<CcmPeople> list1 = ccmPeopleDao.peopleBirthdayCount(people);
		people.setBeginBirthday(date2);
		people.setEndBirthday(date1);
		year[3] = formatter.format(date2)+"-"+formatter.format(date1);
		List<CcmPeople> list2 = ccmPeopleDao.peopleBirthdayCount(people);
		people.setBeginBirthday(date3);
		people.setEndBirthday(date2);
		year[2] = formatter.format(date3)+"-"+formatter.format(date2);
		List<CcmPeople> list3 = ccmPeopleDao.peopleBirthdayCount(people);
		people.setBeginBirthday(date4);
		people.setEndBirthday(date3);
		year[1] = formatter.format(date4)+"-"+formatter.format(date3);
		List<CcmPeople> list4 = ccmPeopleDao.peopleBirthdayCount(people);
		people.setEndBirthday(date4);
		year[0] = "before-"+formatter.format(date4);
		List<CcmPeople> list5 = ccmPeopleDao.peopleBirthdayCount(people);
		List<Map<String, Object>> listData = new ArrayList<Map<String,Object>>();
		String[] dicts = new String[list.size()];
		int[] num;
		String value = null;
		int i = 0;
		for (SysDicts dict : list) {
			value = dict.getValue();
			dicts[i] = dict.getLabel();
			num = new int[5];
			for (CcmPeople p : list1) {
				if(value.equals(p.getSex())) {
					num[4] = p.getResultNum();
				}
			}
			for (CcmPeople p : list2) {
				if(value.equals(p.getSex())) {
					num[3] = p.getResultNum();
				}
			}
			for (CcmPeople p : list3) {
				if(value.equals(p.getSex())) {
					num[2] = p.getResultNum();
				}
			}
			for (CcmPeople p : list4) {
				if(value.equals(p.getSex())) {
					num[1] = p.getResultNum();
				}
			}
			for (CcmPeople p : list5) {
				if(value.equals(p.getSex())) {
					num[0] = p.getResultNum();
				}
			}
			Map<String, Object> temp = new HashMap<>();
			temp.put("name", dict.getLabel());
			temp.put("type", "bar");
			temp.put("data", num);
			listData.add(temp);
			i++;
		}
		Map<String, Object> result = new HashMap<>();
		result.put("yAxis", year);
		result.put("legend", dicts);
		result.put("value", listData);
		return result;
	}

	public Map<String, Object> peopleNationCount(List<SysDicts> list) {
		List<CcmPeople> getcount = ccmPeopleDao.peopleNationCount();
		List<Map<String, Object>> listData = new ArrayList<Map<String,Object>>();
		Map<String, Object> temp;
		for (CcmPeople p : getcount) {
			for (SysDicts dict : list) {
				if(dict.getValue().equals(p.getNation())) {
					temp = new HashMap<String, Object>();
					temp.put("name", dict.getLabel());
					temp.put("value", p.getResultNum());
					listData.add(temp);
				}
			}
		}
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("value", listData);
		return result;
	}

	public Map<String, Object> peopleAgeCount() {
		List<CcmPeople> agecount = ccmPeopleDao.peopleAgeCount();
		String[] agetitle = new String[5];
		int[] num = new int[5];
		agetitle[0] = "<15";
		agetitle[1] = "15-25";
		agetitle[2] = "25-35";
		agetitle[3] = "35-45";
		agetitle[4] = "45<";
		for (CcmPeople p : agecount) {
			if(p.getPeopleAge()<15) {
				num[0] = num[0]+p.getPeopleAge();
			}else if(p.getPeopleAge()>=15 && p.getPeopleAge()<25) {
				num[1] = num[1]+p.getPeopleAge();
			}else if(p.getPeopleAge()>=25 && p.getPeopleAge()<35) {
				num[2] = num[2]+p.getPeopleAge();
			}else if(p.getPeopleAge()>=35 && p.getPeopleAge()<45) {
				num[3] = num[3]+p.getPeopleAge();
			}else {
				num[4] = num[4]+p.getPeopleAge();
			}
		}
		List<Map<String, Object>> listData = new ArrayList<Map<String,Object>>();
		Map<String, Object> temp;
		int j = 0;
		for (int i : num) {
			temp = new HashMap<String, Object>();
			temp.put("name", agetitle[j]);
			temp.put("value", i);
			listData.add(temp);
			j++;
		}
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("name", agetitle);
		result.put("value", listData);
		return result;
	}

	public List<EchartType> peopleRegionCount() {
		 return ccmPeopleDao.peopleRegionCount();
	}

    public User judgeUserAreaPermission(String userId,String areaId,List parentIds) {
		return dao.judgeUserAreaPermission(userId,areaId,parentIds);
    }
    
    // 校园周边重点人员列表
 	public Page<CcmPeople> findAllPopByArea(Page<CcmPeople> page, CcmPeople ccmPeople) {
 		ccmPeople.setPage(page);
 		page.setList(ccmPeopleDao.findAllPopByArea(ccmPeople));
 		return page;
 	}
	public List<CcmPeopleVo> selectByAreaGIdAndName(CcmAreaPointVo areaPointVo){
		return dao.selectByAreaGIdAndName(areaPointVo);
	}

	public List<CcmPeopleVo> selectByAreaGIdAndNameImport(CcmAreaPointVo areaPointVo){
		return dao.selectByAreaGIdAndNameImport(areaPointVo);
	}

	public List<CcmPeople> findByRoomId(String roomId){
		return dao.findByRoomId(roomId);
	}

	public List<CcmPeople> findSuspect(CcmPeople ccmPeople) {
		return ccmPeopleDao.findSuspect(ccmPeople);
	}
	
	public CcmPeople getSuspect(CcmPeople ccmPeople) {
		return ccmPeopleDao.getSuspect(ccmPeople);
	}

	public Page<CcmPeople> findListexists(Page<CcmPeople> page, CcmPeople ccmPeople) {
		ccmPeople.setPage(page);
		page.setList(ccmPeopleDao.findListexists(ccmPeople));
		return page;
	}
	//人口导出数据查询
	public List<CcmPeople> getExportList(CcmPeople ccmPeople) {
		return ccmPeopleDao.getExportList(ccmPeople);
	}

	//重点人员top5
	public List<EchartType> getKeypeopleTop(){

		return ccmPeopleDao.getKeypeopleTop();
	}
	/**
	 * 获取吸毒人员
	 */
	public List<Object> getHouseDrugs() {
		List<Object> list = new ArrayList<>();
		Map<String, Object> mapDrugs = new HashMap<>();
		mapDrugs.put("isParent", true);
		mapDrugs.put("name", "吸毒人员");
		mapDrugs.put("pId", "-1");
		mapDrugs.put("id", "-2");
		mapDrugs.put("pIds", "0,-1");
		List<CcmHouseDrugs> houseDrugs = ccmHouseDrugsService.findList(new CcmHouseDrugs());
		//List<CcmPeople> peopleAll = ccmPeopleService.findSpeList(new CcmPeople()); //只获取重点人口的 其他的用户无需关联
		for (CcmHouseDrugs p : houseDrugs) {
			Map<String, Object> map = new HashMap<>();
			map.put("isParent", false);
			map.put("name", p.getName() + "(" + p.getIdent() + ")");
			map.put("pId", "-2");
			map.put("id", p.getPeopleId());
			map.put("pIds", "0,-1,-2");
			list.add(map);
		}
		list.add(mapDrugs);
		return list;
	}
	/**
	 *获取重点青少年
	 */
	public List<Object> getHouseKym() {
		List<Object> list = new ArrayList<>();
		Map<String, Object> mapKym = new HashMap<>();
		mapKym.put("isParent", true);
		mapKym.put("name", "重点青少年");
		mapKym.put("pId", "-1");
		mapKym.put("id", "-3");
		mapKym.put("pIds", "0,-1");
		List<CcmHouseKym> houseKyms = ccmHouseKymService.findList(new CcmHouseKym());
		for (CcmHouseKym kyms : houseKyms) {
			Map<String, Object> mapK = new HashMap<>();
			mapK.put("isParent", false);
			mapK.put("name", kyms.getName() + "(" + kyms.getIdent() + ")");
			mapK.put("pId", "-3");
			mapK.put("id", kyms.getPeopleId());
			mapK.put("pIds", "0,-1,-3");
			list.add(mapK);
		}
		list.add(mapKym);
		return list;
	}

	/**
	 * 安置帮教
	 * @return list
	 */
	public List<Object> getCcmHouseRelease() {
		List<Object> list = new ArrayList<>();
		Map<String, Object> mapRoot = new HashMap<>();
		mapRoot.put("isParent", true);
		mapRoot.put("name", "安置帮教");
		mapRoot.put("pId", "-1");
		mapRoot.put("id", "-3");
		mapRoot.put("pIds", "0,-1");
		List<CcmHouseRelease> houseReleases = ccmHouseReleaseService.findList(new CcmHouseRelease());
		for (CcmHouseRelease p : houseReleases) {
			Map<String, Object> map = new HashMap<>();
			map.put("isParent", false);
			map.put("name", p.getName() + "(" + p.getIdent() + ")");
			map.put("pId", "-3");
			map.put("id", p.getPeopleId());
			map.put("pIds", "0,-1,-3,");
			list.add(map);
		}
		list.add(mapRoot);
		return list;
	}
	/**
	 * 社区矫正
	 */
	public List<Object> getCcmHouseRectification() {
		List<Object> list = new ArrayList<>();
		Map<String, Object> mapRoot = new HashMap<>();
		mapRoot.put("isParent", true);
		mapRoot.put("name", "社区矫正");
		mapRoot.put("pId", "-1");
		mapRoot.put("id", "-4");
		mapRoot.put("pIds", "0,-1");
		List<CcmHouseRectification> houseRectifications = ccmHouseRectificationService.findList(new CcmHouseRectification());
		for (CcmHouseRectification p : houseRectifications) {
			Map<String, Object> map = new HashMap<>();
			map.put("isParent", false);
			map.put("name", p.getName() + "(" + p.getIdent() + ")");
			map.put("pId", "-4");
			map.put("id", p.getPeopleId());
			map.put("pIds", "0,-1,-4,");
			list.add(map);
		}
		list.add(mapRoot);
		return list;
	}
	/**
	 * 艾滋病患者
	 */
	public List<Object> getCcmHouseAids() {
		List<Object> list = new ArrayList<>();
		Map<String, Object> mapRoot = new HashMap<>();
		mapRoot.put("isParent", true);
		mapRoot.put("name", "艾滋病患者");
		mapRoot.put("pId", "-1");
		mapRoot.put("id", "-5");
		mapRoot.put("pIds", "0,-1");
		List<CcmHouseAids> ccmHouseAids = ccmHouseAidsService.findList(new CcmHouseAids());
		for (CcmHouseAids p : ccmHouseAids) {
			Map<String, Object> map = new HashMap<>();
			map.put("isParent", false);
			map.put("name", p.getName() + "(" + p.getIdent() + ")");
			map.put("pId", "-5");
			map.put("id", p.getPeopleId());
			map.put("pIds", "0,-1,-5,");
			list.add(map);
		}
		list.add(mapRoot);
		return list;
	}
	/**
	 * 危险品从业人员
	 */
	public List<Object> getCcmHouseDangerous() {
		List<Object> list = new ArrayList<>();
		Map<String, Object> mapRoot = new HashMap<>();
		mapRoot.put("isParent", true);
		mapRoot.put("name", "危险品从业人员");
		mapRoot.put("pId", "-1");
		mapRoot.put("id", "-6");
		mapRoot.put("pIds", "0,-1");
		List<CcmHouseDangerous> ccmHouseDangerous = ccmHouseDangerousService.findList(new CcmHouseDangerous());
		for (CcmHouseDangerous p : ccmHouseDangerous) {
			Map<String, Object> map = new HashMap<>();
			map.put("isParent", false);
			map.put("name", p.getName() + "(" + p.getIdent() + ")");
			map.put("pId", "-6");
			map.put("id", p.getPeopleId());
			map.put("pIds", "0,-1,-6,");
			list.add(map);
		}
		list.add(mapRoot);
		return list;
	}
	/**
	 * 涉教人员
	 */
	public List<Object> getCcmHouseHeresy() {
		List<Object> list = new ArrayList<>();
		Map<String, Object> mapRoot = new HashMap<>();
		mapRoot.put("isParent", true);
		mapRoot.put("name", "涉教人员");
		mapRoot.put("pId", "-1");
		mapRoot.put("id", "-7");
		mapRoot.put("pIds", "0,-1");
		List<CcmHouseHeresy> ccmHouseHeresy = ccmHouseHeresyService.findList(new CcmHouseHeresy());
		for (CcmHouseHeresy p : ccmHouseHeresy) {
			Map<String, Object> map = new HashMap<>();
			map.put("isParent", false);
			map.put("name", p.getName() + "(" + p.getIdent() + ")");
			map.put("pId", "-7");
			map.put("id", p.getPeopleId());
			map.put("pIds", "0,-1,-7,");
			list.add(map);
		}
		list.add(mapRoot);
		return list;
	}
	/**
	 * 重点上访
	 */
	public List<Object> getCcmHousePetition() {
		List<Object> list = new ArrayList<>();
		Map<String, Object> mapRoot = new HashMap<>();
		mapRoot.put("isParent", true);
		mapRoot.put("name", "重点上访");
		mapRoot.put("pId", "-1");
		mapRoot.put("id", "-8");
		mapRoot.put("pIds", "0,-1");
		List<CcmHousePetition> ccmHousePetition = ccmHousePetitionService.findList(new CcmHousePetition());
		for (CcmHousePetition p : ccmHousePetition) {
			Map<String, Object> map = new HashMap<>();
			map.put("isParent", false);
			map.put("name", p.getName() + "(" + p.getIdent() + ")");
			map.put("pId", "-8");
			map.put("id", p.getPeopleId());
			map.put("pIds", "0,-1,-8,");
			list.add(map);
		}
		list.add(mapRoot);
		return list;
	}
	/**
	 * 肇事肇祸等严重精神障碍患者人口
	 */
	public List<Object> getCcmHousePsychogeny() {
		List<Object> list = new ArrayList<>();
		Map<String, Object> mapRoot = new HashMap<>();
		mapRoot.put("isParent", true);
		mapRoot.put("name", "肇事肇祸等严重精神障碍患者人口");
		mapRoot.put("pId", "-1");
		mapRoot.put("id", "-9");
		mapRoot.put("pIds", "0,-1");
		List<CcmHousePsychogeny> ccmHousePsychogeny = ccmHousePsychogenyService.findList(new CcmHousePsychogeny());
		for (CcmHousePsychogeny p : ccmHousePsychogeny) {
			Map<String, Object> map = new HashMap<>();
			map.put("isParent", false);
			map.put("name", p.getName() + "(" + p.getIdent() + ")");
			map.put("pId", "-9");
			map.put("id", p.getPeopleId());
			map.put("pIds", "0,-1,-9,");
			list.add(map);
		}
		list.add(mapRoot);
		return list;
	}
	/**
	 *ccm_harm_national_security
	 * 有危害国家安全活动嫌疑的
	 */
	public List<Object> getCcmHarmNationalSecurity() {
		List<Object> list = new ArrayList<>();
		Map<String, Object> mapRoot = new HashMap<>();
		mapRoot.put("isParent", true);
		mapRoot.put("name", "有危害国家安全活动嫌疑的");
		mapRoot.put("pId", "-1");
		mapRoot.put("id", "-10");
		mapRoot.put("pIds", "0,-1");
		List<CcmHarmNationalSecurity> ccmHarmNationalSecurity = ccmHarmNationalSecurityService.findList(new CcmHarmNationalSecurity());
		for (CcmHarmNationalSecurity p : ccmHarmNationalSecurity) {
			Map<String, Object> map = new HashMap<>();
			map.put("isParent", false);
			map.put("name", p.getName() + "(" + p.getIdent() + ")");
			map.put("pId", "-10");
			map.put("id", p.getPeopleId());
			map.put("pIds", "0,-1,-10,");
			list.add(map);
		}
		list.add(mapRoot);
		return list;
	}
	/**
	 * 严重刑事犯罪活动嫌疑
	 */
	public List<Object> getCcmSeriousCriminalOffense() {
		List<Object> list = new ArrayList<>();
		Map<String, Object> mapRoot = new HashMap<>();
		mapRoot.put("isParent", true);
		mapRoot.put("name", "严重刑事犯罪活动嫌疑");
		mapRoot.put("pId", "-1");
		mapRoot.put("id", "-11");
		mapRoot.put("pIds", "0,-1");
		List<CcmSeriousCriminalOffense> ccmSeriousCriminalOffense = ccmSeriousCriminalOffenseService.findList(new CcmSeriousCriminalOffense());
		for (CcmSeriousCriminalOffense p : ccmSeriousCriminalOffense) {
			Map<String, Object> map = new HashMap<>();
			map.put("isParent", false);
			map.put("name", p.getName() + "(" + p.getIdent() + ")");
			map.put("pId", "-11");
			map.put("id", p.getPeopleId());
			map.put("pIds", "0,-1,-11,");
			list.add(map);
		}
		list.add(mapRoot);
		return list;
	}
	/**
	 * 故意违法
	 */
	public List<Object> getCcmHouseDeliberatelyIllegal() {
		List<Object> list = new ArrayList<>();
		Map<String, Object> mapRoot = new HashMap<>();
		mapRoot.put("isParent", true);
		mapRoot.put("name", "故意违法刑事不足5年");
		mapRoot.put("pId", "-1");
		mapRoot.put("id", "-12");
		mapRoot.put("pIds", "0,-1");
		List<CcmHouseDeliberatelyIllegal> ccmHouseDeliberatelyIllegal = ccmHouseDeliberatelyIllegalService.findList(new CcmHouseDeliberatelyIllegal());
		for (CcmHouseDeliberatelyIllegal p : ccmHouseDeliberatelyIllegal) {
			Map<String, Object> map = new HashMap<>();
			map.put("isParent", false);
			map.put("name", p.getName() + "(" + p.getIdent() + ")");
			map.put("pId", "-12");
			map.put("id", p.getPeopleId());
			map.put("pIds", "0,-1,-12,");
			list.add(map);
		}
		list.add(mapRoot);
		return list;
	}

	/**
	 * 搜索重点人口数据 专用接口
	 * @param type 重点人员 类别
	 * @param name 名字
	 * @return
	 */
	public List<CcmPeople> findListByName(String type,String name){
		return ccmPeopleDao.findListByName(type,name);
	}

	//宗教信徒人数
	public Integer statIndexForZj(Integer bid) {
		return 	ccmPeopleDao.peopleFollowerCount(bid);
	}

	//查询从业人员列
	public Page<CcmPeople> findPlaceOfPop(Page<CcmPeople> page, CcmPeople ccmPeople) {
		ccmPeople.setPage(page);
		page.setList(ccmPeopleDao.getPlaceOfPop(ccmPeople));
		return page;
	}

	//批量添加从业人员列
	public Page<CcmPeople> findPlaceOfPopAdd(Page<CcmPeople> page, CcmPeople ccmPeople) {
		ccmPeople.setPage(page);
		page.setList(ccmPeopleDao.findPlaceOfPopAdd(ccmPeople));
		return page;
	}

	public void deletePeopleOfHouse(String id, String houseId, String buildId, String netId) {
		CcmPeople ccmPeople = new CcmPeople();
		ccmPeople = get(id);
		String houseIdString = ccmPeople.getRoomId().getId();
		// ccmPeopleService.delete(ccmPeople);
		CcmPopTenant ccmPopTenant = new CcmPopTenant(); // 移除房屋ID
		ccmPeople.setRoomId(ccmPopTenant);
		// 修改记录表离开时间
		CcmTenantRecord ccmTenantRecord = new CcmTenantRecord();
		ccmTenantRecord.setHouseId(houseIdString);
		ccmTenantRecord.setIdCard(ccmPeople.getIdent());
		List<CcmTenantRecord> list = ccmTenantRecordService.findList(ccmTenantRecord);

		if (list.size() != 0) {
			for (int i = 0; i < list.size(); i++) {
				for (int j = 0; j < list.size() - i - 1; j++) {// 注意第二重循环的条件
					long a =list.get(j).getLiveDate().getTime();
					long b = list.get(j + 1).getLiveDate().getTime();
					if (a > b) {
						CcmTenantRecord temp = list.get(j);
						list.set(j, list.get(j + 1));
						list.set(j + 1, temp);
					}
				}
			}
			CcmTenantRecord ccmTenantRecord2 = list.get(list.size() - 1);
			ccmTenantRecord2.setLeaveDate(new Date());
			ccmTenantRecordService.save(ccmTenantRecord2);
		}

	}

	public List<CcmPeople> queryByIdent(String ident){
		return ccmPeopleDao.queryByIdent(ident);
	}

	//实有、流动、常住、重点、人口个数
	public SearchTab getCountPeople(){
		SearchTab countPeople = dao.getCountPeople();
		return countPeople;
	}

}