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
	var main;
	var search_form;
	var showDialog;
	$(function(){
		main = $("#main").datagrid({
			url:'./model/list_model',
			fit : true,
			width:'auto',
			pageList:[2,4,6,8],
			loadMsg:'正在加载中, 请稍候 …', 
			pagination : true,//底部分页
			rownumbers : true,//显示行数
			fitColumns : true,//自适应列宽
			striped : true,//显示条纹
			pageSize : 2,//每页记录数
			frozenColumns:[[
			                {field:'ck',checkbox:true},
			            ]],
			columns : [[ {
				field : 'id',
				title : '模型Id',
				width : fixWidth(0.2),
				align:'center'
			}, {
				field : 'rmName',
				title : '模型名称',
				width : fixWidth(0.2),
				align:'center'
			}, {
				field : 'rtName',
				title : '所属行业',
				width : fixWidth(0.2),
				align:'center'
			}, {
				field : 'rmKey',
				title : '模型key',
				width : fixWidth(0.2),
				align:'center'
			}, {
				field : 'desc',
				title : '简介',
				width : fixWidth(0.2),
				align:'center'
			} ]],
			toolbar:[{
	            text:'新增',
	            iconCls:'icon-add',
	            handler:function(){showDialog('add');}
	        },'-',{
	            text:'编辑',
	            iconCls:'icon-edit',
	            handler:function(){showDialog('edit');}
	        },'-',{
	            text:'删除',
	            iconCls:'icon-remove',
	            handler:function(){delModel();}
	        }],
	        onDblClickRow:function(rowIndex, rowData){ // 双击一行触发
	            edit(rowIndex, rowData);
	        }
		});
		
		// 分页栏
		displayPageMsg();
	})
	
	function displayPageMsg(){
		main.datagrid('getPager').pagination({
		       displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录',
		       beforePageText: '第',//页数文本框前显示的汉字  
		       afterPageText: '页    共 {pages} 页',  
		});
	}
	
	// 列表宽度百分比设置
	function fixWidth(percent){
    	return document.body.clientWidth * percent ;
	}

	
	// 编辑用户
	function editAdmin(){
		// 获取选中用户
		var rows = main.datagrid('getSelections');
		if(rows.length == 0){
			showMsg("请选择需要编辑的用户！");
		}else if(rows.length == 1){
			
		}else if(rows.length > 1){
			showMsg("选择多个，默认修改第一个用户信息！");
			
		}
	}
	
	// 删除模型
	function delModel(){
		alert("删除...");
		// 返回所有选中的行
		var rows = main.datagrid('getSelections');
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
								main.datagrid('load');	// reload the user data
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
	
	// 新增模型
	function showDialog(type){
		var modelId;
		if(type == 'add'){
			title = '新增模型';
		}else if(type == 'edit'){
			title = '编辑模型';
			modelId = main.datagrid('getSelected').id;
		}
		
		showDialog = $("#diaolog").dialog({
		    title: title,  
		    top:20,
		    width: 600,    
		    height: 400,   
		    maximizable:true,
		    closed: false,    
		    modal: true,
		    href:"./model/add_model?type="+type+"&modelId="+modelId,// 先加载指定页面
		    buttons : [ {
				text : '完成',
				iconCls : 'icon-save',
				handler : function() {
					saveModel();
				}
			},{
				text : '下一步',
				iconCls : 'icon-cancel',
				handler : function() {
					nextStep();
				}
			}],
			onClose : function() {
				//alert("关闭...");
			},
			onLoad:function(){
				// 页面加载完毕后初始化表单
				formInit(type);
			}
		});
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
			return './model/list?date='+Math.random();
		}
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
	}
	
	// 创建tab页签
	function createFrame(url) {
	    var str = '<iframe width=100% height=100% frameborder=0 scrolling=no marginheight=0 marginwidth=0 src="' + url + '"></iframe>';
	    return str;
	}
	
	// 初始化新增管理员表单
	function formInit(type){
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
	
	// 消息框
	function showMsg(msg){
		$.messager.show({    
		    title: '处理结果',
		    msg:msg,
		    timeout:5000,
			showType:'slide'
		});    
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
		main.datagrid('load',$("#search_form").serializeObject());
	}
	
	// 清空按钮
	function clearAll(){
		$("#tId option:first").prop("selected", 'selected');
		$("#rmName").val("");
	}
	
</script>

</head>

<body>

<div class="easyui-layout" data-options="fit:true, border:false" >
	<div data-options="region:'north',border:false" style="height:60px">
		<div style="border:1px;border-style: solid;border-color: #99bbff;margin-top:10px;margin-left:10px;margin-right:10px;">
			<div style="margin-left:10px;margin-top:2px;margin-bottom:2px;">
				<form id="search_form">
					所属行业：<select id="tId" name="tId">
								<option value="-1">全部</option>
								<c:forEach items="${tradeList}" var="trade">
									<option value="${trade.id}">${trade.rtName}</option>
								</c:forEach>
							</select>
					模型名称：<input type="text" id="rmName" name="rmName" placeholder="请输入模型名称..."/>
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search', plain:true" onclick="searchModel()">查询</a>
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel', plain:true" onclick="clearAll()">重置</a>
				</form>
			</div>
		</div>
	</div>
	
	<div data-options="region:'center', split:false,border:false" style="margin-top:5px;">
			<table id="main">
			
			</table>
	</div>
	
	<!-- 新增 -->
	<div id="diaolog">   
    
	</div>
	
	<!-- 右下角操作提示框 -->
	<div id="message">   
    
	</div>  
	
</div>
		
</body>

</html>