<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<style type="text/css">
		.div1{
			border: 1px;
			border-color: ccc;	
			border-style: solid;
			margin-left: 20px;
			margin-right: 20px;
			margin-top:20px;
			height: 300px;
		}
		.div2 {
			margin-left: 14px;
			margin-top: 10px;
		}
		
		.div2 tr {
			font-size: 13px;
		}
		
		.div2 td {
			
		}
		.div2 input{
			width: 120px;
		}
	</style>
	<div id="add_model_step1" class="div1">
	<form id="form" method="post">
		<div class="div2">
			<table>
				<tbody>
					<tr>
						<td>所属模型：</td>
						<td>${model.rmName}</td>
						<td>所属维度：</td>
						<td>${modelLat.rmdName}</td>
					</tr>
					<tr>
						<td>维度算法：</td>
						<td>${modelLat.daName}</td>
						<td>维度算法Key：</td>
						<td>${modelLat.daKey}</td>
					</tr>
					
					<c:forEach items="${algorithmProvideList}" var="pro">
							<tr>
								<td>维度算法属性名称：</td>
								<td>${pro.dappName}</td>
								<td>数据类型：</td>
								<td>${pro.dtName}</td>
							</tr>
							<tr>
								<td>资源维度属性名称：</td>
								<td><input type="text"/></td>
								<td>数据单元：</td>
								<td>
									<select>
										<option value="-1">全部</option>
									</select>
								</td>
								<td>横表列名：</td>
								<td>
									<select>
										<option value="-1">选择列</option>
										<option value="-1">iValue1</option>
										<option value="-1">iValue2</option>
										<option value="-1">dValue1</option>
										<option value="-1">dValue2</option>
										<option value="-1">sValue1</option>
										<option value="-1">sValue2</option>
									</select>
								</td>
							</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	</form>
