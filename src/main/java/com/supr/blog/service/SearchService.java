package com.supr.blog.service;

import java.util.List;

import com.supr.blog.model.vo.IncProductIndex;
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

	/**
	 * 获取待处理增量索引总量
	 * @return
	 */
	int getIncrementIndexCount();

	/**
	 * 获取增量索引集合
	 * @param indexCount
	 * @return
	 */
	List<IncProductIndex> getIncrementIndex(int indexCount);

	/**
	 * 更新增量索引处理状态
	 * @param product
	 */
	void updateIncIndexStatus(IncProductIndex product);

	/**
	 * 删除全部索引
	 * @return
	 */
	int deleteAllIndex();
}
