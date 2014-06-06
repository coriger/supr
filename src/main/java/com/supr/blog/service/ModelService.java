package com.supr.blog.service;

import java.util.List;

import com.supr.blog.model.cmge.Algorithm;
import com.supr.blog.model.cmge.AlgorithmProvide;
import com.supr.blog.model.cmge.DataType;
import com.supr.blog.model.cmge.Model;
import com.supr.blog.model.cmge.ModelAttr;
import com.supr.blog.model.cmge.ModelDataUnit;
import com.supr.blog.model.cmge.ModelLat;
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

	Pager<ModelLat> getModelLatList(String modelId, int pageSize, int pageNum);

	int deleteLatBatch(String[] ids);

	List<Algorithm> getLatAlgorithm();

	int saveModelLat(ModelLat modelLat);

	ModelLat getModelLatById(String latId);

	int updateModelLat(ModelLat modelLat);

	List<AlgorithmProvide> getAlgorithmProvideListById(Integer daId);
	
	List<Model> getModelList();
	
	Pager<ModelDataUnit> getModelDataUnitList(ModelDataUnit modelDataUnit,int pageSize, int pageNum);

	int deleteModelDataUnitBatch(String[] ids);

	ModelDataUnit getModelDataUnitById(String ids);

	int saveModelDataUnitInfo(ModelDataUnit modelDataUnit);
	
	List<DataType> getDataTypeList();
}
