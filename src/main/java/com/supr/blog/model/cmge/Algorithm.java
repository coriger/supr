package com.supr.blog.model.cmge;

/**
 * @desc	维度算法
 * @author	ljt
 * @time	2014-6-5 上午10:26:37
 */
public class Algorithm {
	
	/**
	 * 主键Id
	 */
	private Integer id;
	
	/**
	 * 算法名称
	 */
	private String daName;
	
	/**
	 * 算法key
	 */
	private String daKey;
	
	/**
	 * 算法类路径
	 */
	private String daClass;
	
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

	public String getDaName() {
		return daName;
	}

	public void setDaName(String daName) {
		this.daName = daName;
	}

	public String getDaKey() {
		return daKey;
	}

	public void setDaKey(String daKey) {
		this.daKey = daKey;
	}

	public String getDaClass() {
		return daClass;
	}

	public void setDaClass(String daClass) {
		this.daClass = daClass;
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
}
