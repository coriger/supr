package com.supr.blog.solr;

import java.io.IOException;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.regex.Pattern;

import org.apache.log4j.Logger;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrQuery.ORDER;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.client.solrj.response.FacetField;
import org.apache.solr.client.solrj.response.FacetField.Count;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.client.solrj.response.UpdateResponse;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import com.supr.blog.model.vo.IncProductIndex;
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
	
	// key是className value是keyword字段集合  需要初始化
	public static Map<String,List<String>> classKeywordFieldMap = new HashMap<String,List<String>>();
		
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
	
	// 关键字查询
	private static final int KEYWORD_FIELD = 6;
	
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
	 * 类   -->> 字段名集合
	 */
	private static Map<String,Set<String>> classFieldMap = new HashMap<String,Set<String>>();
	
	/**
	 * 注解map  注解类className ---->> 模板
	 */
	private static Map<String,Integer> annotationMap = new HashMap<String,Integer>();
	
	private static HttpSolrServer server;
	
	/**
	 * 配置文件名
	 */
	private static final String solrConfigName = "/supr.properties";
	
	/**
	 * solr配置文件属性对象
	 */
	private static Properties properties;
	
	/**
	 * 配置文件读取
	 */
	private static String solrUrl;
	
	private SolrUtil(){
		init();
	}
	
	public void init(){
		// 读取配置参数
		properties = new Properties();
		try {
			properties.load(SolrUtil.class.getResourceAsStream(solrConfigName));
			solrUrl = properties.getProperty("solrUrl");
		} catch (IOException e) {
			logger.error("读取["+solrConfigName+"]配置文件失败...",e);
		}
		
		// 初始化solrServer
		server = new HttpSolrServer(solrUrl);
		server.setConnectionTimeout(3000);
		server.setSoTimeout(5000);
		
		/******************************************************
		 * 
		 * 					初始化部分暂时写死
		 * 
		 ******************************************************/
		
		// 初始化类 高亮字段
		List<String> highLightList = new ArrayList<String>();
		highLightList.add("productName");
		classHighlightFieldMap.put("Product", highLightList);
		
		// 初始化类 facet字段
		List<String> facetFieldList = new ArrayList<String>();
		facetFieldList.add("attrvalue");
		classFacetFieldMap.put("Product", facetFieldList);
		
		// 初始化类 keyword字段
		List<String> keywordFieldList = new ArrayList<String>();
		keywordFieldList.add("productName");
		classKeywordFieldMap.put("Product", keywordFieldList);
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
		if(null == facetSet){
			facetSet = new HashSet<String>();
		}
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
			List<String> keywordFieldList = classKeywordFieldMap.get(type.getSimpleName());
			if(!SuprUtil.isEmptyCollection(keywordFieldList)){
				for(String fieldName : keywordFieldList){
					query = query + " AND " + fieldName + ":" + SuprUtil.encodeUrl(SuprUtil.formatUrl(keyword));
				}
			}
		}
		
		// 普通参数
		String params = pro.getParam();
		if(!StringUtils.isEmpty(params)){
			String[] param = params.split(";");
			for(String str : param){
				// 判断格式是否正确 必须 冒号分割
				if(isRightFormat(str)){
					// 判断字段是否真实存在
					if(isExistParam(type,str)){
						query = query + " AND " + str;
					}
				}
			}
		}
		
		// 排序字段查询参数
		String sort = pro.getSort();
		if(!StringUtils.isEmpty(sort)){
			String[] so = sort.split(";");
			for(String str : so){
				// 判断格式是否正确 可排序 price:desc
				if(isRightSortFormat(str)){
					// 判断字段是否真实存在
					if(isExistParam(type,str)){
						String[] sortParamValue = str.split(":");
						String sortParam = sortParamValue[0];
						String sortValue = sortParamValue[1];
						if(!StringUtils.isEmpty(sortValue)){
							if(sortValue.equals(SORT_DESC)){
								solrQuery.addSort(sortParam, ORDER.desc);
							}else if(sortValue.equals(SORT_ASC)){
								solrQuery.addSort(sortParam, ORDER.asc);
							}
						}
					}
				}
			}
		}
		
		// 范围字段查询参数
		String range = pro.getRange();
		if (!StringUtils.isEmpty(range)) {
			String[] ran = range.split(";");
			for (String str : ran) {
				// 判断格式是否正确 范围查询[1-1000]
				if(isRightRangeFormat(str)){
					// 判断字段是否真实存在
					if(isExistParam(type,str)){
						String[] rangeParamValue = str.split(":");
						String rangeParam = rangeParamValue[0];
						String rangeValue = rangeParamValue[1];
						query = query + " AND " + rangeParam + ":" + rangeValue.replaceAll("-", " TO ");
					}
				}
				
			}
		}
		
		// 商品属性查询
		Set<String> attrSet = new HashSet<String>();
		String attrs = pro.getAttrvalue();
		if (!StringUtils.isEmpty(attrs)) {
			String[] attr = attrs.split(";");
			for(String str : attr){
				// 判断格式是否正确 必须 冒号分割
				if(isRightFormat(str)){
					// 判断字段是否真实存在
					if(isExistParam(type,str)){
						String[] s = str.split("_");
						query = query + " AND attrvalue:" + s[0] + "=" + s[1];
						attrSet.add(str.replaceAll("_", "="));
					}
				}
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
	 * 判断str字符串格式是否满足range条件
	 * @param str
	 * @return
	 */
	private static boolean isRightRangeFormat(String str) {
		String regEx = "^[0{1}|/d+-0{1}|/d+]$";
		Pattern pattern = Pattern.compile(regEx);
		if(!StringUtils.isEmpty(str)){
			String[] s = str.split(":");
			if(s.length == 2 && !StringUtils.isEmpty(s[1])){
				if(pattern.matcher(s[1]).find()){
					return true;
				}
			}
		}
		return false;
	}

	/**
	 * 判断str字符串格式是否满足sort条件
	 * @param str
	 * @return
	 */
	private static boolean isRightSortFormat(String str) {
		if(!StringUtils.isEmpty(str)){
			String[] s = str.split(":");
			if(s.length == 2 && !StringUtils.isEmpty(s[1])){
				if(s[1].equals(SORT_ASC) || s[1].equals(SORT_DESC)){
					return true;
				}
			}
		}
		return false;
	}

	/**
	 * 判断str字符串格式是否 是:隔开
	 * @param str
	 * @return
	 */
	private static boolean isRightFormat(String str) {
		if(!StringUtils.isEmpty(str)){
			String[] s = str.split(":");
			if(s.length == 2){
				return true;
			}
		}
		return false;
	}

	/**
	 * 判断类中是否存在指定字段
	 * @param str
	 * @return
	 */
	private static boolean isExistParam(Class<?> type,String str) {
		Set<String> fieldNameSet = classFieldMap.get(type.getSimpleName());
		if(SuprUtil.isEmptyCollection(fieldNameSet)){
			fieldNameSet = new HashSet<String>();
			Field[] fields = type.getFields();
			for(Field field : fields){
				fieldNameSet.add(field.getName());
			}
		}
		
		if(!SuprUtil.isEmptyCollection(fieldNameSet) && fieldNameSet.contains(str)){
			return true;
		}
		
		return false;
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
						if (null != facetSet && !facetSet.contains(facetAttrId)) {
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

	/**
	 * 根据Id删除索引
	 * @param productId
	 */
	public int deleteIndexById(String productId) {
		int result = 1;
		try {
			server.deleteById(productId);
			UpdateResponse response = server.commit();
			result = response.getStatus();
		} catch (Exception e) {
			logger.error("根据Id删除索引异常,索引Id:"+productId,e);
		}
		
		return result;
	}

	/**
	 * 新增索引
	 * @param product
	 * @return
	 */
	public int insertIndex(IncProductIndex product) {
		int result = 1;
		try {
			server.addBean(product);
			UpdateResponse response = server.commit();
			result = response.getStatus();
		} catch (Exception e) {
			logger.error("新增索引异常,索引对象:"+product.toString(),e);
		}
		
		return result;
	}

	/**
	 * 更新索引
	 * @param product
	 * @return
	 */
	public int updateIndex(IncProductIndex product) {
		int result = 1;
		try {
			server.addBean(product);
			UpdateResponse response = server.commit();
			result = response.getStatus();
		} catch (Exception e) {
			logger.error("更新索引异常,索引对象:"+product.toString(),e);
		}
		
		return result;
	}

	/**
	 * 删除全量索引
	 * @return
	 */
	public int deleteAllIndex() {
		int result = 1;
		try {
			server.deleteByQuery("*:*");
			UpdateResponse response = server.commit();
			result = response.getStatus();
		} catch (Exception e) {
			logger.error("删除全量索引异常...",e);
		}
		
		return result;
	}

}
