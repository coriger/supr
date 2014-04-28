package com.supr.blog.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.supr.blog.service.SearchService;
import com.supr.blog.util.StringUtil;
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
	public String searchProduct(HttpServletRequest request,ModelMap model){
		/******************************************************************************
		 * 搜索过程：
		 * 1、获取请求url  这里有个校验的过程 必须匹配三个规则
		 * 		1、参数之间用&隔开
		 * 		2、属性 值之间用_隔开
		 * 		3、值如果是属性的话  则属性Id和值Id用=隔开
		 * 		4、url格式：(几种搜索的情况)
		 * 				首页关键字搜索：keyword=连衣裙
		 * 						   分类栏可以不用显示,加入facet分类的时候只有一个,那就直接显示分类，否则分类作为一个facet字段供用户选择
		 * 				选择分类关键字搜索：keyword=连衣裙&category=110
		 * 						  分类栏要显示对应的分类，并且分类facet就不需要返回了
		 * 				选择分类和具体属性关键字搜索：
		 * 						 keyword=连衣裙&category=110&attrvalue_attrId=valueId
		 * 				排序：
		 * 						 keyword=连衣裙&category=110&attrvalue_attrId=valueId&price_sort=desc
		 * 				范围搜索：
		 * 						 keyword=连衣裙&category=110&attrvalue_attrId=valueId&price_sort=desc&price_[1-1000]
		 * 				facet分组：
		 * 						 attr、category
		 * 2、url中文编码处理
		 * 3、解析url，提交solr查询 返回分页结果
		 * 		1）、查询
		 * 		2）、排序
		 * 		3）、高亮
		 * 		4）、分组
		 * 		5）、分页
		 * 4、其余问题：
		 * 		1）、url格式不对 如何访问数据
		 * 		2）、商品价格范围如何定义
		 ******************************************************************************/
		// 获取请求url
		String url = request.getQueryString();
		// 中文编码
		url = StringUtil.encodeUrl(url);
		// 特殊字符替换
		url = StringUtil.formatUrl(url);
		
		/**
		 * 1、最后结果需要以下几种数据：
		 * 		1）、分页信息   当前页  每页显示数  总数量  总页数
		 * 		2）、排序字段
		 * 		3）、所属分类
		 * 		4）、商品属性 以及 属性值列表  每个属性值对应的商品数
		 */
		// 解析url 返回结果
		SolrPager pager = searchService.getProductPageInfo(pageSize,pageNum,url);
		
		model.put("pager", pager);
		
		return null;
	}
	
}
