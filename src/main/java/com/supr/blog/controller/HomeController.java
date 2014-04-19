package com.supr.blog.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.supr.blog.model.Admin;
import com.supr.blog.model.Album;
import com.supr.blog.model.Category;
import com.supr.blog.model.SiteInfo;
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
	
	@RequestMapping(value = "/home")
	public ModelAndView home(HttpSession session){
		Admin admin = (Admin)session.getAttribute("userInfo");
		if(null == admin){
			return null;
		}
		ModelAndView modelAndView = new ModelAndView("/admin/home");
		HashMap<String, Object> map = new HashMap<String,Object>();
		// 文章
		pager =blogService.getBlogByPager(pageNum,pageSize);
		map.put("pager", pager);
		
		// 分类
		List<Category> categoryList = categoryService.getAllCategory();
		map.put("categoryList", categoryList);
		
		// 相册
		List<Album> albumList = albumService.getAllAlbum();
		map.put("albumList", albumList);
		
		// 站点信息
		SiteInfo siteInfo = siteService.getSiteInfo();
		map.put("siteInfo", siteInfo);

		modelAndView.addAllObjects(map);
		return modelAndView;
	}
	
}
