package com.supr.blog.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	@RequestMapping(value = "/loginout",method = RequestMethod.GET)
	public String loginOut(HttpSession session){
		// 清除session cookie
		session.removeAttribute("currentUser");
		// 跳转登陆页
		return "/home/login";
	}
	
}
