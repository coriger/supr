package com.supr.blog.service;

import com.supr.blog.model.Blog;
import com.supr.blog.util.pager.Pager;

public interface BlogService {

	Pager getBlogByPager(int pageNum, int pageSize);

	int addBlog(Blog blog);

	int deleteBlogById(Integer blogId);

}
