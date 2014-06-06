package com.supr.blog.mapper;

import java.util.List;
import java.util.Map;

import com.supr.blog.model.cmge.Algorithm;
import com.supr.blog.model.cmge.AlgorithmProvide;
import com.supr.blog.model.cmge.DataType;
import com.supr.blog.model.cmge.Model;
import com.supr.blog.model.cmge.ModelAttr;
import com.supr.blog.model.cmge.ModelDataUnit;
import com.supr.blog.model.cmge.ModelLat;
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

	ModelAttr getModelAttrById(String attrId);

	int updateModelAttr(ModelAttr modelAttr);

	int getModelLatCount(Map<String, Object> map);

	List<ModelLat> getModelLatList(Map<String, Object> map);

	int deleteLatBatch(String[] ids);

	List<Algorithm> getLatAlgorithm();

	int saveModelLat(ModelLat modelLat);

	ModelLat getModelLatById(String latId);

	int updateModelLat(ModelLat modelLat);

	List<AlgorithmProvide> getAlgorithmProvideListById(Integer daId);

	List<Model> getAllModelList();
	
	List<DataType> getDataTypeList();

	List<ModelDataUnit> getModelDataUnitList(Map<String,Object> map);

	int getModelDataUnitCount(Map<String,Object> map);

	int deleteModelDataUnitBatch(String[] ids);

	ModelDataUnit getModelDataUnitById(String modelId);

	int saveModelDataUnitInfo(ModelDataUnit modelDataUnit);

}
