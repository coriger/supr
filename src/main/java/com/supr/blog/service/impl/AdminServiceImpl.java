package com.supr.blog.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.supr.blog.mapper.AdminMapper;
import com.supr.blog.model.Admin;
import com.supr.blog.service.AdminService;

/**
 * @功能：账号管理
 * @作者：ljt
 * @时间：2014-4-12 下午9:13:11
 */
@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper adminMapper;
	
	@Override
	public Boolean register(Admin admin) {
		// 判断用户名是否存在
		if(usernameExists(admin.getUsername())){
			return false;
		}
		// 判断邮箱是否存在
		if(emailExists(admin.getEmail())){
			return false;
		}
		
		adminMapper.addAdmin(admin);
		return true;
	}
	
	@Override
	public Boolean emailExists(String email) {
		Admin admin = adminMapper.getAdminByEmail(email);
		return (null == admin ? false : true);
	}
	
	@Override
	public Boolean adminExists(Admin admin) {
		admin = adminMapper.adminExists(admin);
		return (null == admin ? false : true);
	}
	
	@Override
	public Boolean usernameDisabled(String username) {
		Admin admin = adminMapper.getAdminByName(username);
		if(null != admin && admin.getIsEnabled()){
			return true;
		}
		return false;
	}
	
	@Override
	public Boolean usernameExists(String username) {
		Admin admin = adminMapper.getAdminByName(username);
		return (null == admin ? false : true);
	}
	
	@Override
	public Admin getAdminByNameAndPwd(Admin admin) {
		return adminMapper.adminExists(admin);
	}
	
}
