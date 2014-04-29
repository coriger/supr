package com.supr.blog.quartz.annotation;

import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * @功能：基于注解的solr增量索引定时任务
 * @作者： ljt
 * @时间： 2014-4-21 下午3:04:31
 */
@Component
@Lazy(value=false)
public class SolrIndexJob {
	
//	@Scheduled(cron="* * * * * ?")
	public void buildSorlIndex(){
		System.out.println("solr增量索引定时任务开始执行...");
		/**
		 * 1、从数据库表中读取待处理的索引数据
		 * 2、判断待处理数据更新类型
		 * 		*新增：添加索引
		 * 		*更新：先删除再添加
		 * 		*删除：根据Id删除索引
		 * 3、处理完后再更新数据库表状态
		 */
		
		
		
	}
	
}
