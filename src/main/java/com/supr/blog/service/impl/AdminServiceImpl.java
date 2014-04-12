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
	public void register(Admin admin) {
		adminMapper.addAdmin(admin);
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
	
}
