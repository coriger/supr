package com.supr.blog.util;

import org.apache.log4j.Logger;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import org.springframework.util.StringUtils;

public class StringUtil {

	private static final Logger logger = Logger.getLogger(StringUtil.class);
	
	/**
	 * url请求中文编码
	 * @param str
	 * @return
	 */
	public static String encodeUrl(String str){
		String url = "";
		if(!StringUtils.isEmpty(str)){
			try {
				url = URLDecoder.decode(str, "utf-8");
			} catch (UnsupportedEncodingException e) {
				logger.error("中文编码异常..."+str,e);
			}
		}
		
		return url;
	}
	
	/**
	 * 格式化url
	 * @param str
	 * @return
	 */
	public static String formatUrl(String str){
		String url = "";
		if(!StringUtils.isEmpty(str)){
			str = str.replaceAll("&&", "&");
		}
		
		return url;
	}
	
}
