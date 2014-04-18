<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<title>登录点点 | 轻博客</title>
<meta http-equiv="X-UA-Compatible" content="IE=100">
<meta name="Description" content="点点网是一个简单的轻博客，让你能简单快速地发布文字、图片、视频等各种格式内容，通过不同的风格展示来表现你的兴趣或性格。">
<meta name="Keywords" content="点点,点点网,博客,轻博客,独立博客">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="http://s.srcdd.com/js/kissy/1.2/template.js?t=20120703155558" async="" charset="utf-8"></script>
<script src="http://s.srcdd.com/js/lib/tracker.$6736.js" async="" charset="utf-8"></script>
<script src="http://s.srcdd.com/sky/build/sky.$6939.js" async="" charset="utf-8"></script>
<script src="http://s.srcdd.com/js/util.$7202.js" async="" charset="utf-8"></script>
<script src="http://s.srcdd.com/js/kissy/1.2/core.js?t=20120703155558" async="" charset="utf-8"></script>
<script type="text/javascript" async="" src="http://s.srcdd.com/js/base/ga.$5928.js"></script>
<script src="http://s.srcdd.com/js/app/reg-login-third.$7202.js" async="" charset="utf-8"></script>
<script src="http://s.srcdd.com/js/kissy/1.2/seed.$6804.js"></script>
<script type="text/javascript" src="js/supr.js"></script>
<script type="text/javascript" src="js/jquery-json-2.4.js"></script>
<link rel="stylesheet" href="http://s.srcdd.com/css/app/reg-login-third.$7236.less">
<link rel="shortcut icon" type="image/x-icon" href="http://s.srcdd.com/img/icon/favicon.$5106.ico">
	<!--[if lt IE 7]>
	<script>
	try { document.execCommand('BackgroundImageCache', false, true); } catch (e) {}
	</script>
	<![endif]-->

	<script type="text/javascript">
		KISSY.use("app/reg-login-third.$7202", function(S, app) {
			ENV.page = 'login';
			S.ready(function() {
				app.initLogin();
			});
		})
	</script>

</head>

<body style="height: 504px; width: 1263px;">
	<div id="startpage" class="clearfix" style="width: 1263px;">
		<div id="reg-login-switch">
			<a href="register" id="go-register">注册</a>
		</div>
		<div id="startpage-wrap" class="login-bg" style="margin-left: 0px;">
			<h1 id="logo-startpage" style="padding-top: 75.2px;">
				<span class="login-logo"> <a href="javascirpt:return(null)">点点 - 让博客从此简单</a> </span>
			</h1>
			<div id="login-wrap">
				<div id="login-form-wrap">
					<form id="login-form" class="clearfix" action="" method="post">
						<div class="input-wrap focus" id="input-login-email">
							<span class="input-icon"></span> <label>账号</label> <input class="startpage-input-text" type="text" name="username" value="">
						</div>
						<div class="input-wrap" id="input-login-pwd">
							<span class="input-icon"></span> <label>密码</label> <input class="startpage-input-text" type="password" name="password" value="">
							<div class="tip" style="display:none"></div>
						</div>
						<input type="submit" name="login-submit" class="input-button hidden-submit" value="登录">
						<div cloud="" id="ctrlbuttonlogin-submit" data-control="login-submit" class="ui-button skin-button-willblue" style="width: 283px;">
							<span class="ui-button-bg-left skin-button-willblue-bg-left"></span>
							<div onclick="checkLogin()" id="ctrlbuttonlogin-submitlabel" class="ui-button-label skin-button-willblue-label">
								<span id="ctrlbuttonlogin-submittext" class="ui-button-text skin-button-willblue-text">
									登录
								</span>
							</div>
						</div>
					</form>
					<div id="login-help" class="clearfix">
						<a href="http://www.diandian.com/password/forgot" id="forget-password">忘记密码?</a>
					</div>
				</div>
				<div id="third-party-wrap" class="login-third-party-wrap">
					<div class="third-party-first clearfix">
						<a href="http://www.diandian.com/connect/sinaweibo/authorize" class="weibo">新浪微博</a> <a href="http://www.diandian.com/connect/qzone/authorize" class="qq last">QQ</a> <a href="http://www.diandian.com/connect/douban/authorize" class="douban">豆瓣</a> <a href="http://www.diandian.com/connect/msn/authorize" class="msn last">MSN</a> <a href="http://www.diandian.com/connect/qqweibo/authorize" class="qqweibo">腾讯微博</a> <a href="http://www.diandian.com/connect/renren/authorize" class="renren last">人人网</a>
					</div>
				</div>
			</div>
			<div id="footer" style="top: 484px;">
				<a href="http://www.diandian.com">suprBlog</a>©2014<a class="footer-item" href="http://www.diandian.com/links">友情链接</a> <a class="footer-item" href="http://www.diandian.com/map.html">网站地图</a> <a class="footer-item" href="http://www.miibeian.gov.cn/" target="_blank">京ICP备10217266号</a> <span class="footer-item">京公网安备11010502023174号</span>
			</div>
		</div>
	</div>
	<iframe src="http://acl.a.srcdd.com/acl.html?2" width="0" height="0" frameborder="0"></iframe>
	<script src="http://s.srcdd.com/js/lib/tracker/inc/trackerbase.js"></script>
	<script type="text/javascript">
		_DD_TRACE = window._DD_TRACE || {};
		_DD_TRACE.dtid = _DD_TRACE.Cookie.get('dtid');
		_DD_TRACE.Tracker('pv');
		var _ddgaq = _ddgaq || [];
		_ddgaq.push([ 'DDGAT._setAccount', 'UA-30555696-1' ]);
		_ddgaq.push([ 'DDGAT._setDomainName', '.diandian.com' ]);
		_ddgaq.push([ 'DDGAT._setAllowLinker', true ]);
		_ddgaq.push([ 'DDGAT._addOrganic', 'baidu', 'word' ]);
		_ddgaq.push([ 'DDGAT._addOrganic', 'soso', 'w' ]);
		_ddgaq.push([ 'DDGAT._addOrganic', 'youdao', 'q' ]);
		_ddgaq.push([ 'DDGAT._addOrganic', 'sogou', 'query' ]);
		_ddgaq.push([ 'DDGAT._addOrganic', 'so.360.cn', 'q' ]);
		_ddgaq.push([ 'DDGAT._trackPageview' ]);
		(function() {
			// 页面ready load
			
		})();
		
		// 登录校验
		function checkLogin(){
			var params = $.toJSON($("#login-form").serializeObject());
			alert(params);
			$.ajax({
				type:"POST",
				url:"./login/submit",
				data:params,
				contentType:"application/json", 
				dataType:"json",
				async:false,
				success:function(data){
					if(data.resultCode == 'error'){
	                	// 这里可以考虑记住标签id 然后自动选择出错字段
		                alert(data.errorInfo);
	                }else if(data.resultCode == 'success'){
	                	alert("登录成功!");
	                	$("#login-form").attr("action","./admin/home");
	                	$("#login-form").submit();
	                }
				}
			})
		}
	</script>
</body>
</html>