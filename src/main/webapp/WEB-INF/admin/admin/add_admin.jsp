<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div>
	<form id="admin_form" method="post">
		<div>
            <label>用户名:</label>
	            <input name="username" value="${admin.username}" type="text">
        </div>
        <div>
            <label>密码:</label>
            <input name="password" value="${admin.password}" type="password">
        </div>
        <div>
            <label>邮箱:</label>
            <input name="email" value="${admin.email}"  type="text">
        </div>
        
        <input type="hidden" name="userId" value="${admin.userId}">
	</form>
</div>