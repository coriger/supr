<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=100" />
<!--[if IE 9]>
<meta name="application-name" content="点点网" />
<meta name="msapplication-starturl" content="http://www.diandian.com/home" />
<meta name="msapplication-task" content="name=首页;action-uri=http://www.diandian.com/home;icon-uri=http://s.srcdd.com/img/ico/home.$4051.ico" />
<meta name="msapplication-task" content="name=个人主页;action-uri=http://www.diandian.com/gotoprofile;icon-uri=http://s.srcdd.com/img/ico/profile.$4051.ico" />
<meta name="msapplication-task" content="name=发现;action-uri=http://www.diandian.com/wall;icon-uri=http://s.srcdd.com/img/ico/explore.$4051.ico" />
<meta name="msapplication-navbutton-color" content="#1f83bf" />
<link rel="shortcut icon" href="http://s.srcdd.com/img/ico/favicon-ie9.$4053.ico" type="image/x-icon">
<![endif]-->
<link rel="shortcut icon" type="image/x-icon"
	href="http://s.srcdd.com/img/icon/favicon.$5106.ico" />
<!--[if lt IE 7]>
<script>
try { document.execCommand('BackgroundImageCache', false, true); } catch (e) {}
</script>
<![endif]-->
<script>
	window.DDformKey = '88301c81136549d9f220b5815b0c837d';
	window.DDHostName = 'db13.dd.hn';
	window.DDrev = '23257 376e6ae12b57 2014032016 built by vela';
	window.DDrequestStart = '1397868548341';
	window.DDrequestEnd = '1397868548378';
</script>
<script src="js/seed.$6804.js"></script>
<link rel="stylesheet" href="http://s.srcdd.com/css/base/dd.$7250.css">
<script>
	KISSY.Config.debug = '';
</script>
<script>
	ENV.serverTimestamp = 1397868548341;
	ENV.clientTimestamp = new Date().getTime();
	KISSY.ready(function(S) {
		ENV.domReadyTimestamp = new Date().getTime();
	});
</script>
<!--[if IE 9]>
<script type="text/javascript">
KISSY.ready(function(S){
KISSY.use("lib/pintab.$7202", function(S, pintab) {
pintab.init();
});
});
</script>
<![endif]-->
<link rel="stylesheet"
	href="http://s.srcdd.com/css/app/publisher.$7218.css">
<script>
	ENV.blogUrl = 'coriger';
	ENV.blogId = '630544';
	ENV.userId = '411527';
	ENV.tempUserId = '411527';
	ENV.isNewPost = '1';
	ENV.weibo = {
		"coriger" : false
	};
	ENV.qqWeibo = {
		"coriger" : false
	};
	ENV.douban = {
		"coriger" : false
	};
	ENV.qzone = {
		"coriger" : false
	};
	ENV.renren = {
		"coriger" : false
	};
	ENV.facebook = {
		"coriger" : false
	};
	ENV.twitter = {
		"coriger" : false
	};
	ENV.flickr = {
		"coriger" : false
	};

	KISSY
			.use(
					"app/publisher/text.$7252,app/publisher/autosave.$7252",
					function(S, publisher, autosave) {
						var dataSource = [
								{
									value : "coriger",
									isPrivace : "0",
									name : "<img class='avatar' src='http://m2.img.srcdd.com/farm5/d/2012/0808/09/465FFD66E441B6166CC48086BA96E7B3_S30_30_30.JPEG'/><span class='blog-name'>coriger</span>"
								}, null ];
						dataSource.pop();
						var privacySource = [ {
							value : '0',
							name : '现在发布'
						}, {
							value : "queue",
							name : '加入到自动发布列表'
						}, {
							value : "timer",
							name : '定时发布'
						} ];
						S.ready(function() {
							publisher.init(dataSource, privacySource);
							publisher.text.init();
							// 0 stand for new post
							autosave.init('text', 0);
						});
					});
</script>
<title>发布文字 | 点点</title>
</head>
<body id="new-text">
	<div id="PopElementContainer"></div>
	<div id="PopMenuContainer">
		<div id="pop-blog-list-holder" class="pop-menu-list-holder"
			style="display:none;">
			<div id="pop-blog-list-inner" class="pop-menu-list-inner">
				<div id="pop-blog-list-triangle" class="pop-menu-list-triangle"></div>
				<ul id="pop-blog-list" class="pop-menu-list">
					<li class="first" id="pop-blog-630544"><a
						href="http://www.diandian.com/dianlog/coriger"><span
							class="pop-menu-extra blog-move-icon"></span><span
							class="nav-blog-name">coriger</span> </a></li>
					<li class="sub"><a href="http://www.diandian.com/new/blog"
						title="再创建一个博客"> <span class="aside-icon"></span> +再创建一个博客 </a></li>
				</ul>
			</div>
		</div>
	</div>
	<div id="wrap">
		<div id="header-holder">
			<div id="header" class="clearfix">
				<div id="logo-holder">
					<h1 id="logo">
						<a href="http://www.diandian.com/home">点点网</a>
					</h1>
					<a id="new-feed-count" class="header-pop-notice"
						style="display:none;"></a>
				</div>
				<ul id="nav">
					<li id="nav-index" class=""><a class="nav-item"
						href="http://www.diandian.com/home">首页</a></li>
				</ul>
				<div id="J_HeaderMiscAction" class="misc-action">
					<ul class="action-list">
						<li class="action-item"><a class="action-link discovery"
							href="http://www.diandian.com/wall?ref=topnav" title="发现">发现</a>
						</li>
						<li class="action-item"><a class="action-link themegarden"
							href="http://www.diandian.com/themes" title="模板公园">模板公园</a>
						</li>
						<li class="action-item"><a class="action-link settings"
							href="http://www.diandian.com/settings" title="帐户">帐户</a>
						</li>
						<li class="action-item"><a class="action-link logout"
							href="http://www.diandian.com/logout?formKey=88301c81136549d9f220b5815b0c837d"
							title="退出">退出</a>
						</li>
					</ul>
				</div>
				<ul id="nav-blog-list" style="position:absolute;top:-500px;">
					<li id="nav-blog-630544" class="blog-item" notify="" url="coriger"><a
						class="blog-url" href="http://www.diandian.com/dianlog/coriger">
							<span class="nav-blog-name"> coriger</span> </a></li>
				</ul>
				<div id="nav-blog-action">
					<a id="nav-more-blog" class="nav-more-blog">更多</a> <a
						id="nav-new-blog" class="nav-new-blog"
						href="http://www.diandian.com/new/blog" title="再创建一个博客">再创建一个博客</a>
					<span id="nav-more-blog-notice"
						class="header-pop-notice large-pop-notice blog-pop-notice"
						style="display:none;">New</span>
				</div>
				<script>
					(function() {
						function $(el) {
							return document.getElementById(el);
						}
						var header = $('header'), logo = $('logo-holder'), nav = $('nav'), action = $('nav-blog-action'), misc = $('J_HeaderMiscAction');
						function getBlogListWidth() {
							var actionWidth = 50;
							return (header.offsetWidth - (logo.offsetWidth
									+ nav.offsetWidth + misc.offsetWidth + actionWidth));
						}
						function renderNavBlogList() {
							var MAX_BLOG_LIST_WIDTH = getBlogListWidth(), ret = [], attr, hideblog = false, ul = $('nav-blog-list'), lis = ul
									.getElementsByTagName('li'), moreNotice = false, noticeName = '', noticeMap = {};
							for ( var i = 0; i < lis.length; i++) {
								lis[i].style.display = '';
							}
							for ( var i = lis.length - 1; i >= 0; i--) {
								if (ul.offsetWidth > MAX_BLOG_LIST_WIDTH) {
									if (lis[i].className.indexOf('active') > -1)
										continue;
									lis[i].style.display = 'none';
									if (lis[i].className.indexOf('J_HasNotice') > -1) {
										noticeName = lis[i]
												.getAttribute('notify');
										noticeMap[noticeName] = 1;
										moreNotice = true;
									}
									hideblog = true;
								} else {
									break;
								}
							}
							if (!hideblog) {
								$('nav-more-blog').style.display = 'none';
							} else {
								$('nav-more-blog').style.display = '';
							}
							if (lis.length > 1 && !!hideblog) {
								$('nav-new-blog').style.display = 'none';
							} else {
								$('nav-new-blog').style.display = '';
							}
							if (!!moreNotice) {
								if (!!noticeMap['投稿']) {
									$('nav-more-blog-notice').innerHTML = '投稿';
								} else if (!!noticeMap['退稿']) {
									$('nav-more-blog-notice').innerHTML = '退稿';
								} else if (!!noticeMap['私信']) {
									$('nav-more-blog-notice').innerHTML = '私信';
								}
								$('nav-more-blog-notice').style.display = '';
							} else {
								$('nav-more-blog-notice').style.display = 'none';
							}
							ul.style.position = '';
							ul.style.top = '';
						}
						setTimeout(function() {
							renderNavBlogList();
						}, 1);
						ENV.__renderNavBlogList = renderNavBlogList;
					})();
					KISSY.use("lib/header.$7202", function(S, header) {
						header.init();
					});
					ENV.labsFullScreenSlide = false;
				</script>
			</div>
		</div>
		<div id="content-holder">
			<div id="content">
				<div class="pb-main-top clearfix">
					<div class="l">&nbsp;</div>
					<div class="r">&nbsp;</div>
				</div>
				<div class="pb-wrapper clearfix">
					<div id="pb-main">
						<div id="editor"></div>
						<h2 id="pb-main-title" class="clearfix">
							<span>发布文字</span>
							<div class="pb-share-tip" style='display: none;'>
								<div id="pb-share-tip-0" style='display: none;'>
									一键分享站外内容到点点? <a target="_blank"
										href="http://www.diandian.com/share/intro">点击这里</a>
								</div>
								<div id="pb-share-tip-1" style='display: none;'>
									通过邮件发布文章到点点? <a target="_blank"
										href="http://www.diandian.com/help/content?id=55">点击这里</a>
								</div>
								<div id="pb-share-tip-2" style='display: none;'>
									希望保护原创作品？试试 <a target="_blank"
										href="http://iam.diandian.com/post/watermark">图片水印</a>
								</div>
								<a id="pb-share-tip-close" href="#" title="不再提示">关闭</a>
							</div>
						</h2>
						<div id="pb-post-area">
							<div id="pb-text-title-holder" class="pb-post-section">
								<h3 class="pb-section-title">
									标题 <span>(可不填)</span>
								</h3>
								<input tabindex="1" type="text" name="pb-text-title"
									class="pb-input-text" id="pb-text-title">
							</div>
							<div id="pb-text-post-holder" class="pb-post-section">
								<h3 class="pb-section-title">内容</h3>
								<textarea id="pb-text-textarea" name="pb-text-textarea"
									class="pb-input-text"></textarea>
							</div>
						</div>
						<div id="pb-action-holder" class="clearfix">
							<div class="pb-submit">
								<div cloud="type:Button;id:pb-submit;width:70;skin:willblue">发布</div>
							</div>
							<div class="pb-preview">
								<div cloud="type:Button;id:pb-preview;width:70;skin:willlight">预览</div>
							</div>
							<div class="pb-draft">
								<div cloud="type:Button;id:pb-draft;width:94;skin:willlight">保存到草稿</div>
							</div>
							<div class="pb-cancel">
								<div cloud="type:Button;id:pb-cancel;width:70;skin:willlight">取消</div>
							</div>
							<span id="pb-submiting-tip" style="display:none;">正在保存...</span>
						</div>
					</div>
					<div id="pb-aside">
						<div class="pb-aside-i">
							<div id="post-to-aside-holder" class="aside-item"
								style="display:none">
								<div class="pb-mod">
									<label for="post-to-select">发布至</label>
									<div id="post-to-select-aside" default="coriger"></div>
								</div>
								<div class="separator noborder"></div>
							</div>
							<div id="post-privacy-holder" class="pb-mod aside-item">
								<div id="post-privacy-select" default="0"></div>
								<div id="post-by-timer-holder" style="display: none;"
									class="post-by-timer clearfix">
									<div class="item date">
										<input name="post-timer-date" id="post-timer-date" type="text" />
										<a href="#" class="arrow"></a>
									</div>
									<div class="item hour">
										<input name="post-timer-hour" id="post-timer-hour" type="text" />
									</div>
									<div class="split">:</div>
									<div class="item minutes">
										<input name="post-timer-minutes" id="post-timer-minutes"
											type="text" />
									</div>
								</div>
							</div>
							<div class="separator noborder"></div>
							<div class="pb-mod">
								<div id="post-tag-holder" class="aside-item">
									<div id="post-tag">
										<ul id="post-tag-list" class="clearfix">
										</ul>
										<div id="post-tag-input-holder">
											<input type="text" name="post-tag-input" id="post-tag-input"
												tip='{"class":"pb-tag-tip","text":"添加标签..."}'>
										</div>
									</div>
								</div>
								<div id="recommand-tag-holder" class="aside-item"
									style="display:none;">
									<ul id="recommand-tag-list" class="clearfix"></ul>
								</div>
							</div>
							<div id="permalink-holder">
								<div class="separator"></div>
								<div class="pb-mod aside-item pb-side-opt">
									<div class="permalink-check">
										<label>自定义链接</label>
									</div>
									<div class="permallink" id="permallink">
										/<input cloud="type:TextInput;id:permallink;width:180"
											name="permallink" type="text" />
									</div>
								</div>
							</div>
							<div class="separator"></div>
							<div class="pb-mod aside-item pb-side-opt no-padding-right">
								<label id="pb-set-private-holder" class="first"> <input
									id="pb-set-private" type="checkbox" />仅自己可见 </label>
								<div id="top-post-holder">
									<label><input type="checkbox" id="pb-top-post">文章置顶</label>
								</div>
								<div id="post-cc-holder" style="display:block;">
									<label><input id="post-cc" type="checkbox" checked />原创内容授权</label>
									<div class="post-cc-sub" id="post-cc-sub">
										<div class="post-cc-sub-panel clearfix" id="postCcPanel"
											value="by_nc_nd" style="display: none;">
											<span class="cc-1"></span> <span class="cc-2"></span> <span
												class="cc-3"></span> <span class="cc-4"></span> <a href="#"
												class="post-cc-sub-modify-btn" id="post-cc-sub-modify-btn">
												修改 </a>
										</div>
										<div class="post-cc-sub-modify" id="postCcModify"
											style="display: none;">
											<ul>
												<li class="clearfix"><input name="creativeCommonsType"
													value="by_nc_nd" id="postCcType" type="radio" /> <label
													for="postCcType"> <span class="cc-1"></span> <span
														class="cc-2"></span> <span class="cc-3"></span> </label> <label
													for="postCcType" class="post-cc-h post-cc-text-123">署名-非商业使用-禁止演绎</label>
												</li>
												<li class="clearfix"><input name="creativeCommonsType"
													value="by_nc_sa" id="postCcType1" type="radio" /> <label
													for="postCcType1"> <span class="cc-1"></span> <span
														class="cc-2"></span> <span class="cc-4"></span> </label> <label
													for="postCcType1" class="post-cc-h post-cc-text-124">署名-非商业使用-相同方式共享</label>
												</li>
												<li class="clearfix"><input name="creativeCommonsType"
													value="by_nc" id="postCcType2" type="radio" /> <label
													for="postCcType2"> <span class="cc-1"></span> <span
														class="cc-2"></span> </label> <label for="postCcType2"
													class="post-cc-h post-cc-text-12">署名-非商业使用</label></li>
												<li class="clearfix"><input name="creativeCommonsType"
													value="by_nd" id="postCcType3" type="radio" /> <label
													for="postCcType3"> <span class="cc-1"></span> <span
														class="cc-3"></span> </label> <label for="postCcType3"
													class="post-cc-h post-cc-text-13">署名-禁止演绎</label></li>
												<li class="clearfix"><input name="creativeCommonsType"
													value="by_sa" id="postCcType4" type="radio" /> <label
													for="postCcType4"> <span class="cc-1"></span> <span
														class="cc-4"></span> </label> <label for="postCcType4"
													class="post-cc-h post-cc-text-14">署名-相同方式共享</label></li>
												<li class="clearfix"><input name="creativeCommonsType"
													value="by" id="postCcType5" type="radio" /> <label
													for="postCcType5"><span class="cc-1"></span>
												</label> <label for="postCcType5" class="post-cc-h post-cc-text-1">署名</label>
												</li>
											</ul>
										</div>
									</div>
								</div>

								<div id="pb-weibo2long-holder" postType="text">
									<label> <input type="checkbox" id="pb-weibo2long" />生成长微博
										<a id="pb-weibo2long-preview" style="display: none;" href="">预览</a>
									</label>
									<p id="pb-weibo2long-tip" style="visibility: hidden;">仅支持同步到新浪、腾讯微博</p>
								</div>
							</div>
							<div id="pb-sync-holder" class="clearfix"
								style="display:none;position:relative;">
								<div class="separator" id="pb-sync-sep"></div>
								<div class="pb-mod clearfix">
									<div id="sync-to-weibo-holder"
										class="aside-item pb-side-opt pb-side-sync-opt"
										style="display:none;">
										<a href="#" class="pb-sync-to-weibo" id="pb-sync-to-weibo">新浪微博</a>
									</div>
									<div id="sync-to-qzone-holder"
										class="aside-item pb-side-opt pb-side-sync-opt"
										style="display:none;">
										<a href="#" class="pb-sync-to-qzone" id="pb-sync-to-qzone">QQ空间</a>
									</div>
									<div id="sync-to-renren-holder"
										class="aside-item pb-side-opt pb-side-sync-opt"
										style="display:none;">
										<a href="#" class="pb-sync-to-renren" id="pb-sync-to-renren">人人</a>
									</div>
									<div id="sync-to-qqweibo-holder"
										class="aside-item pb-side-opt pb-side-sync-opt"
										style="display:none;">
										<a href="#" class="pb-sync-to-qqweibo" id='pb-sync-to-qqweibo'>腾讯微博</a>
									</div>
									<div id="sync-to-facebook-holder"
										class="aside-item pb-side-opt pb-side-sync-opt"
										style="display:none;">
										<a href="#" class="pb-sync-to-facebook"
											id="pb-sync-to-facebook">facebook</a>
									</div>
									<div id="sync-to-twitter-holder"
										class="aside-item pb-side-opt pb-side-sync-opt"
										style="display:none;">
										<a href="#" class="pb-sync-to-twitter" id="pb-sync-to-twitter">twitter</a>
									</div>
									<div id="sync-to-flickr-holder"
										class="aside-item pb-side-opt pb-side-sync-opt"
										style="display:none;">
										<a href="#" class="pb-sync-to-flickr" id="pb-sync-to-flickr">flickr</a>
									</div>
								</div>
							</div>
							<div id="pb-no-sync-holder" style="display: none;">
								<div class="separator" id="pb-sync-sep"></div>
								<div class="pb-mod">
									<a href="/customize/coriger#sync" id="pb-no-sync"
										class="pb-no-sync" target="_blank">绑定账号，同步到微博 -></a> <a
										href="#" class="pb-sync-reject" id="pb-sync-reject"
										style="display: none;">不想绑定</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="pb-main-bottom clearfix">
					<div class="l">&nbsp;</div>
					<div class="r">&nbsp;</div>
				</div>
			</div>
		</div>
	</div>
	<iframe src="http://acl.a.srcdd.com/acl.html?2" width="0" height="0"
		frameborder="0"></iframe>
	<script src="http://s.srcdd.com/js/lib/tracker/inc/trackerbase.js"></script>
	<script type="text/javascript">
_DD_TRACE = window._DD_TRACE || {};
_DD_TRACE.dtid = _DD_TRACE.Cookie.get('dtid');
_DD_TRACE.Tracker('pv');var _ddgaq = _ddgaq || [];
_ddgaq.push(['DDGAT._setAccount', 'UA-30555696-1']);
_ddgaq.push(['DDGAT._setDomainName', '.diandian.com']);
_ddgaq.push(['DDGAT._setAllowLinker', true]);
_ddgaq.push(['DDGAT._addOrganic', 'baidu', 'word']);
_ddgaq.push(['DDGAT._addOrganic', 'soso', 'w']);
_ddgaq.push(['DDGAT._addOrganic', 'youdao', 'q']);
_ddgaq.push(['DDGAT._addOrganic', 'sogou', 'query']);
_ddgaq.push(['DDGAT._addOrganic', 'so.360.cn', 'q']);
_ddgaq.push(['DDGAT._trackPageview']);(function() {
var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
ga.src = 'http://s.srcdd.com/js/base/ga.$5928.js';
var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();
</script>


</body>
</html>