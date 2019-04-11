<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java"
	import="com.apew.marathon.model.SystemUserModel"%>
<%
	if (session.getAttribute("user") == null) {
		response.sendRedirect("/Marathon/system/systemLogin.jsp");
	}
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<!DOCTYPE html>
<html lang="en">

<head>
<base href="<%=basePath%>" />
<meta charset="utf-8" />
<title>跑友管理平台</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="" name="description" />
<meta content="" name="author" />
<%@ include file="../static/systemCSS.html"%>
<%@ include file="../static/systemScript.html"%>
<style>
.container-fluid {
	padding: 0px 10px;
}

.portlet {
	margin-top: -25px;
}

#top_message {
	background-color: #fff;
	width: 400px;
	height: 100px;
	position: fixed;
	z-index: 99999;
	top: -110px;
	left: calc(50% - 180px);
	border: 1px solid skyblue;
	transition: all 650ms ease-in 0s;
}

#top_message .l-dialog-content {
	height: 45px;
	background: url(system/image/dialog-icons.gif) no-repeat 0px 0px;
	padding-left: 50px;
	margin: 10px 0px 0px 10px;
}

.l-dialog-image-donne{ background-image:url('../images/win/dialog-icons-donne.png') !important; /*background-position:0px 0px !important;*/ }
.l-dialog-image-error{ background-image:url('../images/win/dialog-icons-error.png') !important;/*background-position:0px -48px !important;*/ }
.l-dialog-image-question{ background-image:url('../images/win/dialog-icons-question.png') !important;/*background-position:0px -144px !important;*/ }
.l-dialog-image-warn{ background-image:url('../images/win/dialog-icons-warn.png') !important; /*background-position:0px -96px !important;*/ }
</style>
</head>

<body class="page-header-fixed">
	<div id="top_message" style="display:block !important;">
		<table class="l-dialog-table" cellpadding="0" cellspacing="0"
			border="0">
			<tbody>
				<tr>
					<td class="l-dialog-tl"></td>
					<td class="l-dialog-tc" style="width:400px">
						<div class="l-dialog-tc-inner"
							style="    padding: 3px 0px 0px 5px;border-bottom: 1px solid skyblue;">
							<div class="l-dialog-icon"></div>
							<div class="l-dialog-title">提示信息</div>
							<div class="l-dialog-winbtns" style="width: 22px;">
								<div class="l-dialog-winbtn l-dialog-close" id="closeTop"></div>
							</div>
						</div>
					</td>
					<td class="l-dialog-tr"></td>
				</tr>
				<tr>
					<td class="l-dialog-cl"></td>
					<td class="l-dialog-cc">
						<div class="l-dialog-body" style="width: 390px;">
							<div id="tmsg-class" class="l-dialog-content l-dialog-image-done">
								${message}</div>
						</div>
					</td>
					<td class="l-dialog-cr"></td>
				</tr>
				<tr>
					<td class="l-dialog-bl"></td>
					<td class="l-dialog-bc"></td>
					<td class="l-dialog-br"></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="header navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="brand" href="system/systemIndex.jsp" style="font-size:10px; color:#e6e6e6">
					<img src="system/image/logo.png" alt="logo" width="32" height="32"
					style="margin-top:-3px" /> 跑友体育管理平台
				</a> <a href="javascript:;" class="btn-navbar collapsed"
					data-toggle="collapse" data-target=".nav-collapse"> <img
					src="system/image/menu-toggler.png" alt="" />
				</a>
				<ul class="nav pull-right">
					<%@ include file="../static/systemMessage.html"%>
					<li class="dropdown user"><a class="dropdown-toggle"
						data-toggle="dropdown" style="cursor:pointer"> <!--    <img alt="" src="file/photos/@(currUser.LoginName).jpg" width="32" style="height:32px !important" /> -->
							<span class="username">
								<%
									if (session.getAttribute("user") != null) {
										String uname = ((SystemUserModel) session.getAttribute("user")).getUserName();
										out.print(uname);
									}
								%>
						</span> <i class="icon-angle-down"></i>
					</a>
						<ul class="dropdown-menu">
							<li><a href=""><i class="icon-user"></i> 我的档案 </a></li>
							<li><a href=""><i class="icon-calendar"></i> 我的日程 </a></li>
							<li><a href=""><i class="icon-envelope"></i> 我的消息 </a></li>
							<li><a href=""><i class="icon-tasks"></i> 我的任务 </a></li>
							<li class="divider"></li>
							<li><a href="system/lock.jsp"><i class="icon-lock"></i> 锁定程序 </a></li>
							<li><a href="system/systemLogin.jsp"><i class="icon-key"></i> 注销 </a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="page-container row-fluid">
		<div class="page-sidebar nav-collapse collapse in">
			<ul class="page-sidebar-menu">
				<li>
					<div class="sidebar-toggler hidden-phone"></div>
				</li>
				<li>
					<form class="sidebar-search">
						<div class="input-box">
							<a href="javascript:;" class="remove"></a> <input type="text"
								placeholder="搜索" /> <input type="button" class="submit"
								value=" " />
						</div>
					</form>
				</li>
				<%@ include file="../static/systemMenu.html"%>
			</ul>
		</div>
		<div class="page-content">
			<div id="portlet-config" class="modal hide">
				<div class="modal-header">
					<button data-dismiss="modal" class="close" type="button"></button>
					<h3>portlet Settings</h3>
				</div>
				<div class="modal-body">
					<p>Here will be a configuration form</p>
				</div>
			</div>
			<div class=""  style="float:none !important; padding:0px 10px 10px 10px;">
				<div class="row-fluid">
					<div class="span12">
						<%--              <%@ include file="../static/systemSetting.html" %> --%>
						<%@ include file="../static/systemNav.html"%>
					</div>
				</div>
				<div style="float:none !important; display:block !important;">
					<div class="span12"  style="float:none !important;">
						<div id="ContentMain">
							<!--[if lt IE 9]>
<script src="system/js/excanvas.min.js"></script>
<script src="system/js/respond.min.js"></script>
<![endif]-->
							<script>
								var backTime = 2250;
								var divHeight = 100;
							
								jQuery(document).ready(function() {
									disTopMessage();
									App.init();
							
									$("#closeTop").click(function() {
										$("#top_message").css({
											"top" : "-" + (divHeight + 10) + "px"
										});
									});
							
									$("#logout").click(function() {
										$.ligerDialog.confirm('是否注销？', function(r) {
											if (r)
												location.href = "Home/LoginOut";
										});
									});
							
									$("#top_message").mouseenter(function() {
										clearTimeout(topMTimer);
										$("#top_message").css({
											"top" : "0px"
										});
									});
							
									$("#top_message").mouseleave(function() {
										topMTimer = setTimeout(function() {
											$("#top_message").css({
												"top" : "-" + (divHeight + 10) + "px"
											});
										}, backTime)
									});
							
									if (location.pathname.length > 1)
										$(".page-sidebar-menu a").each(function() {
											if (location.pathname == $(this).attr("href") ||
												location.pathname.substring(1, location.pathname.length) == $(this).attr("href")) {
												//去掉前面的斜杠在检查一次,路径填写时可能会漏掉开头的斜杠
												$(this).parents("li").addClass("active");
											}
										});
								});
							
								var topMTimer;
							
								function disTopMessage(time) {
									var topmsg = $("#top_message .l-dialog-content").html().trim();
									if (!time)
										time = 2250;
									if (topmsg.length > 0) {
										$("#top_message").css({
											"top" : "0px"
										});
										topMTimer = setTimeout(function() {
											$("#top_message").css({
												"top" : "-110px"
											});
										}, time)
									}
								}
							
							    //type:done,error,warn,question
								function addTopMessage(msg, typeClass, time, height) {
									if (!typeClass)
										typeClass = "done";
									if (!height)
										height = 100;
									if (!time)
										time = 2250;
							
									divHeight = height;
									backTime = time;
							
									$("#top_message").css({
										"height" : height + "px"
									});
									$("#tmsg-class").removeClass("l-dialog-image-done");
									$("#tmsg-class").removeClass("l-dialog-image-error");
									$("#tmsg-class").removeClass("l-dialog-image-warn");
									$("#tmsg-class").removeClass("l-dialog-image-question");
									$("#tmsg-class").addClass("l-dialog-image-" + typeClass);
									$("#tmsg-class").html(msg);
									//disTopMessage(time);
									$(".l-dialog-content").css({
										"height" : (height - 100 + 30) + "px"
									});
							
									var topmsg = $("#top_message .l-dialog-content").html().trim();
									if (topmsg.length > 0) {
										$("#top_message").css({
											"top" : "0px"
										});
										topMTimer = setTimeout(function() {
											$("#top_message").css({
												"top" : "-" + (height + 10) + "px"
											});
										}, time)
									}
								}
							</script>