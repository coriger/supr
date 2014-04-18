package com.supr.blog.controller;

import com.supr.blog.util.pager.Pager;

/**
 * @功能：基类控制器
 * @作者： ljt
 * @时间： 2014-4-18 下午6:03:49
 */
public class BaseController {
	
	/**
	 * 分页 每页显示数量
	 */
	public int pageSize;
	
	/**
	 * 分页 当前页数
	 */
	public int pageNum;
	
	/**
	 * 分页类
	 */
	public Pager pager;
	
}
