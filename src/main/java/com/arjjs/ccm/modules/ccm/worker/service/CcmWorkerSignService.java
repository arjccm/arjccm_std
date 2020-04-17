/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.worker.service;

import java.text.SimpleDateFormat;
import java.util.*;

import com.arjjs.ccm.modules.pbs.sys.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.service.CrudService;
import com.arjjs.ccm.modules.ccm.worker.entity.CcmWorkerSign;
import com.arjjs.ccm.modules.ccm.worker.dao.CcmWorkerSignDao;
import org.apache.commons.lang3.time.DateUtils;

/**
 * 社工签到Service
 * @author yiqingxuan
 * @version 2019-06-17
 */
@Service
@Transactional(readOnly = true)
public class CcmWorkerSignService extends CrudService<CcmWorkerSignDao, CcmWorkerSign> {

	@Autowired
	private CcmWorkerSignDao ccmWorkerSignDao;

	public CcmWorkerSign get(String id) {
		return super.get(id);
	}
	
	public List<CcmWorkerSign> findList(CcmWorkerSign ccmWorkerSign) {
		return super.findList(ccmWorkerSign);
	}
	
	public Page<CcmWorkerSign> findPage(Page<CcmWorkerSign> page, CcmWorkerSign ccmWorkerSign) {
		if(UserUtils.getUser().getId()!=null){
			ccmWorkerSign.getSqlMap().put("dsf", dataScopeFilter( UserUtils.getUser(), "o", "u2"));
		} else {
			if(ccmWorkerSign.getUser()!=null){
				ccmWorkerSign.getSqlMap().put("dsf", dataScopeFilter( ccmWorkerSign.getUser(), "o", "u2"));
			}
		}
		return super.findPage(page, ccmWorkerSign);
	}
	
	@Transactional(readOnly = false)
	public void save(CcmWorkerSign ccmWorkerSign) {
		super.save(ccmWorkerSign);
	}
	
	@Transactional(readOnly = false)
	public void delete(CcmWorkerSign ccmWorkerSign) {
		super.delete(ccmWorkerSign);
	}

	@Transactional(readOnly = false)
	public  void insertIdaa(CcmWorkerSign ccmWorkerSign) {
		ccmWorkerSignDao.insertIdaa(ccmWorkerSign);
	}


	//签退信息
    @Transactional(readOnly = false)
	public void signBack(CcmWorkerSign ccmWorkerSign) {
		ccmWorkerSignDao.signBack(ccmWorkerSign);
	}
	@Transactional(readOnly = false)
	public int findClockoutTime(CcmWorkerSign ccmWorkerSign) {
		return  ccmWorkerSignDao.findClockoutTime(ccmWorkerSign);


	}
	@Transactional(readOnly = false)
	//签到时查询之前是否存在签到信息
	public int findByClockinInfo(CcmWorkerSign ccmWorkerSign) {
		return ccmWorkerSignDao.findByClockinInfo(ccmWorkerSign);
	}
	@Transactional(readOnly = false)
	public Map<String,Object> findByCountMonth(Date date, CcmWorkerSign ccmWorkerSign) {

		Map<String,Object> map= new HashMap<String,Object>();
		//打卡统计（签到签退都有数据）
		List<Integer> wholelist=new ArrayList<>();
		//打卡统计（只有签到）
		List<Integer> lacklist=new ArrayList<>();
		//打卡次数
		int timenum=0;
		//工时
		String manHour="";

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat formatter1 = new SimpleDateFormat("dd");
		String dateformatter = formatter.format(date);
		//查询和date同月数据
		List<CcmWorkerSign> ccmWorkerSignlist = ccmWorkerSignDao.findByCountMonth(dateformatter, ccmWorkerSign);
		for (int i = 0; i < ccmWorkerSignlist.size(); i++) {
			CcmWorkerSign ccmWorkerSign1 = ccmWorkerSignlist.get(i);
			if (DateUtils.isSameDay(date,ccmWorkerSign1.getClockinTime())){
				if (ccmWorkerSign1.getClockoutTime()!=null){
					long l = ccmWorkerSign1.getClockoutTime().getTime() - ccmWorkerSign1.getClockinTime().getTime();
					long day=l/(24*60*60*1000);
					long hour=(l/(60*60*1000)-day*24);
					long min=((l/(60*1000))-day*24*60-hour*60);
					manHour= String.format("%.1f", (double) hour+(double) min/60);
					timenum=2;
				}else {
					manHour="0";
					timenum=1;
				}
				ccmWorkerSign.setClockinTime(ccmWorkerSign1.getClockinTime());
				ccmWorkerSign.setClockoutTime(ccmWorkerSign1.getClockoutTime());
				ccmWorkerSign.setClockinAreaName(ccmWorkerSign1.getClockinAreaName());
				ccmWorkerSign.setClockoutAreaName(ccmWorkerSign1.getClockoutAreaName());
			}
			if (ccmWorkerSign1.getClockoutTime()!=null){
				wholelist.add(Integer.parseInt(formatter1.format(ccmWorkerSign1.getClockinTime())));
			}else {
				lacklist.add(Integer.parseInt(formatter1.format(ccmWorkerSign1.getClockinTime())));
			}
		}
		map.put("timenum",timenum);  //打卡次数
		map.put("manHour",manHour);  //工时
		map.put("ccmWorkerSign",ccmWorkerSign);
		map.put("wholelist",wholelist); //打卡统计（签到签退都有数据）
		map.put("lacklist",lacklist);  //打卡统计（只有签到）

		return map;
	}
}