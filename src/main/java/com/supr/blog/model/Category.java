package com.supr.blog.model;

import java.util.Date;

/**
 * @功能：文章分类
 * @作者： ljt
 * @时间： 2014-4-11 下午5:42:13
 */
public class Category {
	
	private Integer categoryId;
	
	private String categoryName;
	
	private Date createTime;

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
}
