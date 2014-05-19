package com.supr.blog.frame.protocol.filter.code;

import com.supr.blog.frame.protocol.filter.MessageFilter;
import com.supr.blog.frame.protocol.filter.MessageFilterHandler;
import com.supr.blog.frame.protocol.message.Message;

/**
 * @desc	编码过滤器
 * @author	ljt
 * @time	2014年5月19日 下午5:08:26
 */
public class EncodeFilter implements MessageFilter{
	
	private Encode encode;
	
	@Override
	public void filter(MessageFilterHandler filterHandler, Message message) {
		// 对message进行编码 
		encode.encode(message);
		filterHandler.handler(message);
	}
	
}
