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
	
	@Override
	public boolean existTag(String tagName) {
		Tag tag = tagMapper.getTagByName(tagName);
		return (null == tag) ? false : true;
	}
	
	@Override
	public int addTag(Tag tag) {
		return tagMapper.addTag(tag);
	}
}