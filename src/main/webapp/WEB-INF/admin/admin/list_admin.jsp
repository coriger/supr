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

<script type="text/javascript">
	
</script>

</head>

<body>

<div id="admin_usermanage_layout" class="easyui-layout" data-options="fit:true, border:false" >
	<div data-options="region:'north', border:false">
		用户名：<input type="text" name="username" />
		状态：<select>
				<option>可用</option>
				<option>不可用</option>
			</select>
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search', plain:true" onclick="searchUser()">搜索</a>
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel', plain:true" onclick="clearParam()">清空</a>
	</div>
	<div data-options="region:'center', border:false">
		<table id="tt" class="easyui-datagrid" style="" url="" toolbar="#tb" 
			iconCls="icon-save" rownumbers="true" pagination="true">
		<thead>
			<tr>
				<th field="用户Id">用户Id</th>
				<th field="用户名">用户名</th>
				<th field="密码">密码</th>
				<th field="是否可用">是否可用</th>
				<th field="邮箱">邮箱</th>
			</tr>
		</thead>
		
		<thead>
			<c:forEach items="${adminList}" var="admin">
				<tr>
					<th style="width: 80px">${admin.userId}</th>
					<th style="width: 80px">${admin.username}</th>
					<th style="width: 80px">${admin.password}</th>
					<th style="width: 80px">${admin.isEnabled}</th>
					<th style="width: 80px">${admin.email}</th>
				</tr>
			</c:forEach>
		</thead>
	</table>
	</div>
</div>
		
</body>

</html>