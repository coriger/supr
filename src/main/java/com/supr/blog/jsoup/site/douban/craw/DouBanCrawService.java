package com.supr.blog.jsoup.site.douban.craw;

import java.util.ArrayList;
import java.util.List;

import com.supr.blog.jsoup.api.CrawService;
import com.supr.blog.jsoup.api.UrlGeneratorStratery;
import com.supr.blog.jsoup.bean.CrawServiceInfo;
import com.supr.blog.jsoup.site.douban.DouBanJsoupUtil;
import com.supr.blog.jsoup.site.douban.FilterType;
import com.supr.blog.jsoup.site.douban.bean.DouBanBean;
import com.supr.blog.jsoup.site.douban.config.DouBanCrawConfig;
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
		List<String> bookUrlList = new ArrayList<String>(1000);
		String fileName = douBanCrawConfig.getCrawFileName();
		for(String url : urlList){
			// 实体url
			bookUrlList.addAll(DouBanJsoupUtil.getListFromUrl(url));
		}
		
		System.out.println("++++++++++++++++++++解析标签列表完成++++++++++++++++++++");
		
		if(!SuprUtil.isEmptyCollection(bookUrlList)){
			for(String url : bookUrlList){
				// 解析成bean
				DouBanBean bean = DouBanJsoupUtil.getBeanFromStream(url);
				
				// 过滤器
				FilterType type = douBanCrawConfig.getFilterType();
				if(type.equals(FilterType.BLACK)){// 黑名单模式
					if(douBanCrawConfig.getBlackKeyWord().contains(bean.getISBN())){
						continue;
					}
				}else if(type.equals(FilterType.WHITE)){// 白名单模式
					if(!douBanCrawConfig.getBlackKeyWord().contains(bean.getISBN())){
						continue;
					}
				}
				
//				下载书籍首页到本地
//				HttpClientUtil.writeToFile(fileName+bean.getTitle()+".html", bean.getUrl());
				
//				下载评论到本地
//				List<String> commentUrl = bean.getCommentUrlList();
//				if(!SuprUtil.isEmptyCollection(commentUrl)){
//					int k = 0;
//					for(String str : commentUrl){
//						HttpClientUtil.writeToFile(fileName+bean.getTitle()+"评论"+(k+=1)+"-"+(k+=25)+".html", str);
//					}
//				}
				
//				下载读书笔记到本地
//				List<String> readUrl = bean.getReadUrlList();
//				if(!SuprUtil.isEmptyCollection(readUrl)){
//					int v = 0;
//					for(String str : readUrl){
//						HttpClientUtil.writeToFile(fileName+bean.getTitle()+"读书笔记"+(v+=1)+"-"+(v+=10)+".html", str);
//					}
//				}
				
			}
		}
	}
	
	public static void main(String[] args) {
		List<String> list = new ArrayList<String>();
//		list.add("哲学");list.add("文学");list.add("随笔");list.add("中国文学");list.add("经典");list.add("散文");
//		list.add("杂文");list.add("名著");list.add("诗词");list.add("港台");list.add("言情");
		list.add("哲学");
		douBanCrawConfig = new DouBanCrawConfig();
		douBanCrawConfig.setTagList(list);
		douBanCrawConfig.setMaxCount(1000);
		douBanCrawConfig.setStartNum(0);
		douBanCrawConfig.setStepCount(20);
		douBanCrawConfig.setCrawFileName("E:\\craw\\");
		// 黑名单
		douBanCrawConfig.setFilterType(FilterType.BLACK);
		
		List<String> blackList = new ArrayList<String>();
		blackList.add("9787309041644");
		blackList.add("9787115282828");
		blackList.add("9787508044019");
		douBanCrawConfig.setBlackKeyWord(blackList);
		
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
