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

<script type="text/javascript">
	
	function addTab(tabId,htmlUrl,title){
		alert("打开个tab");
		alert(tabId+":"+htmlUrl+":"+title);
		//如果当前id的tab不存在则创建一个tab
	    if($("#"+tabId).html()==null){
	    	var name = 'iframe_'+tabId;
	        $('#center-tab').tabs('add',{  
	            title: title,           
	            closable:true,
	            selected:true,
	            cache : false,  
	            //注：使用iframe即可防止同一个页面出现js和css冲突的问题  
	            content : createFrame(tabId,"./admin/list")
	        });  
	    }else{
	    	alert("已存在...");
	    }
		return false;
	}
	
	function createFrame(id,url) {
	    var s = '<iframe id="' + id +'" scrolling="auto" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>';
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
    <div data-options="region:'west',title:'导航',split:true" style="width:200px;">
    	<div class="easyui-accordion" data-options="fit:true,border:false">  
            <div title="系统管理" data-options="selected:true" style="padding:10px;overflow:auto;">  
                <ul class="easyui-tree">    
			       <li><a href="javascript:addTab('admin','/admin/list_admin.jsp','用户管理')">用户管理</a></span></li>
			       <li><span>资源管理</span></li>   
			       <li><span>角色管理</span></li>
			       <li><span>机构管理</span></li>
			   </ul>
            </div>  
            <div title="Title2" style="padding:10px;">  
                content2  
            </div>  
            <div title="Title3" style="padding:10px">  
                content3  
            </div>  
            <div title="Title3" style="padding:10px">  
                content3  
            </div> 
            <div title="Title3" style="padding:10px">  
                content3  
            </div> 
            <div title="Title3" style="padding:10px">  
                content3  
            </div> 
            <div title="Title3" style="padding:10px">  
                content3  
            </div> 
        </div>  
    </div>   
    
    <!-- 中间 -->
    <div data-options="region:'center'" style="background:#eee;">
    	<div id="center-tab" class="easyui-tabs" data-options="fit:true,border:false">  
            <div title="首页" style="padding:20px;overflow:hidden;">   
              <div style="margin-top:20px;">  
              		欢迎欢迎...
              </div>  
            </div>  
        </div>
    </div>   
</body>  

</html>
