package com.supr.blog.mapper;

import com.supr.blog.model.vo.ProductAttr;
import com.supr.blog.model.vo.ProductVal;

public interface SearchMapper {

	ProductAttr getProductAttr(String attrId);

	ProductVal getProductVal(String valId);
	
}
