package com.supr.blog.jsoup.douban;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

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
			Document doc = Jsoup.parse(is, "utf-8", null);
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
	 * 解析实体页面
	 * @param is
	 * @return
	 */
	public static DouBanBean getBeanFromStream(InputStream is) {
		DouBanBean bean = new DouBanBean();
		try {
			Document doc = Jsoup.parse(is, "utf-8", null);
			// 书籍名称
			Element titleEle = doc.select("div#wrapper > h1 > span").get(0);
			bean.setTitle(titleEle.text());
			
			// 书籍图片地址
			Element picEle = doc.select("div#mainpic > img").get(0);
			bean.setUrl(picEle.attr("src"));
			
			Elements contents = doc.select("div#info > span.pl");
			
			Element contentDiv = doc.select("div#info").get(0);
			String content = contentDiv.toString();
			String[] con = content.split("<br>");
			for(Element ele : contents){
				parseContent(ele.text(),bean,con);
			}
			
			// 解析内容简介
			
			// 解析作者简介
			
			// 解析评论
			
			// 解析读书笔记
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	private static void parseContent(String text, DouBanBean bean,String[] con) {
		// br的问题  一个br对应一个span
		if(null != text){
			text = text.trim().replace(":", "");
			String containStr = null;
			for(String str : con){
				if(str.contains(text)){
					containStr = str;
					// 去掉这个字符  减少下次遍历时间
				}
			}
			switch (text) {
				case "作者":
					Document authorDoc = Jsoup.parse(containStr);
					bean.setTranslator(authorDoc.select("a").text());
					break;
				case "出版社":
					bean.setPublishName(containStr.substring(containStr.lastIndexOf("</span>")).trim());
					break;
				case "原作名":
					bean.setSecondTitle(containStr.substring(containStr.lastIndexOf("</span>")).trim());
					break;
				case "译者":
					Document translatorDoc = Jsoup.parse(containStr);
					bean.setTranslator(translatorDoc.select("a").text());
					break;
				case "出版年":
					bean.setPublishDate(containStr.substring(containStr.lastIndexOf("</span>")).trim());
					break;
				case "页数":
					bean.setPageTotal(containStr.substring(containStr.lastIndexOf("</span>")).trim());
					break;
				case "定价":
					bean.setPrice(containStr.substring(containStr.lastIndexOf("</span>")).trim());
					break;
//				case "装帧":
//					
//					break;
//				case "丛书":
//					
//					break;
				case "ISBN":
					bean.setISBN(containStr.substring(containStr.lastIndexOf("</span>")).trim());
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