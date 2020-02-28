/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.pop.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.arjjs.ccm.common.utils.StringUtils;
import com.arjjs.ccm.tool.DateTools;
import com.arjjs.ccm.tool.EchartType;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.service.CrudService;
import com.arjjs.ccm.modules.ccm.pop.entity.CcmPeopleAntiepidemic;
import com.arjjs.ccm.modules.ccm.pop.dao.CcmPeopleAntiepidemicDao;

/**
 * 人员疫情Service
 * @author yi
 * @version 2020-02-13
 */
@Service
@Transactional(readOnly = true)
public class CcmPeopleAntiepidemicService extends CrudService<CcmPeopleAntiepidemicDao, CcmPeopleAntiepidemic> {
	@Autowired
	private CcmPeopleAntiepidemicDao ccmPeopleAntiepidemicDao;


	public CcmPeopleAntiepidemic get(String id) {
		return super.get(id);
	}

	public List<CcmPeopleAntiepidemic> findList(CcmPeopleAntiepidemic ccmPeopleAntiepidemic) {
		return super.findList(ccmPeopleAntiepidemic);
	}

	public Page<CcmPeopleAntiepidemic> findPage(Page<CcmPeopleAntiepidemic> page, CcmPeopleAntiepidemic ccmPeopleAntiepidemic) {
		return super.findPage(page, ccmPeopleAntiepidemic);
	}

	@Transactional(readOnly = false)
	public void save(CcmPeopleAntiepidemic ccmPeopleAntiepidemic) {
		super.save(ccmPeopleAntiepidemic);
	}

	@Transactional(readOnly = false)
	public void delete(CcmPeopleAntiepidemic ccmPeopleAntiepidemic) {
		super.delete(ccmPeopleAntiepidemic);
	}



	private static final String HB = "湖北";
	private static final String WH = "武汉";
	// 籍贯统计查询
	public List<EchartType> getCountdomicile(){
		List<EchartType> list = Lists.newArrayList();
		EchartType echartType = new EchartType();

		//人员总数
		CcmPeopleAntiepidemic ccmPeopleAntiepidemic = new CcmPeopleAntiepidemic();
		int num = ccmPeopleAntiepidemicDao.countPeopleAntiepidemic(ccmPeopleAntiepidemic);
		echartType.setType(num+"");

		//湖北籍
		CcmPeopleAntiepidemic ccmPeoplehubei = new CcmPeopleAntiepidemic();
		ccmPeoplehubei.setDomicile(HB);
		int num1 = ccmPeopleAntiepidemicDao.countPeopleAntiepidemic(ccmPeoplehubei);
		echartType.setValue(num1+"");

		//非湖北籍
		echartType.setValue1(num-num1 +"");

		//武汉籍
		CcmPeopleAntiepidemic ccmPeoplewuhan = new CcmPeopleAntiepidemic();
		ccmPeoplewuhan.setDomicile(WH);
		int num2 = ccmPeopleAntiepidemicDao.countPeopleAntiepidemic(ccmPeoplewuhan);
		echartType.setValue2(num2+"");

		//湖北非武汉籍
		echartType.setValue3(num1-num2 +"");

		list.add(echartType);
		return list;

	}

	//人员隔离措施
	public List<EchartType> getCounttakeSteps(){
		List<EchartType> list = Lists.newArrayList();
		EchartType echartType = new EchartType();

		//居家隔离
		CcmPeopleAntiepidemic ccmPeopleAntiepidemic = new CcmPeopleAntiepidemic();
		ccmPeopleAntiepidemic.setTakeSteps("1");
		int num = ccmPeopleAntiepidemicDao.countPeopleAntiepidemic(ccmPeopleAntiepidemic);
		echartType.setValue(num+"");

		//留观点隔离
		CcmPeopleAntiepidemic ccmPeople2 = new CcmPeopleAntiepidemic();
		ccmPeople2.setTakeSteps("2");
		int num1 = ccmPeopleAntiepidemicDao.countPeopleAntiepidemic(ccmPeople2);
		echartType.setValue1(num1+"");

		//确诊住院
		CcmPeopleAntiepidemic ccmPeople3= new CcmPeopleAntiepidemic();
		ccmPeople3.setTakeSteps("3");
		int num2 = ccmPeopleAntiepidemicDao.countPeopleAntiepidemic(ccmPeople3);
		echartType.setValue2(num2+"");

		//医院隔离
		CcmPeopleAntiepidemic ccmPeople4 = new CcmPeopleAntiepidemic();
		ccmPeople4.setTakeSteps("4");
		int num3 = ccmPeopleAntiepidemicDao.countPeopleAntiepidemic(ccmPeople4);
		echartType.setValue3(num3+"");

		list.add(echartType);
		return list;

	}


	//人员现状
	public List<EchartType> getCountstatus(){
		List<EchartType> list = Lists.newArrayList();
		EchartType echartType = new EchartType();

		//总数
		CcmPeopleAntiepidemic ccmPeopleAntiepidemic = new CcmPeopleAntiepidemic();
		int num = ccmPeopleAntiepidemicDao.countPeopleAntiepidemic(ccmPeopleAntiepidemic);
		echartType.setValue(num+"");

		//身体状况异常
		CcmPeopleAntiepidemic ccmPeople2 = new CcmPeopleAntiepidemic();
		ccmPeople2.setHealth("2");
		int num1 = ccmPeopleAntiepidemicDao.countPeopleAntiepidemic(ccmPeople2);
		echartType.setValue1(num1+"");

		//已满14天
		CcmPeopleAntiepidemic ccmPeople3= new CcmPeopleAntiepidemic();
		ccmPeople3.setIsIn14days("1");
		int num2 = ccmPeopleAntiepidemicDao.countPeopleAntiepidemic(ccmPeople3);
		echartType.setValue2(num2+"");

		//已移交卫健委
		CcmPeopleAntiepidemic ccmPeople4 = new CcmPeopleAntiepidemic();
		ccmPeople4.setIsTransferHc("2");
		int num3 = ccmPeopleAntiepidemicDao.countPeopleAntiepidemic(ccmPeople4);
		echartType.setValue3(num3+"");

		list.add(echartType);
		return list;

	}


	//人员年龄段
	public List<EchartType> getCountage(){
		List<EchartType> list = Lists.newArrayList();
		EchartType echartType = new EchartType();

		//总数
		CcmPeopleAntiepidemic ccmPeopleAntiepidemic = new CcmPeopleAntiepidemic();
		int num = ccmPeopleAntiepidemicDao.countPeopleAntiepidemic(ccmPeopleAntiepidemic);
		echartType.setType(num+"");

		//18岁以下少年儿童
		CcmPeopleAntiepidemic ccmPeople2 = new CcmPeopleAntiepidemic();
		ccmPeople2.setMaxage(19);
		int num1 = ccmPeopleAntiepidemicDao.countPeopleAntiepidemic(ccmPeople2);
		echartType.setValue(num1+"");

		//18-30岁青年
		CcmPeopleAntiepidemic ccmPeople3= new CcmPeopleAntiepidemic();
		ccmPeople3.setMinage(18);
		ccmPeople3.setMaxage(31);
		int num2 = ccmPeopleAntiepidemicDao.countPeopleAntiepidemic(ccmPeople3);
		echartType.setValue1(num2+"");

		//30-60中青年
		CcmPeopleAntiepidemic ccmPeople4 = new CcmPeopleAntiepidemic();
		ccmPeople4.setMinage(30);
		ccmPeople4.setMaxage(61);
		int num3 = ccmPeopleAntiepidemicDao.countPeopleAntiepidemic(ccmPeople4);
		echartType.setValue2(num3+"");

		//60以上老年
		CcmPeopleAntiepidemic ccmPeople5 = new CcmPeopleAntiepidemic();
		ccmPeople5.setMinage(60);
		int num4 = ccmPeopleAntiepidemicDao.countPeopleAntiepidemic(ccmPeople5);
		echartType.setValue3(num4+"");

		list.add(echartType);
		return list;

	}

	//人员现状
	public Map<String, Object> getDistribution(){
		Map<String, Object> map = Maps.newHashMap();
		List<Integer> list = Lists.newArrayList();
		EchartType echartType = new EchartType();

		//崖州  天涯  吉阳  海棠   育才
		int temp = 0;
		List<Integer> resnum = Lists.newArrayList();
		String[] areanames = {"崖州","天涯","吉阳","海棠","育才"};
//        String[] areanames = {"西秀","平坝","普定","镇宁","关岭","紫云"};
		for(String name : areanames){
			CcmPeopleAntiepidemic ccmPeople = new CcmPeopleAntiepidemic();
			ccmPeople.setBelongSubBureau(name);
			int num = ccmPeopleAntiepidemicDao.countPeopleAntiepidemic(ccmPeople);
			resnum.add(num);
			if(num > temp){
				temp = num;
			}
		}

		for(int i=0;i<areanames.length;i++){
			list.add(temp);
		}

		List<String> getname = Lists.newArrayList();
		String[] names = {"崖州区","天涯区","吉阳区","海棠区","育才生态区"};
//        String[] names = {"西秀区","平坝区","普定区","镇宁县","关岭县","紫云县"};
		for(String name : names){
			getname.add(name);
		}

		map.put("type",getname);
		map.put("value",list);
		map.put("value1",resnum);
		return map;

	}


	//根据入琼时间查询
	public Map<String, Object> countBycomeHainanDate() throws Exception{
		Map<String, Object> summap = Maps.newHashMap();
		CcmPeopleAntiepidemic ccmPeopleAntiepidemic = new CcmPeopleAntiepidemic();
		List<EchartType> list = ccmPeopleAntiepidemicDao.countBycomeHainanDate(ccmPeopleAntiepidemic);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		Map<String,String> map = Maps.newHashMap();
		for(EchartType type:list){
			if(StringUtils.isNotEmpty(type.getType())){
				String typestr = type.getType().split(" ")[0];
				map.put(typestr,type.getValue());
			}
		}

		CcmPeopleAntiepidemic ccmPeople = new CcmPeopleAntiepidemic();
		ccmPeople.setDomicile(WH);
		List<EchartType> listwuhan = ccmPeopleAntiepidemicDao.countBycomeHainanDate(ccmPeople);
		Map<String,String> mapwuhan = Maps.newHashMap();
		for(EchartType type:listwuhan){
			if(StringUtils.isNotEmpty(type.getType())){
				String typestr = type.getType().split(" ")[0];
				mapwuhan.put(typestr,type.getValue());
			}
		}

		List<String> types = Lists.newArrayList();
		List<String> values = Lists.newArrayList();
		List<String> whvalues = Lists.newArrayList();
		List<String> ldates = DateTools.getDayBetweenDates("2020-01-14","2020-01-24");
		for(String s : ldates){
			if(map.containsKey(s)){
				values.add(map.get(s));
			} else {
				values.add("0");
			}

			if(mapwuhan.containsKey(s)){
				whvalues.add(mapwuhan.get(s));
			} else {
				whvalues.add("0");
			}

			types.add(s.substring(s.indexOf("-")+1,s.length()));
		}

		summap.put("type",types);
		summap.put("value",values);
		summap.put("value1",whvalues);
		return summap;

	}
}