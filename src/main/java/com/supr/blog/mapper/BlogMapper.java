package com.supr.blog.mapper;

import java.util.List;

import com.supr.blog.model.Blog;
import com.supr.blog.util.pager.Pager;

public interface BlogMapper {

	int getAllBlogCount();

	List<Blog> getBlogByPager(Pager pager);

	int getBlogCountByCategoryId(Integer categoryId);

	int addBlog(Blog blog);

	int deleteBlogById(Integer blogId);

	Blog getBlogById(Integer blogId);

	int updateBlog(Blog blog);

}
