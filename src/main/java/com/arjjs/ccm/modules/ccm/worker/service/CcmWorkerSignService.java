/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.worker.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import com.arjjs.ccm.modules.ccm.attendance.dao.CcmWorkerAttendanceDao;
import com.arjjs.ccm.modules.ccm.attendance.entity.CcmWorkerAttendance;
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
	@Autowired
	private CcmWorkerAttendanceDao ccmWorkerAttendanceDao;

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

	//打卡日历
	@Transactional(readOnly = false)
	public Map<String,Object> findByCountMonth(String userId,Date date, CcmWorkerSign ccmWorkerSign) {

		Map<String,Object> map= new HashMap<String,Object>();
		//打卡统计（签到签退都有数据）
		List<Integer> wholelist=new ArrayList<>();
		//打卡统计（只有签到）
		List<Integer> lacklist=new ArrayList<>();
		//打卡次数
		Integer timenum=0;
		//缺卡次数
		Integer Lacknum=0;
		//每日工时
		String manHour="";
		//总工时
		long num=0;
		//平均工时
		long average1;
		//出勤天数
		Integer number=0;
		//请假天数
		double leaveNum=0;
		double	leaveNum1=0;
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM");
		SimpleDateFormat formatter2 = new SimpleDateFormat("dd");
		SimpleDateFormat formatter3 = new SimpleDateFormat("MM");
		String dateformatter = formatter.format(date);
		//查询和date同月数据
		List<CcmWorkerSign> ccmWorkerSignlist = ccmWorkerSignDao.findByCountMonth(dateformatter, ccmWorkerSign);
		//请假天数
		List<CcmWorkerAttendance> CcmWorkerAttendances = ccmWorkerAttendanceDao.leaveNumByUserId(userId,date);
		//出勤天数
		number=ccmWorkerSignlist.size();
		for (int i = 0; i < ccmWorkerSignlist.size(); i++) {
			CcmWorkerSign ccmWorkerSign1 = ccmWorkerSignlist.get(i);
			if (DateUtils.isSameDay(date,ccmWorkerSign1.getClockinTime())){
				if (ccmWorkerSign1.getClockoutTime()!=null){
					long l = ccmWorkerSign1.getClockoutTime().getTime() - ccmWorkerSign1.getClockinTime().getTime();
					manHour= findmanHour(l);
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
				wholelist.add(Integer.parseInt(formatter2.format(ccmWorkerSign1.getClockinTime())));
				long l = ccmWorkerSign1.getClockoutTime().getTime() - ccmWorkerSign1.getClockinTime().getTime();
				num=num+l;
			}else {
				Lacknum++;
				lacklist.add(Integer.parseInt(formatter2.format(ccmWorkerSign1.getClockinTime())));
			}
		}

		try {
		for (CcmWorkerAttendance ccmWorkerAttendance : CcmWorkerAttendances) {
			String beginFormat1 = formatter1.format(ccmWorkerAttendance.getAttendanceBegin());
			String endFormat1 = formatter1.format(ccmWorkerAttendance.getAttendanceEnd());
			String dateFormat1 = formatter1.format(date);
			String dateFormat = formatter.format(date);
			if (beginFormat1.equals(endFormat1)){
					leaveNum1 = Double.parseDouble(ccmWorkerAttendance.getDays());
			}else if (beginFormat1.equals(dateFormat1)){
					leaveNum1 = (int)(getMaxMonthDate(dateFormat, formatter) - ccmWorkerAttendance.getAttendanceBegin().getTime())/ (24 * 60 * 60 * 1000);
			}else {
					leaveNum1 = (int)(ccmWorkerAttendance.getAttendanceEnd().getTime()-getminMonthDate(dateFormat, formatter) )/ (24 * 60 * 60 * 1000);
			}
			leaveNum=leaveNum+leaveNum1;
		}
		}catch (Exception e){
		e.printStackTrace();
	}
		if (num>0&&number>0){
			average1=num/number;
			String average= findmanHour(average1);
			map.put("average",average);  //月平均工时
		}
		map.put("timenum",timenum);  //打卡次数
		map.put("leaveNum",leaveNum);  //请假次数
		map.put("Lacknum",Lacknum);  //月缺卡次数
		map.put("manHour",manHour);  //每日工时
		map.put("number",number);  //出勤天数
		map.put("ccmWorkerSign",ccmWorkerSign);
		map.put("wholelist",wholelist); //打卡统计（签到签退都有数据）
		map.put("lacklist",lacklist);  //打卡统计（只有签到）
		return map;
	}
	//根据毫秒值返回几号
	public static String findmanHour(long l){
		long day=l/(24*60*60*1000);
		long hour=(l/(60*60*1000)-day*24);
		long min=((l/(60*1000))-day*24*60-hour*60);
		return String.format("%.1f", (double) hour+(double) min/60);
	}
	//返回传入时间月底的毫秒值
	public static long getMaxMonthDate(String date,SimpleDateFormat formatter) throws ParseException {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(formatter.parse(date));
		calendar.set(calendar.get(Calendar.YEAR),calendar.get(Calendar.MONDAY), calendar.get(Calendar.DAY_OF_MONTH), 23, 59,59);
		calendar.set(Calendar.DAY_OF_MONTH,calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
		return calendar.getTimeInMillis();
	}
	//返回传入时间月初的毫秒值
	public static long getminMonthDate(String date,SimpleDateFormat formatter) throws ParseException {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(formatter.parse(date));
		calendar.set(calendar.get(Calendar.YEAR),calendar.get(Calendar.MONDAY), calendar.get(Calendar.DAY_OF_MONTH), 00, 00,00);
		calendar.set(Calendar.DAY_OF_MONTH,calendar.getActualMinimum(Calendar.DAY_OF_MONTH));
		return calendar.getTimeInMillis();
	}
}