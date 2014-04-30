package com.supr.blog.model.vo;

/**
 * @功能：增量索引
 * @作者： ljt
 * @时间： 2014-4-30 上午9:33:59
 */
public class IncProductIndex {
	
	private String productId;
	
	private String productName;
	
	private float price;
	
	private int saleCount;
	
	private int categoryId;
	
	private int indexType;
	
	private int indexId;
	
	private int indexStatue;

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

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public int getSaleCount() {
		return saleCount;
	}

	public void setSaleCount(int saleCount) {
		this.saleCount = saleCount;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public int getIndexType() {
		return indexType;
	}

	public void setIndexType(int indexType) {
		this.indexType = indexType;
	}

	public int getIndexId() {
		return indexId;
	}

	public void setIndexId(int indexId) {
		this.indexId = indexId;
	}

	public int getIndexStatue() {
		return indexStatue;
	}

	public void setIndexStatue(int indexStatue) {
		this.indexStatue = indexStatue;
	}
}
