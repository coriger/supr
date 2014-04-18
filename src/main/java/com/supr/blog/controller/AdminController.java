package com.supr.blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @功能：后台管理
 * @作者：ljt
 * @时间：2014-4-13 下午1:59:55
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
	
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
