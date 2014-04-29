package com.supr.blog.service.impl;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfig;

import com.supr.blog.service.TemplateService;

import freemarker.template.Configuration;
import freemarker.template.Template;

@Service
public class TemplateServiceImpl implements TemplateService {

//	@Autowired
//	@Qualifier("freemarkerConfiguration")
//	private Configuration cfg;

	private FreeMarkerConfig configuration;

	@Override
	public Template getTemplate(String name) {
		Template template = null;
//		try {
//			template = cfg.getTemplate(name, "utf-8");
//		} catch (IOException e) {
//
//		}
		return template;
	}

	@Override
	public String getTemplateContent(String name) {
		return getTemplate(name).toString();
	}

	@Override
	public String buildPage(String name, Map<?, ?> data) {
		StringWriter result = new StringWriter();
		Template template = getTemplate(name);
		try {
			template.process(data, result);
		} catch (Exception e) {

		}
		return result.getBuffer().toString();
	}

	@Override
	public int buildPage(String name, Map<?, ?> data, String fileFullName) {
		Writer result;
		try {
			result = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(fileFullName), "UTF-8"));
			Template template = getTemplate(name);
			template.process(data, result);
		} catch (Exception e) {
		}
		return 0;
	}

	@Override
	public int buildPage(String name, Map<?, ?> data, String filePath, String fileName) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int buildPage(String name, Map<?, ?> data, File file) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void initialize() {

	}

}
