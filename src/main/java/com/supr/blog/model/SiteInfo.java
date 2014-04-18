package com.supr.blog.model;

import java.util.Date;

/**
 * @功能：站点信息 (访问量 文章 图片数量等)
 * @作者： ljt
 * @时间： 2014-4-18 下午5:05:09
 */
public class SiteInfo {
	
	// 访问数
	private Long hitCount;
	
	// 在线数
	private Integer liveCount;
	
	// 在线时间
	private Long timeCount;
	
	// 文章数
	private Integer blogCount;
	
	// 相片数
	private Integer photoCount;
	
	public Long getHitCount() {
		return hitCount;
	}

	public void setHitCount(Long hitCount) {
		this.hitCount = hitCount;
	}

	public Integer getLiveCount() {
		return liveCount;
	}

	public void setLiveCount(Integer liveCount) {
		this.liveCount = liveCount;
	}

	public Long getTimeCount() {
		return timeCount;
	}

	public void setTimeCount(Long timeCount) {
		this.timeCount = timeCount;
	}

	public Integer getBlogCount() {
		return blogCount;
	}

	public void setBlogCount(Integer blogCount) {
		this.blogCount = blogCount;
	}

	public Integer getPhotoCount() {
		return photoCount;
	}

	public void setPhotoCount(Integer photoCount) {
		this.photoCount = photoCount;
	}

}
