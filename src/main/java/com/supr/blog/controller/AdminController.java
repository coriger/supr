package com.supr.blog.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.supr.blog.model.Admin;
import com.supr.blog.model.vo.Result;
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
	public @ResponseBody 
	Result addAdmin(Admin admin,@RequestParam String type){
		if(type.equals("add")){
			admin.setIsEnabled(Admin.isEnable);
			int i = adminService.addAdmin(admin);
			if(i == 1){
				return new Result("success", "新增管理员成功！");
			}else{
				return new Result("error", "新增管理员失败！");
			}
		}else if(type.equals("edit")){
			int i = adminService.updateAdmin(admin);
			if(i == 1){
				return new Result("success", "更新管理员成功！");
			}else{
				return new Result("error", "更新管理员失败！");
			}
		}
		
		return null;
	}
	
	/**
	 * 新增管理员
	 * @param admin
	 */
	@RequestMapping(value = "/add_admin")
	public String addAdmin(@RequestParam String type,@RequestParam String userId,ModelMap map){
		if(type.equals("edit")){
			Admin admin = adminService.getAdminById(userId);
			map.addAttribute("admin", admin);
		}
		return "admin/admin/add_admin";
	}
	
	/**
	 * 删除管理员
	 * @param adminId
	 */
	@RequestMapping(value = "/delete",method = RequestMethod.POST)
	public void deleteAdmin(Integer adminId){
		
	}
	
	/**
	 * 删除管理员
	 * @param adminId
	 */
	@RequestMapping(value = "/deleteBatch",method = RequestMethod.POST)
	public @ResponseBody 
	Result deleteBatch(@RequestParam String adminIds){
		String[] ids = adminIds.split(",");
		int count = adminService.deleteBatch(ids);
		if(count != ids.length){
			return new Result("error", "删除失败！");
		}else{
			return new Result("success", "删除成功！");
		}
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
	public String getAdminList(){
		return "/admin/admin/list_admin";
	}
	
	/**
	 * 获取管理员列表
	 * @param adminId
	 */
	@RequestMapping(value = "/list_admin")
	public @ResponseBody 
	Map<String, Object> getAdminListJson(){
		Map<String, Object> map = new HashMap<String, Object>();
		List<Admin> adminList = adminService.getAdminList();
		map.put("rows", adminList);
		map.put("total", 28);
		return map;
	}
	
}
