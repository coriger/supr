package com.supr.blog.service;

import java.io.File;
import java.util.Map;

import freemarker.template.Template;

public interface TemplateService {

	/**
	 * get Template获取模板
	 * 
	 * @param name
	 * @return
	 */
	public Template getTemplate(String name);

	/**
	 * get Template String Content获取模板(字符串格式)
	 * 
	 * @param name
	 * @return
	 */
	public String getTemplateContent(String name);

	/**
	 * 根据模版名称和对应的数据渲染模版
	 * 
	 * @param name
	 *            模板名称
	 * @param data
	 *            数据
	 * @return 生成的字符串内容
	 */
	public String buildPage(String name, Map<?, ?> data);

	/**
	 * 根据模版名称和对应的数据渲染模版,并生成文件
	 * 
	 * @param name
	 *            模板名称
	 * @param data
	 *            数据
	 * @param fileFullName
	 *            包括路径的文件名
	 * @return
	 */
	public int buildPage(String name, Map<?, ?> data, String fileFullName);

	/**
	 * 根据模版名称和对应的数据渲染模版,并生成文件
	 * 
	 * @param name
	 *            模板名称
	 * @param data
	 *            数据
	 * @param filePath
	 *            文件路径
	 * @param fileName
	 *            文件名
	 * @return
	 */
	public int buildPage(String name, Map<?, ?> data, String filePath, String fileName);

	/**
	 * 根据模版名称和对应的数据渲染模版,并生成文件
	 * 
	 * @param name
	 *            模板名称
	 * @param data
	 *            数据
	 * @param file
	 *            文件
	 * @return
	 */
	public int buildPage(String name, Map<?, ?> data, File file);

	/**
	 * 初始化上下文
	 */
	public void initialize();
}
