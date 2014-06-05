<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="<%=basePath%>js/easyui/themes/icon.css" type="text/css"></link>
<link rel="stylesheet" href="<%=basePath%>js/easyui/themes/default/easyui.css" type="text/css"></link>
<script type="text/javascript" src="<%=basePath%>js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/easyui/locale/easyui-lang-zh_CN.js"></script>

<script type="text/javascript">
	
	//列表宽度百分比设置
	function fixWidth(percent){
		return document.body.clientWidth * percent ;
	}
	
	// 新增模型
	function addModel(){
		console.info("addModel...");
		// 先删掉所有tab
		$("#add_model_top li").each(function (i, n) {
            var title = $(n).text();
            $('#add_model_top').tabs('close',title);
        });
		
		$("#addDialog").dialog('open');
		formInit();
	}
	
	// 编辑模型属性
	function editModelAttr(attrId){
		console.info("editModelAttr...,attrId="+attrId);
		$("#updateAttrDialog").dialog('open');
		editAttrFormInit(attrId);
	}
	
	// 编辑模型维度
	function editModelLat(latId){
		console.info("editModelLat...,latId="+latId);
		$("#updateLatDialog").dialog('open');
		editLatFormInit(latId);
	}
	
	// 不用iframe方式  
	function getContent(url){
		$.ajax({
			url : url,
			data: "",
			method : "post",
			success : function(data) {
				console.info(data);
				return "hello";
			}
		})
	}
	
	// 维度编辑框初始化
	function editLatFormInit(latId){
		// 创建两个tab页  第一步：维度基本信息   第二步：维度算法
		$('#update_lat_top').tabs({
			border:false,
		    fit:true,
		});
		
		$.ajax({
			url : './model/forward/update/lat?latId='+latId+"&modelId="+$("#rmId").val(),
			data: "",
			method : "post",
			success : function(data) {
				$('#update_lat_top').tabs('add',{
					title:"第一步:维度基本信息定义",
					selected:true,
					closable:false,
					cache:false,
					content : data // 这里动态加载第一步页面信息
				});
				
				$('#update_lat_top').tabs('add',{
					title:"第二步:维度算法信息定义",
					selected:false,
					closable:false,
					cache:false,
					content : "two"//createFrame(getTagUrl('0')) // 这里动态加载第一步页面信息
				});
				
				$('#update_lat_top').tabs('disableTab', 1); 
				$('#update_lat_top').tabs('enableTab', 0); 
			}
		})
		
		// 跳转编辑属性页面
		//$("#updateLatDialog").dialog('refresh', './model/forward/update/lat?latId='+latId+"&modelId="+$("#rmId").val());		
	}
	
	// 属性编辑框初始化
	function editAttrFormInit(attrId){
		// 跳转编辑属性页面
		$("#updateAttrDialog").dialog('refresh', './model/forward/update/attr?attrId='+attrId+"&modelId="+$("#rmId").val());		
	}
	
	// 新增模型属性
	function addModelAttr(modelId){
		console.info("addModelAttr...,modelId="+modelId);
		$("#addAttrDialog").dialog('open');
		attrFormInit(modelId);
	}
	
	// 新增模型维度
	function addModelLat(modelId){
		console.info("addModelLat...,modelId="+modelId);
		$("#addLatDialog").dialog('open');
		latFormInit(modelId);
	}
	
	// 初始化新增模型维度表单
	function latFormInit(modelId){
		console.info("新增模型维度...");
		// 跳转新增属性页面
		$('#addLatDialog').dialog('refresh', './model/forward/add/lat?modelId='+modelId);		
	}
	
	// 初始化新增模型属性表单
	function attrFormInit(modelId){
		console.info("新增模型属性...");
		// 跳转新增属性页面
		$('#addAttrDialog').dialog('refresh', './model/forward/add/attr?modelId='+modelId);		
	}
	
	// 更新模型属性
	function updateModelAttr(){
		console.info($("#updateAttrForm").serialize());
		$.ajax({
			url : './model/update/attr?data='+Math.random(),
			data: $("#updateAttrForm").serialize(),
			method : "post",
			dataType : "json",
			success : function(data) {
				if (data.resultCode == 'error') {
					alert(data.errorInfo);
					return;
				} else if (data.resultCode == 'success') {
					// 弹出新增成功消息框 
					showMsg("更新成功!");
					closeUpdateModelAttr();
				}
			}
		});
	}
	
	// 保存模型维度
	function saveModelLat(){
		console.info("保存模型维度...");
		//console.info($(window.frames["sb"].document).find("#form").serialize());
		console.info("test:"+Math.random());
		console.info($("#form").serialize());
		$.ajax({
			url : './model/add/lat?data='+Math.random(),
			data: $("#form").serialize(),
			method : "post",
			dataType : "json",
			success : function(data) {
				if (data.resultCode == 'error') {
					alert(data.errorInfo);
					return;
				} else if (data.resultCode == 'success') {
					// 弹出新增成功消息框 
					showMsg("新增成功!");
					// 输入框清空
					$(':input','#form')
					 .not(':button, :submit, :reset, :hidden')
					 .val('')
					 .removeAttr('checked');
					//.removeAttr('selected');
					//$("#rmduId").combobox('select','-1');
				}
			}
		});
	}
	
	// 保存模型属性
	function saveModelAttr(){
		console.info("保存模型属性...");
		//console.info($(window.frames["sb"].document).find("#form").serialize());
		console.info("test:"+Math.random());
		console.info($("#form").serialize());
		$.ajax({
			url : './model/add/attr?data='+Math.random(),
			data: $("#form").serialize(),
			method : "post",
			dataType : "json",
			success : function(data) {
				if (data.resultCode == 'error') {
					alert(data.errorInfo);
					return;
				} else if (data.resultCode == 'success') {
					// 弹出新增成功消息框 
					showMsg("新增成功!");
					// 输入框清空
					$(':input','#form')
					 .not(':button, :submit, :reset, :hidden')
					 .val('')
					 .removeAttr('checked');
					//.removeAttr('selected');
					//$("#rmduId").combobox('select','-1');
				}
			}
		});
	}
	
	// 保存并关闭  
	function saveAndCloseModelAttr(){
		// 保存
		saveModelAttr();
		// 关闭
		closeModelAttr();
	}
	
	// 保存并关闭  
	function saveAndCloseModelLat(){
		// 保存
		saveModelLat();
		// 关闭
		closeModelLat();
	}
	
	// 关闭新增属性窗口
	function closeModelAttr(){
		console.info("关闭新增属性窗口...");
		// 关闭属性列表
		$("#addAttrDialog").dialog('close');
		// 刷新
		updateTagContent(getTagUrl('1',$("#rmId").val()));
	}
	
	// 关闭新增维度窗口
	function closeModelLat(){
		console.info("关闭新增维度窗口...");
		$("#addLatDialog").dialog('close');
		// 刷新
		updateTagContent(getTagUrl('2',$("#rmId").val()));
	}
	
	function closeUpdateModelAttr(){
		// 关闭属性列表
		$("#updateAttrDialog").dialog('close');
		// 刷新
		updateTagContent(getTagUrl('1',$("#rmId").val()));
	}

	// 新增模型属性
	function addModelAttr(modelId){
		console.info("addModelAttr...,modelId="+modelId);
		$("#addAttrDialog").dialog('open');
		attrFormInit(modelId);
	}
	
	// 初始化新增模型属性表单
	function attrFormInit(modelId){
		console.info("新增模型属性...");
		// 跳转新增属性页面
		$('#addAttrDialog').dialog('refresh', './model/forward/add/attr?modelId='+modelId);		
	}
	
	// 保存模型属性
	function saveModelAttr(){
		console.info("保存模型属性...");
		//console.info($(window.frames["sb"].document).find("#form").serialize());
		console.info("test:"+Math.random());
		console.info($("#form").serialize());
		$.ajax({
			url : './model/add/attr?data='+Math.random(),
			data: $("#form").serialize(),
			method : "post",
			dataType : "json",
			success : function(data) {
				if (data.resultCode == 'error') {
					alert(data.errorInfo);
					return;
				} else if (data.resultCode == 'success') {
					// 弹出新增成功消息框 
					showMsg("新增成功!");
					// 输入框清空
					$(':input','#form')
					 .not(':button, :submit, :reset, :hidden,:select')
					 .val('')
					 .removeAttr('checked');
					//.removeAttr('selected');
					$("#rmduId").combobox('select','-1');
				}
			}
		});
	}
	
	// 保存并关闭  
	function saveAndCloseModelAttr(){
		// 保存
		saveModelAttr();
		// 关闭
		closeModelAttr();
	}
	
	// 关闭新增属性窗口
	function closeModelAttr(){
		console.info("关闭新增属性窗口...");
		// 关闭属性列表
		$("#addAttrDialog").dialog('close');
		// 刷新
		updateTagContent(getTagUrl('1',$("#rmId").val()));
	}
	
	// 初始化新增模型表单
	function formInit(){
		console.info("初始化表单...");
		// 初始化三个tab  第一步、第二步、第三步
		$('#add_model_top').tabs({
			border:false,
		    fit:true,
		});
		
		$('#add_model_top').tabs('add',{
			title:"第一步:模型基本信息定义",
			selected:true,
			closable:false,
			cache:false,
			content : createFrame(getTagUrl('0')) // 这里动态加载第一步页面信息
		});
		
		$('#add_model_top').tabs('add',{
			title:"第二步:模型属性信息定义",
			selected:false,
			closable:false,
			cache:false,
			//content : createFrame(getTagUrl('1')) // 这里动态加载第二步页面信息
		});
		
		$('#add_model_top').tabs('add',{
			title:"第三步:模型维度信息定义",
			selected:false,
			closable:false,
			cache:false,
			//content : createFrame(getTagUrl('2')) // 这里动态加载第三步页面信息
		});
		
		// 初始化时候  禁用1、2 tab
		$('#add_model_top').tabs('disableTab', 1); 
		$('#add_model_top').tabs('disableTab', 2); 
	}
	
	// 上一步  切换到上一个tab
	function beforeStep(){
		// 获取当前tab
		var curTab = $("#add_model_top").tabs('getSelected');
		var index = $('#add_model_top').tabs('getTabIndex',curTab);
		if(index == '1'){
			// 保存模型属性 
			index = index - 1;
			$('#add_model_top').tabs('disableTab', 1); 
			$('#add_model_top').tabs('enableTab', 0); 
			$('#add_model_top').tabs('disableTab', 2); 
			// 去掉上一步按钮
			$(".dialog-button a:first-child").remove();
		}else if(index == '2'){
			index = index - 1;
			// 保存模型维度
			$('#add_model_top').tabs('disableTab', 0); 
			$('#add_model_top').tabs('disableTab', 2); 
			$('#add_model_top').tabs('enableTab', 1); 
			
			// 增加下一步按钮
			var beforeButton = "<a href='javascript:nextStep()' class='l-btn l-btn-small' group='' id=''>"+
						  	"<span class='l-btn-left l-btn-icon-left'>"+
							"<span class='l-btn-text'>下一步</span>"+
							"<span class='l-btn-icon icon-save'></span>"+
						 	"</span>"+
							"</a>";
			$(".dialog-button").append(beforeButton);
		}
		
		// 切换到上一个tab
		$("#add_model_top").tabs('select',index);
		// 更新tab内容
		updateTagContent(getTagUrl(index));
	}
	
	// 更新tab内容 重新加载  不要缓存
	function updateTagContent(url){
		$("#add_model_top").tabs('update',{
			tab:$("#add_model_top").tabs('getSelected'),
		    options : {
		         content : createFrame(url)
		    }
		});
	}
	
	// 更新tab内容 重新加载  不要缓存
	function updateTabContent(url){
		$.ajax({
			url:url,
			method:"post",
			success:function(data){
				$("#update_lat_top").tabs('update',{
					tab:$("#update_lat_top").tabs('getSelected'),
				    options : {
				         content : data
				    }
				});
			}
		})
	}
	
	// 编辑模型维度   下一步
	function updateLatNextStep(){
		// 保存第一步数据
		var curTab = $("#update_lat_top").tabs('getSelected');
		var index = $('#update_lat_top').tabs('getTabIndex',curTab);
		if(index == '0'){
			index = index + 1;
			alert("进来了...");
			//alert($(window.frames["sb"].document).find("#add_model_step1"));
			//alert($(window.frames["sb"].document).find("#updateLatForm"));
			alert($("#updateLatForm").serialize());
			console.info($("#updateLatForm").serialize());
			//alert($(window.frames["sb"].document));
			//console.info($(window.frames["sb"].document).find("#updateLatForm"));
			$.ajax({
				url : './model/update/latinfo?data='+Math.random(),
				data: $("#updateLatForm").serialize(),
				method : "post",
				dataType : "json",
				success : function(data) {
					if (data.resultCode == 'error') {
						alert(data.errorInfo);
						return;
					} else if (data.resultCode == 'success') {
						// showMsg("新增成功!");
						// 切换到下一个tab
						$("#update_lat_top").tabs('select',index);
						// 更新tab内容
						updateTabContent('./model/forward/update/lat_algorithm?latId='+latId+"&modelId="+$("#rmId").val());
					}
				}
			});
		}else if(index == '1'){
			
		}
		
	}
	
	// 下一步 切换到下一个tab
	function nextStep(){
		// 获取当前tab  判断是否是最后一个tab
		var curTab = $("#add_model_top").tabs('getSelected');
		var index = $('#add_model_top').tabs('getTabIndex',curTab);
		if(index == '0'){
			// 保存模型名称 和 模型key
			console.info($(window.frames["sb"].document).find("#form").serialize());
			$.ajax({
				url : './model/add/info',
				data: $(window.frames["sb"].document).find("#form").serialize(),
				method : "post",
				dataType : "json",
				success : function(data) {
					if (data.resultCode == 'error') {
						alert(data.errorInfo);
						return;
					} else if (data.resultCode == 'success') {
						var modelId = data.object;
						index = index + 1;
						$('#add_model_top').tabs('enableTab', 1); 
						$('#add_model_top').tabs('disableTab', 0); 
						$('#add_model_top').tabs('disableTab', 2); 
						// 增加上一步按钮
						var beforeButton = "<a href='javascript:beforeStep()' class='l-btn l-btn-small' group='' id='modelId' value='"+modelId+"'>"+
									  	"<span class='l-btn-left l-btn-icon-left'>"+
										"<span class='l-btn-text'>上一步</span>"+
										"<span class='l-btn-icon icon-save'></span>"+
									 	"</span>"+
										"</a>";
						$(".dialog-button").prepend(beforeButton);
						// 切换到下一个tab
						$("#add_model_top").tabs('select',index);
						// 更新tab内容
						updateTagContent(getTagUrl(index,modelId));
					}
				}
			});
		}else if(index == '1'){
			// 保存模型属性 
			var modelId = $("#modelId").attr("value");
			//console.info($(window.frames["sb"].document).find("#modelId").val());
			//alert($(window.frames["sb"].document).find("#modelId").val());
			index = index + 1;
			$('#add_model_top').tabs('disableTab', 0); 
			$('#add_model_top').tabs('enableTab', 2); 
			$('#add_model_top').tabs('disableTab', 1); 
			
			// 去掉下一步按钮
			//alert($("#addBt a:eq(2)").html());
			// remove方法无效  暂时先用empty
			$("#addBt a:eq(2)").empty();
			
			// 切换到下一个tab
			$("#add_model_top").tabs('select',index);
			// 更新tab内容
			updateTagContent(getTagUrl(index,modelId));
		}else if(index == '2'){
			// 保存模型维度
			$('#add_model_top').tabs('disableTab', 0); 
			$('#add_model_top').tabs('disableTab', 1); 
			$('#add_model_top').tabs('enableTab', 2); 
			
			// 切换到下一个tab
			$("#add_model_top").tabs('select',index);
			// 更新tab内容
			updateTagContent(getTagUrl(index,1));
		}
	}
	
	function getTagUrl(index,modelId){
		if(index == '0'){
			return './model/add/step1?date='+Math.random()+"&modelId="+modelId;
		}else if(index == '1'){
			return './model/add/step2?date='+Math.random()+"&modelId="+modelId;
		}else if(index == '2'){
			return './model/add/step3?date='+Math.random()+"&modelId="+modelId;
		}
	}
	
	// 创建tab页签
	function createFrame(url) {
	    var str = '<iframe name=sb width=100% height=100% frameborder=0 scrolling=no marginheight=0 marginwidth=0 src="' + url + '"></iframe>';
	    return str;
	}
	
	// 删除模型
	function delModel(){
		console.info("删除...");
		var rows = $("#main").datagrid('getSelections');
		if(rows.length >0){
			$.messager.confirm('确认提示！','您确定要删除选中的所有行？',function(r){
				if (r){
					var ids = "";
					for(var i=0;i<rows.length;i++){
						ids += rows[i].id + ","; 
					}
					console.info(ids);
					$.ajax({
						url:'./model/deleteBatch',
						data:'modelIds='+ids,
						method : "post",
						dataType : "json",
						success:function(data){
							if (data.resultCode=='success'){
								$("#main").datagrid('load');
								showMsg(data.errorInfo);//操作结果提示
							} else {
								showMsg(data.errorInfo);//操作结果提示
							}
						}
					})
				}
			});
		}else{
			showMsg("请选择要操作的对象！");
		}
	}
	
	// form表单转json
	$.fn.serializeObject = function()    
	{    
	   var o = {};    
	   var a = this.serializeArray();    
	   $.each(a, function() {    
	       if (o[this.name]) {    
	           if (!o[this.name].push) {    
	               o[this.name] = [o[this.name]];    
	           }    
	           o[this.name].push(this.value || '');    
	       } else {    
	           o[this.name] = this.value || '';    
	       }    
	   });    
	   return o;    
	}; 
	
	
	// 搜索模型列表
	function searchModel(){
		console.info($("#search_form").serializeObject());
		$("#main").datagrid('load',$("#search_form").serializeObject());
	}
	
	// 清空按钮
	function clearAll(){
		$("#tId").combobox('select','-1');
		// $("#tId option:first").prop("selected", 'selected');
		$("#rmName").val("");
	}
	
	// 保存模型
	function saveModel(){
		console.info("保存模型...");
		// 当前tab页面 
		var curTab = $("#add_model_top").tabs('getSelected');
		var index = $('#add_model_top').tabs('getTabIndex',curTab);
		
		if(index == '0'){
			// 如果是第一步  则保存模型基本信息
			console.info("第一步保存...");
		}else if(index == '1'){
			// 如果是第二部  则保存模型属性信息
			console.info("第二步保存...");
		}else if(index == '2'){
			// 如果是第三部  则保存模型维度信息
			console.info("第三步保存...");
		}
		
		// 关闭dialog
		$("#addDialog").dialog('close');
		// 刷新模型列表
		$("#main").datagrid('load');
	}
	
	// 弹出消息框
	function showMsg(msg){
		$.messager.show({    
		    title: '处理结果',
		    msg:msg,
		    timeout:3000,
			showType:'slide'
		});    
	}
	
</script>

</head>

<table id="main" class="easyui-datagrid" 
			data-options="fit : true,border:false,rownumbers:true,fitColumns : true,
			url:'./model/list_model',pagination : true,pageSize:2, pageList:[2,4,6,8],
			loadMsg:'正在加载中, 请稍候 …',toolbar:'#searchBut'"> 
	<thead>  
           <tr>  
           	   <th data-options="field:'ck',checkbox:true"></th>
               <th data-options="field:'id',width:fixWidth(0.2),align:'center'">模型Id</th>  
               <th data-options="field:'rmName',width:fixWidth(0.2),align:'center'">模型名称</th>  
               <th data-options="field:'rtName',width:fixWidth(0.2),align:'center'">所属行业</th>  
               <th data-options="field:'rmKey',width:fixWidth(0.2),align:'center'">模型key</th>
               <th data-options="field:'description',width:fixWidth(0.2),align:'center'">简介</th>       
           </tr>  
   </thead>  
</table>

<div id="searchBut" style="padding:5px;height:auto">
        <div style="margin-bottom:5px">
            <a href="#" onclick="addModel()" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>
            <a href="#" onclick="editModel()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">编辑</a>
            <a href=# onclick="delModel()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
        </div>
        
        <div>
            <!-- Date From: <input class="easyui-datebox" style="width:80px">
            To: <input class="easyui-datebox" style="width:80px"> -->
           	<form id="search_form"> 
	           	 所属行业：
	            <select id="tId" name="tId" class="easyui-combobox" panelHeight="auto" style="width:100px">
									<option value="-1">全部</option>
									<c:forEach items="${tradeList}" var="trade">
										<option value="${trade.id}">${trade.rtName}</option>
									</c:forEach>
				</select>
				模型名称：<input type="text" id="rmName" name="rmName" placeholder="请输入模型名称..."/>
	            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="searchModel()">查询</a>
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="clearAll()">重置</a>
        	</form>
        </div>
</div>

<!-- 新增弹出框 -->
<div id="addDialog" class="easyui-dialog" 
			data-options="title: '新增模型',top:20,width: 600, height: 400,
			maximizable:true,closed: false, modal: true,
			buttons:'#addBt',closed:true">   
	<div id="add_model_top">

	</div>
</div>

<!-- 新增模型dialog按钮 -->
<div id="addBt">
	<a href="#" onclick="saveModel()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">完成</a>
	<a href="#" onclick="nextStep()" class="easyui-linkbutton" data-options="iconCls:'icon-help'">下一步</a>
</div>


<!-- 新增属性弹出框 -->
<div id="addAttrDialog" class="easyui-dialog" 
			data-options="title: '新增模型属性',top:20,width: 600, height: 400,
			maximizable:true,closed: false, modal: true,
			buttons:'#addAttrBt',closed:true">   
	
</div>

<!-- 新增属性按钮 -->
<div id="addAttrBt">
	<a href="#" onclick="closeModelAttr()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">关闭</a>
	<a href="#" onclick="saveModelAttr()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">保存</a>
	<a href="#" onclick="saveAndCloseModelAttr()" class="easyui-linkbutton" data-options="iconCls:'icon-help'">保存并关闭</a>
</div>

<!-- 编辑属性弹出框 -->
<div id="updateAttrDialog" class="easyui-dialog" 
			data-options="title: '新增模型属性',top:20,width: 600, height: 400,
			maximizable:true,closed: false, modal: true,
			buttons:'#updateAttrBt',closed:true">   
	
</div>

<!-- 编辑属性按钮 -->
<div id="updateAttrBt">
	<a href="#" onclick="closeUpdateModelAttr()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">关闭</a>
	<a href="#" onclick="updateModelAttr()" class="easyui-linkbutton" data-options="iconCls:'icon-help'">更新</a>
</div>


<!-- 新增维度弹出框 -->
<div id="addLatDialog" class="easyui-dialog" 
			data-options="title: '新增模型维度',top:20,width: 600, height: 400,
			maximizable:true,closed: false, modal: true,
			buttons:'#addLatBt',closed:true">   
	
</div>

<!-- 新增维度按钮 -->
<div id="addLatBt">
	<a href="#" onclick="closeModelLat()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">关闭</a>
	<a href="#" onclick="saveModelLat()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">保存</a>
	<a href="#" onclick="saveAndCloseModelLat()" class="easyui-linkbutton" data-options="iconCls:'icon-help'">保存并关闭</a>
</div>


<!-- 编辑维度弹出框 -->
<div id="updateLatDialog" class="easyui-dialog" 
			data-options="title: '编辑模型维度',top:20,width: 600, height: 400,
			maximizable:true,closed: false, modal: true,
			buttons:'#updateLatBt',closed:true">   
	
	<div id="update_lat_top">
		
	</div>
</div>

<!-- 编辑维度按钮 -->
<div id="updateLatBt">
	<a href="#" onclick="closeUpdateModelLat()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">关闭</a>
	<a href="#" onclick="updateModelLat()" class="easyui-linkbutton" data-options="iconCls:'icon-help'">完成</a>
	<a href="#" onclick="updateLatNextStep()" class="easyui-linkbutton" data-options="iconCls:'icon-help'">下一步</a>
</div>
