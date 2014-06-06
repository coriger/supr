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
		$("#addDialog").dialog('open');
		formInit();
	}
	
	// 初始化新增模型表单
	function formInit(){
		console.info("初始化表单...");
		$("#addDialog").dialog('refresh', './modelDataUnit/addModelDataUnit');	
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
		$("#rmId").combobox('select','-1');
		$("#dtId").combobox('select','-1');
		$("#useType").combobox('select','-1');
		$("#rmduName").val("");
	}
	
	// 保存模型
	function saveModel(){
		console.info("保存模型数据单元...");
		$.ajax({
			url : './model/add/info?data='+Math.random(),
			data: $("#modleDUForm").serialize(),
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
		// 关闭dialog
		$("#addDialog").dialog('close');
		// 刷新模型列表
		$("#main").datagrid('load');
	}
	
	//取消按钮
	function closeWin(){
		// 关闭dialog
		$("#addDialog").dialog('close');
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
	//转换列表中的使用类型
	function useTypeTrans(value,rowData,rowIndex) {  
        if (rowData["useType"] == "1")  
            return "属性";  
        else if (rowData["useType"] == "2")  
            return "维度属性";  
        else  
            return "未知";  
    } 
</script>

</head>

<table id="main" class="easyui-datagrid" 
			data-options="fit : true,border:false,rownumbers:true,fitColumns : true,
			url:'./modelDataUnit/list_modelDataUnit',pagination : true,pageSize:2, pageList:[2,4,6,8],
			loadMsg:'正在加载中, 请稍候 …',toolbar:'#searchBut'"> 
	<thead>  
           <tr>  
           	   <th data-options="field:'ck',checkbox:true"></th>
               <th data-options="field:'id',width:fixWidth(0.1),align:'center'">ID</th>  
               <th data-options="field:'rmduName',width:fixWidth(0.2),align:'center'">数据单元名称</th>  
               <th data-options="field:'dtName',width:fixWidth(0.1),align:'center'">数据类型</th>  
               <th data-options="field:'rmName',width:fixWidth(0.2),align:'center'">所属模型</th>
               <th data-options="field:'useType',width:fixWidth(0.2),align:'center'" formatter="useTypeTrans">使用类型</th>
               <!-- <th data-options="field:'useType',width:fixWidth(0.2),align:'center'">使用类型</th>   -->
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
	           	 所属模型：
	            <select id="rmId" name="rmId" class="easyui-combobox" panelHeight="auto" style="width:100px">
									<option value="-1">全部</option>
									<c:forEach items="${modelList}" var="model">
										<option value="${model.id}">${model.rmName}</option>
									</c:forEach>
				</select>
				 数据类型：
	            <select id="dtId" name="dtId" class="easyui-combobox" panelHeight="auto" style="width:100px">
									<option value="-1">全部</option>
									<c:forEach items="${dataTypeList}" var="dateType">
										<option value="${dateType.id}">${dateType.dtName}</option>
									</c:forEach>
				</select>	
				 使用类型：
	            <select id="useType" name="useType" class="easyui-combobox" panelHeight="auto" style="width:100px">
									<option value="-1">全部</option>
									<option value="1">属性</option>
									<option value="2">维度属性</option>
				</select>		
				名称：<input type="text" id="rmduName" name="rmduName" placeholder="请输入名称..."/>
	            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="searchModel()">查询</a>
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="clearAll()">重置</a>
        	</form>
        </div>
</div>

<!-- 新增弹出框 -->
<div id="addDialog" class="easyui-dialog" 
			data-options="title: '新增模型数据单元',top:20,width: 530, height: 400,
			maximizable:true,closed: false, modal: true,
			buttons:'#addBt',closed:true">
</div>

<!-- 新增模型数据单元dialog按钮 -->
<div id="addBt">
	<a href="#" onclick="saveModel()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">保存</a>
	<a href="#" onclick="closeWin()" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">取消</a>
</div>
