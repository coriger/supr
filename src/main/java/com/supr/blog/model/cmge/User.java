package com.supr.blog.model.cmge;

/**
 * @desc	管理员
 * @author	ljt
 * @time	2014-5-30 上午10:02:31
 */
public class User {
	
	/**
	 * 管理员Id
	 */
	private Integer id;
	
	/**
	 * 管理员名称
	 */
	private String name;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
