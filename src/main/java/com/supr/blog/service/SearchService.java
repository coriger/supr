package com.supr.blog.service;

import com.supr.blog.util.pager.SolrPager;

public interface SearchService {

	/**
	 * 搜索商品
	 * @param pageSize
	 * @param pageNum
	 * @param url
	 * @return
	 */
	SolrPager getProductPageInfo(int pageSize, int pageNum, String url);
	
}
