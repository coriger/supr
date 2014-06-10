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
		<input type="hidden" id="id" name="id" value="${mdu.id}" >
		<div class="div2">
			<table>
				<tbody>
					<tr>
						<td>所属模型：</td>
						<td><select id="rmId" name="rmId" class="easyui-combobox" style="width: 120px" 
							panelHeight="150px" value="2" >
								<option value="-1">全部</option>
								<c:forEach items="${modelList}" var="model">
									<c:if test="${model.rmName==mdu.rmName}">
										<option value="${model.id}" selected="selected">${model.rmName}</option>
								   	</c:if>  
								   	<c:if test="${model.rmName!=mdu.rmName}">
										<option value="${model.id}">${model.rmName}</option>
								   	</c:if>
								</c:forEach>
						</select></td>
						<td>数据模型：</td>
						<td><select id="dtId" name="dtId" class="easyui-validatebox combobox" style="width: 120px"
							panelHeight="150px">
								<option value="-1">全部</option>
								<c:forEach items="${dataTypeList}" var="dateType">
									<c:if test="${dateType.dtName==mdu.dtName}">
										<option value="${dateType.id}" selected="selected">${dateType.dtName}</option>
								   	</c:if>  
								   	<c:if test="${dateType.dtName!=mdu.dtName}">
										<option value="${dateType.id}">${dateType.dtName}</option>
								   	</c:if>
								</c:forEach>
						</select></td>
					</tr>
					<tr>
						<td>单元名称：</td>
						<td><input type="text" id="rmduName" name="rmduName" value="${mdu.rmduName}" class="easyui-validatebox textbox" data-options="required:true,validType:'length[1,25]',missingMessage:'请输入数据单元名称'"/></td>
						<td>使用类型：</td>
						<td>
							<select id="useType" name="useType" class="easyui-combobox" panelHeight="auto" style="width:120px">
									<option value="-1">全部</option>
									<option value="1">属性</option>
									<option value="2">维度属性</option>
									
									<c:if test="${mdu.useType=='1'}">
										<option value="1" selected="selected">属性</option>
								   	</c:if>  
								   	<c:if test="${mdu.useType=='2'}">
										<option value="2"  selected="selected">维度属性</option>
								   	</c:if>
							</select>
						</td>
					</tr>
					<tr>
						<td>最大值：</td>
						<td><input type="text" id="maxValue" name="maxValues" value="${mdu.maxValues}" /></td>
						<td>最小值：</td>
						<td><input type="text" id="minValue" name="minValue" value="${mdu.minValue}" /></td>
					</tr>
					<tr>
						<td>步长：</td>
						<td><input type="text" id="stepValue" name="stepValue" value="${mdu.stepValue}" /></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>默认值1：</td>
						<td><input type="text" id="defaultValue1" name="defaultValue1" value="${mdu.defaultValue1}" /></td>
						<td>默认值2：</td>
						<td><input type="text" id="defaultValue2" name="defaultValue2" value="${mdu.defaultValue2}" /></td>
					</tr>
					<tr>
						<td>默认值3：</td>
						<td><input type="text" id="defaultValue3" name="defaultValue3" value="${mdu.defaultValue2}" /></td>
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
								id="description" name="description" >${mdu.description}</textarea></td>
					</tr>
				</tbody>
			</table>
		</div>
		</form>
	</div>
