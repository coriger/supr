package com.supr.blog.jsoup.site.daomubiji.bean;

public class DaoMuBean {
	
	private String id;
	
	// 章节Id
	private String chapterId;
	
	// 章节标题
	private String chapterTitle;
	
	// 标题
	private String title;
	
	// 内容
	private String content;

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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getChapterId() {
		return chapterId;
	}

	public void setChapterId(String chapterId) {
		this.chapterId = chapterId;
	}

	public String getChapterTitle() {
		return chapterTitle;
	}

	public void setChapterTitle(String chapterTitle) {
		this.chapterTitle = chapterTitle;
	}
}
