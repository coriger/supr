package com.supr.blog.jsoup.douban.config;

import java.util.Date;
import java.util.List;

import com.supr.blog.jsoup.config.CrawConfig;
import com.supr.blog.jsoup.douban.LanguageType;

/**
 * @desc	豆瓣爬虫配置
 * @author	ljt
 * @time	2014-5-26 上午11:16:04
 */
public class DouBanCrawConfig implements CrawConfig{
	 
	// 起始值
	private Integer startNum;
	
	// 最大爬取数量
	private Integer maxCount; 
	
	// 分页数量
	private Integer stepCount;
	
	// 最大爬取时间  单位：秒
	private long maxTime;
	
	// 爬取网页存放文件名
	private String crawFileName;
	
	// 需要爬取的tag名
	private List<String> tagList;
	
	// 爬取超过指定评论数量的数据
	private Integer commentCount;
	
	// 爬取超过指定价格以上的数据
	private Integer price;
	
	// 爬取指定时间之后的数据
	private Date publishTime;
	
	// 爬取指定评分以上的数据
	private Integer star;
	
	// 爬取指定类型的数据  中文 英文 根据文件title来区分
	private LanguageType languageType;
	
	public Integer getMaxCount() {
		return maxCount;
	}

	public void setMaxCount(Integer maxCount) {
		this.maxCount = maxCount;
	}

	public long getMaxTime() {
		return maxTime;
	}

	public void setMaxTime(long maxTime) {
		this.maxTime = maxTime;
	}

	public String getCrawFileName() {
		return crawFileName;
	}

	public void setCrawFileName(String crawFileName) {
		this.crawFileName = crawFileName;
	}

	public List<String> getTagList() {
		return tagList;
	}

	public void setTagList(List<String> tagList) {
		this.tagList = tagList;
	}

	public Integer getStepCount() {
		return stepCount;
	}

	public void setStepCount(Integer stepCount) {
		this.stepCount = stepCount;
	}

	public Integer getStartNum() {
		return startNum;
	}

	public void setStartNum(Integer startNum) {
		this.startNum = startNum;
	}

	public Integer getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(Integer commentCount) {
		this.commentCount = commentCount;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Date getPublishTime() {
		return publishTime;
	}

	public void setPublishTime(Date publishTime) {
		this.publishTime = publishTime;
	}

	public Integer getStar() {
		return star;
	}

	public void setStar(Integer star) {
		this.star = star;
	}

	public LanguageType getLanguageType() {
		return languageType;
	}

	public void setLanguageType(LanguageType languageType) {
		this.languageType = languageType;
	}
}
