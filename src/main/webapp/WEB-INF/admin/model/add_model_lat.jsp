<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<script type="text/javascript">
		function addDataUnit(){
			console.info("新增数据单元...");
		}
		
		function getAlgorithm(value){
			if(value == '-1'){
				$("#algorithm_div").empty();
				return;
			}
			
			// 获取对应算法入参属性
			$.ajax({
				url : './model/getAlgorithmInfo?data='+Math.random(),
				data: $("#add_model_lat_form").serialize(),
				method : "post",
				success : function(data) {
					// 先清空 再赋值
					$("#algorithm_div").empty();
					$("#algorithm_div").html(data);
				}
			});
			
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
			height: auto;
		}
		
		.div2{
			margin-left: 14px;
			margin-top: 10px;
		}
		
		.div1 tr{
			font-size: 13px;
			margin-left:auto;
			margin-right:auto;
		}
		
		.div2 td{
			padding-left: 20px;
		}
		
		.div2 input{
			width: 160px;
		}
	</style>

	<div id="add_model_step1" class="div1">
			<div class="div2">
				<form id="add_model_lat_form" method="post">
					<table>
						<input type="hidden" id="rmId" name="rmId" value="${model.id}"/>
						<tr>
							<td>所属模型：</td>
							<td>${model.rmName}</td>
							<td>维度名称：</td>
							<td><input type="text" id="rmdName" name="rmdName"/></td>
						</tr>
						
						<tr>
							<td>维度完整Key：</td>
							<td><input type="text" id="rmdFullKey" name="rmdFullKey"/></td>
							<td>维度算法：</td>
							<td>
								<select id="daId" name="daId" class="easyui-combobox" panelHeight="auto" style="width:160px" 
									data-options="onChange:function(newValue, oldValue)
															{
																getAlgorithm(newValue);
															}">
									<option value="-1">选择维度算法</option>
									<c:forEach items="${algorithmList}" var="algorithm">
										<option value="${algorithm.id}">${algorithm.daName}</option>
									</c:forEach>
								</select>
							</td>
						</tr>	
						
						<%--<tr>
							<td>描述：</td>
							<td colspan="3"><textarea rows="3" cols="10" style="resize: none;" id="description" name="description"></textarea></td>
						</tr>
					--%></table>	
				</form>
			</div>
		
		<div style="margin-left: 37px;margin-bottom: 10px">
			<td>描述：</td>
			<td><textarea rows="5" cols="68" style="resize: none;" id="description" name="description"></textarea></td>
		</div>
						
	</div>
	
	<!-- 维度算法明细 -->
	<div id="algorithm_div">
						
	</div>
