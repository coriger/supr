package com.supr.blog.jsoup.api;

/**
 * @desc	解析策略
 * @author	ljt
 * @time	2014-5-26 上午9:56:40
 */
public interface ParseStrategy {
	
	/**
	 * 解析方法    每个策略都会有一个独立的解析方法
	 */
	public void parse();
	
}