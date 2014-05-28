package com.supr.blog.jsoup.site.douban.bean;

/**
 * @desc	豆瓣读书书籍评论bean
 * @author	ljt
 * @time	2014-5-26 下午3:35:54
 */
public class DouBanCommentBean {
	
	// 用户名
	private String username;
	
	// 用户头像
	private String userUrl;

	// 评论
	private String comment;
	
	// 评论Id
	private Integer commentId;

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

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Integer getCommentId() {
		return commentId;
	}

	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
	}
}
