package com.supr.blog.frame.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @desc	拦截器
 * @author	ljt
 * @time	2014年6月28日 上午10:01:35
 */
public abstract class Handler {
	
	// 下一个拦截器
	private Handler nextHandler;
	
	// 拦截方法
	public abstract void handler(String target,HttpServletRequest request,HttpServletResponse response);
}
