/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.ccmsys.service;

import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.service.CrudService;
import com.arjjs.ccm.common.utils.StringUtils;
import com.arjjs.ccm.modules.ccm.ccmsys.dao.CcmDeviceDao;
import com.arjjs.ccm.modules.ccm.ccmsys.entity.CcmAreaDev;
import com.arjjs.ccm.modules.ccm.ccmsys.entity.CcmDevice;
import com.arjjs.ccm.modules.ccm.ccmsys.entity.CcmDeviceArea;
import com.arjjs.ccm.modules.ccm.org.entity.CcmOrgArea;
import com.arjjs.ccm.modules.ccm.org.entity.SysArea;
import com.arjjs.ccm.modules.ccm.org.service.CcmOrgAreaService;
import com.arjjs.ccm.modules.ccm.org.service.SysAreaService;
import com.arjjs.ccm.modules.ccm.pop.entity.CcmAreaPoint;
import com.arjjs.ccm.modules.ccm.sys.dao.SysConfigDao;
import com.arjjs.ccm.modules.ccm.sys.entity.CcmAreaPointVo;
import com.arjjs.ccm.modules.ccm.sys.entity.SysConfig;
import com.arjjs.ccm.modules.ccm.videoData.entity.CcmTiandyOnlineStatus;
import com.arjjs.ccm.modules.sys.entity.Area;
import com.arjjs.ccm.modules.sys.entity.Dict;
import com.arjjs.ccm.modules.sys.utils.DictUtils;
import com.arjjs.ccm.tool.EchartType;
import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/**
 * 设备管理Service
 * @author arj
 * @version 2018-01-25
 */
@Service
@Transactional(readOnly = true)
public class CcmDeviceService extends CrudService<CcmDeviceDao, CcmDevice> {

	@Autowired
	private CcmDeviceDao ccmDeviceDao;

	@Autowired
	private SysConfigDao sysConfigDao;
	@Autowired
	private SysAreaService sysAreaService;

	@Autowired
	private CcmOrgAreaService ccmOrgAreaService;

	public CcmDevice get(String id) {
		return super.get(id);
	}
	
	public List<CcmDevice> findList(CcmDevice ccmDevice) {
		return super.findList(ccmDevice);
	}
	
	public Page<CcmDevice> findPage(Page<CcmDevice> page, CcmDevice ccmDevice) {
		return super.findPage(page, ccmDevice);
	}
	
	@Transactional(readOnly = false)
	public void save(CcmDevice ccmDevice) {
		super.save(ccmDevice);
	}
	
	@Transactional(readOnly = false)
	public void delete(CcmDevice ccmDevice) {
		super.delete(ccmDevice);
	}
	
	@Transactional(readOnly = false)
	public boolean updateCoordinates(CcmDevice ccmDevice){
		return ccmDeviceDao.updateCoordinates(ccmDevice)>0;
	}
	
	@Transactional(readOnly = false)
	public boolean updateDeviceArea(CcmDevice ccmDevice){
		return ccmDeviceDao.updateDeviceArea(ccmDevice)>0;
	}

	public CcmDevice getByIp(String ip) {
		return ccmDeviceDao.getByIp(ip);
	}
	
	public CcmDevice getByCode(String cameraCode) {
		return ccmDeviceDao.getByCode(cameraCode);
	}

	//<!-- 视频安装范围分类 -->
	public List<EchartType> selectByInstallType(){
		return dao.selectByInstallType();
	}
	//	<!-- 视频每年布控趋势 -->
	public List<EchartType> selectByCreateDate(){
		return  dao.selectByCreateDate();
	}
	//<!-- 监控设备类型 -->
	public List<EchartType> selectByType(){
		return  dao.selectByType();
	}
	//<!-- 监控设备状态 -->
	public List<EchartType> selectByStatus(){
		List<EchartType> list = dao.selectByStatus();
		List<Dict> dicts = DictUtils.getDictList("ccm_device_status");
		List<EchartType> result = new ArrayList<>();
		int sum = 0;
		for(Dict dict:dicts){
			EchartType echartType = new EchartType();
			echartType.setType("监控设备"+ dict.getLabel() +"数");
			for(EchartType e:list){
				if(StringUtils.isNotEmpty(e.getTypeO())){
					if(dict.getValue().equals(e.getTypeO())){
						echartType.setValue(e.getValue());
					}
				}
			}
			if(StringUtils.isEmpty(echartType.getValue())){
				echartType.setValue("0");
			}
			result.add(echartType);
		}
		for(EchartType e:list){
			sum = sum + Integer.parseInt(e.getValue());
		}
		EchartType total = new EchartType();
		total.setType("监控设备总数");
		total.setValue(String.valueOf(sum));
		result.add(0,total);
		return  result;
	}
	// <!-- 视频区域分布 by maoxb 2020-02-16-->
	public List<EchartType> selectDevAreaInfo(){


		SysConfig system_level = sysConfigDao.get("system_level");
		//系统应用级别：1街道；2区县；3市
		String paramStr = system_level.getParamStr();
		String sysConf = "5";
		if ("1".equals(paramStr)){
			sysConf= "6";
		}else{
			sysConf = "5";
		}
		//查出所有视频所属区域；
		List<CcmAreaDev> devAreaList = dao.selectDevAreaInfo();

		//递归视频找出对应的大区；统计数量
		List<EchartType> devAreaCount = this.groupA(devAreaList,sysConf);

		return devAreaCount;
	}

	/**
	 *  分组统计区域视频
	 * @param list 设备中视频集合
	 * @param sysConf 系统配置级别
	 * @return
	 */
	public List<EchartType> groupA(List<CcmAreaDev> list, String sysConf) {
		Map<String, Integer> map = new HashMap<>();
		if (null == list ) {
			return null;
		}
		String key;
		for (CcmAreaDev val : list) {
			key = val.getAreaName();
			Integer listTmp =  map.get(key) == null ? 0: map.get(key);
			if (0 == listTmp && val.getType().equals(sysConf)) {
				map.put(key, 1);
			}
			if(0 == listTmp && !val.getType().equals(sysConf)){
				SysArea parentDevInfo = this.getParentDevInfo(val.getParentId(), sysConf);
				if (parentDevInfo==null)
					continue;
				key = parentDevInfo.getName();
				listTmp =  map.get(key) == null ? 0: map.get(key);
				listTmp++;
				map.put(key, listTmp);
			}
			if(0 != listTmp){
				listTmp++;
				map.put(key, listTmp);
			}
		}
		List<EchartType> resultList = new ArrayList<>();

		for (Map.Entry<String, Integer> entry : map.entrySet()) {
			EchartType resultETC = new EchartType();
			resultETC.setType(entry.getKey());
			resultETC.setValue(entry.getValue().toString());
			resultList.add(resultETC);
		}
		return  resultList;
	}

	/**
	 * 递归寻找父区域
	 * @param id
	 * @param sysConf
	 * @return
	 */
	private SysArea getParentDevInfo(String id,String sysConf) {
		SysArea area = sysAreaService.get(id);
		if (area != null && !area.getType().equals(sysConf)){
			getParentDevInfo(area.getParent().getId(), sysConf);
		}
		return area;
	}

	// <!-- 视频区域分布-->
	public List<EchartType> selectDeviceByArea(){

		SysConfig system_level = sysConfigDao.get("system_level");
		//系统应用级别：1街道；2区县；3市
		String paramStr = system_level.getParamStr();
		List<EchartType> resultEchar = new ArrayList<>();
		List<String> diffrent= new ArrayList<>();
		if ("1".equals(paramStr)){//县级市
			List<EchartType> echartTypeList = dao.selectDeviceByArea();
			List<String> sysAreas = sysAreaService.selectAreaByType("6");
			List<String> newStr= new ArrayList<>();
			if (echartTypeList.size() != sysAreas.size()){
				for (EchartType echartType:  echartTypeList) {
					resultEchar.add(echartType);
					newStr.add(echartType.getType());
				}
				diffrent  = getDiffrent(newStr,sysAreas);
				System.out.println(diffrent);

			}
		}
		if ("2".equals(paramStr)){//地级市
			List<EchartType> echartTypeList = dao.selectDeviceByAreaYa();
			List<String> sysAreas = sysAreaService.selectAreaByType("5");
			List<String> newStr= new ArrayList<>();
			if (echartTypeList.size() != sysAreas.size()){
				for (EchartType echartType:  echartTypeList) {
					resultEchar.add(echartType);
					newStr.add(echartType.getType());
				}
				diffrent  = getDiffrent(newStr,sysAreas);
				System.out.println(diffrent);

			}
		}
		for (String str:diffrent) {
			EchartType echartType = new EchartType();
			echartType.setType(str);
			echartType.setValue("0");
			resultEchar.add(echartType);
		}
		return  resultEchar;
	}
	private static List<String> getDiffrent(List<String> list1, List<String> list2) {
		long st = System.nanoTime();
		Map<String,Integer> map = new HashMap<String,Integer>(list1.size()+list2.size());
		List<String> diff = new ArrayList<String>();
		for (String string : list1) {
			map.put(string, 1);
		}
		for (String string : list2) {
			Integer cc = map.get(string);
			if(cc!=null){
				map.put(string, ++cc);
				continue;
			}
			map.put(string, 1);
		}
		for(Map.Entry<String, Integer> entry:map.entrySet()){
			if(entry.getValue()==1){
				diff.add(entry.getKey());
			}
		}
		return diff;
	}

	public List<CcmAreaPoint> selectByAreaGIdAndName(CcmAreaPointVo areaPointVo) {
		return dao.selectByAreaGIdAndName(areaPointVo);
	}
	List<CcmTiandyOnlineStatus> findIdAndStatus() {
		return dao.findIdAndStatus();
	}
}