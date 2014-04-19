package com.supr.blog.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.supr.blog.mapper.TagMapper;
import com.supr.blog.model.Tag;
import com.supr.blog.service.TagService;

@Service
public class TagServiceImpl implements TagService{
	
	@Autowired
	private TagMapper tagMapper;
	
	@Override
	public List<Tag> getAllTag() {
		return tagMapper.getAllTag();
	}
}
