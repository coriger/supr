<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
	$().ready(function(){
		// 初始化登录框
		$('#login').window({    
		    width:250,    
		    height:150,    
		    modal:true,
		    collapsible:false,
		    minimizable:false,
		    maximizable:false,
		    closable:false,
		    title:'用户登录',
		    draggable:false,
		    resizable:false
		});  
	})
	
	// 登录
	function login(){
		$.ajax({
			url : "./login/submit/",
			data: $("#form").serialize(),
			method : "post",
			dataType : "json",
			success : function(data) {
				if (data.resultCode == 'error') {
					alert(data.errorInfo);
				} else if (data.resultCode == 'success') {
					$("#form").attr("action","./home");
					$("#form").submit();
				}
			}
		})
	}
	
	// 注册
	function register(){
		
	}
</script>

</head>

<body>
		<div id="login">
			<form id="form" action="login/submit" method="post">
				用户名：<input type="text" name="username" value="admin"/></br>
				密码：<input type="password" name="password" value="123456"/></br>
				<input type="button" value="登录" onclick="login();"/>
				<input type="button" value="注册" onclick="register();"/>
			</form>
		</div>  
</body>

</html>