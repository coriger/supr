<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="http://s.srcdd.com/js/kissy/1.2/template.js?t=20120703155558" async="" charset="utf-8"></script>
<script src="http://s.srcdd.com/js/lib/tracker.$6736.js" async="" charset="utf-8"></script>
<script src="http://s.srcdd.com/sky/build/sky.$6939.js" async="" charset="utf-8"></script>
<script src="http://s.srcdd.com/js/util.$7202.js" async="" charset="utf-8"></script>
<script src="http://s.srcdd.com/js/kissy/1.2/core.js?t=20120703155558" async="" charset="utf-8"></script>
<script type="text/javascript" async="" src="http://s.srcdd.com/js/base/ga.$5928.js"></script>
<script src="http://s.srcdd.com/js/app/reg-login-third.$7202.js" async="" charset="utf-8"></script>
<script type="text/javascript" src="js/supr.js"></script>
<script type="text/javascript" src="js/jquery-json-2.4.js"></script>
<meta charset="utf-8">
<title>注册点点 | 轻博客</title>
<meta http-equiv="X-UA-Compatible" content="IE=100">
<meta name="Description" content="点点网是一个简单的轻博客，让你能简单快速地发布文字、图片、视频等各种格式内容，通过不同的风格展示来表现你的兴趣或性格。">
<meta name="Keywords" content="点点,点点网,博客,轻博客,独立博客">
<link rel="shortcut icon" type="image/x-icon" href="http://s.srcdd.com/img/icon/favicon.$5106.ico">
<!--[if lt IE 7]>
<script>
try { document.execCommand('BackgroundImageCache', false, true); } catch (e) {}
</script>
<![endif]-->
<script>
	window.DDformKey = '';
	window.DDHostName = 'hy-10-0-0-86.dd.hn';
	window.DDrev = '23257 376e6ae12b57 2014032016 built by vela';
	window.DDrequestStart = '1397650490085';
	window.DDrequestEnd = '1397650490136';
</script>
<link rel="stylesheet" href="http://s.srcdd.com/css/app/reg-login-third.$7236.less">
<script src="http://s.srcdd.com/js/kissy/1.2/seed.$6804.js"></script>
<script>
	KISSY.use("app/reg-login-third.$7202", function(S, app) {
		ENV.page = 'register';
		S.ready(function() {
			app.initRegister();
		});
	})
</script>
</head>

<body style="height: 504px; width: 1263px;">
	<div id="startpage" class="clearfix" style="width: 1263px;">
		<div id="reg-login-switch">
			<a href="http://www.diandian.com/login" id="go-login">登录</a>
		</div>
		<div id="startpage-wrap" style="margin-left: 0px;">
			<h1 id="logo-startpage" style="padding-top: 75.2px;">
				<span class="register-logo"> <a href="http://www.diandian.com">点点 - 让博客从此简单</a> </span>
			</h1>
			<div id="third-party-wrap" class="register-third-party-wrap">
				<div class="third-party-first clearfix">
					<a href="http://www.diandian.com/connect/sinaweibo/authorize" class="weibo">新浪微博</a>
				</div>
				<div style="display:none" id="show-more-third">
					<span id="show-more-third-span" class="help-link">更多合作平台 &gt;</span>
				</div>
			</div>
			<div id="footer" style="top: 484px;">
				<a href="http://www.diandian.com">点点网</a>©2012<a class="footer-item" href="http://www.diandian.com/links">友情链接</a> <a class="footer-item" href="http://www.diandian.com/map.html">网站地图</a> <a class="footer-item" href="http://www.miibeian.gov.cn/" target="_blank">京ICP备10217266号</a> <span class="footer-item">京公网安备11010502023174号</span>
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
			var ga = document.createElement('script');
			ga.type = 'text/javascript';
			ga.async = true;
			ga.src = 'http://s.srcdd.com/js/base/ga.$5928.js';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(ga, s);
		})();
	</script>
</body>
</html>
