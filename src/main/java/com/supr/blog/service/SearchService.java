package com.supr.blog.service;

import com.supr.blog.util.pager.Pager;

public interface SearchService {

	Pager getPageInfo(Class type,int pageSize, int pageNum, String url);
	
}
