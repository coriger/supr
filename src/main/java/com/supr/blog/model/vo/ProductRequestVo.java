package com.supr.blog.model.vo;

/**
 * @功能：商品搜索请求vo
 * @作者： ljt
 * @时间： 2014-4-29 下午3:27:39
 */
public class ProductRequestVo {
	
	/**
	 * 搜索关键字	keyword=连衣裙
	 */
	private String keyword;
	
	/**
	 * 范围搜索字段	range=price_[1-1000];comment_[1-3]
	 */
	private String range;
	
	/**
	 * 普通属性参数	param=categoryId=1100;productStatue=1;sendType=3
	 */
	private String param;

	/**
	 * 排序参数	sort=price:desc;saleCount:adc;
	 */
	private String sort;
	
	/**
	 * 商品属性参数	attrvalue=attrId1:valueId1;attrId2:valueId2;attrId3:valueId3;
	 */
	private String attrvalue;

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getRange() {
		return range;
	}

	public void setRange(String range) {
		this.range = range;
	}

	public String getParam() {
		return param;
	}

	public void setParam(String param) {
		this.param = param;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getAttrvalue() {
		return attrvalue;
	}

	public void setAttrvalue(String attrvalue) {
		this.attrvalue = attrvalue;
	}
}
