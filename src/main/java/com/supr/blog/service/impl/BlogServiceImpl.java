package com.supr.blog.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.supr.blog.mapper.BlogMapper;
import com.supr.blog.model.Blog;
import com.supr.blog.service.BlogService;
import com.supr.blog.util.pager.Pager;

@Service
public class BlogServiceImpl implements BlogService {
	
	@Autowired
	private BlogMapper blogMapper;
	
	@Override
	public Pager getBlogByPager(int pageNum, int pageSize) {
		Pager pager = new Pager();
		// 获取数据总量
		int count = blogMapper.getAllBlogCount();
		// 分页信息封装 这一步关键 保证分页信息的合法性
		pager.setTotalCount(count);
		pager.setPageSize(pageSize);
		pager.setPageNum(pageNum);
		if (count > 0) {
			// 获取分页数据
			List<Blog> list = blogMapper.getBlogByPager(pager);
			pager.setList(list);
		}
		return pager;
	}
	
}
