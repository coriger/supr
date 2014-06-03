package com.supr.blog.model.cmge;

/**
 * @desc	模型
 * @author	ljt
 * @time	2014-5-30 上午9:43:47
 */
public class Model {
	
	/**
	 * 模型Id
	 */
	private Integer id;
	
	/**
	 * 行业Id
	 */
	private Integer tId;
	
	/**
	 * 行业名称
	 */
	private String rtName;
	
	/**
	 * 模型名
	 */
	private String rmName;
	
	/**
	 * 模型key 全局唯一 （RM#EateryRoom）
	 */
	private String rmKey;
	
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

	public Integer gettId() {
		return tId;
	}

	public void settId(Integer tId) {
		this.tId = tId;
	}

	public String getRmName() {
		return rmName;
	}

	public void setRmName(String rmName) {
		this.rmName = rmName;
	}

	public String getRmKey() {
		return rmKey;
	}

	public void setRmKey(String rmKey) {
		this.rmKey = rmKey;
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

	public String getRtName() {
		return rtName;
	}

	public void setRtName(String rtName) {
		this.rtName = rtName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
}
