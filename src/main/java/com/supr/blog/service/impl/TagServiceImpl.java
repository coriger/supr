package com.supr.blog.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.supr.blog.mapper.TagMapper;
import com.supr.blog.model.Tag;
import com.supr.blog.service.TagService;

@Service
@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
public class TagServiceImpl implements TagService{
	
	@Autowired
	private TagMapper tagMapper;
	
	@Override
	@Transactional(readOnly=true)
	public List<Tag> getAllTag() {
		return tagMapper.getAllTag();
	}
	
	@Override
	@Transactional(readOnly=true)
	public boolean existTag(String tagName) {
		Tag tag = tagMapper.getTagByName(tagName);
		return (null == tag) ? false : true;
	}
	
	@Override
	public int addTag(Tag tag) {
		return tagMapper.addTag(tag);
	}
}
