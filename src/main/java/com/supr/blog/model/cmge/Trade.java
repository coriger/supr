package com.supr.blog.model.cmge;

/**
 * @desc	行业
 * @author	ljt
 * @time	2014-5-30 上午9:47:46
 */
public class Trade {
	
	/**
	 * 行业Id
	 */
	private Integer id;
	
	/**
	 * 行业名称
	 */
	private String rtName;
	
	/**
	 * 父行业Id
	 */
	private Integer parentId;
	
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
	private String desc;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getRtName() {
		return rtName;
	}

	public void setRtName(String rtName) {
		this.rtName = rtName;
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
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

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}
}
