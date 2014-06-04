package com.supr.blog.mapper;

import java.util.List;
import java.util.Map;

import com.supr.blog.model.cmge.Model;
import com.supr.blog.model.cmge.ModelAttr;
import com.supr.blog.model.cmge.ModelDataUnit;
import com.supr.blog.model.cmge.Trade;

public interface ModelMapper {

	List<Model> getModelList(Map<String,Object> map);

	List<Trade> getTradeList();

	int getModelCount(Map<String,Object> map);

	int deleteBatch(String[] modelIds);

	Model getModelById(String modelId);

	int getModelAttrCount(Map<String, Object> map);

	List<ModelAttr> getModelAttrList(Map<String, Object> map);

	int saveModelInfo(Model model);

	List<ModelDataUnit> getModelDataUnit(String modelId);

	int saveModelAttr(ModelAttr modelAttr);

	int deleteAttrBatch(String[] ids);

}
