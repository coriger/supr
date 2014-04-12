package com.supr.blog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.supr.blog.model.Admin;
import com.supr.blog.model.vo.Result;
import com.supr.blog.service.AdminService;

/**
 * @功能：用户登录
 * @作者：ljt
 * @时间：2014-4-12 下午8:48:53
 */
@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(method=RequestMethod.GET)
	public String index(){
		return "/admin/login";
	}
	
	@RequestMapping(value="/submit",method=RequestMethod.POST)
	public @ResponseBody 
	Result login(String username,String password){
		// 校验用户名 
		if (StringUtils.isEmpty(username) || username.length() < 10) {
			return new Result("error","用户名输入错误!");
		}
		// 校验密码
		if (StringUtils.isEmpty(password) || password.length() < 10) {
			return new Result("error","密码输入错误!");
		}
		Admin admin = new Admin(username,password);
		if(adminService.adminExists(admin)){
			return new Result("success","登录成功!");
		}else{
			return new Result("error","用户名或密码错误！");
		}
	}
	
}
