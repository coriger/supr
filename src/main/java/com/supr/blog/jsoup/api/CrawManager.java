package com.supr.blog.jsoup.api;

import java.util.ArrayList;
import java.util.List;

/**
 * @desc 爬取管理器
 * @author ljt
 * @time 2014-5-26 上午10:01:52
 */
public class CrawManager {

	/**********************************************************
	 * 
	 * 1、管理爬虫 2、爬虫服务可能有多个，爬取不同网站 3、爬取过程中，可能会有暂停、停止、重新启动的操作
	 * 
	 * 4、状态监控 5、动态新增、删除爬虫服务
	 * 
	 **********************************************************/

	public static CrawManager crawManager = new CrawManager();
	
	private List<CrawService> list = new ArrayList<CrawService>();
	
	private CrawManager(){
		// 这里进行初始化相关操作
		
	}
	
	public void start(CrawService craw) {
		craw.start();
	}

	public void startAll() {
		for(CrawService craw : list){
			craw.start();
		}
	}

	public void restart(CrawService craw) {
		craw.start();
	}

	public void restartAll() {
		for(CrawService craw : list){
			craw.start();
		}
	}

	public void stop(CrawService craw) {
		craw.stop();
	}

	public void stopAll() {
		for(CrawService craw : list){
			craw.stop();
		}
	}

	public void pause(CrawService craw) {
		craw.pause();
	}

	public void pauseAll() {
		for(CrawService craw : list){
			craw.pause();
		}
	}
	
	public void addCraw(CrawService craw){
		list.add(craw);
	}
	
	public void removeCraw(CrawService craw){
		list.remove(craw);
	}
}
