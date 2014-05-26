package com.supr.blog.jsoup.api;

import java.util.List;

/**
 * @desc	Url生成策略接口  有可能按数字递增或者其他
 * @author	ljt
 * @time	2014-5-26 上午9:59:16
 */
public interface UrlGeneratorStratery {
	
	public List<String> generator();
	
}
