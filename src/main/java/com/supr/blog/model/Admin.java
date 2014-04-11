package com.supr.blog.model;

/**
 * @功能：管理员
 * @作者： ljt
 * @时间： 2014-4-11 下午5:41:52
 */
public class Admin {

	private Integer userId;

	private String loginName;

	private String password;

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
