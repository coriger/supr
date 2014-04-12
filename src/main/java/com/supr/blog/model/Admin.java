package com.supr.blog.model;

/**
 * @功能：管理员
 * @作者： ljt
 * @时间： 2014-4-11 下午5:41:52
 */
public class Admin {

	private Integer userId;

	private String username;

	private String password;
	
	private Boolean isEnabled;
	
	public Admin() {
		super();
	}

	public Admin(String username, String password) {
		super();
		this.username = username;
		this.password = password;
		isEnabled = true;
	}
	
	public Boolean getIsEnabled() {
		return isEnabled;
	}

	public void setIsEnabled(Boolean isEnabled) {
		this.isEnabled = isEnabled;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
