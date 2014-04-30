package com.supr.blog.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.solr.client.solrj.response.FacetField.Count;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.supr.blog.mapper.SearchMapper;
import com.supr.blog.model.vo.IncProductIndex;
import com.supr.blog.model.vo.Product;
import com.supr.blog.model.vo.ProductAttr;
import com.supr.blog.model.vo.ProductRequestVo;
import com.supr.blog.model.vo.ProductVal;
import com.supr.blog.service.SearchService;
import com.supr.blog.solr.SolrUtil;
import com.supr.blog.util.SuprUtil;
import com.supr.blog.util.pager.SolrPager;

/**
 * @功能：搜索
 * @作者： ljt
 * @时间： 2014-4-28 下午4:30:03
 */
@Service
public class SearchServiceImpl implements SearchService{
	
	@Autowired
	private SolrUtil solrUtil;
	
	@Autowired
	private SearchMapper searchMapper;
	
	@Autowired
	private CacheManager cacheManager;
	
	/**
	 * 搜索商品
	 */
	public SolrPager getProductPageInfo(int pageSize, int pageNum, ProductRequestVo pro) {
		SolrPager pager = new SolrPager();
		// 获取数据总量
		int count = solrUtil.getPageCount(Product.class,pro);
		
		// 分页信息封装 这一步关键 保证分页信息的合法性
		pager.setTotalCount(count);
		pager.setPageSize(pageSize);
		pager.setPageNum(pageNum);
		if(count > 0){
			// 查询 获取pager信息
			pager = SolrUtil.getPageInfo(Product.class,pager,pro);
			
			QueryResponse response = (QueryResponse)pager.getObj();
			
			// 商品属性封装pager
			buildProductAttr(response,pager);
			
			// 高亮字段 遍历重新赋值
			List<Product> productList = (List<Product>)pager.getList();
			if(!SuprUtil.isEmptyCollection(productList)){
				Map<String, Map<String, List<String>>> highLightMap = response.getHighlighting();
				for(Product product : productList){
					// 字段高亮设置
					buildHighLight(Product.class,highLightMap,product);
				}
			}
		}
		
		return pager;
	}
	
	
	@Cacheable(value="productValueCache",key="#valId")
	private ProductVal getProductVal(String valId) {
		return searchMapper.getProductVal(valId);
	}

	@Cacheable(value="productAttrCache",key="#attrId")
	private ProductAttr getProductAttr(String attrId) {
		return searchMapper.getProductAttr(attrId);
	}

	/**
	 * 构建商品属性
	 * @return
	 */
	private void buildProductAttr(QueryResponse response,SolrPager pager) {
		List<ProductAttr> attrList = new ArrayList<ProductAttr>();
		Map<String,List<Count>> map = pager.getFacetFieldMap();
		List<Count> countList = map.get("attrvalue");
		if (!SuprUtil.isEmptyCollection(countList)) {
			Map<String, ProductAttr> attrMap = new HashMap<String, ProductAttr>();
			ProductAttr attr = null;
			ProductVal val = null;
			for (Count co : countList) {
				// 这个是属性Id:值Id
				String[] attrvalue = co.getName().split("=");
				String attrId = attrvalue[0];
				String valId = attrvalue[1];
				// 根据Id获取商品属性对象
				attr = attrMap.get(attrId);
				if (null == attr) {
					attr = this.getProductAttr(attrId);
				}
				// 根据Id获取商品属性值对象
				val = this.getProductVal(valId);
				attr.setVal(val);
				attrMap.put(attrId, attr);
			}
			// 把map中的属性对象放到List中
			for (String key : attrMap.keySet()) {
				attrList.add(attrMap.get(key));
			}
		}

		// 商品属性封装到pager中
		pager.setAttrList(attrList);
	}
	
	/**
	 * 构建高亮
	 * @param highLightMap
	 * @param product
	 */
	private void buildHighLight(Class<?> type,Map<String, Map<String, List<String>>> highLightMap, Product product) {
		String productId = product.getProductId();
		// 高亮非空
		if(!SuprUtil.isEmptyMap(highLightMap)){
			// 获取当前商品高亮信息
			Map<String, List<String>> proMap = highLightMap.get(productId);
			if(!SuprUtil.isEmptyMap(proMap)){
				// 获取需要高亮字段  遍历
				List<String> list = SolrUtil.classHighlightFieldMap.get(type.getSimpleName());
				for(String fieldName : list){
					if(!SuprUtil.isEmptyCollection(proMap.get(fieldName))){
						// 存在则重新赋值
						if(null != proMap.get(fieldName).get(0)){
							// 高亮设置
							product.setProductName(proMap.get(fieldName).get(0));
						}
					}
				}
			}
		}
	}
	
	@Override
	public int getIncrementIndexCount() {
		return searchMapper.getIncrementIndexCount();
	}
	
	@Override
	public List<IncProductIndex> getIncrementIndex(int indexCount) {
		return searchMapper.getIncrementIndex(indexCount);
	}

	@Override
	public void updateIncIndexStatus(IncProductIndex product) {
		searchMapper.updateIncIndexStatus(product);
	}
	
	@Override
	public int deleteAllIndex() {
		return solrUtil.deleteAllIndex();
	}
}
