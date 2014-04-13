package com.supr.blog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	public String preLogin(){
		return "/admin/login";
	}
	
	@RequestMapping(value="/submit",method=RequestMethod.POST)
	public @ResponseBody 
	Result login(@RequestBody Admin admin){
		Result result = null;
		// 校验用户名 
		if (StringUtils.isEmpty(admin.getUsername())) {
			result = new Result("error","用户名输入错误!");
			return result;
		}
		// 校验密码
		if (StringUtils.isEmpty(admin.getPassword())) {
			result = new Result("error","密码输入错误!");
			return result;
		}
		admin = new Admin(admin.getUsername(),admin.getPassword());
		if(adminService.adminExists(admin)){
			result = new Result("success","登录成功!");
			return result;
		}else{
			result = new Result("error","用户名或密码错误！");
			return result;
		}
	}
	
}