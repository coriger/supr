package com.supr.blog.httpclient;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;

/**
 * @desc	HttpClient工具类
 * @author	ljt
 * @time	2014-5-26 下午1:51:14
 */
public class HttpClientUtil {
	
	private static HttpClientUtil httpClientUtil = new HttpClientUtil();
	
	private static HttpClient httpClient;
	
	private HttpClientUtil(){
		httpClient = new DefaultHttpClient();
	}

	public static InputStream getResponse(String url) {
		InputStream is = null;
		HttpGet get = new HttpGet(url);
		HttpResponse response = null;
		try {
			response = httpClient.execute(get);
			if (HttpStatus.SC_OK == response.getStatusLine().getStatusCode()) {
				HttpEntity httpEntity = response.getEntity();
				if (httpEntity != null) {
					is = httpEntity.getContent();
				}
			}
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return is;
	}

	public static void writeToFile(String fileName, InputStream is) {
		BufferedOutputStream bos = null;
		try {
			bos = new BufferedOutputStream(new FileOutputStream(new File(fileName)));
			byte[] b = new byte[2048];
			int s = 0;
			while((s = is.read(b))!= -1){
				bos.write(b, 0, s);
			}
			bos.flush();
			bos.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally{
			if(null != bos){
				try {
					bos.close();
				} catch (IOException e) {}
			}
			if(null != is){
				try {
					is.close();
				} catch (IOException e) {}
			}
		}
	}
	
}
