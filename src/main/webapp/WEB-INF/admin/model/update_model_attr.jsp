<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<script type="text/javascript">
		function addDataUnit(){
			console.info("新增数据单元...");
			
		}
	</script>

	<style type="text/css">
		.div1{
			border: 1px;
			border-color: ccc;	
			border-style: solid;
			margin-left: 20px;
			margin-right: 20px;
			margin-top:20px;
			height: 298px;
		}
		
		.div2{
			margin-left: 14px;
			margin-top: 10px;
		}
		
		.div2 tr{
			font-size: 13px;
		}
		
		.div2 td{
			width:220px;
		}
	</style>

	<div id="add_model_step1" class="div1">
		<form id="updateAttrForm" method="post">
			<div class="div2">
					<table>
						<tbody>
						<input type="hidden" id="Id" name="Id" value="${modelAttr.id}"/>
						<tr>
							<td>所属模型：</td>
							<td>
								${modelAttr.rmName}
							</td>
						</tr>
						
						<tr>
							<td>属性名称：</td>
							<td>
								<input type="text" id="rmpName" name="rmpName" value="${modelAttr.rmpName}"/>
							</td>
						</tr>
						
						<tr>
							<td>属性Key：</td>
							<td>
								<input type="text" id="rmpKey" name="rmpKey" value="${modelAttr.rmpKey}"/>
							</td>
						</tr>	
						
						<tr>
							<td>属性完整Key：</td>
							<td>
								<input type="text" id="rmpFullKey" name="rmpFullKey" value="${modelAttr.rmpFullKey}"/>
							</td>
						</tr>	
						
						<tr>
							<td>数据单元：</td>
							<td>
								<select id="rmduId" name="rmduId" class="easyui-combobox" panelHeight="auto">
									<option value="1">选择数据单元</option>
									<c:forEach items="${dataUnitList}" var="unit">
										<option value="${unit.id}">${unit.rmduName}</option>
									</c:forEach>
								</select>
								<input type="button" value="数据单元管理" onclick="addDataUnit()"/>
							</td>
						</tr>
						
						<tr>
							<td>描述：</td>
							<td>
								<textarea rows="8" cols="60" style="resize: none;" id="description" name="description"> ${modelAttr.description}</textarea>
							</td>
						</tr>
						</tbody>	
					</table>	
			</div>
		</form>
	</div>
