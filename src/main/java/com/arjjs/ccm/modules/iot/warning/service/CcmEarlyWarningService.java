/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.iot.warning.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;


import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.service.CrudService;
import com.arjjs.ccm.modules.iot.warning.dao.CcmEarlyWarningDao;
import com.arjjs.ccm.modules.iot.warning.entity.CcmEarlyWarning;

/**
 * 预警记录Service
 * 
 * @author yiqingxuan
 * @version 2019-07-24
 */
@Service
@Transactional(readOnly = true)
public class CcmEarlyWarningService extends CrudService<CcmEarlyWarningDao, CcmEarlyWarning> {

	@Autowired
	private CcmEarlyWarningDao ccmEarlyWarningDao;

	public CcmEarlyWarning get(String id) {
		return super.get(id);
	}

	public List<CcmEarlyWarning> findList(CcmEarlyWarning ccmEarlyWarning) {
		return super.findList(ccmEarlyWarning);
	}

	public Page<CcmEarlyWarning> findPage(Page<CcmEarlyWarning> page, CcmEarlyWarning ccmEarlyWarning) {
		return super.findPage(page, ccmEarlyWarning);
	}

	@Transactional(readOnly = false)
	public void save(CcmEarlyWarning ccmEarlyWarning) {
		super.save(ccmEarlyWarning);
	}

	@Transactional(readOnly = false)
	public void delete(CcmEarlyWarning ccmEarlyWarning) {
		super.delete(ccmEarlyWarning);
	}

	public List<CcmEarlyWarning> getDataByToday() {
		return ccmEarlyWarningDao.getDataByToday();
	}

	public Page<CcmEarlyWarning> findPagegroupby(Page<CcmEarlyWarning> page, CcmEarlyWarning ccmEarlyWarning) {
		ccmEarlyWarning.setPage(page);
		page.setList(ccmEarlyWarningDao.findPagegroupby(ccmEarlyWarning));
		return page;
	}

	public List<CcmEarlyWarning> findListbyidcard(CcmEarlyWarning ccmEarlyWarning) {
		return ccmEarlyWarningDao.findListbyidcard(ccmEarlyWarning);
	}

	public List<Map<String, String>> getSortCountToday(CcmEarlyWarning ccmEarlyWarning) {
		return ccmEarlyWarningDao.getSortCountToday(ccmEarlyWarning);
	}

	public List<Map<String, String>> getSortCountWeek(CcmEarlyWarning ccmEarlyWarning) {
		return ccmEarlyWarningDao.getSortCountWeek(ccmEarlyWarning);
	}

	/*重点人员*/
	public List<CcmEarlyWarning> findPersonal(Date time, String array) {

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String format = simpleDateFormat.format(time);
		String[] split = array.split(",");
		if ("".equals(array)){
			split=null;
		}

		return  ccmEarlyWarningDao.findPersonal(format,split);

	}

	public List<CcmEarlyWarning> findPersonalKJ(String time1, String time2,String array) {
		String[] split = array.split(",");
		if ("".equals(array)){
			split=null;
		}
		return  ccmEarlyWarningDao.findPersonalKJ(time1,time2,split);
	}

	public List<CcmEarlyWarning> findPersonalFu(String array) {
		String[] split = array.split(",");
		String sj="";
		String zd="";
		String ld="";
		String qt="";
		for (String s : split) {
			if (s=="6"){
				sj="1";
			}else if("7".equals(s)){
				zd="1";
			}else if(s=="8"){
				ld="1";
			}else if(s=="9"){
				zd="0";
				ld="0";
			}
		}
		return ccmEarlyWarningDao.findPersonalFu(split,sj,zd,ld,qt);
	}

	public List<CcmEarlyWarning> findPersonalSearch(String name) {

		return ccmEarlyWarningDao.findPersonalSearch("%"+name+"%");
	}
}