package com.supr.blog.solr;

import java.util.ArrayList;
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

import com.supr.blog.model.vo.Product;
import com.supr.blog.model.vo.ProductRequestVo;
import com.supr.blog.util.SuprUtil;
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
	public static ThreadLocal<SolrQuery> solrQueryThreadLocal = new ThreadLocal<SolrQuery>();
	
	// url对应的facetField
	public static ThreadLocal<Set<String>> facetFieldThreadLocal = new ThreadLocal<Set<String>>();

	// key是className value是高亮字段集合  需要初始化
	public static Map<String,List<String>> classHighlightFieldMap = new HashMap<String,List<String>>();
	
	// key是className value是facet字段集合  需要初始化
	public static Map<String,List<String>> classFacetFieldMap = new HashMap<String,List<String>>();
		
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
	
	private static final String solrUrl = "http://localhost:8080/solr";
	
	private SolrUtil(){
		init();
	}
	
	public void init(){
		// 初始化solrServer
		server = new HttpSolrServer(solrUrl);
		server.setConnectionTimeout(3000);
		server.setSoTimeout(5000);
		
		// 初始化类 高亮字段
		List<String> highLightList = new ArrayList<String>();
		highLightList.add("productName");
		classHighlightFieldMap.put("Product", highLightList);
		
		// 初始化类 facet字段
		List<String> facetFieldList = new ArrayList<String>();
		facetFieldList.add("attrvalue");
		classFacetFieldMap.put("Product", facetFieldList);
	}
	
	public static HttpSolrServer getSolrServer(){
		return server;
	}
	
	
	/**
	 * 从线程中获取解析过的solrQuery
	 * @param type
	 * @param pro
	 * @return
	 */
	public static SolrQuery getThreadLocalSolrQuery(Class<?> type,ProductRequestVo pro) {
		// 从线程中取出解析后的solrQuery对象
		SolrQuery query = solrQueryThreadLocal.get();
		if (null == query) {
			// 线程不存在 则解析url
			query = parseSolrRequest(type, pro);
		}
		return query;
	}
	
	public static Set<String> getThreadLocalFacetField() {
		Set<String> facetSet = facetFieldThreadLocal.get();
		return facetSet;
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

	public int getPageCount(Class<Product> type, ProductRequestVo pro) {
		int result = 0;
		SolrQuery query = parseSolrRequest(type, pro);
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

	/**
	 * 解析requestVo对象
	 * @param type
	 * @param pro
	 * @return
	 */
	public static SolrQuery parseSolrRequest(Class<?> type, ProductRequestVo pro) {
		SolrQuery solrQuery = new SolrQuery();
		String query = "*:* ";
		
		// 关键字
		String keyword = pro.getKeyword();
		if(!StringUtils.isEmpty(keyword)){
			// 去type类中查找需要搜索的字段   
			
			query = query + " AND productName:" + SuprUtil.encodeUrl(SuprUtil.formatUrl(keyword));
		}
		
		// 普通参数
		String params = pro.getParam();
		if(!StringUtils.isEmpty(params)){
			String[] param = params.split(";");
			for(String str : param){
				// 判断字段是否真实存在 否则过滤 categoryId:1100 必须要有categoryId字段
				
				// 判断格式是否正确 必须categoryId:1100 冒号分割
				
				query = query + " AND " + str;
			}
		}
		
		// 排序字段查询参数
		String sort = pro.getSort();
		if(!StringUtils.isEmpty(sort)){
			String[] so = sort.split(";");
			for(String str : so){
				// 判断格式是否正确 必须sort:desc 冒号分割

				String[] sortParamValue = str.split(":");
				String sortParam = sortParamValue[0];
				String sortValue = sortParamValue[1];
				// 判断字段是否真实存在且可排序  否则过滤
				if(!StringUtils.isEmpty(sortValue)){
					if(sortValue.equals(SORT_DESC)){
						solrQuery.addSort(sortParam, ORDER.desc);
					}else if(sortValue.equals(SORT_ASC)){
						solrQuery.addSort(sortParam, ORDER.asc);
					}
				}
			}
		}
		
		// 范围字段查询参数
		String range = pro.getRange();
		if (!StringUtils.isEmpty(range)) {
			String[] ran = range.split(";");
			for (String str : ran) {
				// 判断格式是否正确 必须comment:[1-3] 冒号分割

				String[] rangeParamValue = str.split(":");
				String rangeParam = rangeParamValue[0];
				String rangeValue = rangeParamValue[1];
				// 校验范围参数必须是[1-100]这种结构
				
				query = query + " AND " + rangeParam + ":" + rangeValue.replaceAll("-", " TO ");
			}
		}
		
		// 商品属性查询
		Set<String> attrSet = new HashSet<String>();
		String attrs = pro.getAttrvalue();
		if (!StringUtils.isEmpty(attrs)) {
			String[] attr = attrs.split(";");
			for(String str : attr){
				// 判断格式是否正确 必须attrId1:valueId1 冒号分割
				
				// 判断字段必须要有
				
				String[] s = str.split("_");
				query = query + " AND attrvalue:" + s[0] + "=" + s[1];
				attrSet.add(str.replaceAll("_", "="));
			}
			// 绑定到线程中
			facetFieldThreadLocal.set(attrSet);
		}
		
		// 高亮字段设置  获取type类中需要高亮的字段  去缓存中读取
		List<String> HiFieldList = classHighlightFieldMap.get(type.getSimpleName());
		if(!SuprUtil.isEmptyCollection(HiFieldList)){
			// 设置高亮
			solrQuery.setHighlight(true);
			for(String fieldName : HiFieldList){
				solrQuery.addHighlightField(fieldName);
			}
			solrQuery.setHighlightSimplePre(HIGHLIGHT_PRE);
			solrQuery.setHighlightSimplePost(HIGHLIGHT_POST);
		}
		
		// facet字段设置 获取type类中需要facet的字段 去缓存中读取
		List<String> facetFieldList = classFacetFieldMap.get(type.getSimpleName());
		if(!SuprUtil.isEmptyCollection(facetFieldList)){
			// 设置facet
			solrQuery.setFacet(true);
			// 分组类别数限制 也就相当于商品属性数限制
			solrQuery.setFacetLimit(10);
			// 限制分组count数下限 这里设置至少要有一条数据  没有数据的显示出来也没有意义
			solrQuery.setFacetMinCount(1);
			for(String fieldName : facetFieldList){
				// 添加facet字段
				solrQuery.addFacetField(fieldName);
			}
		}
		
		return solrQuery.setQuery(query);
	}
	
	/**
	 * requestVo
	 * @param type
	 * @param pager
	 * @param pro
	 * @return
	 */
	public static SolrPager getPageInfo(Class<?> type, SolrPager pager, ProductRequestVo pro) {
		// 获取线程绑定的SolrQuery对象
		SolrQuery query = getThreadLocalSolrQuery(type, pro);
		// 设置分页信息
		query.setStart(pager.getStartIndex());
		query.setRows(pager.getPageSize());

		try {
			// 响应内容
			QueryResponse response = server.query(query);
			pager.setObj(response);

			// 查询内容封装
			List<?> list = response.getBeans(type);
			pager.setList(list);

			// facet去掉已选facet字段属性 封装到pager中
			List<FacetField> facetFiledList = response.getFacetFields();
			// 存放筛选后的字段facet列表
			Map<String,List<Count>> facetFieldMap = new HashMap<String,List<Count>>();
			if (null != facetFiledList && facetFiledList.size() > 0) {
				for (FacetField facetField : facetFiledList) {
					Set<String> facetSet = getThreadLocalFacetField();
					// 判断url条件中是否已经存在该参数值了 如果存在 则不再返回 这里默认是attr 商品属性
					List<Count> countList = facetField.getValues();
					List<Count> countList_new = new ArrayList<Count>();
					for (Count count : countList) {
						// 前端需要这个属性 这里面保存的是商品属性Id
						String facetAttrId = count.getName();
						// 判断属性Id是否已经是筛选条件了 已经是的话 就不再返回
						if (!facetSet.contains(facetAttrId)) {
							countList_new.add(count);
						}
					}
					facetFieldMap.put(facetField.getName(), countList_new);
				}
				// 筛选后的商品属性放入到pager对象中
				pager.setFacetFieldMap(facetFieldMap);
			}
		} catch (SolrServerException e) {
			logger.error("solr查询异常...", e);
		}

		return pager;
	}

}
