package com.supr.blog.util.pager;

import java.util.List;
import java.util.Map;

import org.apache.solr.client.solrj.response.FacetField.Count;

/**
 * @功能：分页类
 * 
 * 分页信息主要包括几个：当前页   每页显示数  总页数  总数量  和分页返回的信息
 * 
 * @作者： ljt
 * @时间： 2014-4-18 下午5:14:29
 */
public class SolrPager {
	
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
	 * 搜索实体分页信息
	 */
	private List<?> list;
	
	/**
	 * 搜索属性集合
	 */
	private List<?> attrList;
	
	/**
	 * 搜索响应对象
	 */
	private Object obj;
	
	/**
	 * 分页计算起始值
	 */
	private int startIndex;
	
	/**
	 * 分页计算结束值  暂时没用
	 */
	private int endIndex;
	
	/**
	 * solr facet结果集  各个facet字段 对应的可用属性
	 */
	private Map<String,List<Count>> facetFieldMap;
	
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
	
	public int getStart() {
		// 分页开始值 关键
		if (pageNum == 0) {
			startIndex = 0;
		} else {
			startIndex = (pageNum - 1) * pageSize;
		}
		return startIndex;
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

	public Map<String, List<Count>> getFacetFieldMap() {
		return facetFieldMap;
	}

	public void setFacetFieldMap(Map<String, List<Count>> facetFieldMap) {
		this.facetFieldMap = facetFieldMap;
	}

	public List<?> getAttrList() {
		return attrList;
	}

	public void setAttrList(List<?> attrList) {
		this.attrList = attrList;
	}

	public Object getObj() {
		return obj;
	}

	public void setObj(Object obj) {
		this.obj = obj;
	}
}
