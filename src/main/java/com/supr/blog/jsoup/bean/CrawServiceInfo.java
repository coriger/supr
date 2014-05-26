package com.supr.blog.jsoup.bean;

import com.supr.blog.jsoup.config.CrawConfig;

/**
 * @desc	爬取服务信息  一些简单的信息  比如服务名   需要爬取的数目  已完成数  剩余数  服务状态  服务执行时间  最长时间  最短时间等等
 * @author	ljt
 * @time	2014-5-26 上午10:24:33
 */
public class CrawServiceInfo {
	
	// 爬虫服务名
	private String crawServiceName;
	
	private CrawConfig crawConfig;
	
	// 爬虫状态
	private CrawStatus crawStatus;
}

