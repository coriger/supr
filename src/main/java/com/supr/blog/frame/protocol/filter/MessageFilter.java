package com.supr.blog.frame.protocol.filter;

import com.supr.blog.frame.protocol.message.Message;

/**
 * @desc	报文过滤器   编解码、解压缩、加密解密
 * 
 * 流程：	请求对象--->>>二进制流--->>>编码--->>>加密--->>>压缩<<<-|传送协议传送|->>>解压缩--->>>解密
 * 			--->>>解码--->>>处理粘包(组装包)--->>>二进制流映射响应对象
 * 
 * @author	ljt
 * @time	2014年5月19日 下午4:32:06
 */
public interface MessageFilter {
	
	void filter(MessageFilterHandler filterHandler,Message message);
	
}
