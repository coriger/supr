package com.supr.blog.jsoup.douban.craw;

import java.util.ArrayList;
import java.util.List;

import com.supr.blog.jsoup.api.UrlGeneratorStratery;
import com.supr.blog.jsoup.config.CrawConfig;
import com.supr.blog.jsoup.douban.config.DouBanCrawConfig;

/**
 * @desc	豆瓣url爬取生成策略
 * 			
 * 			1、根据tag标签抓取所有实体页面以及实体的评论、读书笔记页面
 *
 * @author	ljt
 * @time	2014-5-26 上午10:22:12
 */
public class DouBanUrlStrategy implements UrlGeneratorStratery{
	
	// url头  不变的部分
	private String urlHead;
	
	// url参数  变化的部分
	private String param; 
	
	// 有效的url
	private List<String> urlList = new ArrayList<String>(); 
	
	@Override
	public List<String> generator(CrawConfig config) {
		DouBanCrawConfig douBanCrawConfig = null;
		if(config instanceof DouBanCrawConfig){
			douBanCrawConfig = (DouBanCrawConfig)config;
		}
		
		if(null != douBanCrawConfig){
			List<String> tagList = douBanCrawConfig.getTagList();
			for(String tag : tagList){
				urlHead = "http://book.douban.com/tag/"+tag;
				for(int i = douBanCrawConfig.getStartNum();i<douBanCrawConfig.getMaxCount();i+=douBanCrawConfig.getStepCount()){
					param = "start="+i+"&type=T";
					urlList.add(urlHead+"?"+param);
					System.out.println(urlHead+"?"+param);
				}
			}
		}
		
		return urlList;
	}
	
	public static void main(String[] args){
		DouBanUrlStrategy douBanUrlStrategy = new DouBanUrlStrategy();
		List<String> list = new ArrayList<String>();
		list.add("小说");list.add("文学");list.add("随笔");list.add("中国文学");list.add("经典");list.add("散文");
		list.add("杂文");list.add("名著");list.add("诗词");list.add("港台");list.add("漫画");list.add("言情");
		DouBanCrawConfig config = new DouBanCrawConfig();
		config.setTagList(list);
		config.setMaxCount(1000);
		config.setStartNum(0);
		config.setStepCount(20);
		douBanUrlStrategy.generator(config);
	}
	
}
