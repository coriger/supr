package com.supr.blog.controller;

import com.supr.blog.model.vo.Result;
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
	public int pageNum = Pager.PAGE_SIZE;
	
	/**
	 * 分页类
	 */
	public Pager pager;
	
	/**
	 * json返回值
	 */
	public Result result;

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public Pager getPager() {
		return pager;
	}

	public void setPager(Pager pager) {
		this.pager = pager;
	}

	public Result getResult() {
		return result;
	}

	public void setResult(Result result) {
		this.result = result;
	}
}