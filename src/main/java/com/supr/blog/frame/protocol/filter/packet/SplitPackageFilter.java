package com.supr.blog.frame.protocol.filter.packet;

import com.supr.blog.frame.protocol.filter.MessageFilter;
import com.supr.blog.frame.protocol.filter.MessageFilterHandler;
import com.supr.blog.frame.protocol.message.Message;

/**
 * @desc	分包过滤器
 * @author	ljt
 * @time	2014年5月19日 下午4:49:18
 */
public class SplitPackageFilter implements MessageFilter{
	
	@Override
	public void filter(MessageFilterHandler filterHandler,Message message) {
		// 处理message
		
		filterHandler.handler(message);
	}
	
}
