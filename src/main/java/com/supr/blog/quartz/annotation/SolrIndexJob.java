package com.supr.blog.quartz.annotation;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.supr.blog.model.vo.IncProductIndex;
import com.supr.blog.service.SearchService;
import com.supr.blog.solr.SolrUtil;
import com.supr.blog.util.Constant;
import com.supr.blog.util.SuprUtil;

/**
 * @功能：基于注解的solr增量索引定时任务
 * @作者： ljt
 * @时间： 2014-4-21 下午3:04:31
 */
@Component
@Lazy(value=false)
public class SolrIndexJob {
	
	private static final Logger logger = Logger.getLogger(SolrIndexJob.class);
	
	/**
	 * 新增索引
	 */
	private static final int INSERT_INDEX = 1;
	
	/**
	 * 删除索引
	 */
	private static final int DELETE_INDEX = 2;
	
	/**
	 * 更新索引
	 */
	private static final int UPDATE_INDEX = 3;
	
	/**
	 * 等待处理
	 */
	private static final int WAIT_PROCESS = 0;
	
	/**
	 * 处理中
	 */
	private static final int PROCESSING = 1;
	
	/**
	 * 已处理
	 */
	private static final int PROCESSED = 2;
	
	/**
	 * 一次提交索引文档数  注： 可以统一在配置文件中配置
	 */
	private static final int COMMIT_COUNT = 2000;
	
	@Autowired
	private SearchService searchService;
	
	@Autowired
	private SolrUtil solrUtil;
	
	
	@Scheduled(cron="* 0/1 * * * ?")
	public void buildSorlIndex(){
		logger.info("solr增量索引定时任务开始执行...");
		
		/**
		 * 1、从数据库表index_product中读取待处理的索引数据
		 * 2、判断待处理数据更新类型
		 * 		*新增：添加索引
		 * 		*更新：先删除再添加
		 * 		*删除：根据Id删除索引
		 * 3、处理完后再更新数据库表状态
		 */
		// 获取索引表待处理数据总量
		int indexCount = searchService.getIncrementIndexCount();
		if(indexCount > 0){
			// 分批次提交
			int time = (indexCount % COMMIT_COUNT == 0) ? (indexCount/COMMIT_COUNT) : (indexCount/COMMIT_COUNT + 1);
			for(int i = 0;i<time;i++){
				// 读取分页数据
				List<IncProductIndex> productList = searchService.getIncrementIndex(COMMIT_COUNT);
				// 取出遍历 根据增量类型 来判断 新增 更新 删除索引
				if(!SuprUtil.isEmptyCollection(productList)){
					for(IncProductIndex product : productList){
						// 0：处理成功   其余：处理失败
						int result = Constant.FAIL;
						switch (product.getIndexType()) {
							case INSERT_INDEX:
								// 新增索引
								result = solrUtil.insertIndex(product);
								break;
							case UPDATE_INDEX:
								// 更新索引
								result = solrUtil.updateIndex(product);
								break;
							case DELETE_INDEX:
								// 删除索引
								result = solrUtil.deleteIndexById(product.getProductId());
								break;
							default:
								break;
						}
						// solr处理成功   则更新数据状态  为已处理  否则不更新
						if(result == Constant.SUCCESS){
							product.setIndexStatue(PROCESSED);
							searchService.updateIncIndexStatus(product);
						}
					}
				}
			}
		}
		
		logger.info("solr增量索引定时任务结束执行...");
	}
	
}
