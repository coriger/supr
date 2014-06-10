<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	// 列表宽度百分比设置
	function fixWidth(percent){
		return document.body.clientWidth * percent ;
	}
	
	// 新增模型属性
	function addModelAttr(modelId){
		$("#addAttrDialog").dialog('open');
		attrFormInit(modelId);
	}
	
	// 初始化新增模型属性表单
	function attrFormInit(modelId){
		// 跳转新增属性页面
		$("#addAttrDialog").dialog('refresh', './model/forward/add/attr?modelId='+modelId);		
	}
	
	// 保存并关闭
	function saveAndCloseModelAttr(){
		console.info("保存并关闭");
	}
	
	// 保存模型属性
	function saveModelAttr(){
		console.info("保存模型属性");
	}
	
	// 关闭模型属性
	function closeModelAttr(){
		console.info("关闭模型属性");
	}
	
	
	// 编辑模型属性
	function editModelAttr(){
		console.info("编辑模型..");
		// 父窗口弹一个新框
		var rows = $("#main").datagrid('getSelections');
		if(rows.length == 0){
			window.parent.showMsg("请选择需要编辑的数据!");
			return;
		}
		window.parent.editModelAttr(rows[0].id);
	}
	
	// 删除模型属性
	function delModelAttr(){
		console.info("删除模型..");
		var rows = $("#main").datagrid('getSelections');
		if(rows.length >0){
			$.messager.confirm('确认提示！','您确定要删除选中的所有行？',function(r){
				if (r){
					var ids = "";
					for(var i=0;i<rows.length;i++){
						ids += rows[i].id + ","; 
					}
					console.info(ids);
					$.ajax({
						url:'./model/deleteAttrBatch',
						data:'modelAttrIds='+ids,
						method : "post",
						dataType : "json",
						success:function(data){
							if (data.resultCode=='success'){
								$("#main").datagrid('load');
								showMsg(data.errorInfo);//操作结果提示
							} else {
								showMsg(data.errorInfo);//操作结果提示
							}
						}
					})
				}
			});
		}else{
			showMsg("请选择要操作的对象！");
		}
		
	}
	
</script>

<style type="text/css">

</style>

<table id="step2_main" class="easyui-datagrid" 
			data-options="fit : true,border:false,rownumbers:false,fitColumns : true,
			url:'./model/list_attr?modelId='+${model.id},pagination : false,
			loadMsg:'正在加载中, 请稍候 …',toolbar:'#step2_searchBut'"> 
			<input type="hidden" id="modelId" value="${model.id}"/>
	<thead>  
           <tr>  
           	   <th data-options="field:'ck',checkbox:true"></th>
               <th data-options="field:'id',width:fixWidth(0.167),align:'center'">属性Id</th>  
               <th data-options="field:'rmName',width:fixWidth(0.167),align:'center'">所属模型</th>  
               <th data-options="field:'rmpName',width:fixWidth(0.167),align:'center'">属性名称</th>  
               <th data-options="field:'rmpKey',width:fixWidth(0.167),align:'center'">属性key</th>
               <th data-options="field:'dtName',width:fixWidth(0.167),align:'center'">数据单元</th>       
               <th data-options="field:'description',width:fixWidth(0.167),align:'center'">简介</th>       
           </tr>  
   </thead>  
</table>

<div id="step2_searchBut" style="padding:5px;height:auto">
        <div style="margin-bottom:5px">
            <a href="#" onclick="addModelAttr(${model.id})" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>
            <a href="#" onclick="editModelAttr()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">编辑</a>
            <a href=# onclick="delModelAttr()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
        </div>
        
        <div>
	           	<ul>
	           		<li>所属行业：${model.rtName}</li>
					<li>模型名称：${model.rmName}</li>
	           	</ul>
        </div>
</div>


<!-- 新增属性弹出框 -->
<div id="addAttrDialog" class="easyui-dialog" 
			data-options="title: '新增模型属性',top:20,width: 600, height: 400,
			maximizable:false,closed: true, modal: true,
			buttons:'#addAttrBt'">   
	
</div>

<!-- 新增属性按钮 -->
<div id="addAttrBt">
	<a href="#" onclick="closeModelAttr()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">关闭</a>
	<a href="#" onclick="saveModelAttr()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">保存</a>
	<a href="#" onclick="saveAndCloseModelAttr()" class="easyui-linkbutton" data-options="iconCls:'icon-help'">保存并关闭</a>
</div>
