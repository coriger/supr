package com.supr.blog.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.solr.client.solrj.response.FacetField.Count;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.supr.blog.model.Product;
import com.supr.blog.service.SearchService;
import com.supr.blog.util.pager.Pager;

/**
 * @功能：搜索模块
 * @作者：ljt
 * @时间：2014-4-26 下午6:09:16
 */
@Controller
@RequestMapping("/search")
public class SearchController extends BaseController{
	
	private static final Logger logger = Logger.getLogger(SearchController.class);
	
	@Autowired
	private SearchService searchService;
	
	@RequestMapping("/product")
	public String search(HttpServletRequest request,ModelMap model){
		/******************************************************************************
		 * 搜索过程：
		 * 1、获取请求url
		 * 2、url中文编码处理
		 * 3、解析url，提交solr查询 返回分页结果
		 * 		1）、查询
		 * 		2）、排序
		 * 		3）、高亮
		 * 		4）、分组
		 * 		5）、分页
		 * 4、获取facet集合 遍历 并获取对应属性对象
		 ******************************************************************************/
		
		// 1、获取请求url
		String url = request.getQueryString();
		// 2、url中文编码处理
		try {
			url = URLDecoder.decode(url, "utf-8");
		} catch (UnsupportedEncodingException e) {
			logger.error("搜索url编码异常："+url, e);
		}
		
		// 3、解析url，提交solr查询
		Pager pager = searchService.getPageInfo(Product.class,pageSize,pageNum,url);
		
		// 4、属性封装
		Map<String,List<Count>> facetMap = pager.getFacetFieldMap();
		
		model.put("pager", pager);
		
		return null;
	}
	
}
