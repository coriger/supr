package com.supr.blog.frame.protocol;

import java.io.DataOutputStream;

public class Test {
	
	public static void main(String[] args) {
		
		SuprSendManager manager = new SuprSendManager();
		
		// 封装请求对象
		DataOutputStream dataOutputStream = new DataOutputStream(null);
		// 发送对象给目标地址
		SendResult result = manager.send(dataOutputStream);
		
		
	}
	
}
