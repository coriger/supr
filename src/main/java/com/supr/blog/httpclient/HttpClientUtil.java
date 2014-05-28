package com.supr.blog.httpclient;

import java.io.IOException;

import org.apache.commons.lang.math.RandomUtils;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.CookieStore;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.protocol.ClientContext;
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
	
	private static String bid ;
	
	static {
		bid = generateBId();
		httpClient = HttpClients.createDefault();
		cookieStore = new BasicCookieStore();
		context = new BasicHttpContext(); 
		context.setAttribute(ClientContext.COOKIE_STORE,cookieStore);
	}
	
	public static String generateBId(){
		return "xMMPn2CAuqo";
	}
	
	/**
	 * 刷新cookie
	 */
	public static void refreshCookie(){
		// 清除原有cookie
		cookieStore.clear();
		// 重新设置cookie
		bid = generateBId();
	}
	
	public static void setHeader(HttpGet get,String url){
		get.setHeader("User-Agent","Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36");
		get.setHeader("Accept","text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8");
		get.setHeader("Accept-Encoding","gzip,deflate,sdch");
		get.setHeader("Accept-Language","zh-CN,zh;q=0.8");
		get.setHeader("Referer","http://book.douban.com/");
		get.setHeader("Content-Type","text/html; charset=utf-8");
		
//		get.setHeader("Cookie","bid=xMMPn2CAuqo");
		System.out.println("bid:"+bid);
		get.setHeader("Cookie","bid="+bid);
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
				
//				获取cookie
//				List<Cookie> cookieList = cookieStore.getCookies(); 
//				for(Cookie cookie : cookieList){
//					System.out.println(cookie.getName()+":"+cookie.getValue());
//				}
				
			}else{
				System.out.println("响应失败："+response.getStatusLine().getStatusCode());
				// 重新设置请求头
				refreshCookie();
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

}
