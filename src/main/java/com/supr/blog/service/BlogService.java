package com.supr.blog.service;

import com.supr.blog.util.pager.Pager;

public interface BlogService {

	Pager getBlogByPager(int pageNum, int pageSize);

}
