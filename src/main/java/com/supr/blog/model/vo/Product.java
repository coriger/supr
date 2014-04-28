package com.supr.blog.model.vo;

import org.apache.solr.client.solrj.beans.Field;

/**
 * @功能：sorl索引bean
 * @作者： ljt
 * @时间： 2014-4-28 上午9:12:37
 */
public class Product {
	
	/**
	 * 商品id
	 */
	@Field("id")
	private String productId;
	
	/**
	 * 商品名称
	 */
	@Field
	private String productName;
	
	/**
	 * 商品销量
	 */
	@Field
	private int saleCount;
	
	/**
	 * 商品价格
	 */
	@Field
	private float price;
	
	/**
	 * 商品属性【材质、大小、季节】
	 */
	@Field
	private String[] attr;
	
	/**
	 * 商品属性值【材质=木头、大小=23码、季节=夏天】
	 */
	@Field
	private String[] attrvalue;
	
	/**
	 * 商品来源
	 */
	@Field
	private String source;
	
	/**
	 * 商品外链地址
	 */
	@Field
	private String url;
	
	/**
	 * 商品图地址
	 */
	@Field
	private String picUrl;

	/**
	 * 分类
	 */
	@Field
	private String[] category;

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getSaleCount() {
		return saleCount;
	}

	public void setSaleCount(int saleCount) {
		this.saleCount = saleCount;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String[] getAttr() {
		return attr;
	}

	public void setAttr(String[] attr) {
		this.attr = attr;
	}

	public String[] getAttrvalue() {
		return attrvalue;
	}

	public void setAttrvalue(String[] attrvalue) {
		this.attrvalue = attrvalue;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getPicUrl() {
		return picUrl;
	}

	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}

	public String[] getCategory() {
		return category;
	}

	public void setCategory(String[] category) {
		this.category = category;
	}
}
