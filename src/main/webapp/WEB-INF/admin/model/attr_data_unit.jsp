<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${modelDataUnit}" var="dataUnit">
	<option value="${dataUnit.id}">${dataUnit.rmduName}</option>
</c:forEach>