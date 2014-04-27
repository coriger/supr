package com.supr.blog.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.supr.blog.service.SearchService;
import com.supr.blog.solr.SolrUtil;
import com.supr.blog.util.pager.Pager;

@Service
public class SearchServiceImpl implements SearchService{
	
	@Autowired
	private SolrUtil solrUtil;
	
	@Override
	public Pager getPageInfo(Class type,int pageSize, int pageNum, String url) {
		Pager pager = new Pager();
		// 获取数据总量
		int count = solrUtil.getPageCount(type,url);
		
		// 分页信息封装 这一步关键 保证分页信息的合法性
		pager.setTotalCount(count);
		pager.setPageSize(pageSize);
		pager.setPageNum(pageNum);
		
		pager = SolrUtil.getPageInfo(type,pager,url);
		return pager;
	}
	
}
