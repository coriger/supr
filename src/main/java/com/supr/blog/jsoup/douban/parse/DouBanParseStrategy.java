package com.supr.blog.jsoup.douban.parse;

import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.supr.blog.jsoup.api.ParseStrategy;
import com.supr.blog.jsoup.config.ParseConfig;
import com.supr.blog.jsoup.douban.bean.DouBanBean;
import com.supr.blog.jsoup.douban.config.DouBanParseConfig;

/**
 * @desc	豆瓣解析策略
 * @author	ljt
 * @time	2014-5-26 上午10:34:28
 */
public class DouBanParseStrategy implements ParseStrategy{
	
	@Override
	public void parse(ParseConfig config) {
		DouBanParseConfig douBanParseConfig = null;
		if(config instanceof DouBanParseConfig){
			douBanParseConfig = (DouBanParseConfig)config;
		}
		
		if(null != douBanParseConfig){
			String directoryPath = douBanParseConfig.getFileDirectoryPath();
			// 遍历文件夹所有文件  依次解析
			File directory = new File(directoryPath);
			File[] files = directory.listFiles();
			for(File file : files){
				DouBanBean bean = new DouBanBean();
				System.out.println("开始解析："+file.getName());
				try {
					Document doc = Jsoup.parse(file,"utf-8");
					Element element = doc.getElementById("subject_list");
					Elements elements = element.getElementsByClass("subject-item");
					for(Element item : elements){
						try {
							Elements infoDivs = item.getElementsByClass("info");
							Element infoDiv = infoDivs.get(0);
							Elements titleDivs = infoDiv.getElementsByTag("a");
							// 标题
							Element titleDiv = titleDivs.get(0);
							bean.setTitle(titleDiv.attr("title"));
							String href = titleDiv.attr("href");
							String[] hrefs = href.split("/");
							bean.setId(hrefs[hrefs.length-1]);
							
							Elements descDivs = infoDiv.getElementsByClass("pub");
							Element descDiv = descDivs.get(0);
							String desc = descDiv.text();
							String[] de = desc.split(" / ");
							
							bean.setPrice(de[de.length-1]);
							bean.setPublishDate(de[de.length-2]);
							bean.setPublishName(de[de.length-3]);
							
							String author = "";
							for(int i = 0;i<de.length-3;i++){
								author += de[i] + ",";
							}
							bean.setAuthor(author);
							
							Elements rateDivs = infoDiv.getElementsByClass("rating_nums");
							if(null != rateDivs && rateDivs.size() > 0){
								Element rateDiv = rateDivs.get(0);
								bean.setRateNum(rateDiv.text());
							}
							
							Element commentDiv = infoDiv.getElementsByClass("pl").get(0);
							bean.setCommentNum(commentDiv.text());
							
							System.out.println(bean);
						} catch (Exception e) {
							continue;
						}
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	public static void main(String[] args) {
		DouBanParseStrategy banParseStrategy = new DouBanParseStrategy();
		DouBanParseConfig config = new DouBanParseConfig();
		config.setFileDirectoryPath("E:\\craw");
		banParseStrategy.parse(config);
	}
	
}
