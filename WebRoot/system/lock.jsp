<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<title>跑友管理平台 | 屏幕锁定</title>
<base href="<%=basePath%>" />
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<%@ include file="static/systemCSS.html"%>
<link rel="shortcut icon" href="media/image/favicon.ico" />
</head>

<body>
	<div class="page-lock">
		<div class="page-logo">
			<a class="brand"> <img src="media/image/logo_withtext4.png"
				alt="logo" width="200" height="50" />
			</a>
		</div>
		<div class="page-body">
			<img class="page-lock-img" src="File/photos/@(Model.LoginName).jpg"
				alt="" width="200" height="200">
			<div class="page-lock-info">
				<h1>@Model.Name</h1>
				<span> <a href="mailto:@(Model.Email)" style="color:#fff">@Model.Email</a>
				</span> <span> <em> @{ if (ViewBag.UnLockMsg == null ||
						ViewBag.UnLockMsg.Length <= 0) { <span style="color: #fafafa">锁定中...</span>
						} else { string msg=ViewBag.UnLockMsg; @Html.Label(msg, new {
						style = "color:red" }) } }
				</em>
				</span>
				<form class="form-search" method="post" action="/Home/UnLock"
					onsubmit="javascript:return pwdEncryption()">
					<div class="input-append">
						<input type="password" class="m-wrap" placeholder="输入密码"
							id="unlockpword" name="unlockpword">
						<button type="submit" class="btn blue icn-only">
							<i class="m-icon-swapright m-icon-white"></i>
						</button>
					</div>
					<div class="relogin">
						<a href="Home/Login">不是@(Model.Name)?</a>
					</div>
				</form>
			</div>
		</div>
		<div class="footer-inner"></div>
	</div>
	<script src="system/js/jquery-1.10.1.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="system/js/jquery-migrate-1.2.1.min.js"
		type="text/javascript" charset="utf-8"></script>
	<script src="system/js/jquery-ui-1.10.1.custom.min.js"
		type="text/javascript" charset="utf-8"></script>
	<script src="system/js/bootstrap.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="system/js/jquery.slimscroll.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="system/js/jquery.blockui.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="system/js/jquery.cookie.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="system/js/jquery.uniform.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="system/js/app.js"></script>
	<script src="system/js/golbleVariable.js"></script>
	<script src="system/ligerUI/js/core/base.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="system/ligerUI/js/plugins/ligerDrag.js"
		type="text/javascript" charset="utf-8"></script>
	<script src="system/ligerUI/js/plugins/ligerDialog.js"
		type="text/javascript" charset="utf-8"></script>
	<script src="js/ajax.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/jquery.toastmessage.js"></script>
	<script>
		jQuery(document).ready(function() {
			Lock.init();
		});
	
		function pwdEncryption() {
			$("#unlockpword").val(hex_md5($("#unlockpword").val()));
			return true;
		}
	</script>
</body>
</html>