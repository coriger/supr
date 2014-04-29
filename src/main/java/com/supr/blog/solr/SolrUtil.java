package com.supr.blog.solr;

import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.log4j.Logger;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrQuery.ORDER;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.client.solrj.response.FacetField;
import org.apache.solr.client.solrj.response.FacetField.Count;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import com.supr.blog.util.pager.SolrPager;

/**
 * @功能：solr工具类
 * @作者：ljt
 * @时间：2014-4-26 下午6:54:40
 */
@Component
public class SolrUtil {
	
	private static final Logger logger = Logger.getLogger(SolrUtil.class);
	
	// 解析后的solrQuery绑定线程
	private static ThreadLocal<SolrQuery> solrQueryThreadLocal = new ThreadLocal<SolrQuery>();
	
	// url对应的facetField
	private static ThreadLocal<Set<String>> facetFieldThreadLocal = new ThreadLocal<Set<String>>();

	// 分面
	private static final int FACET_FIELD = 1;
	
	// 高亮
	private static final int HIGHLIGHT_FIELD = 2;
	
	// 主键
	private static final int PRIMARY_FIELD = 3;
	
	// 范围
	private static final int RANGE_FIELD = 4;
	
	// 排序
	private static final int SORT_FIELD = 5;
	
	// 高亮前置
	private static final String HIGHLIGHT_PRE = "<font style = 'color:red'>";
	
	// 高亮后置
	private static final String HIGHLIGHT_POST = "</font>";
	
	// 升序
	private static final String SORT_ASC = "asc";
	
	// 降序
	private static final String SORT_DESC = "desc";
	
	/**
	 * className -->> class字段Map
	 * class字段Map --->> class字段名:class类型
	 */
	private static Map<String,Map<String,String>> classMap = new HashMap<String,Map<String,String>>();
	
	/**
	 * className -->> class字段Map
	 * class字段Map --->> class字段名:class类型
	 */
	private static Map<String,Map<String,String>> classFacetMap = new HashMap<String,Map<String,String>>();
	
	/**
	 * 注解map  注解类className ---->> 模板
	 */
	private static Map<String,Integer> annotationMap = new HashMap<String,Integer>();
	
	private static HttpSolrServer server;
	
	private static final String solrUrl = "";
	
	private SolrUtil(){
		init();
	}
	
	public void init(){
		// 初始化solrServer
		server = new HttpSolrServer(solrUrl);
		server.setConnectionTimeout(3000);
		server.setSoTimeout(5000);
	}
	
	public static HttpSolrServer getSolrServer(){
		return server;
	}
	
	/**
	 * 解析url
	 * 默认规则是  属性名Id_属性值Id&索引条件名=值&索引条件名=[1-100]
	 * url:productName_2000&price_[1-100]&attrvalue_attrId=attrValue&price_desc&count_asc
	 * _隔开参数和参数值
	 * 
	 * @param url
	 * @return
	 */
	public static SolrQuery parseUrl(Class type,String url) {
		SolrQuery solrQuery = new SolrQuery();
		String query = "*:* ";
		
		// 获取class对应的字段映射map
		Map<String,String> map = classMap.get(type.getSimpleName());
		
		// 拆分url
		if(!StringUtils.isEmpty(url)){
			String[] urlStr = url.split("&");
			
			// 获取参数  与type匹配看是什么类型  然后组装query
			for(String str : urlStr){
				String[] s = str.split("_");
				String param = s[0];
				String value = s[1];
				// 判断param是不是type类中字段
				if(null != map.get(param)){
					/**
					 * 1、主键
					 * 2、普通属性
					 * 3、高亮
					 * 4、排序
					 * 5、范围属性
					 * 6、facet
					 */
					try {
						Field field = type.getDeclaredField(param);
						// 设置可见
						field.setAccessible(true);
						// 获取字段的annotation
						Annotation[] annotations = field.getAnnotations();
						if(null != annotations && annotations.length > 0){
							for(Annotation annotation : annotations){
								Class annotationClass = annotation.getClass();
								if(classMap.containsKey(annotationClass.getSimpleName())){
									// 存在该注解   判断是什么类型
									int fieldType = annotationMap.get(annotationClass.getSimpleName());
									switch (fieldType) {
										case FACET_FIELD:
											solrQuery.addFacetField(param);
											break;
										case HIGHLIGHT_FIELD:
											solrQuery.setHighlight(true);
											solrQuery.addHighlightField(param);
											solrQuery.setHighlightSimplePost(HIGHLIGHT_PRE);
											solrQuery.setHighlightSimplePost(HIGHLIGHT_POST);
											break;
										case PRIMARY_FIELD:
											query = query + " AND " + param + ":" +value;
											break;
										case RANGE_FIELD:
											value = value.replaceAll("-", " TO ");
											query = query + " AND " + param + ":" +value;
											break;
										case SORT_FIELD:
											if(value.equals(SORT_ASC)){
												solrQuery.setSort(param,ORDER.asc);
											}else if(value.equals(SORT_DESC)){
												solrQuery.setSort(param,ORDER.desc);
											}else{
												solrQuery.setSort(param,ORDER.desc);
											}
											break;
										default:
											break;
									}
								}
							}
						}
					}catch (NoSuchFieldException e) {
						logger.warn(type+"类中没有此字段："+param, e);
						// 解析下一个字段
						continue;
					}
				}else{
					// 请求参数不对  忽略掉
					continue;
				}
			}
		}
		
		return solrQuery.setQuery(query);
	}

	/**
	 * 根据url获取solr匹配数据总数
	 * @param url
	 * @return
	 */
	public int getPageCount(Class type,String url) {
		int result = 0;
		SolrQuery query = parseUrl(type, url);
		// 绑定线程
		solrQueryThreadLocal.set(query);
		try {
			QueryResponse response = server.query(query);
			result = (int) response.getResults().getNumFound();
		} catch (SolrServerException e) {
			logger.error("solr查询总量异常...",e);
		}
		return result;
	}
	
	public static SolrQuery getThreadLocalSolrQuery(Class type,String url) {
		// 从线程中取出解析后的solrQuery对象
		SolrQuery query = solrQueryThreadLocal.get();
		if (null == query) {
			// 线程不存在 则解析url
			query = parseUrl(type, url);
		}
		return query;
	}
	
	public static Set<String> getThreadLocalFacetField(Class type, String url) {
		// url facet字段映射
		Set<String> facetSet = facetFieldThreadLocal.get();
		if (null == facetSet) {
			facetSet = getFacetFromUrl(type, url);
		}
		return facetSet;
	}

	/**
	 * 根据url获取solr匹配数据
	 * @param pager
	 * @param url
	 * @return
	 */
	public static SolrPager getPageInfo(Class type,SolrPager pager, String url) {
		// 获取SolrQuery对象
		SolrQuery query = getThreadLocalSolrQuery(type, url);
		// 设置分页信息
		query.setStart(pager.getStartIndex());
		query.setRows(pager.getPageSize());
		
		try {
			// 响应内容
			QueryResponse response = server.query(query);
			pager.setObj(response);
			
			// 查询内容封装
			List<Object> list = response.getBeans(type);
			pager.setList(list);
			
			// facet去掉已选facet字段属性 封装到pager中
			List<FacetField> facetFiledList = response.getFacetDates();
			if(null != facetFiledList && facetFiledList.size() > 0){
				// facetField --->> List<Count>
				Map<String,List<Count>> facetFieldMap = new HashMap<String, List<Count>>();
				// 获取已经分面的字段
				Set<String> facetSet = getThreadLocalFacetField(type, url);
				for(FacetField facetField : facetFiledList){
					// 判断url条件中是否已经存在该参数值了  如果存在 则不再返回  这里默认是attr 商品属性
					List<Count> countList = facetField.getValues();
					for(Count count : countList){
						String facetAttrId = count.getName();// 前端需要这个属性  这里面保存的是商品属性Id
						long facetAttrCount = count.getCount();// 这个是显示该类的总数  暂时可以不考虑
						// 判断属性Id是否已经是筛选条件了   已经是的话  就不再返回
						if(facetSet.contains(facetAttrId)){
							countList.remove(count);
						}
					}
					facetFieldMap.put(facetField.getName(), countList);
				}
				pager.setFacetFieldMap(facetFieldMap);
			}
		} catch (SolrServerException e) {
			logger.error("solr查询异常...",e);
		}
		
		return pager;
	}

	/**
	 * 获取url facet已选字段
	 * @param type
	 * @param url
	 * @return
	 */
	public static Set<String> getFacetFromUrl(Class type,String url) {
		Set<String> facetFieldSet = new HashSet<String>();
		// 解析url
		if(!StringUtils.isEmpty(url)){
			// 找到url中对应的facet字段
			String[] paramStr = url.split("&");
			for(String str : paramStr){
				String[] paramVlaue = str.split("_");
				String param = paramVlaue[0];
				String value = paramVlaue[1];
				// 判断param是否是facet类型
				if(classFacetMap.get(type).get(param).equals(com.supr.blog.solr.FacetField.class.getSimpleName())){
					// attrId=attrValue 把attrId放入set中
					facetFieldSet.add(value.split("=")[0]);
				}
			}
		}
		
		return facetFieldSet;
	}
	
}
