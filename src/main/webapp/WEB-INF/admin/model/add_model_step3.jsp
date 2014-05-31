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
               <th data-options="field:'desc',width:fixWidth(0.2),align:'center'">简介</th>       
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