<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML>
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0 minimal-ui" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black">

<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="images/splash/splash-icon.png">
<link rel="apple-touch-icon-precomposed" sizes="180x180"
	href="images/splash/splash-icon-big.png">
<link rel="apple-touch-startup-image"
	href="images/splash/splash-screen.png"
	media="screen and (max-device-width: 320px)" />
<link rel="apple-touch-startup-image"
	href="images/splash/splash-screen@2x.png"
	media="(max-device-width: 480px) and (-webkit-min-device-pixel-ratio: 2)" />
<link rel="apple-touch-startup-image"
	href="images/splash/splash-screen-six.png"
	media="(device-width: 375px)">
<link rel="apple-touch-startup-image"
	href="images/splash/splash-screen-six-plus.png"
	media="(device-width: 414px)">
<link rel="apple-touch-startup-image" sizes="640x1096"
	href="images/splash/splash-screen@3x.png" />
<link rel="apple-touch-startup-image" sizes="1024x748"
	href="images/splash/splash-screen-ipad-landscape"
	media="screen and (min-device-width : 481px) and (max-device-width : 1024px) and (orientation : landscape)" />
<link rel="apple-touch-startup-image" sizes="768x1004"
	href="images/splash/splash-screen-ipad-portrait.png"
	media="screen and (min-device-width : 481px) and (max-device-width : 1024px) and (orientation : portrait)" />
<link rel="apple-touch-startup-image" sizes="1536x2008"
	href="images/splash/splash-screen-ipad-portrait-retina.png"
	media="(device-width: 768px)	and (orientation: portrait)	and (-webkit-device-pixel-ratio: 2)" />
<link rel="apple-touch-startup-image" sizes="1496x2048"
	href="images/splash/splash-screen-ipad-landscape-retina.png"
	media="(device-width: 768px)	and (orientation: landscape)	and (-webkit-device-pixel-ratio: 2)" />
<link href="css/bootstrap.min.css" />
<title>中国马拉松护照首页</title>

<link rel="stylesheet" href="css/wechartcommon.css">

</head>
<body>
	<div class="container-wapper">
		<div class="bg-img">
			<img src="images/wechart/bg.png">
		</div>

		<!-- 展示页 start -->
		<!-- <div class="passport-wapper" id="passport-info">
			<div class="passport-show-wapper"></div>
			<div class="button-group">
				<button id="intro-passport-btn">介绍</button>
				<button id="handle-passport-btn">办理</button>
			</div>
		</div> -->
		<!-- 展示页 end -->

		<!-- 购买护照表单 start -->
		<div class="passport-wapper" id="passport-form">
			<div class="passport-show-wapper">
				<form>
					<div class="form-input">
						<input type="text" placeholder="请输入您的姓名">
					</div>
					<div class="form-input">
						<label for="sex"> <input type="radio" name="sex" checked><span>男</span>
						</label> <label for="sex"> <input type="radio" name="sex"><span>女</span>
						</label>
					</div>
					<div class="form-input">
						<select>
							<option value="0">请选择您的证件类型</option>
							<option value="1">身份证</option>
							<option value="2">护照</option>
						</select>
					</div>
					<div class="form-input">
						<input type="text" placeholder="请输入您的证件号">
					</div>
					<div class="form-input">
						<input type="text" placeholder="请输入您的手机号">
					</div>
					<div class="form-input">
						<input type="text" placeholder="请选择您的收货地址">
					</div>
					<div class="form-input" style="border: none;">
						<input type="text" placeholder="请输入您的详细地址">
					</div>
				</form>
			</div>

			<div class="button-group">
				<button id="buy-passport">确认办理(￥50/本 含快递费包装费)</button>
			</div>

			<!-- 确认订单信息弹框 start -->
			<div class="pay-way">
				<div class="pay-way-wapper">
					<div class="header-wap">
						<p>
							<img src="images/wechart/check1.png" alt="审核信息">
						</p>
					</div>
					<div class="info-wap">
						<ul>
							<li class="title-li">姓名:</li>
							<li>杨雨琪</li>
						</ul>
						<ul>
							<li class="title-li">性别:</li>
							<li>女</li>
						</ul>
						<ul>
							<li class="title-li">证件号:</li>
							<li>520203199404141129</li>
						</ul>
						<ul>
							<li class="title-li">联系电话:</li>
							<li>15629030582</li>
						</ul>
						<ul>
							<li class="title-li">支付金额:</li>
							<li>50元</li>
						</ul>
					</div>
					<div class="button-group confirm-wap">
						<button id="btn-edit">返回修改</button>
						<button id="btn-pay">去付款</button>
					</div>
				</div>
			</div>
			<!-- 确认订单信息弹框 end -->
		</div>
		<!-- 购买护照表单 end -->

		<!-- 底部图标 start -->
		<div class="footer">
			<img class="logo-center" src="images/wechart/py.png">
		</div>
		<!-- 底部图标 end -->
		<script src="js/jquery.js"></script>
		<script>
			$(function() {
				$("#buy-passport").click(function() {
					$(".pay-way").show();
				});
		
				$("#btn-edit").click(function() {
					$(".pay-way").hide();
				});
			});
		</script>
	</div>
</body>



































