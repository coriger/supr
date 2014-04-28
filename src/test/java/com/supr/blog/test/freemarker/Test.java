package com.supr.blog.test.freemarker;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.HashMap;

import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;

public class Test {
	
	private static Configuration configuration = new Configuration();
	
	public static void main(String[] args) throws Exception {
		
		// 设置模板文件数据源
		configuration.setDirectoryForTemplateLoading(new File("D:\\temp"));
		configuration.setObjectWrapper(new DefaultObjectWrapper());
		
		// 获取模板
		Template template = configuration.getTemplate("test.ftl","utf-8");
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("username", "芦江涛");
		
		Writer out = new OutputStreamWriter(new FileOutputStream(new File("D:\\temp\\test.html")));
		template.process(map, out);
		out.flush();
	}
	
}
