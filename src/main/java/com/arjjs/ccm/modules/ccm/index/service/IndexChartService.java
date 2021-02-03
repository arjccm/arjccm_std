package com.arjjs.ccm.modules.ccm.index.service;

import java.text.SimpleDateFormat;
import java.util.*;

import com.arjjs.ccm.modules.sys.entity.Area;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.arjjs.ccm.modules.ccm.event.dao.CcmEventAmbiDao;
import com.arjjs.ccm.modules.ccm.event.dao.CcmEventIncidentDao;
import com.arjjs.ccm.modules.ccm.event.entity.CcmEventAmbi;
import com.arjjs.ccm.modules.ccm.event.entity.CcmEventIncident;
import com.arjjs.ccm.modules.ccm.house.dao.CcmHouseBuildmanageDao;
import com.arjjs.ccm.modules.ccm.house.dao.CcmHouseSchoolrimDao;
import com.arjjs.ccm.modules.ccm.house.entity.CcmHouseBuildmanage;
import com.arjjs.ccm.modules.ccm.house.entity.CcmHouseSchoolrim;
import com.arjjs.ccm.modules.ccm.line.dao.CcmLineProtectDao;
import com.arjjs.ccm.modules.ccm.line.entity.CcmLineProtect;
import com.arjjs.ccm.modules.ccm.org.dao.CcmOrgNpseDao;
import com.arjjs.ccm.modules.ccm.org.entity.CcmOrgNpse;
import com.arjjs.ccm.modules.ccm.place.base.dao.CcmBasePlaceDao;
import com.arjjs.ccm.modules.ccm.place.base.entity.CcmBasePlace;
import com.arjjs.ccm.modules.ccm.pop.dao.CcmPeopleDao;
import com.arjjs.ccm.modules.ccm.pop.dao.CcmPopTenantDao;
import com.arjjs.ccm.modules.ccm.pop.dao.CcmRoadAddressDao;
import com.arjjs.ccm.modules.ccm.pop.entity.CcmPeople;
import com.arjjs.ccm.modules.ccm.pop.entity.CcmPopTenant;
import com.arjjs.ccm.modules.ccm.pop.entity.CcmRoadAddress;
import com.arjjs.ccm.modules.ccm.view.dao.VCcmTeamDao;
import com.arjjs.ccm.modules.ccm.view.entity.VCcmTeam;
import com.arjjs.ccm.tool.EchartType;
import com.arjjs.ccm.tool.LayUIBean;
import com.google.common.collect.Lists;

@Service
@Transactional(readOnly = true)
public class IndexChartService {

	@Autowired
	private CcmEventAmbiDao ccmEventAmbiDao;
	@Autowired
	private VCcmTeamDao vCcmTeamDao;
	@Autowired
	private CcmOrgNpseDao ccmOrgNpseDao;
	@Autowired
	private CcmEventIncidentDao ccmEventIncidentDao;
	@Autowired
	private CcmLineProtectDao ccmLineProtectDao;
	@Autowired
	private CcmPeopleDao ccmPeopleDao;
	@Autowired
	private CcmPopTenantDao ccmPopTenantDao;
	@Autowired
	private CcmHouseBuildmanageDao buildmanageDao;
	@Autowired
	private CcmHouseSchoolrimDao ccmHouseSchoolrimDao;
	@Autowired
	private CcmRoadAddressDao ccmRoadAddressDao;
	@Autowired
	private CcmBasePlaceDao ccmBasePlaceDao;

	public List<EchartType> oneYearSolveEvent() {
		CcmEventAmbi ccmEventAmbi = new CcmEventAmbi();
		Calendar dateCalendar = Calendar.getInstance();
		dateCalendar.set(dateCalendar.get(Calendar.YEAR) - 1, dateCalendar.get(Calendar.MONTH) + 1, 1, 0, 0, 0);
		ccmEventAmbi.setBeginSendDate(dateCalendar.getTime());
		dateCalendar.add(Calendar.YEAR, 1);
		dateCalendar.add(Calendar.SECOND, -1);
		ccmEventAmbi.setEndSendDate(dateCalendar.getTime());
		List<EchartType> list = ccmEventAmbiDao.stateEventOneYear(ccmEventAmbi);
		List<EchartType> result = Lists.newArrayList();
		dateCalendar.setTime(ccmEventAmbi.getBeginSendDate());
		int count = 0;
		boolean flag = true;
		for (int i = 0; i < 12; i++) {
			StringBuffer t = new StringBuffer();
			t.append(dateCalendar.get(Calendar.YEAR));
			t.append("-");
			t.append(dateCalendar.get(Calendar.MONTH) + 1);
			dateCalendar.add(Calendar.MONTH, 1);
			if (flag && list.size()>0 && t.toString().equals(list.get(count).getType())) {
				result.add(list.get(count));
				if (count == list.size() - 1) {
					flag = false;
				}
				count++;
			} else {
				EchartType e = new EchartType();
				e.setType(t.toString());
				e.setValue("0");
				e.setValue1("0");
				result.add(e);
			}
		}
		return result;
	}

	public LayUIBean indexChartService(String parentIds) {
		LayUIBean result = new LayUIBean();
		List<CcmEventAmbi> list = ccmEventAmbiDao.findCountByStatus(parentIds);
		result.setCode("0");
		result.setCount(list.size());
		result.setData(list);
		result.setMsg("");
		return result;
	}

	public LayUIBean findOfficeCount() {
		LayUIBean result = new LayUIBean();
		List<CcmEventAmbi> list = ccmEventAmbiDao.findOfficeCount();
		result.setCode("0");
		result.setCount(list.size());
		result.setData(list);
		result.setMsg("");
		return result;
	}

	public LayUIBean findTeamCount() {
		LayUIBean result = new LayUIBean();
		List<VCcmTeam> list = vCcmTeamDao.findTeamCount();
		result.setCode("0");
		result.setCount(list.size());
		result.setData(list);
		result.setMsg("");
		return result;
	}

	public LayUIBean findCountByCompType(String parentIds) {
		LayUIBean result = new LayUIBean();
		List<CcmOrgNpse> list = ccmOrgNpseDao.findCountByCompType(parentIds);
		result.setCode("0");
		result.setCount(list.size());
		result.setData(list);
		result.setMsg("");
		return result;
	}

	public LayUIBean findCountLineProtect() {
		LayUIBean result = new LayUIBean();
		List<CcmEventIncident> list = ccmEventIncidentDao.findCountLineProtect();
		result.setCode("0");
		result.setCount(list.size());
		result.setData(list);
		result.setMsg("");
		return result;
	}

	public LayUIBean findCountLine() {
		LayUIBean result = new LayUIBean();
		List<CcmLineProtect> list = ccmLineProtectDao.findCountLine();
		result.setCode("0");
		result.setCount(list.size());
		result.setData(list);
		result.setMsg("");
		return result;
	}

	public LayUIBean findCountSchoolPeople() {
		LayUIBean result = new LayUIBean();
		List<CcmEventIncident> list = ccmEventIncidentDao.findCountSchoolPeople();
		result.setCode("0");
		result.setCount(list.size());
		result.setData(list);
		result.setMsg("");
		return result;
	}

	public LayUIBean findCountSchool() {
		LayUIBean result = new LayUIBean();
		CcmHouseSchoolrim schoolrim = new CcmHouseSchoolrim();
		List<CcmHouseSchoolrim> list = ccmHouseSchoolrimDao.findList(schoolrim);
		result.setCode("0");
		result.setCount(list.size());
		result.setData(list);
		result.setMsg("");
		return result;
	}

	public LayUIBean findCountPeopleForType(String parentIds) {
		LayUIBean result = new LayUIBean();
		List<CcmPeople> list = ccmPeopleDao.findCountPeopleForType(parentIds);
		result.setCode("0");
		result.setCount(list.size());
		result.setData(list);
		result.setMsg("");
		return result;
	}

	public LayUIBean findCountByType(String parentIds) {
		LayUIBean result = new LayUIBean();
		List<CcmPeople> list = ccmPeopleDao.findCountByType(parentIds);
		result.setCode("0");
		result.setCount(list.size());
		result.setData(list);
		result.setMsg("");
		return result;
	}

	public LayUIBean findCountByUniformlogo(String parentIds) {
		LayUIBean result = new LayUIBean();
		List<CcmPeople> list = ccmPeopleDao.findCountByUniformlogo(parentIds);
		result.setCode("0");
		result.setCount(list.size());
		result.setData(list);
		result.setMsg("");
		return result;
	}

	public LayUIBean findCountByHouseType(String parentIds) {
		LayUIBean result = new LayUIBean();
		List<CcmPopTenant> list = ccmPopTenantDao.findCountByHouseType(parentIds);
		result.setCode("0");
		result.setCount(list.size());
		result.setData(list);
		result.setMsg("");
		return result;
	}

	public LayUIBean findCountByRentPur(String parentIds) {
		LayUIBean result = new LayUIBean();
		List<CcmPopTenant> list = ccmPopTenantDao.findCountByRentPur(parentIds);
		result.setCode("0");
		result.setCount(list.size());
		result.setData(list);
		result.setMsg("");
		return result;
	}

	public LayUIBean findCountAddressLibrary(String parentIds) {
		LayUIBean result = new LayUIBean();
		List<CcmHouseBuildmanage> list = buildmanageDao.findCountAddressLibrary(parentIds);
		result.setCode("0");
		result.setCount(list.size());
		result.setData(list);
		result.setMsg("");
		return result;
	}

/*	public LayUIBean findCountByHousePrup() {
		LayUIBean result = new LayUIBean();
		List<CcmPopTenant> list = ccmPopTenantDao.findCountByHousePrup();
		result.setCode("0");
		result.setCount(list.size());
		result.setData(list);
		result.setMsg("");
		return result;
	}*/

	public LayUIBean findCountByconstruction(String parentIds) {
		LayUIBean result = new LayUIBean();
		List<CcmHouseBuildmanage> list = buildmanageDao.findCountAddressLibrary(parentIds);
		result.setCode("0");
		for (CcmHouseBuildmanage ccmHouseBuildmanage : list) {
			if("buildmanage".equals(ccmHouseBuildmanage.getName())) {
				result.setCount(Integer.parseInt(ccmHouseBuildmanage.getCount()));
			}
		}
		result.setData(list);
		result.setMsg("");
		return result;
	}

	public LayUIBean streetRoadLane() {
		LayUIBean result = new LayUIBean();
		List<CcmRoadAddress> list = ccmRoadAddressDao.findList(new CcmRoadAddress());
		result.setCode("0");
		result.setCount(list.size());
		result.setData(list);
		result.setMsg("");
		return result;
	}

	public LayUIBean findKeyPlace() {
		LayUIBean result = new LayUIBean();
		List<CcmBasePlace> list = ccmBasePlaceDao.findList(new CcmBasePlace());
		result.setCode("0");
		result.setCount(list.size());
		result.setData(list);
		result.setMsg("");
		return result;
	}

	public List<CcmPeople> findPeopleCountByAllType() {
		List<CcmPeople> one = ccmPeopleDao.findCountByTypeNoArea();
		List<CcmPeople> two = ccmPeopleDao.findCountByUniformlogoNoArea();
		for(CcmPeople count:two){
			if("02".equals(count.getUniformlogo())){
				one.add(count);
			}
		}
		return one;
	}

	public Map<String, Object> getPeopleCountByArea() {
		Map<String, Object> result = new HashMap<>();
		List<EchartType> list = ccmPeopleDao.getPeopleCountByArea();
		String[] legend = new String[]{"实有人口","流动人员"};
		List<Integer> barNum = new ArrayList<>();
		List<Integer> lineNum = new ArrayList<>();
		List<String> xdata = new ArrayList<>();
		int barMax = 100;
		int lineMax = 100;
		for(int i=0 ; i<list.size() ; i++){
			barNum.add(list.get(i).getNum());
			lineNum.add(list.get(i).getNum1());
			xdata.add(list.get(i).getType());
			if(list.get(i).getNum() > barMax){
				barMax = list.get(i).getNum();
			}
			if(list.get(i).getNum1() > lineMax){
				lineMax = list.get(i).getNum1();
			}
		}
		Map<String, Object> barData = new HashMap<>();
		barData.put("name","实有人口");
		barData.put("data",barNum);
		Map<String, Object> lineData = new HashMap<>();
		lineData.put("name","流动人员");
		lineData.put("data",lineNum);

		result.put("legend",legend);
		result.put("barData",barData);
		result.put("lineData",lineData);
		result.put("xdata",xdata);
		result.put("barMax",barMax);
		result.put("lineMax",lineMax);
		return result;
	}

	public Map<String, Object> getImportPeopleCountOfArea() {
		Map<String, Object> result = new HashMap<>();
		List<EchartType> list = ccmPeopleDao.getImportPeopleCountOfArea();
		if(list.size()>0){
			for(int i=0;i<list.size()-1;i++){
				for(int j=0;j<list.size()-1-i;j++){
					if(list.get(j+1).getNum()>list.get(j).getNum()){
						EchartType temp = list.get(j);
						list.set(j,list.get(j+1));
						list.set(j+1,temp);
					}
				}
			}
		}
		if(list.size()>5){
			list = list.subList(0, 5);
		}
		List<Integer> data = new ArrayList<>();
		List<String> name = new ArrayList<>();
		int max = 50;
		for(int j=0 ; j<list.size() ; j++){
			data.add(list.get(j).getNum());
			name.add(list.get(j).getType());
			if(list.get(j).getNum() > max){
				max = list.get(j).getNum();
			}
		}

		result.put("data",data);
		result.put("name",name);
		result.put("max",max);
		return result;
	}

	public Map<String, Object> getEventCountBySevenDay() {
		Map<String, Object> result = new HashMap<>();
		List<EchartType> list = new ArrayList<>();
		SimpleDateFormat noyear = new SimpleDateFormat("MM-dd");
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		for(int i=0 ; i<7 ; i++){
			EchartType echartType = new EchartType();
			calendar.add(Calendar.DAY_OF_MONTH,-1);
			echartType.setName(noyear.format(calendar.getTime()));
			echartType.setNum(0);
			list.add(echartType);
		}
		List<EchartType> find = ccmEventAmbiDao.getEventCountBySevenDay();
		for(EchartType one:list){
			for(EchartType two:find){
				if(one.getName().equals(two.getName())){
					one.setNum(two.getNum());
				}
			}
		}
		List<Integer> data = new ArrayList<>();
		List<String> name = new ArrayList<>();
		int max = 50;
		for(int j=0 ; j<list.size() ; j++){
			data.add(list.get(j).getNum());
			name.add(list.get(j).getName());
			if(list.get(j).getNum() > max){
				max = list.get(j).getNum();
			}
		}

		result.put("data",data);
		result.put("name",name);
		result.put("max",max);
		return result;
	}

	public Map<String, Object> getPeopleCountAndAreaName() {
		Map<String, Object> result = new HashMap<>();
		List<EchartType> list = ccmPeopleDao.getPeopleCountAndAreaName();
		List<Map<String, Object>> data = new ArrayList<>();
		int max = 0;
		for(int i=0 ; i<list.size() ; i++){
			Map<String, Object> map = new HashMap<>();
			map.put("name", list.get(i).getType());
			map.put("value", list.get(i).getNum());
			data.add(map);
			if(list.get(i).getNum() > max){
				max = list.get(i).getNum();
			}
		}
		result.put("data",data);
		result.put("max",max);
		return result;
	}

}
