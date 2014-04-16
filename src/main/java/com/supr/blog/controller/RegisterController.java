package com.supr.blog.controller;

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
 * @功能：用户注册
 * @作者：ljt
 * @时间：2014-4-12 下午8:47:52
 */
@Controller
@RequestMapping("/register")
public class RegisterController {
	
	@Autowired
	private AdminService adminService;
	
	/**
	 * 跳转注册页
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String index(){
		return "/admin/register";
	}
	
	
	/**
	 * 检查用户名是否被禁用或已存在
	 */
	@RequestMapping(value = "/check_username", method = RequestMethod.GET)
	public @ResponseBody
	boolean checkUsername(String username) {
		if (StringUtils.isEmpty(username)) {
			return false;
		}
		if (adminService.usernameDisabled(username) || adminService.usernameExists(username)) {
			return false;
		} else {
			return true;
		}
	}

	/**
	 * 检查E-mail是否存在
	 */
	@RequestMapping(value = "/check_email", method = RequestMethod.GET)
	public @ResponseBody
	boolean checkEmail(String email) {
		if (StringUtils.isEmpty(email)) {
			return false;
		}
		if (adminService.emailExists(email)) {
			return false;
		} else {
			return true;
		}
	}
	
	/**
	 * 注册
	 */
	@RequestMapping(method=RequestMethod.POST)
	public @ResponseBody
	Result register(@RequestBody Admin admin){
		// 校验用户名 
		if (StringUtils.isEmpty(admin.getUsername())) {
			return new Result("error","用户名输入错误!");
		}
		// 校验密码
		if (StringUtils.isEmpty(admin.getPassword())) {
			return new Result("error","密码输入错误!");
		}
		// 校验邮箱
		if (StringUtils.isEmpty(admin.getEmail())) {
			return new Result("error","邮箱输入错误!");
		}
		
		admin = new Admin(admin.getUsername(),admin.getPassword(),admin.getEmail());
		boolean result = adminService.register(admin);
		if(result){
			return new Result("success","注册成功！");
		}else{
			return new Result("error","注册失败！");
		}
	}
	
}
