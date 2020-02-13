/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.ccmsys.dao;

import com.arjjs.ccm.common.persistence.CrudDao;
import com.arjjs.ccm.common.persistence.annotation.MyBatisDao;
import com.arjjs.ccm.modules.ccm.ccmsys.entity.CcmMobileDevice;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 移动设备管理DAO接口
 * @author fu
 * @version 2018-04-20
 */
@MyBatisDao
public interface CcmMobileDeviceDao extends CrudDao<CcmMobileDevice> {

	CcmMobileDevice findByDeviceId(String deviceId);

	CcmMobileDevice findByDeviceIdAndUserId(@Param("deviceId") String deviceId, @Param("userId")String userId);

	//App电子围栏
	public int updateCoordinates(CcmMobileDevice ccmMobileDevice);

	//查询待上传的数据
	List<CcmMobileDevice> findListApp(CcmMobileDevice ccmMobileDevice);
	
	/**
	 * @desc 更新设备关联电子围栏信息
	 * @param ccmMobileDevice
	 * @author arj0704
	 * @return
	 */
	public int updateElecFenceId(CcmMobileDevice ccmMobileDevice);
	
	/**
	 * @desc 根据电子围栏id获取关联设备列表
	 * @param id
	 * @author arj0704
	 * @return
	 */
	List<CcmMobileDevice> findDeviceListByElecId(String id);
	
	
	/**
	 * @desc 根据设备标识、用户id获取其围栏规则及信息
	 * @param ccmMobileDevice
	 * @author arj0704
	 * @return
	 */
	CcmMobileDevice findAppElecInfoById(CcmMobileDevice ccmMobileDevice);

	
}