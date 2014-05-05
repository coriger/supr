package com.supr.blog.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.supr.blog.model.vo.ProductRequestVo;
import com.supr.blog.model.vo.Result;
import com.supr.blog.service.SearchService;
import com.supr.blog.util.Constant;
import com.supr.blog.util.pager.SolrPager;

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
	public String searchProduct(ProductRequestVo product,HttpServletRequest request,ModelMap model){
		SolrPager pager = searchService.getProductPageInfo(pageSize,pageNum,product);
		model.put("pager", pager);
		return "/blog/product";
	}
	
	/**
	 * 构造全量索引
	 */
	public void buildAllIndex(){
		int result = searchService.deleteAllIndex();
		if(result == Constant.SUCCESS){
			// 开始构建全量索引  分批读取数据
			
			
		}
	}
	
	/**
	 * 自动提示
	 */
	@RequestMapping("/suggest")
	public @ResponseBody  
	Result getSuggestByKeyword(){
		
		
		return new Result("", "");
	}
	
}
