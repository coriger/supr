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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/supr.js"></script>
  </head>
  
  <body>
  	<div class="container">
      <form class="form-signin" role="form" id="form" action="register" method="post" onsubmit="checkRegister()">
        <h2 class="form-signin-heading">用户注册</h2>
        用户名：<input type="text" name="username" class="form-control" placeholder="请输入用户名" required autofocus>
        密码：<input type="password" name="password" class="form-control" placeholder="请输入密码" required>
        邮箱：<input type="text" name="email" class="form-control" placeholder="请输入邮箱" required>
        <button class="btn btn-lg btn-primary btn-block" type="submit">注册</button>
        <button class="btn btn-lg btn-primary btn-block" type="reset">重置</button>
      </form>
    </div>
  </body>
</html>
