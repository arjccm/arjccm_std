/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.iot.warning.dao;

import java.util.List;
import java.util.Map;
import com.arjjs.ccm.common.persistence.CrudDao;
import com.arjjs.ccm.common.persistence.annotation.MyBatisDao;
import com.arjjs.ccm.modules.iot.warning.entity.CcmEarlyWarning;
import org.apache.ibatis.annotations.Param;

/**
 * 预警记录DAO接口
 * @author yiqingxuan
 * @version 2019-07-24
 */
@MyBatisDao
public interface CcmEarlyWarningDao extends CrudDao<CcmEarlyWarning> { 
	
	List<CcmEarlyWarning> getDataByToday();

    public List<Map<String, String>> getSortCountToday(CcmEarlyWarning ccmEarlyWarning);

    public List<Map<String, String>> getSortCountWeek(CcmEarlyWarning ccmEarlyWarning);
	/**
	 * 
	 * @Title: findPagegroupby
	 * @Description : 分组身份证号 查询
	 * @author：
	 * @date： 2019年7月30日上午8:42:26
	 * @param ccmEarlyWarning
	 * @return
	 */
	public List<CcmEarlyWarning> findPagegroupby(CcmEarlyWarning ccmEarlyWarning);
	
	/**
	 * 
	 * @Title: findListbyidcard
	 * @Description : 通过身份证号查询
	 * @author：
	 * @date： 2019年7月30日上午8:43:01
	 * @param ccmEarlyWarning
	 * @return
	 */
	public List<CcmEarlyWarning> findListbyidcard(CcmEarlyWarning ccmEarlyWarning);


	/*重点人员*/
	List<CcmEarlyWarning> findPersonal(@Param("time") String time, @Param("list") String[] list);

	List<CcmEarlyWarning> findPersonalKJ(@Param("time1") String time1, @Param("time2") String time2,@Param("list") String[] list);

	List<CcmEarlyWarning> findPersonalFu(@Param("list") String[] list,@Param("sj")String sj,@Param("zd")String zd,@Param("ld")String ld,@Param("qt")String qt);

	List<CcmEarlyWarning> findPersonalSearch(@Param("name") String name);


	/**
	 *  根据日期查询  人脸 车辆抓拍信息
	 * @param ccmEarlyWarning
	 * @return
	 */
	List<CcmEarlyWarning> findListbyalarmDate(CcmEarlyWarning ccmEarlyWarning);


}