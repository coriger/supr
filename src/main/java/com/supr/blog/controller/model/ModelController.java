package com.supr.blog.controller.model;

import java.util.ArrayList;
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
import com.supr.blog.model.cmge.Algorithm;
import com.supr.blog.model.cmge.AlgorithmProvide;
import com.supr.blog.model.cmge.DataType;
import com.supr.blog.model.cmge.Model;
import com.supr.blog.model.cmge.ModelAttr;
import com.supr.blog.model.cmge.ModelDataUnit;
import com.supr.blog.model.cmge.ModelLat;
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
	Map<String, Object> getModelAttrListJson(String modelId){
		Map<String, Object> map = new HashMap<String, Object>();
		Pager<ModelAttr> pager = modelService.getModelAttrList(modelId,pageSize,pageNum);
		map.put("rows", pager.getList());
		map.put("total", pager.getTotalCount());
		return map;
	}
	
	/**
	 * 获取模型维度列表
	 * @param adminId
	 */
	@RequestMapping(value = "/list_lat")
	public @ResponseBody 
	Map<String, Object> getModelLatListJson(String modelId){
		Map<String, Object> map = new HashMap<String, Object>();
		Pager<ModelLat> pager = modelService.getModelLatList(modelId,pageSize,pageNum);
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
	 * 删除模型属性
	 * @param adminId
	 */
	@RequestMapping(value = "/deleteAttrBatch",method = RequestMethod.POST)
	public @ResponseBody 
	Result deleteAttrBatch(@RequestParam String modelAttrIds){
		String[] ids = modelAttrIds.split(",");
		int count = modelService.deleteAttrBatch(ids);
		if(count != ids.length){
			return new Result("error", "删除失败！");
		}else{
			return new Result("success", "删除成功！");
		}
	}
	
	/**
	 * 删除模型维度
	 * @param adminId
	 */
	@RequestMapping(value = "/deleteLatBatch",method = RequestMethod.POST)
	public @ResponseBody 
	Result deleteLatBatch(@RequestParam String modelLatIds){
		String[] ids = modelLatIds.split(",");
		int count = modelService.deleteLatBatch(ids);
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
	 * 获取模型第一步保存数据
	 * @param admin
	 */
	@RequestMapping(value = "/load/modelinfo")
	public String loadModelInfo(String modelId,ModelMap map){
		Model model = modelService.getModelById(Integer.parseInt(modelId));
		List<Trade> tradeList = modelService.getTradeList();
		
		map.addAttribute("tradeList", tradeList);
		map.addAttribute("model", model);
		return "admin/model/add_model_step1";
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
		if(modelService.isExistModelName(model)){
			return new Result("error", "模型名称已存在！");
		}else if(modelService.isExistModelLKey(model)){
			return new Result("error", "模型Key存在！");
		}else{
			model.setCreateTime(System.currentTimeMillis());
			int count = modelService.saveModelInfo(model);
			if(count == 1){
				return new Result("success", "新增成功！",model.getId());
			}else{
				return new Result("error", "新增失败！");
			}
		}
	}
	
	/**
	 * 更新模型第一步
	 * @param admin
	 */
	@RequestMapping(value = "/update/info")
	public @ResponseBody 
	Result updateModelInfo(Model model){
		model.setCreateTime(System.currentTimeMillis());
		int count = modelService.updateModelInfo(model);
		if(count == 1){
			return new Result("success", "更新成功！",model.getId());
		}else{
			return new Result("error", "更新失败！");
		}
	}
	
	
	/**
	 * 新增模型第二步
	 */
	@RequestMapping(value = "/add/step2")
	public String addModelStep2(String modelId,ModelMap map){
		// 获取model对象
		Model model = modelService.getModelById(Integer.parseInt(modelId));
		map.addAttribute("model",model);
		return "admin/model/add_model_step2";
	}
	
	/**
	 * 跳转新增数据单元
	 */
	@RequestMapping(value = "/forward/addDataUnit")
	public String addModelDataUnitPre(String modelId,ModelMap map){
		// 获取数据类型
		List<DataType> dataTypeList = modelService.getDataTypeList();
		map.addAttribute("dataTypeList", dataTypeList);	
		// 获取model对象
		Model model = modelService.getModelById(Integer.parseInt(modelId));
		map.addAttribute("model",model);
		return "admin/model/add_data_unit";
	}
	
	/**
	 * 获取模型的属性数据单元
	 */
	@RequestMapping(value = "/getDataUnitByModelId")
	public @ResponseBody 
	List<ModelDataUnit> getAttrDataUnitByModelId(String modelId,ModelMap map){
		// 获取模型属性数据单元
		List<ModelDataUnit> modelDataUnit = modelService.getAttrDataUnitByModelId(modelId);
		if(null == modelDataUnit || modelDataUnit.size() == 0){
			modelDataUnit = new ArrayList<ModelDataUnit>();
			ModelDataUnit dataUnit = new ModelDataUnit();
			dataUnit.setId(-1);
			dataUnit.setRmduName("选择数据单元");
			modelDataUnit.add(dataUnit);
		}
		return modelDataUnit;
	}
	
	/**
	 * 跳转新增模型属性
	 * @param admin
	 */
	@RequestMapping(value = "/forward/add/attr")
	public String addModelAttrPre(String modelId,ModelMap map){
		// 获取数据单元
		// List<ModelDataUnit> dataUnitList = modelService.getModelAttrDataUnit(modelId);
		// 获取模型信息
		Model model = modelService.getModelById(Integer.parseInt(modelId));
		
		map.addAttribute("model",model);
		// map.addAttribute("dataUnitList",dataUnitList);
		return "admin/model/add_model_attr";
	}
	
	/**
	 * 跳转新增模型维度
	 * @param admin
	 */
	@RequestMapping(value = "/forward/add/lat")
	public String addModelLatPre(String modelId,ModelMap map){
		// 获取维度算法
		List<Algorithm> algorithmList = modelService.getLatAlgorithm();
		// 获取模型信息
		Model model = modelService.getModelById(Integer.parseInt(modelId));
		
		map.addAttribute("model",model);
		map.addAttribute("algorithmList",algorithmList);
		return "admin/model/add_model_lat";
	}
	
	/**
	 * 根据算法Id获取维度算法明细
	 * @param admin
	 */
	@RequestMapping(value = "/getAlgorithmInfo")
	public String getAlgorithmInfo(ModelLat modelLat,ModelMap map){
		// 获取数据单元
		List<ModelDataUnit> dataUnitList = modelService.getModelAttrDataUnit(modelLat.getRmId()+"");
		// 获取维度算法属性
		List<AlgorithmProvide> algorithmProvideList = modelService.getAlgorithmProvideListById(modelLat);
		map.addAttribute("dataUnitList",dataUnitList);
		map.addAttribute("algorithmProvideList",algorithmProvideList);
		return "admin/model/getAlgorithmInfo";
	}
	
	
	/**
	 * 跳转编辑模型属性
	 * @param admin
	 */
	@RequestMapping(value = "/forward/update/attr")
	public String updateModelAttrPre(String attrId,String modelId,ModelMap map){
		// 获取数据单元
		List<ModelDataUnit> dataUnitList = modelService.getModelAttrDataUnit(modelId);
		// 获取模型信息
		Model model = modelService.getModelById(Integer.parseInt(modelId));
		// 获取模型属性信息
		ModelAttr modelAttr = modelService.getModelAttrById(attrId);
		
		map.addAttribute("model",model);
		map.addAttribute("modelAttr",modelAttr);
		map.addAttribute("dataUnitList",dataUnitList);
		return "admin/model/update_model_attr";
	}
	
	/**
	 * 跳转编辑模型维度  第一步
	 * @param admin
	 */
	@RequestMapping(value = "/forward/update/lat")
	public String updateModelLatPre(String latId,String modelId,ModelMap map){
		// 获取维度算法
		List<Algorithm> algorithmList = modelService.getLatAlgorithm();
		// 获取模型信息
		Model model = modelService.getModelById(Integer.parseInt(modelId));
		// 获取模型属性信息
		ModelLat modelLat = modelService.getModelLatById(latId);
		
		map.addAttribute("model",model);
		map.addAttribute("modelLat",modelLat);
		map.addAttribute("algorithmList",algorithmList);
		return "admin/model/update_model_lat";
	}
	
	/**
	 * 跳转编辑模型维度  第二步
	 * @param admin
	 */
	@RequestMapping(value = "/forward/update/lat_algorithm")
	public String updateModelLatPost(String latId,ModelMap map){
		// 获取模型属性信息
		ModelLat modelLat = modelService.getModelLatById(latId);
		// 获取模型信息
		Model model = modelService.getModelById(modelLat.getRmId());
		// 算法入参
		List<AlgorithmProvide> algorithmProvideList = modelService.getAlgorithmProvideListById(modelLat);
		// 获取维度数据单元
		List<ModelDataUnit> dataUnitList = modelService.getModelLatDataUnit(modelLat.getRmId());
				
		map.addAttribute("model",model);
		map.addAttribute("modelLat",modelLat);
		map.addAttribute("algorithmProvideList",algorithmProvideList);
		map.addAttribute("dataUnitList",dataUnitList);
		return "admin/model/update_model_lat_algorithm";
	}
	
	/**
	 * 编辑模型属性
	 * @param admin
	 */
	@RequestMapping(value = "/update/attr")
	public @ResponseBody 
	Result updateModelAttrPre(ModelAttr modelAttr,ModelMap map){
		modelAttr.setModifyTime(System.currentTimeMillis());
		int count = modelService.updateModelAttr(modelAttr);
		if(count == 1){
			return new Result("success", "更新成功！");
		}else{
			return new Result("error", "更新失败！");
		}
	}
	
	/**
	 * 更新模型维度基本信息
	 * @param admin
	 */
	@RequestMapping(value = "/update/latinfo")
	public @ResponseBody 
	Result updateModelLatInfo(ModelLat modelLat,ModelMap map){
		modelLat.setModifyTime(System.currentTimeMillis());
		int count = modelService.updateModelLat(modelLat);
		if(count == 1){
			return new Result("success", "更新成功！");
		}else{
			return new Result("error", "更新失败！");
		}
	}
	
	/**
	 * 新增模型属性
	 * @param admin
	 */
	@RequestMapping(value = "/add/attr")
	public @ResponseBody 
	Result addModelAttr(ModelAttr modelAttr){
		modelAttr.setCreateTime(System.currentTimeMillis());
		int count = modelService.saveModelAttr(modelAttr);
		if(count == 1){
			return new Result("success", "新增成功！");
		}else{
			return new Result("error", "新增失败！");
		}
	}
	
	/**
	 * 新增模型维度
	 * @param admin
	 */
	@RequestMapping(value = "/add/lat")
	public @ResponseBody 
	Result addModelLat(ModelLat modelLat){
		modelLat.setCreateTime(System.currentTimeMillis());
		int count = modelService.saveModelLat(modelLat);
		if(count == 1){
			return new Result("success", "新增成功！");
		}else{
			return new Result("error", "新增失败！");
		}
	}
	
	/**
	 * 新增模型第三步
	 */
	@RequestMapping(value = "/add/step3")
	public String addModelStep3(String modelId,ModelMap map){
		// 获取model对象
		Model model = modelService.getModelById(Integer.parseInt(modelId));
		map.addAttribute("model",model);
		return "admin/model/add_model_step3";
	}
	
}
