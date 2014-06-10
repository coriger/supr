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
	<div id="div1" class="div1">
	<form id="modleDUForm" method="post">
		<div class="div2">
			<table>
				<tbody>
					<tr>
						<td>所属模型：</td>
						<td>${model.id}</td>
						<input type="hidden" name="rmId" value="${model.id}"/>
						<td>数据模型：</td>
						<td><select id="dtId" name="dtId" class="easyui-combobox" style="width: 120px"
							panelHeight="auto">
								<option value="-1">全部</option>
								<c:forEach items="${dataTypeList}" var="dateType">
									<option value="${dateType.id}">${dateType.dtName}</option>
								</c:forEach>
						</select></td>
					</tr>
					<tr>
						<td>单元名称：</td>
						<td><input type="text" id="rmduName" name="rmduName" /></td>
						<td>使用类型：</td>
						<td>
							<select id="useType" name="useType" class="easyui-combobox" panelHeight="auto" style="width:120px">
									<option value="-1">全部</option>
									<option value="1">属性</option>
									<option value="2">维度属性</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>最大值：</td>
						<td><input type="text" id="maxValue" name="maxValue" /></td>
						<td>最小值：</td>
						<td><input type="text" id="minValue" name="minValue" /></td>
					</tr>
					<tr>
						<td>步长：</td>
						<td><input type="text" id="stepValue" name="stepValue" /></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>默认值1：</td>
						<td><input type="text" id="defaultValue1" name="defaultValue1" /></td>
						<td>默认值2：</td>
						<td><input type="text" id="defaultValue2" name="defaultValue2" /></td>
					</tr>
					<tr>
						<td>默认值3：</td>
						<td><input type="text" id="defaultValue3" name="defaultValue3" /></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td colspan="2">数据单元描述：</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td colspan="4"><textarea rows="5" cols="60" style="resize: none;"
								id="description" name="description"></textarea></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	</form>
