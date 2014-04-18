package com.supr.blog.controller;

import com.supr.blog.util.pager.Pager;

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
