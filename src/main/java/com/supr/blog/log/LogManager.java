package com.supr.blog.log;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.xml.DOMConfigurator;

/**
 * @desc	日志管理类
 * @author	ljt
 * @time	2014年6月27日 下午5:20:24
 */
public class LogManager implements LogListener{
	
	private static final int BLACK_TYPE = 1;
	
	private static final int WHITE_TYPE = 2;
	
	private static LogManager logManager = null;
	
	/**
	 * log4j配置文件
	 */
	private String logConfig;
	
	/**
	 * 黑名单
	 */
	private List<String> blackList = new ArrayList<String>();
	
	/**
	 * 白名单
	 */
	private List<String> whiteList = new ArrayList<String>(); 
	
	/**
	 * 过滤类型  1：黑名单 2：白名单
	 */
	private int filterType;
	
	/**
	 * 配置文件上次更新时间
	 */
	private long lastUpdateTime;
	
	private LogManager(){
		init();
		checkFile();
	}
	
	public static LogManager getInstance(){
		if(null == logManager){
			logManager = new LogManager();
		}
		return logManager;
	}
	
	private void init(){
		// 配置文件自动注入  或者读取properties配置文件
		logConfig = "";
		DOMConfigurator.configure(logConfig);
		// 配置黑白名单
		
	}
	
	/**
	 * 重新加载日志配置文件
	 */
	public void reLoad(){
		init();
	}
	
	/**
	 * 启动线程查询配置文件是否修改
	 */
	public void checkFile(){
		new Thread(new Runnable() {
			
			@Override
			public void run() {
				while(true){
					try {
						// 获取配置文件的修改时间
						File file = new File(logConfig);
						long updateTime = file.lastModified();
						if(updateTime > lastUpdateTime){
							// 重新加载配置文件
							reLoad();
							lastUpdateTime = updateTime;
						}
						
						// 休眠10秒
						Thread.sleep(10000);
					} catch (Exception e) {
						continue;
					}
				}
			}
		}).start();
	}
	
}
