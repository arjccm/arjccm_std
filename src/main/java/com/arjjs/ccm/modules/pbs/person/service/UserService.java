package com.arjjs.ccm.modules.pbs.person.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.arjjs.ccm.modules.sys.dao.SysUserRoleDao;
import com.arjjs.ccm.modules.sys.dao.UserDao;
import com.arjjs.ccm.modules.sys.entity.SysUserRole;
import com.arjjs.ccm.modules.sys.entity.User;

@Service
@Transactional(readOnly = true)
public class UserService {
	
	@Autowired
	private UserDao userDao;
	@Autowired
	private SysUserRoleDao sysUserRoleDao;
	
	public User get(String id) {
		return userDao.get(id);
	}
	
	public List<User>  getUserListByOfficeId(User user){
		return userDao.findList(user);
	}
	
	public List<User>  findList(User user){
		return userDao.findList(user);
	}
	
	public List<SysUserRole>  findUandRList(SysUserRole userrole){
		return sysUserRoleDao.findList(userrole);
	}
}

