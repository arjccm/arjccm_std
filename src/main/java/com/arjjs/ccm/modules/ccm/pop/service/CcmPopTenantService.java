/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.pop.service;

import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.service.CrudService;
import com.arjjs.ccm.common.utils.StringUtils;
import com.arjjs.ccm.modules.ccm.ccmsys.entity.CcmUploadLog;
import com.arjjs.ccm.modules.ccm.ccmsys.service.CcmUploadLogService;
import com.arjjs.ccm.modules.ccm.house.dao.CcmHouseBuildmanageDao;
import com.arjjs.ccm.modules.ccm.house.entity.CcmHouseBuildmanage;
import com.arjjs.ccm.modules.ccm.pop.dao.CcmPopTenantDao;
import com.arjjs.ccm.modules.ccm.pop.entity.CcmPeople;
import com.arjjs.ccm.modules.ccm.pop.entity.CcmPopTenant;
import com.arjjs.ccm.modules.ccm.sys.entity.CcmAreaPointVo;
import com.arjjs.ccm.modules.sys.entity.User;
import com.arjjs.ccm.modules.sys.utils.UserUtils;
import com.arjjs.ccm.tool.*;
import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 房屋Service
 * @author wwh
 * @version 2018-01-10
 */
@Service
@Transactional(readOnly = true)
public class CcmPopTenantService extends CrudService<CcmPopTenantDao, CcmPopTenant> {
	
	@Autowired
	private CcmPopTenantDao ccmPopTenantDao;

	@Autowired
	private CcmHouseBuildmanageDao ccmHouseBuildmanageDao;

	//上传上级平台记录
	@Autowired
	private CcmUploadLogService ccmUploadLogService;
	
	public CcmPopTenant get(String id) {
		return super.get(id);
	}
	
	public List<CcmPopTenant> findList(CcmPopTenant ccmPopTenant) {
		return super.findList(ccmPopTenant);
	}

	public List<CcmPopTenant> findListBylimit(CcmPopTenant ccmPopTenant) {
		return ccmPopTenantDao.findListBylimit(ccmPopTenant);
	}


	public Page<CcmPopTenant> findPage(Page<CcmPopTenant> page, CcmPopTenant ccmPopTenant) {
		return super.findPage(page, ccmPopTenant);
	}	
	
	public LayUIBean findListBuildData(CcmPopTenant ccmPopTenant) {
		LayUIBean result = new LayUIBean();
		List<CcmPopTenant> popTenantList = ccmPopTenantDao.findListOrderby(ccmPopTenant);
		if(popTenantList != null && popTenantList.size() > 0) {
			result.setCount(popTenantList.size());
			result.setData(popTenantList);
			result.setCode(Result.ERROR_OK);
			result.setMsg("");
		}else {
			result.setCode(Result.ERROR_PARAM);
		}
		return result;
	}
	
	//楼栋调用
	@Transactional(readOnly = false)
	public void saveBuild(CcmPopTenant ccmPopTenant) {
		boolean isNew = false;
		if (ccmPopTenant.getId() == null || "".equals(ccmPopTenant.getId())) {//无主键ID，则是新记录
			isNew = true;
		}
		if (ccmPopTenant.getIsNewRecord()) {//指定了是新增记录，则算新记录
			isNew = true;
		}

		//修改或新增时判断房屋的所属网格与楼栋是否一致，不一致则改成一致
		if(StringUtils.isNotBlank(ccmPopTenant.getBuildingId().getId())){
			CcmHouseBuildmanage build = ccmHouseBuildmanageDao.get(ccmPopTenant.getBuildingId().getId());
			if(StringUtils.isNotBlank(build.getArea().getId())){
				if(StringUtils.isNotBlank(ccmPopTenant.getArea().getId())){
					if(!ccmPopTenant.getArea().getId().equals(build.getArea().getId())){
						ccmPopTenant.setArea(build.getArea());
					}
				}else{
					ccmPopTenant.setArea(build.getArea());
				}
			}
		}

		super.save(ccmPopTenant);

		//上传上级平台记录
		if (!SysConfigInit.UPPER_URL.equals("")) {//有上级平台地址时，才存入上传上级平台记录的日志
			CcmUploadLog uploadLog = new CcmUploadLog();
			if (isNew) {//新增数据
				uploadLog.setOperateType("1");
				uploadLog.setRemarks("新增房屋数据：" + ccmPopTenant.getHouseBuild() + ", " + ccmPopTenant.getDoorNum());
			} else {//编辑数据
				uploadLog.setOperateType("2");
				uploadLog.setRemarks("编辑房屋数据：" + ccmPopTenant.getHouseBuild() + ", " + ccmPopTenant.getDoorNum());
			}
			uploadLog.setTableName("ccm_pop_tenant");
			uploadLog.setDataId(ccmPopTenant.getId());
			uploadLog.setUploadStatus("1");
			User user = UserUtils.getUser();
			if (user == null || StringUtils.isBlank(user.getId())){
				uploadLog.setCreateBy(new User("1"));
				uploadLog.setUpdateBy(new User("1"));
			}
			ccmUploadLogService.save(uploadLog);
		}
	}
	//楼栋调用
	@Transactional(readOnly = false)
	public void deleteBuild(CcmPopTenant ccmPopTenant) {
		super.delete(ccmPopTenant);
	}
	
	//楼栋房屋弹框
	@Transactional(readOnly = false)
	public List<CcmPopTenant> getHouseList(CcmPopTenant ccmPopTenant) {
		return ccmPopTenantDao.getHouseList(ccmPopTenant);
	}
	
	
	@Transactional(readOnly = false)
	public void save(CcmPopTenant ccmPopTenant) {
		boolean isNew = false;
		if (ccmPopTenant.getId() == null || "".equals(ccmPopTenant.getId())) {//无主键ID，则是新记录
			isNew = true;
		}
		if (ccmPopTenant.getIsNewRecord()) {//指定了是新增记录，则算新记录
			isNew = true;
		}

		//修改或新增时判断房屋的所属网格与楼栋是否一致，不一致则改成一致
		if(StringUtils.isNotBlank(ccmPopTenant.getBuildingId().getId())){
			CcmHouseBuildmanage build = ccmHouseBuildmanageDao.get(ccmPopTenant.getBuildingId().getId());
			if(StringUtils.isNotBlank(build.getArea().getId())){
				if(StringUtils.isNotBlank(ccmPopTenant.getArea().getId())){
					if(!ccmPopTenant.getArea().getId().equals(build.getArea().getId())){
						ccmPopTenant.setArea(build.getArea());
					}
				}else{
					ccmPopTenant.setArea(build.getArea());
				}
			}
		}

		super.save(ccmPopTenant);
		
		//上传上级平台记录
		if (!SysConfigInit.UPPER_URL.equals("")) {//有上级平台地址时，才存入上传上级平台记录的日志
			CcmUploadLog uploadLog = new CcmUploadLog();
			if (isNew) {//新增数据
				uploadLog.setOperateType("1");
				uploadLog.setRemarks("新增房屋数据：" + ccmPopTenant.getHouseBuild() + ", " + ccmPopTenant.getDoorNum());
			} else {//编辑数据
				uploadLog.setOperateType("2");
				uploadLog.setRemarks("编辑房屋数据：" + ccmPopTenant.getHouseBuild() + ", " + ccmPopTenant.getDoorNum());
			}
			uploadLog.setTableName("ccm_pop_tenant");
			uploadLog.setDataId(ccmPopTenant.getId());
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
	public void delete(CcmPopTenant ccmPopTenant) {
		super.delete(ccmPopTenant);

		//上传上级平台记录
		if (!SysConfigInit.UPPER_URL.equals("")) {//有上级平台地址时，才存入上传上级平台记录的日志
			CcmUploadLog uploadLog = new CcmUploadLog();
			uploadLog.setOperateType("3");
			uploadLog.setRemarks("删除房屋数据：" + ccmPopTenant.getHouseBuild() + ", " + ccmPopTenant.getDoorNum());
			uploadLog.setTableName("ccm_pop_tenant");
			uploadLog.setDataId(ccmPopTenant.getId());
			uploadLog.setUploadStatus("1");
			User user = UserUtils.getUser();
			if (user == null || StringUtils.isBlank(user.getId())){
				uploadLog.setCreateBy(new User("1"));
				uploadLog.setUpdateBy(new User("1"));
			}
			ccmUploadLogService.save(uploadLog);
		}
	}

	public List<CcmPopTenant> findAreaBuildTenantList(CcmPopTenant ccmPopTenant, String type) {
		
		return ccmPopTenantDao.findAreaBuildTenantList(ccmPopTenant,type);
	}
	
	// 获取当前楼栋内所有重点人员的房屋 ID List
	public List<String> getStringSpecial(CcmPopTenant ccmPopTenant){
		return ccmPopTenantDao.getStringSpecial(ccmPopTenant);
		
	}

	//首页社区弹框:出租屋总数
	public List<CcmPopTenant> findHouseRentArea(CcmPopTenant ccmPopTenant) {
		return ccmPopTenantDao.findHouseRentArea(ccmPopTenant);
	}

	//报表:楼栋房屋
	public List<SearchTabMore> findHouseAndBuild(SearchTabMore searchTabMore) {
		return ccmPopTenantDao.findHouseAndBuild(searchTabMore);
	}
	//app接口使用，通过roomId查对应社区及网格id
	public CcmPeople findAreaByRoom(CcmPopTenant ccmPopTenant) {
		return ccmPopTenantDao.findAreaByRoom(ccmPopTenant);
	}

	//街道信息-大屏-滨海新区社会网格化管理信息平台
	public List<SearchTab> findListAllData(CcmPopTenant ccmPopTenant) {
		return ccmPopTenantDao.findListAllData(ccmPopTenant);
	}

	//报表:房屋类型
	public List<EchartType> findHouseType() {
		return ccmPopTenantDao.findHouseType();
	}

	//房屋总数
	public int findListNum(CcmPopTenant ccmPopTenant) {
		return ccmPopTenantDao.findListNum(ccmPopTenant);
	}

	//房屋安全隐患统计
	public List<EchartType> getHouseHazard() {
		return ccmPopTenantDao.getHouseHazard();
	}

	//出租房数量-社区
	public int findListNumCommunity(CcmPopTenant ccmPopTenant) {
		return ccmPopTenantDao.findListNumCommunity(ccmPopTenant);
	}

	//重点人员More
	public List<SearchTabMM> getStringSpecialMore(CcmPopTenant ccmPopTenantDto) {
		return ccmPopTenantDao.getStringSpecialMore(ccmPopTenantDto);
	}
	public List<String> selectByBuildIdAndName(CcmAreaPointVo areaPointVo){
		return dao.selectByBuildIdAndName(areaPointVo);
	}

	public List<CcmPopTenant> findByTranceId(String tranceId){
	    return ccmPopTenantDao.findByTranceId(tranceId);
    }


    public Page<CcmPopTenant> findListId(Page<CcmPopTenant> page, CcmPopTenant ccmPopTenant){
		ccmPopTenant.setPage(page);
		return page.setList(ccmPopTenantDao.findListId(ccmPopTenant));
	}

	public List<CcmPopTenant> findListIdBylimit(CcmPopTenant ccmPopTenant){
		return ccmPopTenantDao.findListIdBylimit(ccmPopTenant);
	}


	public Page<CcmPopTenant> findList_V2(Page<CcmPopTenant> page, CcmPopTenant ccmPopTenant){
		ccmPopTenant.setPage(page);
		return page.setList(ccmPopTenantDao.findList_V2(ccmPopTenant));
	}


	//查询出租房屋数量
	public List<CcmPopTenant> findLet(CcmPopTenant ccmPopTenant) {
		return ccmPopTenantDao.findLet(ccmPopTenant);
	}


	//实有房屋个数
	public Integer houseCount(){
		return dao.houseCount();
	}

	//出租屋个数
	public Integer letCount(){
		return dao.letCount();
	}

	// 导入 查询全部
	public List<CcmPopTenant> queryAllForImport() {
		return ccmPopTenantDao.queryAllForImport();
	}

	public SearchTab getPopTenantNum(String areaId) {
		return ccmPopTenantDao.getPopTenantNum(areaId);
	}
}