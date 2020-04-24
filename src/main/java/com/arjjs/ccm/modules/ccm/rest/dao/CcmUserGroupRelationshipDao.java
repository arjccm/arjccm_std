/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.rest.dao;

import com.arjjs.ccm.common.persistence.annotation.MyBatisDao;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmUserGroupRelationship;

import java.util.List;

/**
 * 房间用户信息DAO接口
 * @author m
 * @version 2020-04-23
 */
@MyBatisDao
public interface CcmUserGroupRelationshipDao{

    List<CcmUserGroupRelationship> findUserGroupRelationByGroupId(CcmUserGroupRelationship groupRelationship);

    int saveGroupUserRel(CcmUserGroupRelationship ccmUserGroupRelationship);

    int deleteByGroupIdAndUserId(CcmUserGroupRelationship groupRelationship);
}