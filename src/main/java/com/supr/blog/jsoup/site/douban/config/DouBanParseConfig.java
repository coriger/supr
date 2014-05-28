package com.supr.blog.jsoup.site.douban.config;

import com.supr.blog.jsoup.config.ParseConfig;

/**
 * @desc	豆瓣解析配置
 * @author	ljt
 * @time	2014-5-26 上午11:16:37
 */
public class DouBanParseConfig implements ParseConfig{
	
	// 待解析文件目录
	private String fileDirectoryPath;

	public String getFileDirectoryPath() {
		return fileDirectoryPath;
	}

	public void setFileDirectoryPath(String fileDirectoryPath) {
		this.fileDirectoryPath = fileDirectoryPath;
	}
}
