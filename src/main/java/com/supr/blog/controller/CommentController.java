package com.supr.blog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.supr.blog.service.CommentService;

/**
 * @功能：评论管理
 * @作者：ljt
 * @时间：2014-4-18 下午10:03:06
 */
@Controller
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
}
