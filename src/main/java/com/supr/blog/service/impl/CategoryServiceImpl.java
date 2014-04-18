package com.supr.blog.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.supr.blog.mapper.BlogMapper;
import com.supr.blog.mapper.CategoryMapper;
import com.supr.blog.model.Category;
import com.supr.blog.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService{
	
	@Autowired
	private CategoryMapper categoryMapper;
	
	@Autowired
	private BlogMapper blogMapper;
	
	@Override
	public List<Category> getAllCategory() {
		List<Category> list = categoryMapper.getAllCategory();
		if(null != list){
			for(Category category : list){
				int blogCount = blogMapper.getBlogCountByCategoryId(category.getCategoryId());
				category.setBlogCount(blogCount);
			}
		}
		return list;
	}
	
}
