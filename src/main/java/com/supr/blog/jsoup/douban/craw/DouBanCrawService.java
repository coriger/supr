package com.supr.blog.jsoup.douban.craw;

import java.util.ArrayList;
import java.util.List;

import com.supr.blog.jsoup.api.CrawService;
import com.supr.blog.jsoup.api.UrlGeneratorStratery;
import com.supr.blog.jsoup.bean.CrawServiceInfo;

/**
 * @desc	豆瓣网站爬取服务
 * @author	ljt
 * @time	2014-5-26 上午10:17:55
 */
public class DouBanCrawService implements CrawService{
	
	// 爬取服务bean
	private CrawServiceInfo crawServiceInfo;
	
	// 爬取策略  url生成策略
	private UrlGeneratorStratery urlGeneratorStratery;
	
	// 需要爬取的url
	private List<String> urlList = new ArrayList<String>();
	
	// 服务状态 通过修改这个值来控制服务运行
	private volatile boolean flag = true;
	
	@Override
	public void init() {
		urlList = urlGeneratorStratery.generator();
	}
	
	/**
	 * 暂停当前爬取服务
	 */
	@Override
	public void pause() {
		
	}
	
	/**
	 * 启动爬取服务  开启线程执行
	 */
	@Override
	public void start() {
		
	}
	
	/**
	 * 停止爬取服务
	 */
	@Override
	public void stop() {
		
	}
	
	@Override
	public void restart() {
		
	}
	
}
