package com.supr.blog.mapper;

import java.util.List;

import com.supr.blog.model.vo.IncProductIndex;
import com.supr.blog.model.vo.ProductAttr;
import com.supr.blog.model.vo.ProductVal;

public interface SearchMapper {

	ProductAttr getProductAttr(String attrId);

	ProductVal getProductVal(String valId);

	int getIncrementIndexCount();

	List<IncProductIndex> getIncrementIndex(int indexCount);

	void updateIncIndexStatus(IncProductIndex product);
	
}
