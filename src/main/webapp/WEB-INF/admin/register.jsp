<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>注册页面</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
  	<!-- 页面每次提交时 都要校验输入框架值 读取每个标签的regx和它们的值 校验是否匹配 -->
  	<form id="form" action="" method="post">
  		用户名：<input type="text" name="username"></br>
  		密码：<input type="password" name="password"></br>
  		<input type="button" value="注册">
  		<input type="reset" value="重置">
  	</form>
  </body>
</html>
