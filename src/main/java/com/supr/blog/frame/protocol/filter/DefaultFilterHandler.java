package com.supr.blog.frame.protocol.filter;

import java.util.ArrayList;
import java.util.List;

import com.supr.blog.frame.protocol.message.Message;

/**
 * @desc	过滤器控制器默认实现
 * @author	ljt
 * @time	2014年5月19日 下午4:51:28
 */
public class DefaultFilterHandler implements MessageFilterHandler{
	
	private List<MessageFilter> list = new ArrayList<MessageFilter>();
	
	/**
	 * 执行过滤器  递归方式
	 */
	@Override
	public void handler(Message message) {
		// 获取下一个过滤器   执行filter操作
//		MessageFilter filter = getNextFilter();
//		filter.filter(this, message);
	}

	public void setList(List<MessageFilter> list) {
		this.list = list;
	}
	
	public void addFilter(MessageFilter filter) {
		if(!list.contains(filter)){
			list.add(filter);
		}
	}
	
}
