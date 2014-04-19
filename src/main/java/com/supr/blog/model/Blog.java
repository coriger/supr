package com.supr.blog.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @功能：文章
 * @作者： ljt
 * @时间： 2014-4-11 下午5:42:03
 */
public class Blog {
	
	private Integer blogId;
	
	private String title;
	
	private Date publishTime;
	
	private Date updateTime;
	
	private Integer userId;
	
	private String content;
	
	// 标签Id串
	private String tagIds;
	
	// 标签
	private List<Tag> tag;
	
	// 浏览数
	private Integer hits;
	
	// 评论数
	private Integer commentSum;
	
	// 文章静态页面地址   静态地址格式暂定为 /blog/2014-10-12/后缀
	private String postFix;

	public Integer getBlogId() {
		return blogId;
	}

	public void setBlogId(Integer blogId) {
		this.blogId = blogId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getPublishTime() {
		return publishTime;
	}

	public void setPublishTime(Date publishTime) {
		this.publishTime = publishTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public List<Tag> getTag() {
		return tag;
	}

	public void setTag(List<Tag> tag) {
		this.tag = tag;
	}
	
	public void setTag(Tag tag) {
		if(null == this.tag){
			this.tag = new ArrayList<Tag>();
		}
		this.tag.add(tag);
	}

	public Integer getHits() {
		return hits;
	}

	public void setHits(Integer hits) {
		this.hits = hits;
	}

	public Integer getCommentSum() {
		return commentSum;
	}

	public void setCommentSum(Integer commentSum) {
		this.commentSum = commentSum;
	}

	public String getTagIds() {
		return tagIds;
	}

	public void setTagIds(String tagIds) {
		this.tagIds = tagIds;
	}

	public String getPostFix() {
		return postFix;
	}

	public void setPostFix(String postFix) {
		this.postFix = postFix;
	}
}
