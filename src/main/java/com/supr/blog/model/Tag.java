package com.supr.blog.model;

/**
 * @功能：文章标签
 * @作者： ljt
 * @时间： 2014-4-11 下午5:47:26
 */
public class Tag {
	
	private Integer tagId;
	
	private String tagName;

	public Integer getTagId() {
		return tagId;
	}

	public void setTagId(Integer tagId) {
		this.tagId = tagId;
	}

	public String getTagName() {
		return tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}
}
