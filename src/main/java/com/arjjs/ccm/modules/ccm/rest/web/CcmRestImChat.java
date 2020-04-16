package com.arjjs.ccm.modules.ccm.rest.web;

import com.arjjs.ccm.common.config.Global;
import com.arjjs.ccm.common.web.BaseController;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestResult;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestType;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmUserGroup;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmUserRelationship;
import com.arjjs.ccm.modules.ccm.rest.service.CcmUserGroupService;
import com.arjjs.ccm.modules.ccm.rest.service.CcmUserRelationshipService;
import com.arjjs.ccm.modules.sys.entity.User;
import groovy.util.logging.Slf4j;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * IM 即时通讯接口类
 * 
 * @author fuxinshuang
 * @version 2018-03-08
 */
@Api(description = "IM 即时通讯接口类-app接口类")
@Slf4j
@RestController
@RequestMapping(value = "${appPath}/rest/ImChat")
public class CcmRestImChat extends BaseController {

	@Autowired
	private CcmUserGroupService ccmUserGroupService;
	@Autowired
	private CcmUserRelationshipService ccmUserRelationshipService;

	/**
	 * @see  创建和修改用户群信息
	 * @param
	 * @return
	 * @author fuxinshuang
	 * @version 2018-03-08
	 */
	@RequestMapping(value="/saveGroups", method = RequestMethod.POST)
	@ApiOperation(value = " 创建和修改用户群信息")
	public CcmRestResult saveGroups(@RequestBody  CcmUserGroup ccmUserGroup, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		CcmRestResult result = new CcmRestResult();
		//1、校验，当用登陆用户，当前人是不是群主，组中有没有人员列表，如果没有直接返回；
		//2、添加组
		//3、添加关系
		User sessionUser = (User) req.getSession().getAttribute("user");
		if (sessionUser== null) {
			result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
			return result;
		}
		String sessionUserId = sessionUser.getId();
		if (ccmUserGroup.getUserId()== null || "".equals(ccmUserGroup.getUserId()) ||!ccmUserGroup.getUserId().equals(sessionUserId)) {
			result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
			return result;
		}
		if (ccmUserGroup.getId()!= null && !"".equals(ccmUserGroup.getId())) {
			CcmUserGroup ccmUserGroupDB = ccmUserGroupService.get(ccmUserGroup.getId());
			if (ccmUserGroupDB == null ) {//从数据库中没有取到对应数据
				result.setCode(CcmRestType.ERROR_DB_NOT_EXIST);
				return result;
			}
			if(!sessionUserId.equals(ccmUserGroupDB.getGroupOwnerId())){	//如果操作者不是群创建者，提示无权限
				result.setCode(CcmRestType.ERROR_NO_PERSSION);
				return result;
			}
		}
		List<String> userList = ccmUserGroup.getUserList();
		if(null == userList && userList.isEmpty()){
			result.setCode(CcmRestType.ERROR_DB_NOT_EXIST);//数据不存在，没有用户列表，保存不了；群组必须有人；
			return result;
		}
		ccmUserGroup.setCreateBy(new User(sessionUserId));
		ccmUserGroup.setUpdateBy(new User(sessionUserId));
		if (StringUtils.isBlank(ccmUserGroup.getGroupOwnerId())){//如果没有设置群主，则为当前用户
			ccmUserGroup.setGroupOwnerId(ccmUserGroup.getUserId());
		}
		ccmUserGroupService.save(ccmUserGroup);
		userList.forEach(userId ->{
			CcmUserRelationship ccmUserRelationship = new CcmUserRelationship();
			ccmUserRelationship.setGroupId(ccmUserGroup.getId());
			ccmUserRelationship.setUser(new User(userId));
			ccmUserRelationship.setCreateBy(new User(sessionUserId));
			ccmUserRelationship.setUpdateBy(new User(sessionUserId));
			ccmUserRelationshipService.save(ccmUserRelationship);
		});
		result.setCode(CcmRestType.OK);
		ccmUserGroup.setType("group");
		String avatar = ccmUserGroup.getAvatar();
		String path = Global.getConfig("FILE_UPLOAD_URL");//文件上传存储路径
		ccmUserGroup.setAvatar(avatar!="" ? path+avatar : "");
		result.setResult(ccmUserGroup);
		return result;

	}
}