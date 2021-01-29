/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.org.dao;

import com.arjjs.ccm.common.persistence.CrudDao;
import com.arjjs.ccm.common.persistence.annotation.MyBatisDao;
import com.arjjs.ccm.modules.ccm.org.entity.SysArea;
import com.arjjs.ccm.plugins.InterceptorEntity;
import com.arjjs.ccm.tool.EchartType;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 区域扩展表（区域查询）DAO接口
 * @author pengjianqiang
 * @version 2018-01-29
 */
@MyBatisDao
public interface SysAreaDao extends CrudDao<SysArea> {

	List<SysArea> queryBuildCollectStat(SysArea sysArea);
	List<SysArea> queryRoomCollectStat(SysArea sysArea);
	List<SysArea> queryPeopleCollectStat(SysArea sysArea);
	List<SysArea> queryNpseCollectStat(SysArea sysArea);
	List<SysArea> queryPlaceCollectStat(SysArea sysArea);
	List<SysArea> selectAreaByType(@Param("type") String type);
	List<SysArea> findByPid(SysArea area);

    List<String> selectAreaIdByParentIdAndId(InterceptorEntity interceptorEntity);

    //实有人口数据汇总（户籍）
    List<EchartType> ccmPeopleCountHj();
	//实有人口数据汇总（流动）
	List<EchartType> ccmPeopleCountLd();
	//重点人员区域分布TOP5
	List<EchartType> keyPeopleOfArea();
	//出租房区域分布TOP5
	List<EchartType> rentalHouseOfArea();
	//警力人员分布
	List<EchartType> policeForceDistribution();
	//警力设备监控设备分布
	List<EchartType> policeEquipmentMD();
	//警情区域分布TOP5
	List<EchartType> alarmOfArea();

	//警力总数
	Integer policeCount();
	//流动人员流入原因
	List<EchartType> listFlawService();

    List<SysArea> getAreaIdBytype();
}