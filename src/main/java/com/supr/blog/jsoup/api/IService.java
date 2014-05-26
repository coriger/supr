package com.supr.blog.jsoup.api;

/**
 * @desc	抽象服务接口   爬虫 解析都属于服务
 * @author	ljt
 * @time	2014-5-26 上午10:03:02
 */
public interface IService {
	
	/**
	 * 初始化
	 */
	public void init();
	
	/**
	 * 启动
	 */
	public void start();
	
	/**
	 * 停止
	 */
	public void stop();
	
	/**
	 * 暂停
	 */
	public void pause();
	
	/**
	 * 重新启动
	 */
	public void restart();
	
}
