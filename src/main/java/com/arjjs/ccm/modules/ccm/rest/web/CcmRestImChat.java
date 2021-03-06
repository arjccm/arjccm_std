package com.arjjs.ccm.modules.ccm.rest.web;

import com.arjjs.ccm.common.config.Global;
import com.arjjs.ccm.common.web.BaseController;
import com.arjjs.ccm.modules.ccm.rest.entity.*;
import com.arjjs.ccm.modules.ccm.rest.service.CcmUserGroupRelationshipService;
import com.arjjs.ccm.modules.ccm.rest.service.CcmUserGroupService;
import com.arjjs.ccm.modules.ccm.rest.service.CcmUserRelationshipService;
import com.arjjs.ccm.modules.sys.entity.User;
import com.arjjs.ccm.modules.sys.utils.UserUtils;
import groovy.util.logging.Slf4j;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * IM 即时通讯接口类
 * 
 * @author mao
 * @version 2018-03-08
 */
@Api(description = "IM 即时通讯-相关接口类")
@Slf4j
@RestController
@RequestMapping(value = "${appPath}/rest/ImChat")
public class CcmRestImChat extends BaseController {

	@Autowired
	private CcmUserGroupService ccmUserGroupService;
	@Autowired
	private CcmUserRelationshipService ccmUserRelationshipService;

	@Autowired
	private CcmUserGroupRelationshipService ccmUserGroupRelationshipService;

	/**
	 *   创建和修改用户群信息
	 * @param
	 * @return
	 * @author mao
	 * @version 2018-03-08
	 */
	@RequestMapping(value="/saveGroups", method = RequestMethod.POST)
	@ApiOperation(value = " 创建和修改用户群信息")
	public CcmRestResult saveGroups(@RequestBody  CcmUserGroup ccmUserGroup, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		CcmRestResult result = new CcmRestResult();
		//1、校验，当用登陆用户，当前人是不是群主，组中有没有人员列表，如果没有直接返回；
		//2、添加组
		//3、添加关系

		if (ccmUserGroup.getId()!= null && !"".equals(ccmUserGroup.getId())) {
			CcmUserGroup ccmUserGroupDB = ccmUserGroupService.get(ccmUserGroup.getId());
			if (ccmUserGroupDB == null ) {//从数据库中没有取到对应数据
				result.setCode(CcmRestType.ERROR_DB_NOT_EXIST);
				return result;
			}
			String userId = ccmUserGroup.getUserId();
			String groupOwnerId = ccmUserGroupDB.getGroupOwnerId();
			if(!userId.equals(groupOwnerId)){	//如果操作者不是群创建者，提示无权限
				result.setCode(CcmRestType.ERROR_NO_PERSSION);
				return result;
			}
		}
        User userInfo = UserUtils.get(ccmUserGroup.getUserId());
		List<String> userListVo = ccmUserGroup.getUserList();
		if(null == userListVo && userListVo.isEmpty()){
			result.setCode(CcmRestType.ERROR_DB_NOT_EXIST);//数据不存在，没有用户列表，保存不了；群组必须有人；
			return result;
		}
		ccmUserGroup.setCreateBy(new User(ccmUserGroup.getUserId()));
		ccmUserGroup.setUpdateBy(new User(ccmUserGroup.getUserId()));
		if (StringUtils.isEmpty(ccmUserGroup.getGroupOwnerId())){//如果没有设置群主，则为当前用户
			ccmUserGroup.setGroupOwnerId(ccmUserGroup.getUserId());
		}
		if (StringUtils.isEmpty(ccmUserGroup.getGroupname())){//如果没有设置群名称，则为用户名称 + 的临时群组
			ccmUserGroup.setGroupname(userInfo.getName() + "的临时群组");
		}
		ccmUserGroupService.save(ccmUserGroup);
		//根据ID，删除群组用户
        ccmUserRelationshipService.deleteRelByGroupId(ccmUserGroup.getId());
        userListVo.forEach(userId -> {
            CcmUserRelationship ccmUserRelationship = new CcmUserRelationship();
            ccmUserRelationship.setGroupId(ccmUserGroup.getId());
            ccmUserRelationship.setUser(new User(userId));
            ccmUserRelationship.setCreateBy(new User(ccmUserGroup.getUserId()));
            ccmUserRelationship.setUpdateBy(new User(ccmUserGroup.getUserId()));
            ccmUserRelationshipService.save(ccmUserRelationship);
        });
		result.setCode(CcmRestType.OK);
		ccmUserGroup.setType("group");
		String avatar = ccmUserGroup.getAvatar();
		String path = Global.getConfig("FILE_UPLOAD_URL");//文件上传存储路径
		ccmUserGroup.setAvatar(avatar!="" ? path+avatar : "");
		result.setResult(ccmUserGroup);
		return result;

	}/**
	 *   退出群组(IM中退群)
	 * @param userId  当前用户ID
	 * @param groupId  所前所属群组ID
	 * @return
	 * @author mao
	 * @version 2018-03-08
	 */
	@RequestMapping(value="/leaveGroup", method = RequestMethod.POST)
	@ApiOperation(value = " 退出群组")
	public CcmRestResult leaveGroup(@RequestParam  String userId, @RequestParam String groupId, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		CcmRestResult result = new CcmRestResult();
		if (StringUtils.isEmpty(userId)) {
			result.setCode(CcmRestType.ERROR_NO_PERSSION);
			return result;
		}
		if (StringUtils.isEmpty(groupId)) {
			result.setCode(CcmRestType.ERROR_PARAM);
			return result;
		}
		//先判断当前用户是不是群主,如果是群主需要把群主移交给其它人
        User user = ccmUserGroupService.updateGroupOwenId(userId, groupId);
        //如果不是群主，直接删除，
        int i = ccmUserRelationshipService.deleteByGroupIdAndUserId(userId, groupId);
		result.setCode(CcmRestType.OK);
        if (user!= null){
            result.setResult(user.getName()); //群主退群把新的群主返回去
        }else{
            result.setResult(i);//其它人退群返回1，表示退群成功,0表示用户不存在；
        }
		return result;

	}
	/**
	 *   查询视频房间中用户记录
	 * @param
	 * @return
	 * @author mao
	 * @version 2020-04-23
	 */
	@RequestMapping(value="/findUserGroupRel", method = RequestMethod.GET)
	@ApiOperation(value = "查询视频房间中用户记录")
	public CcmRestResult findUserGroupRelationByGroupId(@RequestParam String userId,@RequestParam String groupId, HttpServletRequest req, HttpServletResponse resp) throws IOException {
        CcmRestResult result = new CcmRestResult();
        if (StringUtils.isEmpty(userId)) {
            result.setCode(CcmRestType.ERROR_NO_PERSSION);
            return result;
        }
        List<CcmUserGroupRelationship> userGroupRel = ccmUserGroupRelationshipService.findUserGroupRelationByGroupId(new CcmUserGroupRelationship(groupId));
        result.setCode(CcmRestType.OK);
		result.setResult(userGroupRel.isEmpty() ? 0 : 1);
		return result;
	}
	/**
	 *   视频进入房间记录
	 * @param
	 * @return
	 * @author mao
	 * @version 2020-04-23
	 */
	@RequestMapping(value="/saveUserGroupRel", method = RequestMethod.POST)
	@ApiOperation(value = "视频进入房间记录")
	public CcmRestResult saveGroupUserRel(@RequestBody CcmUserGroupRelationship groupRelationship, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		CcmRestResult result = new CcmRestResult();
		if (StringUtils.isEmpty(groupRelationship.getUserId())) {
				result.setCode(CcmRestType.ERROR_NO_PERSSION);
				return result;
		}
		int i = ccmUserGroupRelationshipService.saveGroupUserRel(groupRelationship);
		result.setCode(CcmRestType.OK);
		result.setResult(i);
		return result;
	}
	/**
	 *   视频用户退出房间记录
	 * @param
	 * @return
	 * @author mao
	 * @version 2020-04-23
	 */
	@RequestMapping(value="/deleteUserGroupRel", method = RequestMethod.POST)
	@ApiOperation(value = "视频用户退出房间记录")
	//public CcmRestResult deleteByGroupIdAndUserId(@RequestParam String groupId,@RequestParam String userId, HttpServletRequest req, HttpServletResponse resp) throws IOException {
	public CcmRestResult deleteByGroupIdAndUserId(@RequestBody CcmUserGroupRelationship groupRelationship, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		CcmRestResult result = new CcmRestResult();
		if (StringUtils.isEmpty(groupRelationship.getUserId())) {
			result.setCode(CcmRestType.ERROR_NO_PERSSION);
			return result;
		}
		//CcmUserGroupRelationship groupRelationship = new CcmUserGroupRelationship(groupId,userId);
		int i = ccmUserGroupRelationshipService.deleteByGroupIdAndUserId(groupRelationship);
		result.setCode(CcmRestType.OK);
		result.setResult(i);
		return result;
	}

}