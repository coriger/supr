package com.supr.blog.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.supr.blog.mapper.BlogMapper;
import com.supr.blog.mapper.TagMapper;
import com.supr.blog.model.Blog;
import com.supr.blog.model.Tag;
import com.supr.blog.service.BlogService;
import com.supr.blog.util.pager.Pager;

@Service
public class BlogServiceImpl implements BlogService {
	
	@Autowired
	private BlogMapper blogMapper;
	
	@Autowired
	private TagMapper tagMapper;
	
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
			for(Blog blog : list){
				// 获取每个博客的tag
				String tagIds = blog.getTagIds();
				if(!StringUtils.isEmpty(tagIds)){
					String[] tags = tagIds.split(",");
					Tag tag = null;
					for(String tagId : tags){
						// 遍历查询tag表  tag不会改变 可以全部放入缓存
						tag = tagMapper.getTagById(tagId);
						blog.setTag(tag);
					}
				}
			}
		}
		return pager;
	}
	
	@Override
	public int addBlog(Blog blog) {
		return blogMapper.addBlog(blog);
	}
	
}
