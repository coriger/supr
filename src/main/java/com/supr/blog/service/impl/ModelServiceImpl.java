package com.supr.blog.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.supr.blog.mapper.ModelMapper;
import com.supr.blog.model.cmge.Model;
import com.supr.blog.model.cmge.ModelAttr;
import com.supr.blog.model.cmge.Trade;
import com.supr.blog.service.ModelService;
import com.supr.blog.util.pager.Pager;

@Service
public class ModelServiceImpl implements ModelService {
	
	@Autowired
	private ModelMapper modelMapper;
	
	@Override
	public Pager<Model> getModelList(Model model,int pageSize, int pageNum){
		Pager<Model> pager = new Pager<Model>();
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("model", model);
		
		// 获取数据总量
		int count = modelMapper.getModelCount(map);
		// 分页信息封装 这一步关键 保证分页信息的合法性
		pager.setTotalCount(count);
		pager.setPageSize(pageSize);
		pager.setPageNum(pageNum);
		
		if(count > 0){
			map.put("startIndex", pager.getStartIndex());
			map.put("pageSize", pager.getPageSize());
			List<Model> list = modelMapper.getModelList(map);
			pager.setList(list);
		}
		 
		return pager;
	}
	
	@Override
	public Pager<ModelAttr> getModelAttrList(Model model, int pageSize,int pageNum) {
		Pager<ModelAttr> pager = new Pager<ModelAttr>();
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("model", model);
		
		// 获取数据总量
		int count = modelMapper.getModelAttrCount(map);
		// 分页信息封装 这一步关键 保证分页信息的合法性
		pager.setTotalCount(count);
		pager.setPageSize(pageSize);
		pager.setPageNum(pageNum);
		
		if(count > 0){
			map.put("startIndex", pager.getStartIndex());
			map.put("pageSize", pager.getPageSize());
			List<ModelAttr> list = modelMapper.getModelAttrList(map);
			pager.setList(list);
		}
		 
		return pager;
	}
	
	@Override
	public List<Trade> getTradeList() {
		return modelMapper.getTradeList();
	}
	
	@Override
	public int deleteBatch(String[] ids) {
		return modelMapper.deleteBatch(ids);
	}
	
	@Override
	public Model getModelById(String modelId) {
		return modelMapper.getModelById(modelId);
	}
	
}
