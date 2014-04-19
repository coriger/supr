package com.supr.blog.mapper;

import java.util.List;

import com.supr.blog.model.Tag;

public interface TagMapper {

	Tag getTagById(String tagId);

	List<Tag> getAllTag();

	Tag getTagByName(String tagName);

	int addTag(String tagName);

}
