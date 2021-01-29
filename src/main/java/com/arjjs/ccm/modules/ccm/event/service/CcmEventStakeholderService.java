/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.event.service;

import java.util.*;

import com.arjjs.ccm.common.utils.StringUtils;
import com.arjjs.ccm.modules.ccm.event.dao.CcmEventIncidentDao;
import com.arjjs.ccm.modules.ccm.event.entity.CcmEventCasedeal;
import com.arjjs.ccm.modules.ccm.event.entity.CcmEventIncident;
import com.arjjs.ccm.tool.DateJsonValueProcessor;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.service.CrudService;
import com.arjjs.ccm.modules.ccm.event.entity.CcmEventStakeholder;
import com.arjjs.ccm.modules.ccm.event.dao.CcmEventStakeholderDao;

/**
 * 案事件干系人Service
 * @author pengjianqiang
 * @version 2018-01-30
 */
@Service
@Transactional(readOnly = true)
public class CcmEventStakeholderService extends CrudService<CcmEventStakeholderDao, CcmEventStakeholder> {

	@Autowired
	private CcmEventIncidentDao ccmEventIncidentDao;
	@Autowired
	private CcmEventIncidentService ccmEventIncidentService;

	public CcmEventStakeholder get(String id) {
		return super.get(id);
	}
	
	public List<CcmEventStakeholder> findList(CcmEventStakeholder ccmEventStakeholder) {
		return super.findList(ccmEventStakeholder);
	}
	
	public Page<CcmEventStakeholder> findPage(Page<CcmEventStakeholder> page, CcmEventStakeholder ccmEventStakeholder) {
		return super.findPage(page, ccmEventStakeholder);
	}
	
	@Transactional(readOnly = false)
	public void save(CcmEventStakeholder ccmEventStakeholder) {
		super.save(ccmEventStakeholder);
	}
	
	@Transactional(readOnly = false)
	public void delete(CcmEventStakeholder ccmEventStakeholder) {
		super.delete(ccmEventStakeholder);
	}

	public Page<CcmEventIncident> getEventListByStakeholder(Page<CcmEventIncident> page, CcmEventIncident ccmEventIncident) {
		ccmEventIncident.setPage(page);
		if(StringUtils.isNotEmpty(ccmEventIncident.getStakeHolderIden())){
			page.setList(ccmEventIncidentDao.findPageOrg(ccmEventIncident));
			return page;
		}else{
			page.setList(new ArrayList<CcmEventIncident>());
			return page;
		}
	}

	public Map<String, Object> getEventCasedealById(CcmEventIncident ccmEventIncident) {
		Map<String, Object> result = new HashMap<>();
		List<CcmEventCasedeal> CcmEventCasedealList = ccmEventIncidentService.findList(ccmEventIncident.getId());
		JsonConfig config = new JsonConfig();
		config.setExcludes(new String[]{"createBy", "updateBy", "currentUser", "dbName", "global", "page", "createDate", "updateDate", "sqlMap"});
		config.setIgnoreDefaultExcludes(false);  //设置默认忽略
		config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		config.registerJsonValueProcessor(Date.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
		String jsonDocumentList = JSONArray.fromObject(CcmEventCasedealList, config).toString();
		result.put("CcmEventCasedealList",jsonDocumentList);
		result.put("CasedealListNumber",CcmEventCasedealList.size());
		CcmEventIncident resultEvent = ccmEventIncidentService.get(ccmEventIncident.getId());
		result.put("ccmEventIncident", resultEvent);
		return result;
	}
	
}