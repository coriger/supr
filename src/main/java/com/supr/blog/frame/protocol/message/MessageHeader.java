package com.supr.blog.frame.protocol.message;

/**
 * @desc	报文头
 * @author	ljt
 * @time	2014年5月19日 下午4:28:39
 */
public abstract class MessageHeader {
	 
	public int bodyLength;
	
	/**
	 * 获取报体长度
	 * @return
	 */
	public abstract int getBodyLength();
	
	/**
	 * 设置报体长度
	 */
	public abstract void setBodyLength();
	
}
