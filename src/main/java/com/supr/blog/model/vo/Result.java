package com.supr.blog.model.vo;

/**
 * @功能：操作处理结果
 * @作者：ljt
 * @时间：2014-4-12 下午9:56:54
 */
public class Result {
	
	// 操作结果
	private String resultCode;
	
	// 错误信息
	private String errorInfo;
	
	public Result(String resultCode, String errorInfo) {
		super();
		this.resultCode = resultCode;
		this.errorInfo = errorInfo;
	}

	public String getResultCode() {
		return resultCode;
	}

	public void setResultCode(String resultCode) {
		this.resultCode = resultCode;
	}

	public String getErrorInfo() {
		return errorInfo;
	}

	public void setErrorInfo(String errorInfo) {
		this.errorInfo = errorInfo;
	}
}
