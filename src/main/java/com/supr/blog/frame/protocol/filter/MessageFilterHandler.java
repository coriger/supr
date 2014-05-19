package com.supr.blog.frame.protocol.filter;

import com.supr.blog.frame.protocol.message.Message;

/**
 * @desc	报文过滤调度器
 * @author	ljt
 * @time	2014年5月19日 下午4:39:03
 */
public interface MessageFilterHandler {
	
	void handler(Message message);
	
}
