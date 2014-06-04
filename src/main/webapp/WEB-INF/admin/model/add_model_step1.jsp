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
			height: 268px;
		}
		
		.div2{
			margin-left: 14px;
			margin-top: 10px;
		}
		
		.div2 tr{
			font-size: 13px;
		}
		
		.div2 td{
		}
	</style>

	<div id="add_model_step1" class="div1">
		<form id="form" method="post">
			<div class="div2">
					<table>
						<tbody>
						<tr>
							<td>所属行业：</td>
							<td>
								<select id="tId" name="tId" class="easyui-combobox" panelHeight="auto">
									<option value="-1">全部</option>
									<c:forEach items="${tradeList}" var="trade">
										<option value="${trade.id}">${trade.rtName}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						
						<tr>
							<td>模型名称：</td>
							<td>
								<input type="text" id="rmName" name="rmName"/>
							</td>
						</tr>
						
						<tr>
							<td>模型Key：</td>
							<td>
								<input type="text" id="rmKey" name="rmKey"/>
							</td>
						</tr>	
						
						<tr>
							<td>模型描述：</td>
							<td>
								<textarea rows="10" cols="60" style="resize: none;" id="description" name="description"></textarea>
							</td>
						</tr>
						</tbody>	
					</table>	
			</div>
		</form>
	</div>