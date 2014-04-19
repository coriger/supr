package com.supr.blog.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.supr.blog.model.Blog;
import com.supr.blog.model.Category;
import com.supr.blog.model.Tag;
import com.supr.blog.service.BlogService;
import com.supr.blog.service.CategoryService;
import com.supr.blog.service.TagService;

/**
 * @功能：文章
 * @作者：ljt
 * @时间：2014-4-19 上午8:56:53
 */
@Controller
@RequestMapping("/blog")
public class BlogController extends BaseController {
	
	@Autowired
	private BlogService blogService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private TagService tagService;
	
	/**
	 * 跳转新增文章页面
	 */
	@RequestMapping("/new")
	public String newBlog(ModelMap model){
		// 获取文章分类  
		List<Category> categoryList = categoryService.getAllCategory();
		
		// 获取文章标签
		List<Tag> tagList = tagService.getAllTag();
		
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("tagList", tagList);
		model.addAttribute("publishTime", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		model.addAttribute("postFix", new SimpleDateFormat("HHmmss").format(new Date()));
		return "/admin/blog/add_blog";
	}
	
	/**
	 * 新增文章
	 */
	@RequestMapping("/add")
	public String addBlog(Blog blog){
		
		return "/home/blog/add_blog";
	}
	
}
