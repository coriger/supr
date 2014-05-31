<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="<%=basePath%>js/easyui/themes/icon.css" type="text/css"></link>
<link rel="stylesheet" href="<%=basePath%>js/easyui/themes/default/easyui.css" type="text/css"></link>
<script type="text/javascript" src="<%=basePath%>js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/easyui/locale/easyui-lang-zh_CN.js"></script>

<script type="text/javascript">
	
	//列表宽度百分比设置
	function fixWidth(percent){
		return document.body.clientWidth * percent ;
	}
	
	// 新增模型
	function addModel(){
		console.info("addModel...");
		// 先删掉所有tab
		$("#add_model_top li").each(function (i, n) {
            var title = $(n).text();
            $('#add_model_top').tabs('close',title);
        });
		
		$("#addDialog").dialog('open');
		formInit();
	}
	
	// 初始化新增模型表单
	function formInit(){
		console.info("初始化表单...");
		// 初始化三个tab  第一步、第二步、第三步
		$('#add_model_top').tabs({
			border:false,
		    fit:true,
		});
		
		$('#add_model_top').tabs('add',{
			title:"第一步:模型基本信息定义",
			selected:true,
			closable:false,
			cache:false,
			content : createFrame(getTagUrl('0')) // 这里动态加载第一步页面信息
		});
		
		$('#add_model_top').tabs('add',{
			title:"第二步:模型属性信息定义",
			selected:false,
			closable:false,
			cache:false,
			content : createFrame(getTagUrl('1')) // 这里动态加载第二步页面信息
		});
		
		$('#add_model_top').tabs('add',{
			title:"第三步:模型维度信息定义",
			selected:false,
			closable:false,
			cache:false,
			content : createFrame(getTagUrl('2')) // 这里动态加载第三步页面信息
		});
		
		// 初始化时候  禁用1、2 tab
		$('#add_model_top').tabs('disableTab', 1); 
		$('#add_model_top').tabs('disableTab', 2); 
	}
	
	// 上一步  切换到上一个tab
	function beforeStep(){
		// 获取当前tab
		var curTab = $("#add_model_top").tabs('getSelected');
		var index = $('#add_model_top').tabs('getTabIndex',curTab);
		if(index == '1'){
			// 保存模型属性 
			index = index - 1;
			$('#add_model_top').tabs('disableTab', 1); 
			$('#add_model_top').tabs('enableTab', 0); 
			$('#add_model_top').tabs('disableTab', 2); 
			// 去掉上一步按钮
			$(".dialog-button a:first-child").remove();
		}else if(index == '2'){
			index = index - 1;
			// 保存模型维度
			$('#add_model_top').tabs('disableTab', 0); 
			$('#add_model_top').tabs('disableTab', 2); 
			$('#add_model_top').tabs('enableTab', 1); 
			
			// 增加下一步按钮
			var beforeButton = "<a href='javascript:nextStep()' class='l-btn l-btn-small' group='' id=''>"+
						  	"<span class='l-btn-left l-btn-icon-left'>"+
							"<span class='l-btn-text'>下一步</span>"+
							"<span class='l-btn-icon icon-save'></span>"+
						 	"</span>"+
							"</a>";
			$(".dialog-button").append(beforeButton);
		}
		
		// 切换到上一个tab
		$("#add_model_top").tabs('select',index);
		// 更新tab内容
		updateTagContent(getTagUrl(index));
	}
	
	// 更新tab内容 重新加载  不要缓存
	function updateTagContent(url){
		$("#add_model_top").tabs('update',{
			tab:$("#add_model_top").tabs('getSelected'),
		    options : {
		         content : createFrame(url)
		    }
		});
	}
	
	// 下一步 切换到下一个tab
	function nextStep(){
		// 获取当前tab  判断是否是最后一个tab
		var curTab = $("#add_model_top").tabs('getSelected');
		var index = $('#add_model_top').tabs('getTabIndex',curTab);
		if(index == '0'){
			// 保存模型名称 和 模型key
			index = index + 1;
			$('#add_model_top').tabs('enableTab', 1); 
			$('#add_model_top').tabs('disableTab', 0); 
			$('#add_model_top').tabs('disableTab', 2); 
			// 增加上一步按钮
			var beforeButton = "<a href='javascript:beforeStep()' class='l-btn l-btn-small' group='' id=''>"+
						  	"<span class='l-btn-left l-btn-icon-left'>"+
							"<span class='l-btn-text'>上一步</span>"+
							"<span class='l-btn-icon icon-save'></span>"+
						 	"</span>"+
							"</a>";
			$(".dialog-button").prepend(beforeButton);
		}else if(index == '1'){
			// 保存模型属性 
			index = index + 1;
			$('#add_model_top').tabs('disableTab', 0); 
			$('#add_model_top').tabs('enableTab', 2); 
			$('#add_model_top').tabs('disableTab', 1); 
			// 去掉下一步按钮
			$(".dialog-button a:last-child").remove();
		}else if(index == '2'){
			// 保存模型维度
			$('#add_model_top').tabs('disableTab', 0); 
			$('#add_model_top').tabs('disableTab', 1); 
			$('#add_model_top').tabs('enableTab', 2); 
		}
		
		// 切换到下一个tab
		$("#add_model_top").tabs('select',index);
		// 更新tab内容
		updateTagContent(getTagUrl(index));
	}
	
	function getTagUrl(index){
		if(index == '0'){
			return './model/add/step1?date='+Math.random();
		}else if(index == '1'){
			return './model/add/step2?date='+Math.random();
		}else if(index == '2'){
			return './model/add/step3?date='+Math.random();
		}
	}
	
	// 创建tab页签
	function createFrame(url) {
	    var str = '<iframe width=100% height=100% frameborder=0 scrolling=no marginheight=0 marginwidth=0 src="' + url + '"></iframe>';
	    return str;
	}
	
	// 删除模型
	function delModel(){
		console.info("删除...");
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
						url:'./model/deleteBatch',
						data:'modelIds='+ids,
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
	
	// form表单转json
	$.fn.serializeObject = function()    
	{    
	   var o = {};    
	   var a = this.serializeArray();    
	   $.each(a, function() {    
	       if (o[this.name]) {    
	           if (!o[this.name].push) {    
	               o[this.name] = [o[this.name]];    
	           }    
	           o[this.name].push(this.value || '');    
	       } else {    
	           o[this.name] = this.value || '';    
	       }    
	   });    
	   return o;    
	}; 
	
	
	// 搜索模型列表
	function searchModel(){
		console.info($("#search_form").serializeObject());
		$("#main").datagrid('load',$("#search_form").serializeObject());
	}
	
	// 清空按钮
	function clearAll(){
		$("#tId").combobox('select','-1');
		// $("#tId option:first").prop("selected", 'selected');
		$("#rmName").val("");
	}
	
	// 保存模型
	function saveModel(){
		console.info("保存模型...");
		// 当前tab页面 
		var curTab = $("#add_model_top").tabs('getSelected');
		var index = $('#add_model_top').tabs('getTabIndex',curTab);
		
		if(index == '0'){
			// 如果是第一步  则保存模型基本信息
			console.info("第一步保存...");
		}else if(index == '1'){
			// 如果是第二部  则保存模型属性信息
			console.info("第二步保存...");
		}else if(index == '2'){
			// 如果是第三部  则保存模型维度信息
			console.info("第三步保存...");
		}
		
		// 关闭dialog
		$("#addDialog").dialog('close');
		// 刷新模型列表
		$("#main").datagrid('load');
	}
	
	// 弹出消息框
	function showMsg(msg){
		$.messager.show({    
		    title: '处理结果',
		    msg:msg,
		    timeout:3000,
			showType:'slide'
		});    
	}
	
	
</script>

</head>

<table id="main" class="easyui-datagrid" 
			data-options="fit : true,border:false,rownumbers:true,fitColumns : true,
			url:'./model/list_model',pagination : true,pageSize:2, pageList:[2,4,6,8],
			loadMsg:'正在加载中, 请稍候 …',toolbar:'#searchBut'"> 
	<thead>  
           <tr>  
           	   <th data-options="field:'ck',checkbox:true"></th>
               <th data-options="field:'id',width:fixWidth(0.2),align:'center'">模型Id</th>  
               <th data-options="field:'rmName',width:fixWidth(0.2),align:'center'">模型名称</th>  
               <th data-options="field:'rtName',width:fixWidth(0.2),align:'center'">所属行业</th>  
               <th data-options="field:'rmKey',width:fixWidth(0.2),align:'center'">模型key</th>
               <th data-options="field:'desc',width:fixWidth(0.2),align:'center'">简介</th>       
           </tr>  
   </thead>  
</table>

<div id="searchBut" style="padding:5px;height:auto">
        <div style="margin-bottom:5px">
            <a href="#" onclick="addModel()" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>
            <a href="#" onclick="editModel()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">编辑</a>
            <a href=# onclick="delModel()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
        </div>
        
        <div>
            <!-- Date From: <input class="easyui-datebox" style="width:80px">
            To: <input class="easyui-datebox" style="width:80px"> -->
           	<form id="search_form"> 
	           	 所属行业：
	            <select id="tId" name="tId" class="easyui-combobox" panelHeight="auto" style="width:100px">
									<option value="-1">全部</option>
									<c:forEach items="${tradeList}" var="trade">
										<option value="${trade.id}">${trade.rtName}</option>
									</c:forEach>
				</select>
				模型名称：<input type="text" id="rmName" name="rmName" placeholder="请输入模型名称..."/>
	            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="searchModel()">查询</a>
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="clearAll()">重置</a>
        	</form>
        </div>
</div>

<!-- 新增弹出框 -->
<div id="addDialog" class="easyui-dialog" 
			data-options="title: '新增模型',top:20,width: 600, height: 400,
			maximizable:true,closed: false, modal: true,
			buttons:'#addBt',closed:true">   
	<div id="add_model_top">

	</div>
</div>

<!-- 新增模型dialog按钮 -->
<div id="addBt">
	<a href="#" onclick="saveModel()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">完成</a>
	<a href="#" onclick="nextStep()" class="easyui-linkbutton" data-options="iconCls:'icon-help'">下一步</a>
</div>
