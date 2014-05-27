package com.supr.blog.jsoup.douban;

import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.supr.blog.httpclient.HttpClientUtil;
import com.supr.blog.jsoup.douban.bean.DouBanBean;

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
	public static List<String> getListFromStream(InputStream is) {
		List<String> list = new ArrayList<String>();
		try {
			Document doc = Jsoup.parse(is, "utf-8",null);
			Elements elements = doc.select("a[onclick]");
			for(Element ele : elements){
				list.add(ele.attr("href"));
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	/**
	 * 解析标签列表
	 * @param is
	 * @return
	 */
	public static List<String> getListFromUrl(String url){
		List<String> list = new ArrayList<String>();
		try {
			Document doc = Jsoup.parse(new URL(url),20000);
			Elements elements = doc.select("div.info > h2 > a");
			for (Element ele : elements) {
				System.out.println(ele.attr("href"));
				list.add(ele.attr("href"));
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	/**
	 * 解析实体页面
	 * @param is
	 * @return
	 */
	public static DouBanBean getBeanFromStream(String url) {
		DouBanBean bean = new DouBanBean();
		try {
			Document doc = Jsoup.parse(new URL(url),200000);
			// 书籍首页地址
			bean.setUrl(url);
			// 书籍名称
			Element titleEle = doc.select("div#wrapper > h1 > span").get(0);
			bean.setTitle(titleEle.text());
			System.out.println("书籍名称："+bean.getTitle());
			
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
			Elements descs = doc.select("div.related_info + h2");
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
				List<String> commentUrlList = new ArrayList<String>();
				if(count < 25){
					commentUrlList.add(commentUrl);
				}else{
					int max = 0;
					if(count%25 == 0){
						max = count/25;
					}else{
						max = count/25 + 1;
					}
					System.out.println("评论数："+count+";最大页数："+max);
					for(int i = 1;i<=max;i++){
						commentUrlList.add(commentUrl + "?score=&start="+(i-1)*25);
					}
				}
				
				bean.setCommentNum(commentCount);
				bean.setCommentUrlList(commentUrlList);
				System.out.println("评论数："+bean.getCommentNum());
				System.out.println("评论url列表：："+bean.getCommentUrlList().toString());
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
				List<String> readUrlList = new ArrayList<String>();
				if(count < 10){
					readUrlList.add(readUrl);
				}else{
					int max = 0;
					if(count%10 == 0){
						max = count/10;
					}else{
						max = count/10 + 1;
					}
					for(int i = 1;i<=max;i++){
						readUrlList.add(readUrl + "?sort=rank&start="+(i-1)*10);
					}
				}
				bean.setReadUrlList(readUrlList);
				System.out.println("读书笔记url列表：："+bean.getReadUrlList().toString());
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return bean;
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