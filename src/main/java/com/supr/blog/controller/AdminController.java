package com.supr.blog.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.supr.blog.model.Admin;
import com.supr.blog.service.AdminService;

/**
 * @功能：后台管理
 * @作者：ljt
 * @时间：2014-4-13 下午1:59:55
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
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
	
	/**
	 * 新增管理员
	 * @param admin
	 */
	@RequestMapping(value = "/add",method = RequestMethod.POST)
	public void addAdmin(Admin admin){
		
	}
	
	/**
	 * 删除管理员
	 * @param adminId
	 */
	@RequestMapping(value = "/delete",method = RequestMethod.POST)
	public void deleteAdmin(Integer adminId){
		
	}
	
	/**
	 * 更新管理员
	 */
	@RequestMapping(value = "/update",method = RequestMethod.POST)
	public void updateAdmin(Admin admin){
		
	}
	
	/**
	 * 获取管理员信息
	 * @param adminId
	 */
	@RequestMapping(value = "/get",method = RequestMethod.POST)
	public void getAdmin(Integer adminId){
		
	}
	
	/**
	 * 获取管理员列表
	 * @param adminId
	 */
	@RequestMapping(value = "/list")
	public String getAdminList(ModelMap model){
		List<Admin> adminList = adminService.getAdminList();
		model.addAttribute("adminList", adminList);
		return "/admin/admin/list_admin";
	}
	
}
