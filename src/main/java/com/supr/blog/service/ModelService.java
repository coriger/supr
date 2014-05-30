package com.supr.blog.service;

import java.util.List;

import com.supr.blog.model.cmge.Model;
import com.supr.blog.model.cmge.Trade;
import com.supr.blog.util.pager.Pager;

public interface ModelService {

	Pager<Model> getModelList(Model model,int pageSize, int pageNum);

	List<Trade> getTradeList();

	int deleteBatch(String[] ids);

	Model getModelById(String modelId);

}
