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
	
</script>

<style type="text/css">
	.div1{
		list-style: none;
	}
</style>

<table id="main" class="easyui-datagrid" 
			data-options="fit : true,border:false,rownumbers:false,fitColumns : true,
			url:'./model/list_attr',pagination : true,pageSize:2, pageList:[2,4,6,8],
			loadMsg:'正在加载中, 请稍候 …',toolbar:'#searchBut'"> 
	<thead>  
           <tr>  
           	   <th data-options="field:'ck',checkbox:true"></th>
               <th data-options="field:'id',width:fixWidth(0.167),align:'center'">属性Id</th>  
               <th data-options="field:'rmName',width:fixWidth(0.167),align:'center'">所属模型</th>  
               <th data-options="field:'rmpName',width:fixWidth(0.167),align:'center'">属性名称</th>  
               <th data-options="field:'rmpKey',width:fixWidth(0.167),align:'center'">属性key</th>
               <th data-options="field:'dtName',width:fixWidth(0.167),align:'center'">数据单元</th>       
               <th data-options="field:'desc',width:fixWidth(0.167),align:'center'">简介</th>       
           </tr>  
   </thead>  
</table>

<div id="searchBut" style="padding:5px;height:auto">
        <div style="margin-bottom:5px">
            <a href="#" onclick="addModel()" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>
            <a href="#" onclick="editModel()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">编辑</a>
            <a href=# onclick="delModel()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
        </div>
        
        <div class="div1">
	           	<ul>
	           		<li>所属行业：饮食行业</li>
					<li>模型名称：餐厅包房</li>
	           	</ul>
        </div>
</div>