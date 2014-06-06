<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<style type="text/css">
		.div1{
			border: 1px;
			border-color: ccc;	
			border-style: solid;
			height: auto;
		}
		.div2 {
		}
		
		.div2 tr {
			font-size: 13px;
		}
		
		.div2 input{
		}
		
		.table1{
			/**text-align: center;**/
			margin-left: 60px;
			margin-bottom: 12px;
		}
		
		.table1 input{
			width: 80px;
		}
		
		.demo_line_02{height: 1px;border-top: 1px solid #ddd;padding-bottom: 8px;}
		
	</style>
	
	<div id="add_model_step1" class="div1">
		<form id="add_model_lat_alg_form" method="post">
			<div class="div2">
				<table class=".table1">
					<tbody>
						<c:forEach items="${algorithmProvideList}" var="pro">
								<tr>
									<td>算法属性名称：${pro.dappName}</td>
									<td>数据类型：${pro.dtName}</td>
									<td></td>
								</tr>
								<tr>
									<td>算法属性别名：<input type="text"/></td>
									<td>数据单元：
										<select id="rmduId" name="rmduId" class="easyui-combobox" panelHeight="auto">
											<option value="-1">全部</option>
											<c:forEach items="${dataUnitList}" var="unit">
												<option value="${unit.id}">${unit.rmduName}</option>
											</c:forEach>
										</select>
									</td>
									<td>横表列名：
										<select class="easyui-combobox" panelHeight="auto">
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
								<td class="demo_line_02"></td>
								<td class="demo_line_02"></td>
								<td class="demo_line_02"></td>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</form>
	</div>
