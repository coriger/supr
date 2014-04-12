package com.supr.blog.service;

import com.supr.blog.model.Admin;

/**
 * @功能：账号管理
 * @作者：ljt
 * @时间：2014-4-12 下午9:12:08
 */
public interface AdminService {
	
	/**
	 * 注册账号
	 * @param admin
	 */
	void register(Admin admin);
	
	/**
	 * email是否已存在
	 * @param email
	 * @return
	 */
	Boolean emailExists(String email);
	
	/**
	 * 用户名是否已存在
	 * @param username
	 * @return
	 */
	Boolean usernameExists(String username);
	
	/**
	 * 用户名是否被禁用
	 * @param username
	 * @return
	 */
	Boolean usernameDisabled(String username);
	
}
