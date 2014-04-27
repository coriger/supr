package com.supr.blog.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.supr.blog.model.Admin;
import com.supr.blog.model.Blog;
import com.supr.blog.model.Tag;
import com.supr.blog.model.vo.Result;
import com.supr.blog.service.BlogService;
import com.supr.blog.service.TagService;

/**
 * @功能：文章
 * @作者：ljt
 * @时间：2014-4-19 上午8:56:53
 */
@Controller
@RequestMapping("/blog")
public class BlogController extends BaseController {
	
	private static final Logger logger = Logger.getLogger(BlogController.class);
	
	@Autowired
	private BlogService blogService;
	
	@Autowired
	private TagService tagService;
	
//	@Autowired
//	private FreemarkerUtil freemarkerUtil;
	
	/**
	 * 跳转新增文章页面
	 * @param model
	 * @return
	 */
	@RequestMapping("/new")
	public String newBlog(ModelMap model){
		// 获取文章标签
		List<Tag> tagList = tagService.getAllTag();
		
		model.addAttribute("tagList", tagList);
		model.addAttribute("publishTime", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		model.addAttribute("postFix", new SimpleDateFormat("HHmmss").format(new Date()));
		return "/admin/blog/add_blog";
	}
	
	/**
	 * 新增文章
	 * @param blog
	 * @param session
	 * @return
	 */
	@RequestMapping("/add")
	public String addBlog(Blog blog,HttpSession session){
		Admin admin = (Admin)session.getAttribute("userInfo");
		blog.setUserId(admin.getUserId());
		int i = blogService.addBlog(blog);
		if(i > 0){
			return "redirect:/home";
		}else{
			// 更新失败
			return "/admin/error/error";
		}
	}
	
	/**
	 * 删除文章
	 * @param blogId
	 * @return
	 */
	@RequestMapping("/delete/{blogId}")
	public @ResponseBody
	Result deleteBlog(@PathVariable Integer blogId){
		int i = blogService.deleteBlogById(blogId);
		if(i > 0){
			return new Result("success", "删除成功！");
		}else{
			// 更新失败
			return new Result("error", "删除失败！");
		}
	}
	
	/**
	 * 编辑文章
	 * @param blogId
	 * @return
	 */
	@RequestMapping("/edit/{blogId}")
	public String editBlog(@PathVariable Integer blogId,ModelMap model){
		// 获取文章标签
		List<Tag> tagList = tagService.getAllTag();
		// 文章对象
		Blog blog = blogService.getBlogById(blogId);
		
		model.addAttribute("tagList", tagList);
		model.addAttribute("blog", blog);
		return "/admin/blog/edit_blog";
	}
	
	@RequestMapping("/update")
	public String updateBlog(Blog blog){
		int i = blogService.updateBlog(blog);
		if(i > 0){
			return "redirect:/home";
		}else{
			// 更新失败
			return "/admin/error/error";
		}
	}
	
	@RequestMapping("/{postFix}")
	public String blogInfo(@PathVariable String postFix,Blog blog,HttpServletRequest request,HttpServletResponse response){
		if(isExistPage(request, response)){
			// 有则直接跳转页面
			try {
				response.sendRedirect(request.getRequestURI()+".html");
			} catch (IOException e) {
				logger.error("跳转静态页面异常...",e);
			}
			return null;
		}
		
		// 没有则执行静态化操作  并返回静态页面
		blog = blogService.getBlogById(blog.getBlogId());
		// 开启线程执行静态化操作  也可以放在定时任务统一执行
		
		return "/blog/single_blog";
	}
	
}
