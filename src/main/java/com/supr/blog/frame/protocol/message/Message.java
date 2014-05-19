package com.supr.blog.frame.protocol.message;

/**
 * @desc	报文
 * 
 * 格式：	长度 + 报体      比如：
 * @author	ljt
 * @time	2014年5月19日 下午4:30:18
 */
public class Message {
	
	// 包头
	private MessageHeader messageHeader;
	
	// 包体
	private byte[] messageBody;
	
	// 报文长度
	private int bodyLength;

	public MessageHeader getMessageHeader() {
		return messageHeader;
	}

	public void setMessageHeader(MessageHeader messageHeader) {
		this.messageHeader = messageHeader;
	}

	public byte[] getMessageBody() {
		return messageBody;
	}

	public void setMessageBody(byte[] messageBody) {
		this.messageBody = messageBody;
	}

	public int getBodyLength() {
		return bodyLength;
	}

	public void setBodyLength(int bodyLength) {
		this.bodyLength = bodyLength;
	}
}
