package com.supr.blog.frame.protocol.message;

/**
 * @desc	默认报头
 * @author	ljt
 * @time	2014年5月19日 下午5:12:45
 */
public class DefaultMessageHeader extends MessageHeader{
	
	public DefaultMessageHeader(int bodyLength) {
		this.bodyLength = bodyLength;
	}
	
	@Override
	public int getBodyLength() {
		return bodyLength;
	}
	
	@Override
	public void setBodyLength() {
		this.bodyLength = bodyLength;
	}
	
}
