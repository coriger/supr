package com.supr.blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @功能：后台管理
 * @作者：ljt
 * @时间：2014-4-13 下午1:59:55
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
	
	/**
	 * 用户登录后台首页
	 */
	@RequestMapping("/home")
	public ModelAndView index(){
		ModelAndView modelAndView = new ModelAndView("/admin/home");
		// 分类
		
		// 相册
		
		// 文章
		
		// 站点信息
		
		// 专题  暂时不考虑
		
		return modelAndView;
	}
	
	/**
	 * 用户登出系统
	 */
	@RequestMapping("/loginOut")
	public String loginOut(){
		// 清除session 等等操作
		
		// 跳转登陆页
		return "redirect:/home/login";
	}
	
}
