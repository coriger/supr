package com.supr.blog.httpclient;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.CookieStore;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.protocol.ClientContext;
import org.apache.http.cookie.Cookie;
import org.apache.http.impl.client.BasicCookieStore;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.protocol.BasicHttpContext;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.EntityUtils;

/**
 * @desc	HttpClient工具类
 * @author	ljt
 * @time	2014-5-26 下午1:51:14
 */
public class HttpClientUtil {
	
	private static CloseableHttpClient httpClient;
	
	static CookieStore cookieStore = null;
	
	static HttpContext context = null;
	
	static {
		httpClient = HttpClients.createDefault();
		cookieStore = new BasicCookieStore();
		context = new BasicHttpContext(); 
		context.setAttribute(ClientContext.COOKIE_STORE,cookieStore);
	}
	
	public static void setHeader(HttpGet get,String url){
		get.setHeader("User-Agent","Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36");
		get.setHeader("Accept","text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8");
		get.setHeader("Accept-Encoding","gzip,deflate,sdch");
		get.setHeader("Accept-Language","zh-CN,zh;q=0.8");
		get.setHeader("Referer","http://book.douban.com/");
		get.setHeader("Content-Type","text/html; charset=utf-8");
		
//		CookieManager cookieManager = CookieManager.getInstance();
//		get.setHeader("Cookie",cookieManager.getCookies(url));
		get.setHeader("Cookie","bid=xMMPn2CAuqo");
	}
	
	public static void writeToFile(String fileName, String url) {
		InputStream is = null;
		BufferedOutputStream bos = null;
		HttpGet get = new HttpGet(url);
		// 设置头信息
		setHeader(get,url);
		HttpResponse response = null;
		try {
			response = httpClient.execute(get);
			if (HttpStatus.SC_OK == response.getStatusLine().getStatusCode()) {
				HttpEntity httpEntity = response.getEntity();
				if (httpEntity != null) {
					is = httpEntity.getContent();
					bos = new BufferedOutputStream(new FileOutputStream(new File(fileName)));
					byte[] b = new byte[2048];
					int s = 0;
					while((s = is.read(b))!= -1){
						bos.write(b, 0, s);
					}
					bos.flush();
					bos.close();
				}
			}
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally{
			if(null != bos){
				try {
					bos.close();
				} catch (IOException e) {e.printStackTrace();}
			}
			if(null != is){
				try {
					is.close();
				} catch (IOException e) {e.printStackTrace();}
			}
			// 释放链接
			get.releaseConnection();
		}
	}

	public static String getHtml(String url) {
		HttpGet get = new HttpGet(url);
		setHeader(get,url);
		HttpResponse response = null;
		String html = "";

		try {
			response = httpClient.execute(get,context);
			if (HttpStatus.SC_OK == response.getStatusLine().getStatusCode()) {
				html = EntityUtils.toString(response.getEntity());
				
				// 获取cookie
				List<Cookie> cookieList = cookieStore.getCookies(); 
				for(Cookie cookie : cookieList){
					System.out.println(cookie.getName()+":"+cookie.getValue());
				}
				
			}else{
				System.out.println("响应失败："+response.getStatusLine().getStatusCode());
			}
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally{
			get.releaseConnection();
		}
		
		return html;
	}

	public static String getCookie(String url) {
		
		return null;
	}
	
}
