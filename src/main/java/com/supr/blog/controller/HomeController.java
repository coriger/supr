package com.supr.blog.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.supr.blog.model.Category;
import com.supr.blog.service.AlbumService;
import com.supr.blog.service.BlogService;
import com.supr.blog.service.CategoryService;
import com.supr.blog.service.SiteService;

/**
 * @功能：后台首页
 * @作者： ljt
 * @时间： 2014-4-18 下午4:59:57
 */
@Controller
public class HomeController extends BaseController{
	
	@Autowired
	private BlogService blogService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private AlbumService albumService;
	
	@Autowired
	private SiteService siteService;
	
	@RequestMapping(value = "/home",method = RequestMethod.POST)
	public ModelAndView home(){
		ModelAndView modelAndView = new ModelAndView("/admin/home");
		HashMap<String, Object> map = new HashMap<String,Object>();
		// 文章
		pager =blogService.getBlogByPager(pageNum,pageSize);
		map.put("pager", pager);
		
		// 分类
		List<Category> categories = categoryService.getAllCategory();
		map.put("categoryList", null);
		
		// 相册
		map.put("albumList", null);
		
		// 站点信息
		map.put("siteInfo", null);

		modelAndView.addAllObjects(map);
		return modelAndView;
	}
	
}
