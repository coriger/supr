package com.supr.blog.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.supr.blog.model.Tag;
import com.supr.blog.model.vo.Result;
import com.supr.blog.service.TagService;

/**
 * @功能：标签管理
 * @作者：ljt
 * @时间：2014-4-19 下午3:39:08
 */
@Controller
@RequestMapping("/tag")
public class TagController extends BaseController{
	
	@Autowired
	private TagService tagService;
	
	@RequestMapping("/add")
	public @ResponseBody
	Result addTag(Tag tag){
		String tagName = tag.getTagName();
		try {
			tagName = URLDecoder.decode(tagName, "UTF-8");
			tag.setTagName(tagName);
		} catch (UnsupportedEncodingException e) {}
		
		// 判断tag是否已存在
		if(!tagService.existTag(tagName)){
			// 新增tag
			int i = tagService.addTag(tag);
			if(i > 0){
				result = new Result("success","新增成功!",tag.getTagId());
			}else{
				result = new Result("success","新增失败!");
			}
		}else{
			// 已存在 则返回error
			result = new Result("error", "标签名已存在!");
		}
		
		return result;
	}
	
}
