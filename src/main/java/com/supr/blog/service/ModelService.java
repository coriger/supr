package com.supr.blog.service;

import java.util.List;

import com.supr.blog.model.cmge.Model;
import com.supr.blog.model.cmge.ModelAttr;
import com.supr.blog.model.cmge.ModelDataUnit;
import com.supr.blog.model.cmge.Trade;
import com.supr.blog.util.pager.Pager;

public interface ModelService {

	Pager<Model> getModelList(Model model,int pageSize, int pageNum);

	List<Trade> getTradeList();

	int deleteBatch(String[] ids);

	Model getModelById(String modelId);

	Pager<ModelAttr> getModelAttrList(String modelId, int pageSize, int pageNum);

	int saveModelInfo(Model model);

	List<ModelDataUnit> getModelDataUnit(String modelId);

	int saveModelAttr(ModelAttr modelAttr);

	int deleteAttrBatch(String[] ids);

	ModelAttr getModelAttrById(String attrId);

	int updateModelAttr(ModelAttr modelAttr);
}
