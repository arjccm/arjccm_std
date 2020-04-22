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
import com.google.common.collect.Lists;
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

	//考勤日历
	@Transactional(readOnly = false)
	public Map<String,Object> findByCountMonth(String userId,Date date, CcmWorkerSign ccmWorkerSign) {

		Map<String,Object> map= new HashMap<String,Object>();
		//打卡统计（签到签退都有数据）
		List<Integer> wholelist=new ArrayList<>();
		//打卡统计（只有签到）
		List<Integer> lacklist=new ArrayList<>();
		//打卡次数
		Integer timenum=0;
		//每日工时
		String manHour="";

		SimpleDateFormat formatter  = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM");
		SimpleDateFormat formatter2 = new SimpleDateFormat("dd");
		SimpleDateFormat formatter3 = new SimpleDateFormat("MM");
		String dateformatter = formatter.format(date);
		//查询和date同月且有签到时间的数据
		List<CcmWorkerSign> ccmWorkerSignlist = ccmWorkerSignDao.findByCountMonth(dateformatter, ccmWorkerSign);

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
				/*num=num+l;*/
			}else {
				/*Lacknum++;*/
				lacklist.add(Integer.parseInt(formatter2.format(ccmWorkerSign1.getClockinTime())));
			}
		}
		map.put("timenum",timenum);  //打卡次数
		map.put("manHour",manHour);  //每日工时
		map.put("ccmWorkerSign",ccmWorkerSign);
		map.put("wholelist",wholelist); //打卡统计（签到签退都有数据）
		map.put("lacklist",lacklist);  //打卡统计（只有签到）
		return map;
	}

	//考勤统计
	@Transactional(readOnly = false)
	public Map<String,Object> findBystatistics(String userId,Date date, CcmWorkerSign ccmWorkerSign) {

		Map<String,Object> map= new HashMap<String,Object>();

		ArrayList<String> workList = new ArrayList<>();  //出勤天数
		ArrayList<CcmWorkerSign> averageList = new ArrayList<>();  //平均工时
		ArrayList<String> lackList = new ArrayList<>();  //缺卡天数
		ArrayList<String> leaveList = Lists.newArrayList();  //请假天数
		long num=0;  //总工时
		long average1;  //平均工时
		Integer number=0;  //出勤天数
		String manHour="";  //每日工时
	/*	double leaveNum=0;  //请假天数
		double	leaveNum1=0;*/
		String holiday = "";

		SimpleDateFormat formatter  = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat formatter4  = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM");
		SimpleDateFormat formatter2 = new SimpleDateFormat("dd");
		SimpleDateFormat formatter3 = new SimpleDateFormat("MM");
		String dateformatter = formatter.format(date);

		//查询和date同月且有签到时间的数据
		List<CcmWorkerSign> ccmWorkerSignlist = ccmWorkerSignDao.findByCountMonth(dateformatter, ccmWorkerSign);
		//请假天数
		List<CcmWorkerAttendance> CcmWorkerAttendances = ccmWorkerAttendanceDao.leaveNumByUserId(userId,date);
		//出勤天数
		number=ccmWorkerSignlist.size();
		for (CcmWorkerSign workerSign : ccmWorkerSignlist) {
			if (workerSign.getClockoutTime()!=null){
				long l = workerSign.getClockoutTime().getTime() - workerSign.getClockinTime().getTime();
				manHour= findmanHour(l);
				workerSign.setManHour(manHour);
				num=num+l;
			}
			else {
				workerSign.setManHour("0");
				lackList.add(formatter4.format(workerSign.getClockinTime()));
			}
			//出勤天数list
			workList.add(formatter4.format(workerSign.getClockinTime()));
			averageList.add(workerSign);
		}
		try {
		for (CcmWorkerAttendance ccmWorkerAttendance : CcmWorkerAttendances) {
			String beginFormat1 = formatter1.format(ccmWorkerAttendance.getAttendanceBegin());
			String endFormat1 = formatter1.format(ccmWorkerAttendance.getAttendanceEnd());
			String dateFormat1 = formatter1.format(date);
			String dateFormat = formatter.format(date);
			if (beginFormat1.equals(endFormat1)){
					/*leaveNum1 = Double.parseDouble(ccmWorkerAttendance.getDays());*/

				String start = formatter2.format(ccmWorkerAttendance.getAttendanceBegin());
				String end = formatter2.format(ccmWorkerAttendance.getAttendanceEnd());
				for (int i = Integer.valueOf(start); i <= Integer.valueOf(end); i++) {
					if (i/10<1){
						holiday = dateFormat1+"-"+"0"+i;
					}else {
						holiday = dateFormat1+"-"+i;
					}
					leaveList.add(holiday);
				}
			}else if (beginFormat1.equals(dateFormat1)){
				/*leaveNum1 = (int)(getMaxMonthDate(dateFormat, formatter) - ccmWorkerAttendance.getAttendanceBegin().getTime())/ (24 * 60 * 60 * 1000);*/

				String start = formatter2.format(ccmWorkerAttendance.getAttendanceBegin());
				String end = formatter2.format(getMaxMonthDate(dateFormat, formatter));
				for (int i = Integer.valueOf(start); i <= Integer.valueOf(end); i++) {
					if (i/10<1){
						holiday = dateFormat1+"-"+"0"+i;
					}else {
						holiday = dateFormat1+"-"+i;
					}
					leaveList.add(holiday);
				}
			}else {
					/*leaveNum1 = (int)(ccmWorkerAttendance.getAttendanceEnd().getTime()-getminMonthDate(dateFormat, formatter) )/ (24 * 60 * 60 * 1000);*/
					String start = formatter2.format(getminMonthDate(dateFormat, formatter));
					String end = formatter2.format(ccmWorkerAttendance.getAttendanceEnd());
				for (int i = Integer.valueOf(start); i <= Integer.valueOf(end); i++) {
					if (i/10<1){
						holiday = dateFormat1+"-"+"0"+i;
					}else {
						holiday = dateFormat1+"-"+i;
					}
					leaveList.add(holiday);
					}
				}
			}
		}catch (Exception e){
		e.printStackTrace();
	}

		if (num>0&&number>0){
			average1=num/number;
			String average= findmanHour(average1);
			map.put("average",average);  //月平均工时
		}else {
			map.put("average","0");
		}
		map.put("workList",workList);//出勤天数
		map.put("averageList",averageList);//平均工时
		map.put("lackList",lackList);//缺卡天数
		map.put("leaveList",leaveList);//请假天数
		return map;
	}
	//根据毫秒值返回小时
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