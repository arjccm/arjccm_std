package com.arjjs.ccm.modules.ccm.rest.service;

import com.arjjs.ccm.modules.ccm.rest.dao.CcmUserGroupRelationshipDao;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmUserGroupRelationship;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

/**
 * 房间用户信息Service
 * @author m
 * @version 2020-04-23
 */
@Service
@Transactional(readOnly = true)
public  class CcmUserGroupRelationshipService  {

    @Autowired
    private CcmUserGroupRelationshipDao userGroupRelationshipDao;

    //1、根据组ID(房间ID)用户ID，查询组内(房间)用户当前信息；
    public List<CcmUserGroupRelationship> findUserGroupRelationByGroupId(CcmUserGroupRelationship groupRelationship) {
        return userGroupRelationshipDao.findUserGroupRelationByGroupId(groupRelationship);
    }
    //2、用户进入房间，添加到当前房间；
    @Transactional(readOnly = false)
    public int saveGroupUserRel(CcmUserGroupRelationship ccmUserGroupRelationship) {
        List<CcmUserGroupRelationship> userGroupRelList = findUserGroupRelationByGroupId(ccmUserGroupRelationship);
        if (!userGroupRelList.isEmpty()){
            return 1;
        }
        String id = UUID.randomUUID().toString();
        ccmUserGroupRelationship.setId(id);
        return userGroupRelationshipDao.saveGroupUserRel(ccmUserGroupRelationship);
    }
    //3、用户离开房间，删除当前房间用户信息；；
    @Transactional(readOnly = false)
    public int deleteByGroupIdAndUserId( CcmUserGroupRelationship groupRelationship) {
        List<CcmUserGroupRelationship> userGroupRelList = findUserGroupRelationByGroupId(groupRelationship);
        if (userGroupRelList.isEmpty()){
            return 1;
        }
        return userGroupRelationshipDao.deleteByGroupIdAndUserId(groupRelationship);
    }

}