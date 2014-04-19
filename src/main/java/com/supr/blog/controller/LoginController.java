package com.supr.blog.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
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
	public String preLogin(){
		return "/admin/login";
	}
	
	@RequestMapping(value="/submit",method=RequestMethod.POST)
	public @ResponseBody 
	Result login(@RequestBody Admin admin,HttpSession session){
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
		admin = adminService.getAdminByNameAndPwd(admin);
		if (null != admin) {
			// 存放用户信息在session中 有效时间60分钟
			session.setAttribute("userInfo", admin);
			session.setMaxInactiveInterval(60 * 60);
			result = new Result("success", "登录成功!");
			return result;
		}else{
			result = new Result("error","用户名或密码错误！");
			return result;
		}
	}
	
}
