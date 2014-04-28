package com.supr.blog.model.vo;

/**
 * @功能：商品属性值bean
 * @作者： ljt
 * @时间： 2014-4-28 下午3:39:05
 */
public class ProductVal {
	
	/**
	 * 商品属性值Id
	 */
	private String valId;
	
	/**
	 * 商品属性值名称
	 */
	private String valName;
	
	/**
	 * 商品属性Id
	 */
	private String attrId;

	public String getValId() {
		return valId;
	}

	public void setValId(String valId) {
		this.valId = valId;
	}

	public String getValName() {
		return valName;
	}

	public void setValName(String valName) {
		this.valName = valName;
	}

	public String getAttrId() {
		return attrId;
	}

	public void setAttrId(String attrId) {
		this.attrId = attrId;
	}
}
