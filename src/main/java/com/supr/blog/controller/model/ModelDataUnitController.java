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
import com.supr.blog.model.cmge.DataType;
import com.supr.blog.model.cmge.Model;
import com.supr.blog.model.cmge.ModelAttr;
import com.supr.blog.model.cmge.ModelDataUnit;
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
@RequestMapping("/modelDataUnit")
public class ModelDataUnitController extends BaseController{
	
	@Autowired
	private ModelService modelService;
	
	/**
	 * 跳转模型数据单元列表
	 * @param adminId
	 */
	@RequestMapping(value = "/list")
	public String dumpModelDataUnitListPage(ModelMap model){
		// 获取模型信息
		List<Model> modelList = modelService.getModelList();
		model.addAttribute("modelList", modelList);
		
		List<DataType> dataTypeList = modelService.getDataTypeList();
		model.addAttribute("dataTypeList", dataTypeList);
		
		return "/admin/model/list_modelDataUnit";
	}
	
	/**
	 * 获取模型数据单元列表
	 * @param adminId
	 */
	@RequestMapping(value = "/list_modelDataUnit")
	public @ResponseBody 
	Map<String, Object> getModelListJson(ModelDataUnit modelDataUnit,@RequestParam(value="rows")int pageSize,@RequestParam(value="page")int pageNum){
		Map<String, Object> map = new HashMap<String, Object>();
		Pager<ModelDataUnit> pager = modelService.getModelDataUnitList(modelDataUnit,pageSize,pageNum);
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
	 * 新增模型数据单元
	 * @param admin
	 */
	@RequestMapping(value = "/addModelDataUnit")
	public String addModelStep1(ModelMap map){
		// 加载模型
		List<Model> modelList = modelService.getModelList();
		map.addAttribute("modelList", modelList);
		
		List<DataType> dataTypeList = modelService.getDataTypeList();
		map.addAttribute("dataTypeList", dataTypeList);
		return "admin/model/add_ModelDataUnit";
	}
	/**
	 * 保存模型数据单元
	 * @param admin
	 */
	@RequestMapping(value = "/add/info")
	public @ResponseBody 
	Result addModelInfo(ModelDataUnit modelDataUnit){
		modelDataUnit.setCreateTime(System.currentTimeMillis());
		int count = modelService.saveModelDataUnitInfo(modelDataUnit);
		if(count == 1){
			return new Result("success", "新增成功！",modelDataUnit.getId());
		}else{
			return new Result("error", "新增失败！");
		}
	}
}
