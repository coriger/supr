package com.supr.blog.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.supr.blog.mapper.CategoryMapper;
import com.supr.blog.model.Category;
import com.supr.blog.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService{
	
	@Autowired
	private CategoryMapper categoryMapper;
	
	@Override
	public List<Category> getAllCategory() {
		return categoryMapper.getAllCategory();
	}
	
}
