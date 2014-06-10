<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<script type="text/javascript">
		// 跳转新增数据单元页面
		function addDataUnit(){
			console.info("跳转新增数据单元页面...");
			$("#addDataUnitDialog").dialog('open');
			$("#addDataUnitDialog").dialog('refresh', './model/forward/addDataUnit?modelId='+$("#rmId").val());	
		}
		
		function defautSelect(){
			var data = $('#rmduId').combobox("getData");
			console.info(data);
		   	if (data) {
		    	$('#rmduId').combobox('setValue',data[0].rmduName);
		    }
		}
		
		// 保存数据单元
		function saveDataUnit(){
			console.info("新增数据单元...");
			$.ajax({
				url : './modelDataUnit/add/info?data='+Math.random(),
				data: $("#modleDUForm").serialize(),
				method : "post",
				dataType : "json",
				success : function(data) {
					if (data.resultCode == 'error') {
						showMsg(data.errorInfo);
						return;
					} else if (data.resultCode == 'success') {
						// 弹出新增成功消息框 
						showMsg(data.errorInfo);
						// 关闭dialog
						$("#addDataUnitDialog").dialog('close');
						// 刷新数据单元列表
						$("#rmduId").combobox('reload');
						
						var data = $('#rmduId').combobox('getData');
						if (data.length > 0) {
			                $('#rmduId').combobox('select', data[0].id);
			            }
					}
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
			height: 290px;
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
		<form id="form" method="post">
			<div class="div2">
					<table>
						<tbody>
						<input type="hidden" id="rmId" name="rmId" value="${model.id}"/>
						<tr>
							<td>所属模型：</td>
							<td>
								${model.rmName}
							</td>
						</tr>
						
						<tr>
							<td>属性名称：</td>
							<td>
								<input type="text" id="rmpName" name="rmpName"/>
							</td>
						</tr>
						
						<tr>
							<td>属性Key：</td>
							<td>
								<input type="text" id="rmpKey" name="rmpKey"/>
							</td>
						</tr>	
						
						<tr>
							<td>属性完整Key：</td>
							<td>
								<input type="text" id="rmpFullKey" name="rmpFullKey"/>
							</td>
						</tr>	
						
						<tr>
							<td>数据单元：</td>
							<td>
								<select id="rmduId" name="rmduId" class="easyui-combobox" panelHeight="auto" style="width:100px" 
									data-options="valueField:'id',textField:'rmduName', url:'./model/getDataUnitByModelId?modelId=${model.id}',onLoadSuccess:function(){defautSelect()}">
								
								</select>
								<input type="button" value="数据单元管理" onclick="addDataUnit()"/>
							</td>
						</tr>
						
						<tr>
							<td>描述：</td>
							<td>
								<textarea rows="6" cols="60" style="resize: none;" id="description" name="description"></textarea>
							</td>
						</tr>
						</tbody>	
					</table>	
			</div>
		</form>
</div>

<!-- 新增数据单元弹出框 -->
<div id="addDataUnitDialog" class="easyui-dialog" 
			data-options="title: '新增模型数据单元',top:20,width: 600, height: 400,
			maximizable:true,modal: true,
			buttons:'#addDataUnitBt',closed:true">
</div>

<!-- 新增模型数据单元dialog按钮 -->
<div id="addDataUnitBt">
	<a href="#" onclick="saveDataUnit()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">保存</a>
	<a href="#" onclick="closeWin()" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">取消</a>
</div>