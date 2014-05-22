<%@ page language="java" import="java.util.*"  pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
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

<link rel="stylesheet" href="<%=basePath%>js/zTree_v3/css/demo.css" type="text/css">
<link rel="stylesheet" href="<%=basePath%>js/zTree_v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
<%--<script type="text/javascript" src="<%=basePath%>js/zTree_v3/js/jquery-1.4.4.min.js"></script>--%>
<script type="text/javascript" src="<%=basePath%>js/zTree_v3/js/jquery.ztree.core-3.5.js"></script>

<script type="text/javascript">
	
	$(function(){
		// 加载菜单
		loadMenu();
		// 初始化tab栏
		initTab();
		// tab菜单栏事件绑定
		bindTabEvent();
	})
	
	// tab菜单栏事件绑定
	function bindTabEvent(){

		// 全部关闭
		$("#closeAll").click(function(){
			$("#center-tab li").each(function (i, n) {
	            var title = $(n).text();
	            if(title != '首页'){
		            $("#center-tab").tabs('close', title);
	            }
	        });
		})
		
		// 刷新
		$("#refresh").click(function(){
			var curTab = $("#center-tab").tabs('getSelected');
			// 获取frame中的src
			url = $(curTab.panel('options').content).attr('src');
			$("#center-tab").tabs('update', {
	            tab:curTab,
	            options:{
	                content:createFrame(url)
	            }
	        })
		})
		
		// 除此之外全部关闭
		$("#closeOther").click(function(){
			curTab = $("#center-tab").tabs('getSelected');
			curTitle = curTab.panel('options').title;
			$("#center-tab li").each(function (i, n) {
	            var title = $(n).text();
	            if(title != curTitle && title != '首页'){
		            $("#center-tab").tabs('close', title);
	            }
	        });
			
			$("#center-tab").tabs('select',curTitle);
		})
		
		// 关闭
		$("#close").click(function(){
			// 获取选中tab
			var curTab = $("#center-tab").tabs('getSelected');
			curTitle = curTab.panel('options').title;
			$("#center-tab").tabs('close',curTitle);
		})
	}
	
	// 刷新当前tab
	function reload(){
		var curTab = $("#center-tab").tabs('getSelected');
		curTitle = curTab.panel('options').title;
		if(curTitle != '首页'){
			// 获取frame中的src
			url = $(curTab.panel('options').content).attr('src');
			$("#center-tab").tabs('update', {
	            tab:curTab,
	            options:{
	                content:createFrame(url)
	            }
	        })
		}
	}
	
	// 关闭当前tab
	function closeOne(){
		var curTab = $("#center-tab").tabs('getSelected');
		curTitle = curTab.panel('options').title;
		if(curTitle != '首页'){
			$("#center-tab").tabs('close',curTitle);
		}
	}
	
	// 关闭所有tab
	function closeAll(){
		$("#center-tab li").each(function (i, n) {
            var title = $(n).text();
            if(title != '首页'){
	            $("#center-tab").tabs('close', title);
            }
        });
	}
	
	// 初始化tab栏
	function initTab(){
		$("#center-tab").tabs({
		    border:false,
		    fit:true,
		    tools:'#tab-tools',
		    onSelect:function(title){    
		        // alert(title+' is sel-cted');
		        // 刷新一下
		        // curTab = $("#center-tab").tabs('getSelected');
		     	// 获取frame中的src
				// url = $(curTab.panel('options').content).attr('src');
				//$("#center-tab").tabs('update', {
		          //  tab:curTab,
		           // options:{
		             //   content:createFrame(url)
		            //}
		        //})
		    },
		    // 右键选中触发事件
		    onContextMenu:function(e,title){
		    	if(title != '首页'){
			    	$("#center-tab").tabs('select', title);
			    	e.preventDefault();
		            $("#menu").menu('show',{
		            	left:e.pageX,
		                top:e.pageY  
		    		});
		    	}
		    }
		});
	}
	
	// 加载菜单
	function loadMenu(){
		
		// 这块到时候ajax动态加载
		var acc = [
		           {"title":"系统管理", "menus":[
		               {"name":"用户管理", "url":"./admin/list"},
		               {"name":"资源管理", "url":"./admin/list"},
		               {"name":"角色管理", "url":"./admin/list"},
		               {"name":"权限管理", "url":"./admin/list"},
		           ]},
		           {"title":"社交", "menus":[
		               {"name":"QQ", "url":"./admin/list"},
		               {"name":"新浪", "url":"./admin/list"},
		               {"name":"人人", "url":"./admin/list"}
		           ]}
		       ];
		
		for (var i in acc) {
	        $("#accordion").accordion("add", {
	            title:acc[i].title,
	            closable:false
	        });
	        var cm = acc[i].menus;
	        var acc_index = $("#accordion")
	            .accordion("getPanel", acc[i].title);
	        for (var j in cm) {
	            $a_html = "<div><a onclick=\"javascript:addTab('" + cm[j].url + "','" + cm[j].name +"')\">"+cm[j].name+"</a></div>";
	            acc_index.append($a_html);
	        }
	    }
		
		$("#accordion").accordion("select","系统管理");
	}
	
	function addTab(htmlUrl,title){
		//如果当前id的tab不存在则创建一个tab
		if(title != ""){
			if($('#center-tab').tabs('exists',title)){
				$('#center-tab').tabs('select',title);
			}else{
				$('#center-tab').tabs('add',{
					title:title,
					selected:true,
					closable:true,
					cache : false,
					content : createFrame(htmlUrl)
				});
			}
		}
		return false;
	}
	
	function createFrame(url) {
	    var s = '<iframe width=100% height=100% frameborder=0 scrolling=no marginheight=0 marginwidth=0 src="' + url + '"></iframe>';
	    return s;
	}
	
</script>

</head>

<body class="easyui-layout">   
    
    <!-- 顶层 -->
    <div data-options="region:'north'" style="height:80px;">
    	顶层
    </div> 
     
    <!-- 底层 -->
    <div data-options="region:'south'" style="height:20px;">
    	底部
    </div>   
    
    <!-- 菜单 -->
    <div data-options="region:'west',title:'导航菜单',split:true" style="width:200px;">
    	<div id="accordion" class="easyui-accordion" data-options="fit:true,border:false">  
        </div>  
    </div>   
    
    <!-- 中间 -->
    <div data-options="region:'center'">
    	<!-- tab栏 -->
    	<div id="center-tab">
    		<div title="首页">   
        		欢迎欢迎... 
    		</div>   
    	</div>
    	
    	<!-- tab菜单栏 -->
    	<div id="menu" class="easyui-menu" style="width:150px;">
			<div id="refresh">刷新</div>
			<div id="closeAll">全部关闭</div>
			<div id="closeOther">除此之外全部关闭</div>
			<div id="close">关闭</div>
		</div>
		
		<!-- 按钮组 -->
		<div id="tab-tools" style="border-left:0px;border-right:0px;border-top:0px">
			<a onclick="reload()" class="easyui-linkbutton" plain="true" iconCls="icon-reload">刷新</a>
			<a onclick="closeOne()" class="easyui-linkbutton" plain="true" iconCls="icon-cancel">关闭</a>
			<a onclick="closeAll()" class="easyui-linkbutton" plain="true" iconCls="icon-cancel">全部关闭</a>
		</div>

    </div>   
</body>  

</html>
