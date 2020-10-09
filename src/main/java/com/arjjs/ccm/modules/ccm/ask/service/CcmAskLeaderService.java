/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.ask.service;

import java.util.Date;
import java.util.List;

import com.arjjs.ccm.common.utils.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.service.CrudService;
import com.arjjs.ccm.modules.ccm.ask.entity.CcmAskLeader;
import com.arjjs.ccm.modules.ccm.ask.dao.CcmAskLeaderDao;
import sun.swing.StringUIClientPropertyKey;

/**
 * 领导请示Service
 * @author cby
 * @version 2020-09-30
 */
@Service
@Transactional(readOnly = true)
public class CcmAskLeaderService extends CrudService<CcmAskLeaderDao, CcmAskLeader> {

	public CcmAskLeader get(String id) {
		return super.get(id);
	}
	
	public List<CcmAskLeader> findList(CcmAskLeader ccmAskLeader) {
		if(StringUtils.isNotEmpty(ccmAskLeader.getTitle())){
			ccmAskLeader.setTitle("%"+ccmAskLeader.getTitle()+"%");
		}
		if(StringUtils.isNotEmpty(ccmAskLeader.getContent())){
			ccmAskLeader.setContent("%"+ccmAskLeader.getContent()+"%");
		}
		if(StringUtils.isNotEmpty(ccmAskLeader.getReply())){
			ccmAskLeader.setReply("%"+ccmAskLeader.getReply()+"%");
		}
		return super.findList(ccmAskLeader);
	}
	
	public Page<CcmAskLeader> findPage(Page<CcmAskLeader> page, CcmAskLeader ccmAskLeader) {
		if(StringUtils.isNotEmpty(ccmAskLeader.getTitle())){
			ccmAskLeader.setTitle("%"+ccmAskLeader.getTitle()+"%");
		}
		if(StringUtils.isNotEmpty(ccmAskLeader.getContent())){
			ccmAskLeader.setContent("%"+ccmAskLeader.getContent()+"%");
		}
		if(StringUtils.isNotEmpty(ccmAskLeader.getReply())){
			ccmAskLeader.setReply("%"+ccmAskLeader.getReply()+"%");
		}
		return super.findPage(page, ccmAskLeader);
	}
	
	@Transactional(readOnly = false)
	public void save(CcmAskLeader ccmAskLeader) {
		if(StringUtils.isEmpty(ccmAskLeader.getId())){
			ccmAskLeader.setReplyStatus("01");
		}
		if(StringUtils.isNotEmpty(ccmAskLeader.getReply())){
			ccmAskLeader.setReplyTime(new Date());
			ccmAskLeader.setReplyStatus("02");
		}
		super.save(ccmAskLeader);
	}
	
	@Transactional(readOnly = false)
	public void delete(CcmAskLeader ccmAskLeader) {
		super.delete(ccmAskLeader);
	}
	
}