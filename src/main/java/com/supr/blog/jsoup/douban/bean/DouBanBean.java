package com.supr.blog.jsoup.douban.bean;


public class DouBanBean {
	
	// 实体id
	private String id;
	
	// 实体真实url
	private String url;
	
	// 实体名称
	private String title;
	
	// 发行时间
	private String publishDate;
	
	// 作者
	private String author;
	
	// 价格
	private String price;
	
	// 发行商
	private String publishName;
	
	// 简述
	private String desc;
	
	// 评分
	private String rateNum;
	
	// 评论数
	private String commentNum;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(String publishDate) {
		this.publishDate = publishDate;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublishName() {
		return publishName;
	}

	public void setPublishName(String publishName) {
		this.publishName = publishName;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}
	
	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}
	
	public String getRateNum() {
		return rateNum;
	}

	public void setRateNum(String rateNum) {
		this.rateNum = rateNum;
	}

	public String getCommentNum() {
		return commentNum;
	}

	public void setCommentNum(String commentNum) {
		this.commentNum = commentNum;
	}

	@Override
	public String toString() {
		return "DouBanBean [id=" + id + ", title=" + title + ", publishDate="
				+ publishDate + ", author=" + author + ", price=" + price
				+ ", publishName=" + publishName + ", desc=" + desc
				+ ", rateNum=" + rateNum + ", commentNum=" + commentNum + "]";
	}
}
