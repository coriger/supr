package com.supr.blog.model;

/**
 * @功能：管理员
 * @作者： ljt
 * @时间： 2014-4-11 下午5:41:52
 */
public class Admin {
	
	public static final Boolean isEnable = true;
	
	public static final Boolean disEnable = false;

	private Integer userId;

	private String username;

	private String password;
	
	private Boolean isEnabled;
	
	private String email;
	
	public Admin() {
		super();
	}
	
	public Admin(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}



	public Admin(String username, String password,String email) {
		super();
		this.username = username;
		this.password = password;
		this.email = email;
		isEnabled = true;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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
