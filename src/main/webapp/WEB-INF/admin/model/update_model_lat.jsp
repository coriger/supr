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
			height: 265px;
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
		<form id="updateLatForm" method="post">
			<div class="div2">
					<table>
						<tbody>
						<input type="hidden" id="latId" name="latId" value="${modelLat.id}"/>
						<input type="hidden" id="Id" name="Id" value="${modelLat.id}"/>
						<tr>
							<td>所属模型：</td>
							<td>
								${model.rmName}
							</td>
						</tr>
						
						<tr>
							<td>维度名称：</td>
							<td>
								<input type="text" id="rmdName" name="rmdName" value="${modelLat.rmdName}"/>
							</td>
						</tr>
						
						<tr>
							<td>维度完整Key：</td>
							<td>
								<input type="text" id="rmdFullKey" name="rmdFullKey" value="${modelLat.rmdFullKey}"/>
							</td>
						</tr>	
						
						<tr>
							<td>维度算法单元：</td>
							<td>
								<select id="daId" name="daId" class="easyui-combobox" panelHeight="auto">
									<option value="-1">选择维度算法</option>
									<c:forEach items="${algorithmList}" var="algorithm">
											<option value="${algorithm.id}"
												<c:if test="${algorithm.id == modelLat.daId}">
													selected
												</c:if>
											>${algorithm.daName}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						
						<tr>
							<td>描述：</td>
							<td>
								<textarea rows="7" cols="60" style="resize: none;" id="description" name="description">${modelLat.description}</textarea>
							</td>
						</tr>
						</tbody>	
					</table>	
			</div>
		</form>
	</div>
