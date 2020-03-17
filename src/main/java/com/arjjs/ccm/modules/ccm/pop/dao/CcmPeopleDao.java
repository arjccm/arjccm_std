/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.pop.dao;

import com.arjjs.ccm.common.persistence.CrudDao;
import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.persistence.annotation.MyBatisDao;
import com.arjjs.ccm.modules.ccm.pop.entity.CcmPeople;
import com.arjjs.ccm.modules.ccm.pop.entity.CcmPeopleExport;
import com.arjjs.ccm.modules.ccm.pop.entity.CcmPeopleVo;
import com.arjjs.ccm.modules.ccm.sys.entity.CcmAreaPointVo;
import com.arjjs.ccm.modules.flat.analyst.entity.Count;
import com.arjjs.ccm.modules.sys.entity.User;
import com.arjjs.ccm.tool.EchartType;
import com.arjjs.ccm.tool.SearchTab;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 实有人口DAO接口
 *
 * @author liang
 * @version 2018-01-04
 */
@MyBatisDao
public interface CcmPeopleDao extends CrudDao<CcmPeople> {
	/**
	 * 绩效统计接口
	 * @return
	 */
	List<Count> getByCount();

	public List<EchartType> getListByMon(@Param("user") User user, @Param("ccmpeople") CcmPeople ccmpeople);

	public List<EchartType> getListByDay(@Param("user") User user, @Param(" ") CcmPeople ccmpeople);

	//人员信息弹框
	public CcmPeople getHousePopForm(CcmPeople ccmPeople);

	//getNation
	public String getNation(CcmPeople ccmPeople);

	//getRelation
	public String getRelation(CcmPeople ccmPeople);

	//楼栋-房屋-住户信息弹框
	public List<CcmPeople> getHousePopList(CcmPeople ccmPeople);

	//校园周边重点人员列表
	public List<CcmPeople> findPagePop(CcmPeople ccmPeople);

	//户籍户号调用
	public List<CcmPeople> listAccount(CcmPeople ccmPeople);

	// 查询指定的重点人员
	public List<CcmPeople> findSpeList(CcmPeople ccmPeople);

	// 查询指定的 人员身份证是否可以存入数据库
	public int checkPeopleIden(CcmPeople ccmPeople);

	//党员
	public List<CcmPeople> findCommunistList(CcmPeople ccmPeople);

	//老年人
	public List<CcmPeople> findOlderPage(CcmPeople ccmPeople);

	//特殊关怀First
	public List<CcmPeople> findCareFirst(CcmPeople ccmPeople);

	//特殊关怀
	public List<CcmPeople> findCareList(CcmPeople ccmPeople);
	
	//房屋人口添加
	public List<CcmPeople> housePopListAdd(CcmPeople ccmPeople);
	
	//导出特殊关怀查询
	public List<CcmPeopleExport> findAllCareList(CcmPeople ccmPeople);

	//特殊关怀人员数量
	public int findListNum(CcmPeople ccmPeople);

	//数组查询id
	public List<CcmPeople> findListLimite(CcmPeople ccmPeople2);

	//常住人口
	public List<CcmPeople> findPermanentList(CcmPeople ccmPeople);

	//常住人口
	public List<CcmPeople> findPermanentListBylimit(CcmPeople ccmPeople);

	//实有、流动、常住、重点、人口个数
	SearchTab getCountPeople();




	/**
	 * 区域内人员统计
	 */
	public int countSelect(List<String> coordianteList);

	/**
	 * zhanghao
	 *
	 * @param 事件周边嫌疑人
	 * @return
	 */
	public List<CcmPeople> locatingSuspects(List<String> coordianteList);

	//首页统计重点人员数量
	List<CcmPeople> findCountPeopleForType();

	//首页统计实有人口信息按type统计
	List<CcmPeople> findCountByType();

	//首页统计实有人口信息按 uniformlogo统计
	List<CcmPeople> findCountByUniformlogo();

	/**
	 * @return
	 * @see 根据周边人员政治面貌统计情况。
	 */
	List<EchartType> selectPopNumAllByPolitics();

	List<EchartType> selectPopNumAllByRectification();

	//数组查询id  V2版本
	public List<CcmPeople> findListLimite_V2(CcmPeople ccmPeople2);

	//
	List<CcmPeople> getByIdent(String string);

	public void updatePeople(CcmPeople ccmPeople);

	public int findCount();

	public CcmPeople getInfoBySnNum(String snNum);

	public List<CcmPeople> findListBuildBox(CcmPeople ccmPeople);

	public CcmPeople peopleSexCount(CcmPeople ccmPeople);

	public List<CcmPeople> peopleBirthdayCount(CcmPeople people);

	public List<CcmPeople> peopleNationCount();

	public List<CcmPeople> peopleAgeCount();

	public List<EchartType> peopleRegionCount();

	public User judgeUserAreaPermission(@Param("userId") String userId, @Param("areaId") String areaId,@Param("parentIds") List parentIds);
	
	//校园周边重点人员列表
	public List<CcmPeople> findAllPopByArea(CcmPeople ccmPeople);

	public List<CcmPeopleVo> selectByAreaGIdAndName(CcmAreaPointVo areaPointVo);

	public List<CcmPeopleVo> selectByAreaGIdAndNameImport(CcmAreaPointVo areaPointVo);

    /**
     * 查询房屋下面的人数
     * @param roomId
     * @return
     */
	List<CcmPeople> findByRoomId(String roomId);
	
	//查询嫌疑人
	public List<CcmPeople> findSuspect(CcmPeople ccmPeople);
	
	public CcmPeople getSuspect(CcmPeople ccmPeople);


	public List<CcmPeople> findListexists(CcmPeople ccmPeople);
	//导出人口数据查询
	public List<CcmPeople> getExportList(CcmPeople ccmPeople);

	//重点人员top5
	public List<EchartType> getKeypeopleTop();
	List<CcmPeople> findListByName(String key,String name);

	//查询从业人员列表
	public List<CcmPeople> getPlaceOfPop(CcmPeople ccmPeople);

	//批量添加从业人员列
	public List<CcmPeople> findPlaceOfPopAdd(CcmPeople ccmPeople);

	//信徒人数
     int peopleFollowerCount(@Param("bid")Integer bid);

	/**
	 * 根据户主身份证号码查询户主下的人员数据
	 * @param ident 身份证号码
	 * @return
	 */
	List<CcmPeople> queryByIdent(@Param("ident")String ident);


	//人口查询分页
	List<CcmPeople> findListBylimit(CcmPeople ccmPeople);
}