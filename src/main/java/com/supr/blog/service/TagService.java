package com.supr.blog.service;

import java.util.List;

import com.supr.blog.model.Tag;

public interface TagService {

	List<Tag> getAllTag();

	boolean existTag(String tagName);

	int addTag(Tag tag);

}
