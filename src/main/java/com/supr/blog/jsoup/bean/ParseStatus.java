package com.supr.blog.jsoup.bean;

/**
 * @desc	解析服务状态
 * @author	ljt
 * @time	2014-5-26 上午11:14:18
 */
public enum ParseStatus {
	
	// 正在启动
	STARTING,
	// 正在运行中
	RUNNING,
	// 正在停止
	STOPPING,
	// 已停止
	STOPPED;
}
