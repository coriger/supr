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

<script type="text/javascript">
	var main;
	var showDialog;
	$(function(){
		main = $("#main").datagrid({
			url:'./admin/list_admin',
			fit : true,
			loadMsg:'正在加载中, 请稍候 …', 
			pagination : true,//底部分页
			rownumbers : false,//显示行数
			fitColumns : false,//自适应列宽
			striped : false,//显示条纹
			pageSize : 20,//每页记录数
			frozenColumns:[[
			                {field:'ck',checkbox:true},
			            ]],
			columns : [[ {
				field : 'id',
				title : '主键',
				hidden: true
			},{
				field : 'userId',
				title : '用户Id',
				width : '100'
			}, {
				field : 'username',
				title : '用户名',
				width : '100'
			}, {
				field : 'password',
				title : '密码',
				width : '100'
			}, {
				field : 'isEnabled',
				title : '状态',
				width : '100'
			}, {
				field : 'email',
				title : '邮箱',
				width : '100'
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
	            handler:function(){delAdmin()}
	        }],
	        onDblClickRow:function(rowIndex, rowData){ // 双击一行触发
	            edit(rowIndex, rowData);
	        }
		});
	})
	
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
	
	// 编辑某一行用户
	function edit(rowIndex, rowData){
		
	}
	
	// 删除用户
	function delAdmin(){
		// 返回所有选中的行
		var rows = main.datagrid('getSelections');
		if(rows.length >0){
			$.messager.confirm('确认提示！','您确定要删除选中的所有行？',function(r){
				if (r){
					var ids = "";
					for(var i=0;i<rows.length;i++){
						ids += rows[i].userId + ","; 
					}
					console.info(ids);
					$.ajax({
						url:'./admin/deleteBatch',
						data:'adminIds='+ids,
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
	
	// 新增管理员
	function showDialog(type){
		var userId;
		if(type == 'add'){
			title = '新增管理员';
		}else if(type == 'edit'){
			title = '编辑管理员';
			// 取第一个用户Id
			userId = main.datagrid('getSelected').userId;
		}
		
		alert(userId);
		
		showDialog = $("<div/>").dialog({
		    title: title,  
		    top:20,
		    width: 400,    
		    height: 200,   
		    maximizable:true,
		    closed: false,    
		    cache: false,    
		    modal: true,
		    href:"./admin/add_admin?type="+type+"&userId="+userId,
		    buttons : [ {
				text : '保存',
				iconCls : 'icon-save',
				handler : function() {
					saveAdmin();
				}
			},{
				text : '关闭',
				iconCls : 'icon-cancel',
				handler : function() {
					
				}
			}],
			onClose : function() {
				
			},
			onLoad:function(){
				// 初始化表单
				formInit(type);
			}
		});
	}
	
	// 保存管理员
	function saveAdmin(){
		$("#admin_form").submit();
	}
	
	// 初始化新增管理员表单
	function formInit(type){
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
</script>

</head>

<body>

<div class="easyui-layout" data-options="fit:true, border:false" >
	<div data-options="region:'north',border:false" style="height:60px">
		<div style="border:1px;border-style: solid;border-color: #99bbff;margin-top:10px;margin-left:10px;margin-right:10px;">
			<div style="margin-left:10px;margin-top:6px;margin-bottom:5px;">
				用户名：<input type="text" name="username" />
				状态：<select>
						<option>可用</option>
						<option>不可用</option>
					</select>
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search', plain:true" onclick="searchUser()">查询</a>
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel', plain:true" onclick="clearParam()">清空</a>
			</div>
		</div>
	</div>
	
	<div data-options="region:'center', split:false,border:false" style="margin-top:2px;">
			<table id="main">
			
			</table>
	</div>
	
	
	<!-- 右下角操作提示框 -->
	<div id="message">   
    
	</div>  
	
</div>
		
</body>

</html>