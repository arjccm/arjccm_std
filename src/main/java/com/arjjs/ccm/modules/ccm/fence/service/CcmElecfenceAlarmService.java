package com.arjjs.ccm.modules.ccm.fence.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.service.CrudService;
import com.arjjs.ccm.modules.ccm.ccmsys.entity.CcmMobileDevice;
import com.arjjs.ccm.modules.ccm.ccmsys.service.CcmMobileDeviceService;
import com.arjjs.ccm.modules.ccm.fence.dao.CcmElecfenceAlarmDao;
import com.arjjs.ccm.modules.ccm.fence.entity.CcmElecfenceAlarm;
import com.arjjs.ccm.tool.CommUtil;


@Service
@Transactional(readOnly = true)
public class CcmElecfenceAlarmService extends CrudService<CcmElecfenceAlarmDao, CcmElecfenceAlarm>{
	
	@Autowired
	private CcmMobileDeviceService ccmMobileDeviceService;
	
	public Page<CcmElecfenceAlarm> findPage(Page<CcmElecfenceAlarm> page, CcmElecfenceAlarm ccmElecfenceAlarm) {
		return super.findPage(page, ccmElecfenceAlarm);
	}
	
	
	
	@Transactional(readOnly = false)
	public void save(CcmElecfenceAlarm ccmElecfenceAlarm) {
		//根据设备id查询出此刻关联的人员信息
		String deviceId = ccmElecfenceAlarm.getCcmDevice().getDeviceId();
		CcmMobileDevice ccmMobileDevice = new CcmMobileDevice();
		ccmMobileDevice = ccmMobileDeviceService.findByDeviceId(deviceId);
		//人口信息
		ccmElecfenceAlarm.setCcmPeople(ccmMobileDevice.getvSpecialPeople());
		Date alarmTime = ccmElecfenceAlarm.getAlarmTime();
		if(null == alarmTime) {//时间
			alarmTime = new Date();
		}
		ccmElecfenceAlarm.setAlarmTime(alarmTime);
		ccmElecfenceAlarm.setIsCheck(1);//1-已核实
		//创建描述
		String desc = CommUtil.getDescribe(ccmElecfenceAlarm);
		ccmElecfenceAlarm.setRemarks(desc);
		super.save(ccmElecfenceAlarm);
	}
}
