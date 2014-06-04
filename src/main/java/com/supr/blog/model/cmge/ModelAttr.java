package com.supr.blog.model.cmge;

/**
 * 模型属性
 * @author coriger
 */
public class ModelAttr {
	
	/**
	 * 属性Id
	 */
	private Integer Id;
	
	/**
	 * 模型名
	 */
	private String rmName;
	
	/**
	 * 模型Id
	 */
	private Integer rmId;
	
	/**
	 * 数据单元Id
	 */
	private Integer rmduId;
	
	/**
	 * 属性名称
	 */
	private String rmpName;
	
	/**
	 * 模型属性数据单元类型
	 */
	private String dtName;
	
	/**
	 * 模型属性Key 本模型唯一
	 */
	private String rmpKey;
	
	/**
	 * 模型属性完整Key 全局唯一
	 */
	private String rmpFullKey;
	
	/**
	 * 创建时间
	 */
	private long createTime;
	
	/**
	 * 创建者Id
	 */
	private Integer createBy;

	/**
	 * 修改时间
	 */
	private long modifyTime;
	
	/**
	 * 修改者Id
	 */
	private Integer modifyBy;
	
	/**
	 * 描述
	 */
	private String description;

	public Integer getId() {
		return Id;
	}

	public void setId(Integer id) {
		Id = id;
	}

	public String getRmpName() {
		return rmpName;
	}

	public void setRmpName(String rmpName) {
		this.rmpName = rmpName;
	}

	public String getRmpKey() {
		return rmpKey;
	}

	public void setRmpKey(String rmpKey) {
		this.rmpKey = rmpKey;
	}

	public String getRmpFullKey() {
		return rmpFullKey;
	}

	public void setRmpFullKey(String rmpFullKey) {
		this.rmpFullKey = rmpFullKey;
	}

	public long getCreateTime() {
		return createTime;
	}

	public void setCreateTime(long createTime) {
		this.createTime = createTime;
	}

	public Integer getCreateBy() {
		return createBy;
	}

	public void setCreateBy(Integer createBy) {
		this.createBy = createBy;
	}

	public long getModifyTime() {
		return modifyTime;
	}

	public void setModifyTime(long modifyTime) {
		this.modifyTime = modifyTime;
	}

	public Integer getModifyBy() {
		return modifyBy;
	}

	public void setModifyBy(Integer modifyBy) {
		this.modifyBy = modifyBy;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDtName() {
		return dtName;
	}

	public void setDtName(String dtName) {
		this.dtName = dtName;
	}

	public String getRmName() {
		return rmName;
	}

	public void setRmName(String rmName) {
		this.rmName = rmName;
	}

	public Integer getRmId() {
		return rmId;
	}

	public void setRmId(Integer rmId) {
		this.rmId = rmId;
	}

	public Integer getRmduId() {
		return rmduId;
	}

	public void setRmduId(Integer rmduId) {
		this.rmduId = rmduId;
	}
}
