package com.arjjs.ccm.modules.ccm.rest.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestResult;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestType;
import com.arjjs.ccm.modules.flat.alarm.entity.BphAlarmInfo;
import com.arjjs.ccm.modules.flat.alarm.entity.PageAlarmInfo;
import com.arjjs.ccm.modules.flat.alarm.service.BphAlarmInfoService;
import com.arjjs.ccm.modules.sys.entity.User;

/**
 * 取警情接口类
 * 
 * @author liujindan
 *
 */

@Controller
@RequestMapping(value = "${appPath}/rest/alarmInfo")
public class CcmRestAlarmInfo {
	
	
	@Autowired
	private BphAlarmInfoService bphAlarmInfoService;
	
	/**
	 * @see  获取单个警情信息
	 * @param id  警情ID
	 * @return 
	 * @author liujindan
	 * @version 
	 */
	@ResponseBody
	@RequestMapping(value="/get", method = RequestMethod.GET)
	public CcmRestResult get(String userId,HttpServletRequest req, HttpServletResponse resp, String id) throws IOException {
		CcmRestResult result = new CcmRestResult();
		User sessionUser = (User) req.getSession().getAttribute("user");
		if (sessionUser== null) {
			result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
			return result;
		}
		String sessionUserId = sessionUser.getId();
		if (userId== null || "".equals(userId) ||!userId.equals(sessionUserId)) {
			result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
			return result;
		}
		if (id == null || "".equals(id)) {//参数id不对
			result.setCode(CcmRestType.ERROR_PARAM);
			return result;
		}
		
		BphAlarmInfo bphAlarmInfo = bphAlarmInfoService.get(id);
		
		result.setCode(CcmRestType.OK);
		result.setResult(bphAlarmInfo);
		
		return result;
	}
	
	/**
	 * @see  查询警情信息
	 * @param name  小区（单位）名称
	 * @param buildname  警情名称 
	 * @param pageNo 页码
	 * @param pageSize 分页大小
	 * @return 
	 * @author liujindan
	 * @version 2019-07-22
	 */
	@ResponseBody
	@RequestMapping(value="/query", method = RequestMethod.GET)
	public CcmRestResult query(Integer startIndex,Integer pageSize,String userId,BphAlarmInfo bphAlarmInfo,HttpServletRequest req, HttpServletResponse resp) throws IOException {
		CcmRestResult result = new CcmRestResult();
		User sessionUser = (User) req.getSession().getAttribute("user");
		if (sessionUser== null) {
			result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
			return result;
		}
		String sessionUserId = sessionUser.getId();
		if (userId== null || "".equals(userId) ||!userId.equals(sessionUserId)) {
			result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
			return result;
		}
		bphAlarmInfo.setCheckUser(sessionUser);
		PageAlarmInfo queryPageAlarmInfo = bphAlarmInfoService.queryPageAlarmInfo(startIndex,pageSize);
		
		result.setCode(CcmRestType.OK);
		result.setResult(queryPageAlarmInfo.getAlarmList());
		
		return result;
	}
	
	
	/**
	 * @see  保存警情信息
	 * @param 
	 * @return 
	 * @author liujindan
	 * @version 2019-07-22
	 *//*
	@ResponseBody
	@RequestMapping(value="/save", method = RequestMethod.POST)
	public CcmRestResult modify(String userId,BphAlarmInfo bphAlarmInfo,HttpServletRequest req, HttpServletResponse resp) throws IOException {
		CcmRestResult result = new CcmRestResult();
		User sessionUser = (User) req.getSession().getAttribute("user");
		if (sessionUser== null) {
			result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
			return result;
		}
		String sessionUserId = sessionUser.getId();
		if (userId== null || "".equals(userId) ||!userId.equals(sessionUserId)) {
			result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
			return result;
		}
		if (bphAlarmInfo.getId()!= null && !"".equals(bphAlarmInfo.getId())) {
			BphAlarmInfo bphAlarmInfoDB = bphAlarmInfoService.get(bphAlarmInfo.getId());
			if (bphAlarmInfoDB == null ) {//从数据库中没有取到对应数据
				result.setCode(CcmRestType.ERROR_DB_NOT_EXIST);
			}
		}
		if (bphAlarmInfo.getCreateBy()== null) {
			bphAlarmInfo.setCreateBy(new User(userId));
		}
		
		bphAlarmInfo.setUpdateBy(new User(userId));
		bphAlarmInfoService.save(bphAlarmInfo);
		result.setCode(CcmRestType.OK);
		result.setResult("成功");
		return result;
		
	}
*/
	
	/**
	 * @see  删除警情信息
	 * @param 
	 * @return 
	 * @author liujindan
	 * @version 2019-07-22
	 */
	@ResponseBody
	@RequestMapping(value="/delete", method = RequestMethod.POST)
	public CcmRestResult delete(String userId,BphAlarmInfo bphAlarmInfo,HttpServletRequest req, HttpServletResponse resp) throws IOException {
		CcmRestResult result = new CcmRestResult();
		User sessionUser = (User) req.getSession().getAttribute("user");
		if (sessionUser== null) {
			result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
			return result;
		}
		String sessionUserId = sessionUser.getId();
		if (userId== null || "".equals(userId) ||!userId.equals(sessionUserId)) {
			result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
			return result;
		}
		if (bphAlarmInfo.getId()!= null && !"".equals(bphAlarmInfo.getId())) {
			BphAlarmInfo bphAlarmInfoDB = bphAlarmInfoService.get(bphAlarmInfo.getId());
			if (bphAlarmInfoDB == null ) {//从数据库中没有取到对应数据
				result.setCode(CcmRestType.ERROR_DB_NOT_EXIST);
				return result;
			}
		}
		bphAlarmInfoService.delete(bphAlarmInfo);
		result.setCode(CcmRestType.OK);
		result.setResult("成功");
		return result;
		
	}

}
