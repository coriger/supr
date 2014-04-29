package com.supr.blog.quartz.annotation;

import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * @功能：基于注解的文章静态化定时任务
 * @作者： ljt
 * @时间： 2014-4-21 下午3:04:31
 */
@Component
@Lazy(value=false)
public class BlogStaticJob {
	
//	@Scheduled(cron="* * * * * ?")
	public void doWork(){
		System.out.println("annotation定时任务执行...");
	}
	
}
