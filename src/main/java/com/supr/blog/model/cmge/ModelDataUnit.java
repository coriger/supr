package com.supr.blog.model.cmge;

/**
 * @desc	模型数据单元
 * @author liliangchun
 */
public class ModelDataUnit {
	
	/**
	 * 模型数据单元Id
	 */
	private Integer id;
	
	/**
	 * 数据类型ID FK e_data_type
	 */
	private Integer dtId;
	/**
	 * 数据类型名称
	 */
	private String dtName;
	/**
	 * 资源模型的ID
	 */
	private Integer rmId;
	/**
	 * 资源模型的名称
	 */
	private String rmName;
	/**
	 * 模型的数据单元名称
	 */
	private String rmduName;
	
	/**
	 * 用途: 1 属性 2 维度属性
	 */
	private Integer useType;
	
	/**
	 * 最大值
	 */
	private String maxValue;
	
	/**
	 * 最小值
	 */
	private String minValue;
	
	/**
	 * 步进值
	 */
	private String stepValue;
	
	/**
	 * 默认值1
	 */
	private String defaultValue1;
	
	/**
	 * 默认值2
	 */
	private String defaultValue2;
	
	/**
	 * 默认值3
	 */
	private String defaultValue3;
	
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

	public Integer getDtId() {
		return dtId;
	}

	public void setDtId(Integer dtId) {
		this.dtId = dtId;
	}

	public Integer getRmId() {
		return rmId;
	}

	public void setRmId(Integer rmId) {
		this.rmId = rmId;
	}

	public String getRmduName() {
		return rmduName;
	}

	public void setRmduName(String rmduName) {
		this.rmduName = rmduName;
	}

	public Integer getUseType() {
		return useType;
	}

	public void setUseType(Integer useType) {
		this.useType = useType;
	}

	public String getMaxValue() {
		return maxValue;
	}

	public void setMaxValue(String maxValue) {
		this.maxValue = maxValue;
	}

	public String getMinValue() {
		return minValue;
	}

	public void setMinValue(String minValue) {
		this.minValue = minValue;
	}

	public String getStepValue() {
		return stepValue;
	}

	public void setStepValue(String stepValue) {
		this.stepValue = stepValue;
	}

	public String getDefaultValue1() {
		return defaultValue1;
	}

	public void setDefaultValue1(String defaultValue1) {
		this.defaultValue1 = defaultValue1;
	}

	public String getDefaultValue2() {
		return defaultValue2;
	}

	public void setDefaultValue2(String defaultValue2) {
		this.defaultValue2 = defaultValue2;
	}

	public String getDefaultValue3() {
		return defaultValue3;
	}

	public void setDefaultValue3(String defaultValue3) {
		this.defaultValue3 = defaultValue3;
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
	
}
