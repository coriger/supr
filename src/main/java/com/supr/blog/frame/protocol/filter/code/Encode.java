package com.supr.blog.frame.protocol.filter.code;

import com.supr.blog.frame.protocol.message.Message;

/**
 * @desc	编码类
 * @author	ljt
 * @time	2014年5月19日 下午5:14:11
 */
public class Encode {

	/**
	 * 编码
	 * @param message
	 */
	public void encode(Message message) {
		// 对body进行编码处理
		byte[] body = message.getMessageBody();
		body = new String(body).getBytes();
		message.setMessageBody(body);
	}

}
