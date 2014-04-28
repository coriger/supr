package com.supr.blog.test.freemarker;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

import freemarker.core.Environment;
import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

/**
 * @功能：自定义指令 数据解析 <@lujiangtao>
 * @作者： ljt
 * @时间： 2014-4-21 下午7:12:54
 */
public class DirectTest implements TemplateDirectiveModel {

	private static Configuration configuration = new Configuration();

	@Override
	public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {
		body.render(new LujiangtaoWriter(env.getOut()));
	}

	public static void main(String[] args) throws Exception {
		// 设置模板文件数据源
		configuration.setDirectoryForTemplateLoading(new File("D:\\temp"));
		configuration.setObjectWrapper(new DefaultObjectWrapper());

		// 获取模板
		Template template = configuration.getTemplate("test.ftl", "utf-8");

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("lujiangtao", new DirectTest());

		Writer out = new OutputStreamWriter(new FileOutputStream(new File("D:\\temp\\test.html")));
		template.process(map, out);
		out.flush();
	}

	private static class LujiangtaoWriter extends Writer {

		private Writer out;

		public LujiangtaoWriter(Writer out) {
			this.out = out;
		}

		@Override
		public void close() throws IOException {
			out.close();
		}

		@Override
		public void flush() throws IOException {
			out.flush();
		}

		@Override
		public void write(char[] cbuf, int off, int len) throws IOException {
			out.write("you are a shuaiguo");
		}
	}

}
