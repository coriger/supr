package com.supr.blog.controller.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.supr.blog.controller.BaseController;
import com.supr.blog.model.cmge.Model;
import com.supr.blog.model.cmge.ModelAttr;
import com.supr.blog.model.cmge.Trade;
import com.supr.blog.model.vo.Result;
import com.supr.blog.service.ModelService;
import com.supr.blog.util.pager.Pager;

/**
 * @desc	模型管理
 * @author	ljt
 * @time	2014-5-30 上午9:08:26
 */
@Controller
@RequestMapping("/model")
public class ModelController extends BaseController{
	
	@Autowired
	private ModelService modelService;
	
	/**
	 * 跳转模型列表
	 * @param adminId
	 */
	@RequestMapping(value = "/list")
	public String dumpModelListPage(ModelMap model){
		// 获取行业信息
		List<Trade> tradeList = modelService.getTradeList();
		model.addAttribute("tradeList", tradeList);
		return "/admin/model/list_model";
	}
	
	/**
	 * 获取模型列表
	 * @param adminId
	 */
	@RequestMapping(value = "/list_model")
	public @ResponseBody 
	Map<String, Object> getModelListJson(Model model,@RequestParam(value="rows")int pageSize,@RequestParam(value="page")int pageNum){
		Map<String, Object> map = new HashMap<String, Object>();
		Pager<Model> pager = modelService.getModelList(model,pageSize,pageNum);
		map.put("rows", pager.getList());
		map.put("total", pager.getTotalCount());
		return map;
	}
	
	/**
	 * 获取模型属性列表
	 * @param adminId
	 */
	@RequestMapping(value = "/list_attr")
	public @ResponseBody 
	Map<String, Object> getModelAttrListJson(String modelId,@RequestParam(value="rows")int pageSize,@RequestParam(value="page")int pageNum){
		Map<String, Object> map = new HashMap<String, Object>();
		Pager<ModelAttr> pager = modelService.getModelAttrList(modelId,pageSize,pageNum);
		map.put("rows", pager.getList());
		map.put("total", pager.getTotalCount());
		return map;
	}
	
	/**
	 * 删除模型
	 * @param adminId
	 */
	@RequestMapping(value = "/deleteBatch",method = RequestMethod.POST)
	public @ResponseBody 
	Result deleteBatch(@RequestParam String modelIds){
		String[] ids = modelIds.split(",");
		int count = modelService.deleteBatch(ids);
		if(count != ids.length){
			return new Result("error", "删除失败！");
		}else{
			return new Result("success", "删除成功！");
		}
	}
	
	/**
	 * 新增模型
	 * @param admin
	 */
	@RequestMapping(value = "/add_model")
	public String addModel(ModelMap map){
		return "admin/model/add_model";
	}
	
	
	/**
	 * 新增模型第一步
	 * @param admin
	 */
	@RequestMapping(value = "/add/step1")
	public String addModelStep1(ModelMap map){
		// 加载行业
		List<Trade> tradeList = modelService.getTradeList();
		map.addAttribute("tradeList", tradeList);
		return "admin/model/add_model_step1";
	}
	
	/**
	 * 新增模型第一步
	 * @param admin
	 */
	@RequestMapping(value = "/add/info")
	public @ResponseBody 
	Result addModelInfo(Model model){
		model.setCreateTime(System.currentTimeMillis());
		int count = modelService.saveModelInfo(model);
		if(count == 1){
			return new Result("success", "新增成功！",model.getId());
		}else{
			return new Result("error", "新增失败！");
		}
	}
	
	/**
	 * 新增模型第二步
	 */
	@RequestMapping(value = "/add/step2")
	public String addModelStep2(String modelId,ModelMap map){
		// 获取model对象
		Model model = modelService.getModelById(modelId);
		map.addAttribute("model",model);
		return "admin/model/add_model_step2";
	}
	
	/**
	 * 新增模型第二步
	 * @param admin
	 */
	@RequestMapping(value = "/add/attr")
	public @ResponseBody 
	Result addModelAttr(ModelMap map){
		return null;
	}
	
	/**
	 * 新增模型第三步
	 */
	@RequestMapping(value = "/add/step3")
	public String addModelStep3(ModelMap map){
		return "admin/model/add_model_step3";
	}
	
	/**
	 * 新增模型第三步
	 * @param admin
	 */
	@RequestMapping(value = "/add/lat")
	public @ResponseBody 
	Result addModelLat(ModelMap map){
		return null;
	}
	
}
