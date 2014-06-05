package com.supr.blog.model.cmge;

/**
 * @desc	模型维度
 * @author	ljt
 * @time	2014-6-5 上午10:05:00
 */
public class ModelLat {
	
	/**
	 * 维度主键Id
	 */
	private Integer id;
	
	/**
	 * 模型Id
	 */
	private Integer rmId;
	
	/**
	 * 模型名称
	 */
	private String rmName;
	
	/**
	 * 维度算法名称
	 */
	private String daName;
	
	/**
	 * 维度算法Key
	 */
	private String daKey;
	
	/**
	 * 维度算法Id
	 */
	private Integer daId;
	
	/**
	 * 维度名称
	 */
	private String rmdName;
	
	/**
	 * 维度完整Key
	 */
	private String rmdFullKey;
	
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

	public Integer getRmId() {
		return rmId;
	}

	public void setRmId(Integer rmId) {
		this.rmId = rmId;
	}

	public Integer getDaId() {
		return daId;
	}

	public void setDaId(Integer daId) {
		this.daId = daId;
	}

	public String getRmdName() {
		return rmdName;
	}

	public void setRmdName(String rmdName) {
		this.rmdName = rmdName;
	}

	public String getRmdFullKey() {
		return rmdFullKey;
	}

	public void setRmdFullKey(String rmdFullKey) {
		this.rmdFullKey = rmdFullKey;
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

	public String getRmName() {
		return rmName;
	}

	public void setRmName(String rmName) {
		this.rmName = rmName;
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
}
