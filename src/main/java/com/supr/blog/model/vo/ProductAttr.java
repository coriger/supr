package com.supr.blog.model.vo;

import java.util.ArrayList;
import java.util.List;

import com.supr.blog.util.SuprUtil;

/**
 * @功能：商品属性bean
 * @作者： ljt
 * @时间： 2014-4-28 下午3:36:25
 */
public class ProductAttr {
	
	/**
	 * 商品属性Id
	 */
	private String attrId;
	
	/**
	 * 商品属性名称
	 */
	private String attrName;
	
	/**
	 * 商品属性值集合
	 */
	private List<ProductVal> valList;

	public String getAttrId() {
		return attrId;
	}

	public void setAttrId(String attrId) {
		this.attrId = attrId;
	}

	public String getAttrName() {
		return attrName;
	}

	public void setAttrName(String attrName) {
		this.attrName = attrName;
	}

	public List<ProductVal> getValList() {
		return valList;
	}

	public void setValList(List<ProductVal> valList) {
		this.valList = valList;
	}
	
	public void setVal(ProductVal productVal){
		if(SuprUtil.isEmptyCollection(this.valList)){
			this.valList = new ArrayList<ProductVal>();
		}
		this.valList.add(productVal);
	}
}	

