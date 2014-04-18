package com.supr.blog.util.pager;

import java.util.List;

/**
 * @功能：分页类
 * 
 * 分页信息主要包括几个：当前页   每页显示数  总页数  总数量  和分页返回的信息
 * 
 * @作者： ljt
 * @时间： 2014-4-18 下午5:14:29
 */
public class Pager {
	
	/**
	 * 默认每页显示数
	 */
	public static final int PAGE_SIZE = 10;
	
	/**
	 * 默认页数
	 */
	public static final int PAGE_NUM = 1;
	
	/**
	 * 页数
	 */
	private int pageNum;
	
	/**
	 * 每页显示数
	 */
	private int pageSize;
	
	/**
	 * 总页数
	 */
	private int totalPageNum;
	
	/**
	 * 记录总数
	 */
	private int totalCount;
	
	/**
	 * 分页信息
	 */
	private List<?> list;
	
	/**
	 * 分页计算起始值
	 */
	private int startIndex;
	
	/**
	 * 分页计算结束值  暂时没用
	 */
	private int endIndex;
	
	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		if(pageNum <= 0){
			pageNum = PAGE_NUM;
		}
		if(pageNum > totalPageNum){
			pageNum = totalPageNum;
		}
		// 分页开始值 关键
		if(pageNum == 0){
			startIndex = 0;
		}else{
			startIndex = (pageNum - 1) * pageSize;
		}
		this.pageNum = pageNum;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		if(pageSize <= 0){
			pageSize = PAGE_SIZE;
		}
		// 计算最大页数
		int pageCount = totalCount / pageSize;
		if(totalCount % pageSize == 0){
			totalPageNum = pageCount;
		}else{
			totalPageNum = pageCount + 1;
		}
		this.pageSize = pageSize;
	}

	public int getTotalPageNum() {
		return totalPageNum;
	}

	public void setTotalPageNum(int totalPageNum) {
		this.totalPageNum = totalPageNum;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public List<?> getList() {
		return list;
	}

	public void setList(List<?> list) {
		this.list = list;
	}

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public int getEndIndex() {
		return endIndex;
	}

	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}
}
