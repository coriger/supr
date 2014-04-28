package com.supr.blog.util;

import java.util.Collection;
import java.util.Map;

/**
 * @功能：基本工具类
 * @作者： ljt
 * @时间： 2014-4-28 下午3:13:17
 */
public class SuprUtil {
	
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
	
}
