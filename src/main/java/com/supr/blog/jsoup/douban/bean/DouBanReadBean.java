package com.supr.blog.jsoup.douban.bean;

/**
 * @desc 豆瓣读书笔记Bean
 * @author ljt
 * @time 2014-5-26 下午3:36:21
 */
public class DouBanReadBean {

	// 用户名
	private String username;

	// 用户头像
	private String userUrl;

	// 笔记内容
	private String read;

	// 笔记Id
	private Integer readId;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserUrl() {
		return userUrl;
	}

	public void setUserUrl(String userUrl) {
		this.userUrl = userUrl;
	}

	public String getRead() {
		return read;
	}

	public void setRead(String read) {
		this.read = read;
	}

	public Integer getReadId() {
		return readId;
	}

	public void setReadId(Integer readId) {
		this.readId = readId;
	}
}
