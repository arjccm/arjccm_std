package com.arjjs.ccm.modules.dma.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.common.collect.Maps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.arjjs.ccm.common.service.BaseService;
import com.arjjs.ccm.common.utils.StringUtils;
import com.arjjs.ccm.modules.dma.dao.DmaThreeRealDataAnalysisDao;
import com.arjjs.ccm.modules.dma.entity.ResidentStatisticsCount;
import com.arjjs.ccm.modules.sys.entity.Area;
import com.arjjs.ccm.modules.sys.entity.Dict;
import com.arjjs.ccm.modules.sys.service.AreaService;
import com.arjjs.ccm.modules.sys.utils.DictUtils;
import com.arjjs.ccm.tool.EchartType;

/**
 * 三实数据分析业务逻辑层
 * @author jiaopanyu
 * @version 2019-09-04
 */
@Service
@Transactional(readOnly = true)
public class DmaThreeRealDataAnalysisService extends BaseService {
	@Autowired
	private AreaService areaService;
	@Autowired
	protected DmaThreeRealDataAnalysisDao dao;
	/**
	 * 各区域人口类型统计
	 * @return
	 */
	public Map<String, Object> findResidentStatisticsData() {
		List<Dict> dictList = DictUtils.getDictList("sys_ccm_people");
		Area area = new Area();
		area.setType("5");
		List<Area> areaList = areaService.findList(area);
		List<ResidentStatisticsCount> dataResidentList = dao.findResidentData(null);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<String> areaMap = new ArrayList<String>();
		for (Area areaO : areaList) {
			areaMap.add(areaO.getName());
		}
		Map<Integer, Object> dataMap = new HashMap<Integer, Object>();
		for (int i = 1; i <= 12; i++) {			
			Map<String, Object> typeMap = new HashMap<String, Object>();
			for (Dict dictData : dictList) {
				int[] typeCount =new int[areaList.size()]; 
				String value = dictData.getValue();
				for (int j = 0; j < areaList.size(); j++) {
					String id = areaList.get(j).getId();
					for (ResidentStatisticsCount dataResident : dataResidentList) {
						int mouth = Integer.parseInt(dataResident.getDateMouth());
						if(mouth == i) {
							String peopleType = dataResident.getPeopleType();
							if(peopleType.equals(value)) {								
								String parentIds = dataResident.getAreaParentIds();							
								if(StringUtils.isNotBlank(id) && StringUtils.isNotBlank(parentIds) && parentIds.indexOf(id) > -1) {
									typeCount[j] += dataResident.getDataNum().intValue();
									break;
								}
							}
						}
					}
				}
				typeMap.put(value, typeCount);
			}
			dataMap.put(i, typeMap);
		}
		resultMap.put("dataType", dictList);
		resultMap.put("dataArea", areaMap);
		resultMap.put("data", dataMap);
		return resultMap;
	}
	/**
	 * 各区域人口性别统计
	 * @return
	 */
	public Map<String, Object> findSexStatisticsData() {
		//查询对应字典数据
		List<Dict> dictList = DictUtils.getDictList("sex");
		Area area = new Area();
		area.setType("5");
		//查询type=5的区域数据
		List<Area> areaList = areaService.findList(area);
		//查询社区村对应的数据
		List<ResidentStatisticsCount> dataResidentList = dao.findSexData(null);
		//定义返回结果集
		Map<String, Object> resultMap = new HashMap<String, Object>();
		//定义echarts图的label集合并将区域名称赋值
		List<String> areaMap = new ArrayList<String>();
		for (Area areaO : areaList) {
			areaMap.add(areaO.getName());
		}
		Map<Integer, Object> dataMap = new HashMap<Integer, Object>();
		for (int i = 1; i <= 4; i++) {			
			Map<String, Object> typeMap = new HashMap<String, Object>();
			for (Dict dictData : dictList) {
				int[] typeCount =new int[areaList.size()]; 
				String value = dictData.getValue();
				for (int j = 0; j < areaList.size(); j++) {
					String id = areaList.get(j).getId();
					for (ResidentStatisticsCount dataResident : dataResidentList) {
						int quarter = Integer.parseInt(dataResident.getDateQuarter());
						if(quarter == i) {
							String peopleType = dataResident.getPeopleType();
							if(value.equals(peopleType)) {
								String parentIds = dataResident.getAreaParentIds();							
								if(StringUtils.isNotBlank(id) && StringUtils.isNotBlank(parentIds) && parentIds.indexOf(id) > -1) {
									typeCount[j] += dataResident.getDataNum().intValue();
									break;
								}
							}
						}
					}
				}
				typeMap.put(value, typeCount);
			}
			dataMap.put(i, typeMap);
		}
		resultMap.put("dataType", dictList);
		resultMap.put("dataArea", areaMap);
		resultMap.put("data", dataMap);
		return resultMap;
	}
	/**
	 * 房屋产权类别分布统计
	 * @return
	 */
	public List<EchartType> findHousePropertyData() {
		List<EchartType> resultList = dao.findHousePropertyData(null);
		return resultList;
	}
	/**
	 * 房屋建筑用途分布统计
	 * @return
	 */
	public List<EchartType> findHousePrupData() {
		List<EchartType> resultList = dao.findHousePrupData(null);
		return resultList;
	}
	/**
	 * 房屋建成年限统计
	 * @return
	 */
	public List<EchartType> findHouseYearData() {
		List<EchartType> resultList = dao.findHouseYearData(null);
		return resultList;
	}
	/**
	 * 房屋区域分布统计
	 * @return
	 */
	public List<EchartType> findHouseAreaData() {
		Area area = new Area();
		area.setType("5");
		List<Area> areaList = areaService.findList(area);
		List<ResidentStatisticsCount> dataHouseAreaList = dao.findHouseAreaData(null);
		Map<String,Object> map = Maps.newHashMap();
		for(ResidentStatisticsCount dataHouseArea : dataHouseAreaList){
			if(map.containsKey(dataHouseArea.getAreaId())){
				ResidentStatisticsCount count = (ResidentStatisticsCount)map.get(dataHouseArea.getAreaId());
				count.setAreaParentIds(dataHouseArea.getAreaParentIds()!=null? dataHouseArea.getAreaParentIds():"");
				count.setDataNum(count.getDataNum()+1);
				map.put(dataHouseArea.getAreaId(),count);
			} else {
				ResidentStatisticsCount count = new ResidentStatisticsCount();
				count.setAreaParentIds(dataHouseArea.getAreaParentIds()!=null? dataHouseArea.getAreaParentIds():"");
				count.setDataNum(1);
				map.put(dataHouseArea.getAreaId(),count);
			}
		}
		List<EchartType> resultList = new ArrayList<EchartType>();
		for (Area areaO : areaList) {
			String id = areaO.getId();
			int value = 0;
			for(Map.Entry<String, Object> entry:map.entrySet()){
				ResidentStatisticsCount count = (ResidentStatisticsCount)entry.getValue();
				String parentIds = count.getAreaParentIds();
				if(StringUtils.isNotEmpty(parentIds) && parentIds.indexOf(id) > -1) {
					value += count.getDataNum().intValue();
				}
			}

			EchartType echartType = new EchartType();
			echartType.setValue(String.valueOf(value));
			echartType.setType(areaO.getName());
			resultList.add(echartType);
		}
		return resultList;
	}
	/**
	 * 房屋结构类型统计
	 * @return
	 */
	public List<EchartType> findHouseStructureData() {
		List<EchartType> resultList = dao.findHouseStructureData(null);
		return resultList;
	}
}
