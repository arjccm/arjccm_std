/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.rest.service;

import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.service.CrudService;
import com.arjjs.ccm.modules.ccm.rest.dao.CcmUserGroupDao;
import com.arjjs.ccm.modules.ccm.rest.dao.CcmUserRelationshipDao;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmUserGroup;
import com.arjjs.ccm.modules.pbs.sys.utils.UserUtils;
import com.arjjs.ccm.modules.sys.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 用户好友分组Service
 * @author fu
 * @version 2018-03-08
 */
@Service
@Transactional(readOnly = true)
public class CcmUserGroupService extends CrudService<CcmUserGroupDao, CcmUserGroup> {
	
	
	@Autowired
	CcmUserGroupDao ccmUserGroupDao;
	@Autowired
	CcmUserRelationshipDao ccmUserRelationshipDao;

	public CcmUserGroup get(String id) {
		return super.get(id);
	}
	
	public List<CcmUserGroup> findList(CcmUserGroup ccmUserGroup) {
		return super.findList(ccmUserGroup);
	}
	
	public Page<CcmUserGroup> findPage(Page<CcmUserGroup> page, CcmUserGroup ccmUserGroup) {
		return super.findPage(page, ccmUserGroup);
	}
	
	@Transactional(readOnly = false)
	public void save(CcmUserGroup ccmUserGroup) {
		super.save(ccmUserGroup);
	}
	
	@Transactional(readOnly = false)
	public void delete(CcmUserGroup ccmUserGroup) {
		super.delete(ccmUserGroup);
	}

	public List<CcmUserGroup> findListByUserId(String userId) {
		return ccmUserGroupDao.findListByUserId(userId);
	}

	/**
	 *  更新群主信息，返回新的群主；
	 * @param userId
	 * @param groupId
	 * @return
	 */
	@Transactional(readOnly = false)
    public User updateGroupOwenId(String userId, String groupId) {
		//判断当前用户是不是群主
		CcmUserGroup userGroup = ccmUserGroupDao.get(groupId);
		User user = null;
		if (userGroup != null){
			String groupOwnerId = userGroup.getGroupOwnerId();
			//如果是群主，则找出群中其它用户，随机指定一人为群主；
			if (userId.equals(groupOwnerId)){
				List<String> groupUserList = ccmUserRelationshipDao.findUserListByGroupId(groupId);
				groupUserList.removeIf(item -> userId.equals(item));
				int index = (int) (Math.random()* groupUserList.size());
				String groupOwenRadom = groupUserList.get(index);
				userGroup.setGroupOwnerId(groupOwenRadom);//设置群主
				user = UserUtils.get(groupOwenRadom);
				ccmUserGroupDao.update(userGroup);
			}
		}
		return  user;
	}
}