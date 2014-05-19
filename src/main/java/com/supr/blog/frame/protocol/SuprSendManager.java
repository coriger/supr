package com.supr.blog.frame.protocol;

import java.io.DataOutputStream;

import com.supr.blog.frame.protocol.filter.MessageFilterHandler;

/**
 * @desc	通信入口
 * @author	ljt
 * @time	2014年5月19日 下午5:28:06
 */
public class SuprSendManager {

	/**
	 * 过滤器控制对象
	 */
	private MessageFilterHandler filterHandler;
	
	public SendResult send(DataOutputStream dataOutputStream) {
		
		int bodyLength = dataOutputStream.size();
		
		return null;
	}

}
