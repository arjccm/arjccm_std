/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.event.service;

import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.service.CrudService;
import com.arjjs.ccm.modules.ccm.event.dao.CcmEventCasedealDao;
import com.arjjs.ccm.modules.ccm.event.entity.CcmEventCasedeal;
import com.arjjs.ccm.modules.ccm.event.entity.CcmEventIncident;
import com.arjjs.ccm.modules.flat.alarm.entity.BphAlarmInfo;
import com.arjjs.ccm.modules.flat.alarm.service.BphAlarmInfoService;
import com.arjjs.ccm.modules.flat.handle.entity.BphAlarmHandle;
import com.arjjs.ccm.modules.flat.handle.service.BphAlarmHandleService;
import com.arjjs.ccm.modules.sys.entity.User;
import com.arjjs.ccm.modules.sys.utils.UserUtils;
import com.arjjs.ccm.tool.EchartType;
import com.google.common.collect.Maps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 事件处理Service
 * @author arj
 * @version 2018-01-10
 */
@Service
@Transactional(readOnly = true)
public class CcmEventCasedealService extends CrudService<CcmEventCasedealDao, CcmEventCasedeal> {

	@Autowired
	private CcmEventCasedealDao ccmEventCasedealDao;
	@Autowired
	private BphAlarmInfoService bphAlarmInfoService;
	@Autowired
	private BphAlarmHandleService bphAlarmHandleService;
	
	public CcmEventCasedeal get(String id) {
		return super.get(id);
	}
	
	public List<CcmEventCasedeal> findList(CcmEventCasedeal ccmEventCasedeal) {
		return super.findList(ccmEventCasedeal);
	}
	
	public Page<CcmEventCasedeal> findPage(Page<CcmEventCasedeal> page, CcmEventCasedeal ccmEventCasedeal) {
		return super.findPage(page, ccmEventCasedeal);
	}
	
	@Transactional(readOnly = false)
	public void save(CcmEventCasedeal ccmEventCasedeal) {
		/*BphAlarmInfo bphAlarmInfo = new BphAlarmInfo();
		bphAlarmInfo.setId(ccmEventCasedeal.getObjId());
		BphAlarmInfo bphAlarmInforesult = bphAlarmInfoService.get(bphAlarmInfo);
		if(ccmEventCasedeal.getId() == null || "".equals(ccmEventCasedeal.getId())) {
			if(bphAlarmInforesult != null) {
				BphAlarmHandle bphAlarmHandle = new BphAlarmHandle();
				bphAlarmHandle.setAlarmId(ccmEventCasedeal.getObjId());
				bphAlarmHandle.setHandlePoliceId(ccmEventCasedeal.getHandleUser().getId());
				bphAlarmHandle.setTask(ccmEventCasedeal.getRemarks());
				bphAlarmHandle.setStatus(ccmEventCasedeal.getStatus());//添加处警状态
				bphAlarmHandle.setCreateBy(UserUtils.getUser());
				bphAlarmHandle.setCreateDate(new Date());
				bphAlarmHandle.setUpdateBy(UserUtils.getUser());
				bphAlarmHandle.setUpdateDate(new Date());
				bphAlarmHandle.setDelFlag("0");
				bphAlarmHandleService.save(bphAlarmHandle);
			}
		}*/
		super.save(ccmEventCasedeal);
	}
	
	@Transactional(readOnly = false)
	public void delete(CcmEventCasedeal ccmEventCasedeal) {
		super.delete(ccmEventCasedeal);
	}

	@Transactional(readOnly = false)
	public void deletegrade(String id) {
		ccmEventCasedealDao.deletegrade(id);
	}

	
	//查询obj_id
	public List<CcmEventCasedeal> findCasedealList(String id) {
		return ccmEventCasedealDao.listWithPID(id);
	}

	//定时请求事件处理状态
	public CcmEventCasedeal getEventCasedealMap(CcmEventCasedeal ccmEventCasedeal) {
		return ccmEventCasedealDao.getEventCasedealMap(ccmEventCasedeal);
	}

	//事件处理未处理数量
	public int getNumEventCasedeal(CcmEventCasedeal ccmEventCasedeal) {
		return ccmEventCasedealDao.getNumEventCasedeal(ccmEventCasedeal);
	}

	public List<User> findAssignUser(String areaId,List<String> parentIds) {
		return ccmEventCasedealDao.findAssignUser(areaId,parentIds);
	}

	public Map getNumByHandelStatus() {

	    Map map = Maps.newHashMapWithExpectedSize(3);
        List<EchartType> num = ccmEventCasedealDao.getNumByHandelStatus();
        for (EchartType echartType : num) {
            // 待签收
            if (echartType.getType().equals("01")) {
                map.put("tobe",echartType.getValue());
            }
            // 已签收
            if (echartType.getType().equals("02")) {
                map.put("done",echartType.getValue());
            }
            // 已反馈
            if (echartType.getType().equals("05")) {
                map.put("ing",echartType.getValue());
            }

        }

        return map;
    }

	public List<CcmEventCasedeal> findListByEventId(CcmEventIncident ccmEventIncident) {
		return ccmEventCasedealDao.findListByEventId(ccmEventIncident);
	}

	public List<CcmEventCasedeal> detectDeadline() {
		return ccmEventCasedealDao.detectDeadline();
	}
    public List<CcmEventCasedeal> detectCreationTime() {
        return ccmEventCasedealDao.detectCreationTime();
    }
    public List<CcmEventCasedeal> exceedDeadline() {
        return ccmEventCasedealDao.exceedDeadline();
    }
	//事件发生地详址
    public String getHappenPlace(String cid) {
		return ccmEventCasedealDao.getHappenPlace(cid);
    }
}