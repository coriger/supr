package com.supr.blog.model.cmge;

/**
 * @desc	维度算法设参
 * @author	ljt
 * @time	2014-6-5 下午5:03:43
 */
public class AlgorithmProvide {
	
	/**
	 * 主键Id
	 */
	private Integer id;
	
	/**
	 * 算法Id
	 */
	private Integer daId;
	
	/**
	 * 数据类型Id
	 */
	private Integer dtId;
	
	/**
	 * 数据类型名称
	 */
	private String dtName;
	
	/**
	 * 设参 参数名
	 */
	private String dappName;
	
	/**
	 * 设参 参数key
	 */
	private String dappKey;
	
	/**
	 * 设参 参数完整key
	 */
	private String dappFullKey;
	
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
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getDaId() {
		return daId;
	}

	public void setDaId(Integer daId) {
		this.daId = daId;
	}

	public Integer getDtId() {
		return dtId;
	}

	public void setDtId(Integer dtId) {
		this.dtId = dtId;
	}

	public String getDappName() {
		return dappName;
	}

	public void setDappName(String dappName) {
		this.dappName = dappName;
	}

	public String getDappKey() {
		return dappKey;
	}

	public void setDappKey(String dappKey) {
		this.dappKey = dappKey;
	}

	public String getDappFullKey() {
		return dappFullKey;
	}

	public void setDappFullKey(String dappFullKey) {
		this.dappFullKey = dappFullKey;
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
}
