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
			height: 260px;
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
			width: 80px;
		}
		
		.table1{
			/**text-align: center;**/
			margin-left: 60px;
			margin-bottom: 12px;
		}
		
		.table1 td{
			/**text-align: center;**/
			padding-left: 30px;
		}
		
		.demo_line_02{height: 1px;border-top: 1px solid #ddd;margin-left: 10px;margin-right: 10px,margin-top:4px;margin-bottom: 4px;}
		
	</style>
	
	<div id="add_model_step1" class="div1">
		<form id="form" method="post">
			<div class="div2">
				<table class="table1">
					<tbody>
						<tr>
							<td>所属模型：${model.rmName}</td>
							<td>所属维度：${modelLat.rmdName}</td>
						</tr>
						<tr>
							<td>维度算法：${modelLat.daName}</td>
							<td>维度算法Key：${modelLat.daKey}</td>
						</tr>
					</table>	
				</table>
				
				<table>
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
