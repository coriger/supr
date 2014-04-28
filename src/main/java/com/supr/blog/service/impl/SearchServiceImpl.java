package com.supr.blog.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.solr.client.solrj.response.FacetField;
import org.apache.solr.client.solrj.response.FacetField.Count;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.supr.blog.mapper.SearchMapper;
import com.supr.blog.model.vo.Product;
import com.supr.blog.model.vo.ProductAttr;
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
	public SolrPager getProductPageInfo(int pageSize, int pageNum, String url) {
		SolrPager pager = new SolrPager();
		// 获取数据总量
		int count = solrUtil.getPageCount(Product.class,url);
		
		// 分页信息封装 这一步关键 保证分页信息的合法性
		pager.setTotalCount(count);
		pager.setPageSize(pageSize);
		pager.setPageNum(pageNum);
		if(count > 0){
			pager = SolrUtil.getPageInfo(Product.class,pager,url);
			List<Product> productList = (List<Product>)pager.getList();
			if(!SuprUtil.isEmptyCollection(productList)){
				QueryResponse response = (QueryResponse)pager.getObj();
				Map<String, Map<String, List<String>>> highLightMap = response.getHighlighting();
				for(Product product : productList){
					// 产品名称高亮设置
					buildHighLight(highLightMap,product);
					// 商品属性封装pager
					List<ProductAttr> attrList = buildProductAttr();
					FacetField facetField = response.getFacetField("attrvalue");
					if(facetField != null){
						// 这里获取的是attrId_valueId的集合
						List<Count> countList = facetField.getValues();
						if(!SuprUtil.isEmptyCollection(countList)){
							ProductAttr attr = null;
							ProductVal val = null;
							for(Count co : countList){
								// 这个是属性Id=值Id
								String[] attrvalue = co.getName().split("=");
								String attrId = attrvalue[0];
								String valId = attrvalue[1];
								attr = this.getProductAttr(attrId);
								val = this.getProductVal(valId);
								attr.setVal(val);
							}
							attrList.add(attr);
						}
					}
					
					pager.setAttrList(attrList);
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
	private List<ProductAttr> buildProductAttr() {
		return null;
	}
	
	/**
	 * 构建高亮
	 * @param highLightMap
	 * @param product
	 */
	private void buildHighLight(Map<String, Map<String, List<String>>> highLightMap, Product product) {
		String productId = product.getProductId();
		// 高亮非空
		if(!SuprUtil.isEmptyMap(highLightMap)){
			// 获取当前商品高亮信息
			Map<String, List<String>> proMap = highLightMap.get(productId);
			if(!SuprUtil.isEmptyMap(proMap)){
				// 获取商品名高亮信息
				if(!SuprUtil.isEmptyCollection(proMap.get("productName"))){
					// 存在则重新赋值
					if(null != proMap.get("productName").get(0)){
						// 产品名称高亮设置
						product.setProductName(proMap.get("productName").get(0));
					}
				}
			}
		}
	}

}
