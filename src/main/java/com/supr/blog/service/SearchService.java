package com.supr.blog.service;

import com.supr.blog.model.vo.ProductRequestVo;
import com.supr.blog.util.pager.SolrPager;

public interface SearchService {

	/**
	 * 搜索商品
	 * @param pageSize
	 * @param pageNum
	 * @param product
	 * @return
	 */
	SolrPager getProductPageInfo(int pageSize, int pageNum, ProductRequestVo product);
	
}
