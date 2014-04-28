package com.supr.blog.freemarker;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

/**
 * @功能：Freemarker静态化工具类
 * @作者： ljt
 * @时间： 2014-4-22 上午9:52:09
 */
@Component
@Scope("singleton")
public class FreemarkerUtil {

	private static final Logger logger = Logger.getLogger(FreemarkerUtil.class);
	
	@Autowired
	@Qualifier("freemarkerConfiguration")
	private Configuration configuration;
	
	private static FreemarkerUtil freemarkerUtil = new FreemarkerUtil();
	
	public static FreemarkerUtil getInstance(){
		return freemarkerUtil;
	}
	
	/**
	 * 获取模板文件
	 * @param name
	 * @return
	 */
	public Template getTemplate(String name){
		Template template = null;
		try {
			template = configuration.getTemplate(name, "utf-8");
		} catch (IOException e) {
			logger.error("获取【"+name+"】模板异常...",e);
		}
		return template;
	}

	
	/**
	 * 创建静态页面
	 * @param rootMap
	 * @param templateName
	 * @param htmlPath
	 * @param htmlName
	 */
	public void buildHtml(Map<?, ?> rootMap,String templateName,String htmlPath,String htmlName){
		Template template = getTemplate(templateName);
		if(null != template){
			Writer out = null;
			try {
				File file = new File(htmlPath);
				if(!file.exists()){
					file.mkdir();
				}
				FileOutputStream fos = new FileOutputStream(htmlPath+ File.separator + htmlName);
				out = new OutputStreamWriter(fos);
				template.process(rootMap, out);
				out.flush();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (TemplateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} finally{
				if(null != out){
					try {
						out.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}
	
}
