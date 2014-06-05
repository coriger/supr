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
	// 列表宽度百分比设置
	function fixWidth(percent){
		return document.body.clientWidth * percent ;
	}
	
	// 新增模型维度
	function addModelLat(){
		console.info("新增模型维度..");
		// 父窗口弹一个新框
		window.parent.addModelLat($("#modelId").val());
	}
	
	// 编辑模型维度
	function editModelLat(){
		console.info("编辑模型维度..");
		// 父窗口弹一个新框
		var rows = $("#main").datagrid('getSelections');
		window.parent.editModelLat(rows[0].id);
	}
	
	// 删除模型维度
	function delModelLat(){
		console.info("删除模型维度..");
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
						url:'./model/deleteLatBatch',
						data:'modelLatIds='+ids,
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
	
</script>

<style type="text/css">
	.div1{
		list-style: none;
	}
</style>

<table id="main" class="easyui-datagrid" 
			data-options="fit : true,border:false,rownumbers:false,fitColumns : true,
			url:'./model/list_lat?modelId='+${model.id},pagination : false,pageSize:2, pageList:[2,4,6,8],
			loadMsg:'正在加载中, 请稍候 …',toolbar:'#searchBut'"> 
			<input type="hidden" id="modelId" value="${model.id}"/>
	<thead>  
           <tr>  
           	   <th data-options="field:'ck',checkbox:true"></th>
               <th data-options="field:'id',width:fixWidth(0.157),align:'center'">维度Id</th>  
               <th data-options="field:'rmName',width:fixWidth(0.167),align:'center'">所属模型</th>  
               <th data-options="field:'rmdName',width:fixWidth(0.167),align:'center'">维度名称</th>  
               <th data-options="field:'daName',width:fixWidth(0.167),align:'center'">维度算法</th>
               <th data-options="field:'rmdFullKey',width:fixWidth(0.177),align:'center'">模型维度完整Key</th>       
               <th data-options="field:'description',width:fixWidth(0.167),align:'center'">简介</th>       
           </tr>  
   </thead>  
</table>

<div id="searchBut" style="padding:5px;height:auto">
        <div style="margin-bottom:5px">
            <a href="#" onclick="addModelLat()" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>
            <a href="#" onclick="editModelLat()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">编辑</a>
            <a href=# onclick="delModelLat()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
        </div>
        
        <div class="div1">
	           	<ul>
	           		<li>所属行业：${model.rtName}</li>
					<li>模型名称：${model.rmName}</li>
	           	</ul>
        </div>
</div>
