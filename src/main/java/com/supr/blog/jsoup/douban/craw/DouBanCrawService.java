package com.supr.blog.jsoup.douban.craw;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import com.supr.blog.httpclient.HttpClientUtil;
import com.supr.blog.jsoup.api.CrawService;
import com.supr.blog.jsoup.api.UrlGeneratorStratery;
import com.supr.blog.jsoup.bean.CrawServiceInfo;
import com.supr.blog.jsoup.douban.DouBanJsoupUtil;
import com.supr.blog.jsoup.douban.bean.DouBanBean;
import com.supr.blog.jsoup.douban.config.DouBanCrawConfig;
import com.supr.blog.util.SuprUtil;

/**
 * @desc	豆瓣网站爬取服务
 * @author	ljt
 * @time	2014-5-26 上午10:17:55
 */
public class DouBanCrawService implements CrawService{
	
	// 爬取服务bean
	private CrawServiceInfo crawServiceInfo;
	
	// 爬取策略  url生成策略
	private UrlGeneratorStratery urlGeneratorStratery;
	
	// 需要爬取的url
	private List<String> urlList = new ArrayList<String>();
	
	// 服务状态 通过修改这个值来控制服务运行
	private volatile boolean flag = true;
	
	// 爬虫服务配置对象
	private static DouBanCrawConfig douBanCrawConfig;
	
	@Override
	public void init() {
		urlGeneratorStratery = new DouBanUrlStrategy();// 这一步后续可以采用自动注入
		// 获取的url仅仅是tag的url  不是具体实体的url  需要再次过滤
		urlList = urlGeneratorStratery.generator(douBanCrawConfig);
	}
	
	/**
	 * 暂停当前爬取服务
	 */
	@Override
	public void pause() {

	}
	
	/**
	 * 启动爬取服务  开启线程执行
	 */
	@Override
	public void start() {
		List<String> bookUrlList = null;
		String fileName = douBanCrawConfig.getCrawFileName();
		int i = 0;
		for(String url : urlList){
			// 读取url 获取实体url
			InputStream is = HttpClientUtil.getResponse(url);
			// 实体url
			bookUrlList = DouBanJsoupUtil.getListFromStream(is);
		}
		
		if(!SuprUtil.isEmptyCollection(bookUrlList)){
			for(String url : bookUrlList){
				// 读取url
				InputStream is = HttpClientUtil.getResponse(url);
				// 解析成bean
				DouBanBean bean = DouBanJsoupUtil.getBeanFromStream(is);
				// 下载评论到本地
				
				// 下载读书笔记到本地
				
				// 下载书籍首页到本地
				
			}
		}
	}
	
	public static void main(String[] args) {
		List<String> list = new ArrayList<String>();
//		list.add("小说");list.add("文学");list.add("随笔");list.add("中国文学");list.add("经典");list.add("散文");
//		list.add("杂文");list.add("名著");list.add("诗词");list.add("港台");list.add("言情");
		list.add("漫画");
		douBanCrawConfig = new DouBanCrawConfig();
		douBanCrawConfig.setTagList(list);
		douBanCrawConfig.setMaxCount(1000);
		douBanCrawConfig.setStartNum(0);
		douBanCrawConfig.setStepCount(20);
		douBanCrawConfig.setCrawFileName("E:\\craw\\");
		
		DouBanCrawService service = new DouBanCrawService();
		
		// 初始化
		service.init();
		
		// 开始爬取
		service.start();
	}
	
	/**
	 * 停止爬取服务
	 */
	@Override
	public void stop() {
		
	}
	
	@Override
	public void restart() {
		
	}
	
}
