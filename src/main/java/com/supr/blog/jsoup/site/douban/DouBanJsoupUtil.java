package com.supr.blog.jsoup.site.douban;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.supr.blog.httpclient.HttpClientUtil;
import com.supr.blog.jsoup.site.douban.bean.DouBanBean;
import com.supr.blog.jsoup.site.douban.config.DouBanCrawConfig;

/**
 * @desc	豆瓣Jsoup工具类
 * @author	ljt
 * @time	2014-5-26 下午4:19:03
 */
public class DouBanJsoupUtil {

	/**
	 * 解析标签列表
	 * @param is
	 * @return
	 */
	public static List<String> getListFromUrl(String url){
		List<String> list = new ArrayList<String>();
		// 这种方式貌似不好 很容易被禁403
		// Document doc = Jsoup.connect(url).get();
		Document doc = Jsoup.parse(HttpClientUtil.getHtml(url));
		Elements elements = doc.select("div.info > h2 > a");
		for (Element ele : elements) {
			list.add(ele.attr("href"));
		}

		return list;
	}

	/**
	 * 解析实体页面
	 * @param is
	 * @return
	 */
	public static DouBanBean getBeanFromStream(DouBanCrawConfig douBanCrawConfig,String url) {
		DouBanBean bean = new DouBanBean();
		try {
			Document doc = Jsoup.parse(HttpClientUtil.getHtml(url));
			// 书籍名称
			Element titleEle = doc.select("div#wrapper > h1 > span").get(0);
			bean.setTitle(titleEle.text());
			System.out.println("书籍名称："+bean.getTitle());

			// 过滤器
			FilterType type = douBanCrawConfig.getFilterType();
			if(type.equals(FilterType.BLACK)){// 黑名单模式
				if(douBanCrawConfig.getBlackKeyWord().contains(bean.getISBN())){
					return null;
				}
			}else if(type.equals(FilterType.WHITE)){// 白名单模式
				if(!douBanCrawConfig.getBlackKeyWord().contains(bean.getISBN())){
					return null;
				}
			}
			
			// 书籍首页地址
			bean.setUrl(url);
			System.out.println("书籍地址："+bean.getUrl());
			
			// 书籍Id
			bean.setId(url.split("/")[url.split("/").length-1]);
			System.out.println("书籍Id："+bean.getId());
			
			// 书籍图片地址
			Element picEle = doc.select("div#mainpic > a > img").get(0);
			bean.setImageUrl(picEle.attr("src"));
			System.out.println("书籍图片地址："+bean.getImageUrl());
			
			Elements contents = doc.select("div#info > span.pl");
			Element contentDiv = doc.select("div#info").get(0);
			String content = contentDiv.toString();
			String[] con = content.split("<br />");
			for(Element ele : contents){
				parseContent(ele.text(),bean,con);
			}
			
			StringBuffer sb = new StringBuffer();
			
			// 解析内容简介
			Elements descs = doc.select("div.related_info > h2");
			if(null != descs && descs.size() > 0 && descs.get(0).text().contains("内容简介")){
				descs = doc.select("#link-report .intro");
				Element desc = null;
				if(descs.size() == 1){
					desc = descs.get(0);
				}else if(descs.size() > 1){
					desc = descs.get(descs.size() -1);
				}
				
				descs = desc.getElementsByTag("p");
				for(Element ele : descs){
					sb.append(ele.text());
				}
				bean.setDesc(sb.toString());
				System.out.println("内容简介："+bean.getDesc());
			}
			
			// 解析作者简介
			Elements authors = doc.select("#link-report + h2");
			if(null != authors && authors.size() > 0 && authors.get(0).text().contains("作者简介")){
				Element author = doc.select(".indent").get(2);
				authors = author.select(".intro");
				if(authors.size() == 1){
					author = authors.get(0);
				}else if(authors.size() > 1){
					author = authors.get(authors.size() -1);
				}
				
				authors = author.getElementsByTag("p");
				sb = new StringBuffer();
				for(Element ele : authors){
					sb.append(ele.text());
				}
				bean.setAuthorDesc(sb.toString());
				System.out.println("作者简介："+bean.getAuthorDesc());
			}
			
			/***********************************************************************
			 * 
			 * 评论、笔记解析   如果数据过多  效率很差   可以考虑只抓取一部分数据  参数配置
			 * 
			 ***********************************************************************/
			
			// 解析评论
			String commentUrl = null;
			String commentCount = null;
			Elements commentUrls = doc.select("#reviews .clearfix .pl a");
			if(null != commentUrls && commentUrls.size() > 0){
				commentUrl = commentUrls.get(0).attr("href");
				commentCount = doc.select("#reviews .clearfix .pl a span").get(0).text();
			}
			
			if(null != commentCount){
				int count = Integer.parseInt(commentCount);
				List<String> commentIdList = new ArrayList<String>();
				if(count < 25){
					getCommentIdList(commentIdList,commentUrl);
				}else{
					int max = 0;
					if(count%25 == 0){
						max = count/25;
					}else{
						max = count/25 + 1;
					}
					
					System.out.println("评论数："+count+";最大页数："+max);
					
					max = Math.min(max,douBanCrawConfig.getCommentPageNum());
					
					for(int i = 1;i<=max;i++){
						// 读取评论页面列表  返回评论Id集合
						getCommentIdList(commentIdList,commentUrl + "?score=&start="+(i-1)*25);
					}
				}
				
				bean.setCommentNum(count);
				bean.setCommentIdList(commentIdList);
				System.out.println("评论数："+bean.getCommentNum());
				System.out.println("评论Id列表：："+bean.getCommentIdList().toString());
			}else{
				bean.setCommentNum(0);
			}
			
			// 解析读书笔记
			String readUrl = null;
			String readCount = null;
			Elements readUrls = doc.select(".ugc-mod .hd .pl a");
			if(null != readUrls && readUrls.size() > 0){
				readUrl = readUrls.get(0).attr("href");
				readCount = doc.select(".ugc-mod .hd .pl a span").get(0).text();
			}
			if(null != readCount){
				int count = Integer.parseInt(readCount);
				List<String> readIdList = new ArrayList<String>();
				if(count < 10){
					getReadIdList(readIdList,readUrl);
				}else{
					int max = 0;
					if(count%10 == 0){
						max = count/10;
					}else{
						max = count/10 + 1;
					}
					
					System.out.println("笔记数："+count+";最大页数："+max);
					
					max = Math.min(max,douBanCrawConfig.getReadPageNum());
					
					for(int i = 1;i<=max;i++){
						// 读取评论页面列表  返回评论Id集合
						getReadIdList(readIdList,readUrl + "?sort=rank&start="+(i-1)*10);
					}
				}
				bean.setReadIdList(readIdList);
				bean.setReadNum(count);
				System.out.println("读书笔记Id列表：："+bean.getReadIdList().toString());
			}else{
				bean.setReadNum(0);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}
	
	public static void getCommentIdList(List<String> commentIdList,String newUrl){
		Document document = Jsoup.parse(HttpClientUtil.getHtml(newUrl));
		Elements elements = document.select("[class=j a_unfolder]");
		for(Element ele : elements){
			String href = ele.attr("href");
			commentIdList.add(href.split("/")[href.split("/").length-1]);
		}
	}
	
	public static void getReadIdList(List<String> readIdList,String newUrl){
		Document document = Jsoup.parse(HttpClientUtil.getHtml(newUrl));
		Elements elements = document.select(".note-unfolder");
		for(Element ele : elements){
			String href = ele.attr("href");
			readIdList.add(href.split("/")[href.split("/").length-1]);
		}
	}

	private static void parseContent(String text, DouBanBean bean,String[] con) {
		// br的问题  一个br对应一个span
		if(null != text){
			text = text.trim().replace(":", "");
			String containStr = null;
			for(String str : con){
				if(str.contains(text)){
					containStr = str;
					break;
				}
			}
			
			switch (text) {
				case "作者":
					Document authorDoc = Jsoup.parse(containStr);
					bean.setAuthor(authorDoc.select("a").text());
					System.out.println("书籍作者："+bean.getAuthor());
					break;
				case "出版社":
					bean.setPublishName(containStr.substring(containStr.lastIndexOf("</span>")+7).trim());
					System.out.println("书籍出版社："+bean.getPublishName());
					break;
				case "原作名":
					bean.setSecondTitle(containStr.substring(containStr.lastIndexOf("</span>")+7).trim());
					System.out.println("书籍原作名称："+bean.getSecondTitle());
					break;
				case "译者":
					Document translatorDoc = Jsoup.parse(containStr);
					bean.setTranslator(translatorDoc.select("a").text());
					System.out.println("书籍译者："+bean.getTranslator());
					break;
				case "出版年":
					bean.setPublishDate(containStr.substring(containStr.lastIndexOf("</span>")+7).trim());
					System.out.println("书籍出版年："+bean.getPublishDate());
					break;
				case "页数":
					bean.setPageTotal(containStr.substring(containStr.lastIndexOf("</span>")+7).trim());
					System.out.println("书籍页数："+bean.getPageTotal());
					break;
				case "定价":
					bean.setPrice(containStr.substring(containStr.lastIndexOf("</span>")+7).trim());
					System.out.println("书籍价格："+bean.getPrice());
					break;
//				case "装帧":
//					
//					break;
//				case "丛书":
//					
//					break;
				case "ISBN":
					bean.setISBN(containStr.substring(containStr.lastIndexOf("</span>")+7).trim());
					System.out.println("书籍ISBN："+bean.getISBN());
					break;
				default:
					break;
				}
		}
	}
	
	
	public static void main(String[] args) {
		StringBuffer buffer = new StringBuffer();
		buffer.append("<span class='pl'>");
		buffer.append("出版社:");
		buffer.append("</span>");
		buffer.append(" 上海译文出版社<br>");
		
		Document document = Jsoup.parse(buffer.toString());
		Element element = document.select("span").get(0);
		System.out.println(element);
		System.out.println(document.select("br"));
	}
}