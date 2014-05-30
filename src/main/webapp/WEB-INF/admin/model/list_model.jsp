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
	            handler:function(){showDialog('add')}
	        },'-',{
	            text:'编辑',
	            iconCls:'icon-edit',
	            handler:function(){showDialog('edit')}
	        },'-',{
	            text:'删除',
	            iconCls:'icon-remove',
	            handler:function(){delModel()}
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
		
		showDialog = $("<div/>").dialog({
		    title: title,  
		    top:20,
		    width: 600,    
		    height: 400,   
		    maximizable:true,
		    closed: false,    
		    cache: false,    
		    modal: true,
		    href:"./model/add_model?type="+type+"&modelId="+modelId,
		    buttons : [ {
				text : '完成',
				iconCls : 'icon-save',
				handler : function() {
					saveAdmin();
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
				// 初始化表单
				formInit(type);
			}
		});
	}
	
	function loadBeforeStep(index){
		alert("加载前一个tab...");
	}
	
	// 下一步 切换到下一个tab
	function nextStep(){
		// 获取当前tab  判断是否是最后一个tab
		var curTab = $("#add_model_tab").tabs('getSelected');
		var index = $('#add_model_tab').tabs('getTabIndex',curTab);

		showDialog.dialog({
			buttons : [ {
				text : '上一步',
				iconCls : 'icon-save',
				handler : function() {
					loadBeforeStep(index-1);
				}
			},{
				text : '完成',
				iconCls : 'icon-save',
				handler : function() {
					saveAdmin();
				}
			},{
				text : '下一步',
				iconCls : 'icon-cancel',
				handler : function() {
					nextStep();
				}
			}],
		})
		
		if(index == '0'){
			// 保存模型名称 和 模型key
			index = index + 1;
			
		}else if(index == '1'){
			// 保存模型属性 
			index = index + 1;
			
		}else if(index == '2'){
			// 保存模型维度
			
		}
		
		// 切换到下一个tab
		$("#add_model_tab").tabs('select',index);
	}
	
	// 保存管理员
	function saveAdmin(){
		$("#admin_form").submit();
	}
	
	// 初始化新增管理员表单
	function formInit(type){
		// 初始化三个tab  第一步、第二步、第三步
		$("#add_model_top").tabs({
			border:false,
		    fit:true,
		});
		
		$("#add_model_top").tabs('add',{
			title:'第一步',
			selected:true,
			closable:true,
			cache : false,
			content : 'asaa'
		});
		
		$("#add_model_top").tabs('add',{
			title:'第二步',
			selected:false,
			closable:true,
			cache : false,
			content : 'asaa'
		});
		
		$("#add_model_top").tabs('add',{
			title:'第三步',
			selected:false,
			closable:true,
			cache : false,
			content : 'asaa'
		});
		
		$("#admin_form").form({    
		    url:"./admin/add?type="+type,
		    data:$("#admin_form").serialize(),
		    onSubmit: function(){    
		    	$.messager.progress({
					title : '提示信息！',
					text : '数据处理中，请稍后....'
				});
		    },    
		    success:function(data){    
		    	$.messager.progress('close');
		    	var data = eval('(' + data + ')');  // change the JSON string to javascript object    
		    	if(data.resultCode == 'success'){
		    		// 销毁新增对话框
		    		showDialog.dialog('destroy');
		    		// 重新加载列表数据
		    		main.datagrid('reload');
		    		showMsg(data.errorInfo);
		    	}else{
		    		showMsg(data.errorInfo);
		    	}
		    }    
		});    
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
	
	
	<!-- 右下角操作提示框 -->
	<div id="message">   
    
	</div>  
	
</div>
		
</body>

</html>