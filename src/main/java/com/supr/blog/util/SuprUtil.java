package com.supr.blog.util;

import org.apache.log4j.Logger;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Collection;
import java.util.Map;

import org.springframework.util.StringUtils;

/**
 * @功能：基本工具类
 * @作者： ljt
 * @时间： 2014-4-28 下午3:13:17
 */
public class SuprUtil {
	
	private static final Logger logger = Logger.getLogger(SuprUtil.class);
	
	/**
	 * 判断集合是否非空
	 * @param collection
	 * @return
	 */
	public static boolean isEmptyCollection(Collection<?> collection){
		boolean flag = true;
		if(null != collection){
			if(collection.size() > 0){
				flag = false;
			}
		}
		
		return flag;
	}
	
	/**
	 * 判断集合是否非空
	 * @param collection
	 * @return
	 */
	public static boolean isEmptyMap(Map map){
		boolean flag = true;
		if(null != map){
			if(map.size() > 0){
				flag = false;
			}
		}
		
		return flag;
	}
	
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
			url = str.replaceAll("&&", "&");
		}
		
		return url;
	}
	
}
