package com.supr.blog.jsoup.douban.bean;

import java.util.List;

/**
 * @desc	豆瓣读书bean
 * @author	ljt
 * @time	2014-5-26 下午3:36:33
 */
public class DouBanBean {
	
	// 实体id
	private String id;
	
	// 实体真实url
	private String url;
	
	// 实体图片url
	private String imageUrl;
	
	// 实体名称
	private String title;
	
	// 别名
	private String secondTitle;
	
	// 发行时间
	private String publishDate;
	
	// 作者
	private String author;
	
	// 作者简介
	private String authorDesc;
	
	// 译者
	private String translator;
	
	// 页数
	private String pageTotal;
	
	// 价格
	private String price;
	
	// 发行商
	private String publishName;
	
	// 内容简介
	private String desc;
	
	// 评分
	private String rateNum;
	
	// 评论数
	private String commentNum;
	
	// 书籍ISBN
	private String ISBN;
	
	// 评论
	private List<DouBanCommentBean> commentList;
	
	// 评论url
	private List<String> commentUrlList;
	
	// 读书笔记
	private List<DouBanReadBean> readList;
	
	// 读书笔记url
	private List<String> readUrlList;
	
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

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public List<DouBanCommentBean> getCommentList() {
		return commentList;
	}

	public void setCommentList(List<DouBanCommentBean> commentList) {
		this.commentList = commentList;
	}

	public List<DouBanReadBean> getReadList() {
		return readList;
	}

	public void setReadList(List<DouBanReadBean> readList) {
		this.readList = readList;
	}
	
	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	
	public String getISBN() {
		return ISBN;
	}

	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}

	public String getTranslator() {
		return translator;
	}

	public void setTranslator(String translator) {
		this.translator = translator;
	}

	public String getPageTotal() {
		return pageTotal;
	}

	public void setPageTotal(String pageTotal) {
		this.pageTotal = pageTotal;
	}

	public String getAuthorDesc() {
		return authorDesc;
	}

	public void setAuthorDesc(String authorDesc) {
		this.authorDesc = authorDesc;
	}

	public String getSecondTitle() {
		return secondTitle;
	}

	public void setSecondTitle(String secondTitle) {
		this.secondTitle = secondTitle;
	}

	public List<String> getCommentUrlList() {
		return commentUrlList;
	}

	public void setCommentUrlList(List<String> commentUrlList) {
		this.commentUrlList = commentUrlList;
	}

	public List<String> getReadUrlList() {
		return readUrlList;
	}

	public void setReadUrlList(List<String> readUrlList) {
		this.readUrlList = readUrlList;
	}
}
