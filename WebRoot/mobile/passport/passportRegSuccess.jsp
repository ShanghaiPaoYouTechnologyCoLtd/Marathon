<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>恭喜您注册成功！</title>
<meta name="viewport"
	content="width=drvice-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style>
img {
	max-width: 100%;
}

* {
	margin: 0px;
	padding: 0px;
}

.above {
	width: 90%;
	margin: 10% auto;
	height: 200px;
	text-align: center;
	color:#3a4880;
}

.above h3 {
	font-size: 1.75em;
	color:#212d5c;
}

.spark {
	width: 80%;
}

button {
	width: 70%;
	font-size:0.80em;
	color: #fff;
	background-color: #212d5c;
	border-color: #212d5c;
	display: inline-block;
	padding: 10px 14px;
	font-size: 14px;
	font-weight: 400;
	line-height: 1.42857143;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	-ms-touch-action: manipulation;
	touch-action: manipulation;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	background-image: none;
	border: 1px solid transparent;
	border-radius: 4px;
}

#mask {
	width: 100%;
	height: 100%;
	min-height: 400px;
	min-width: 300px;
	background: #2b2b2b;
	opacity: 0.9;
	position: absolute;
	z-index: 99998;
	display: none;
	right: 0px;
	top: 0px;
}

#cover {
	position: absolute;
	z-index: 99999;
	right: 0px;
	top: 10px;
	display: none;
	width: 90%;
}

.simg {
	width: 25%;
	margin-left: 37.5%;
}

body {
	background: url(images/mobile/bg1.png) no-repeat;
	background-size: 100% 100%;
}
</style>
</head>

<body>
	<img src="extra-images/weixin-cover.png" id="cover" />
	<div id="mask"></div>
	<div style="padding-top:30px;">
		<img src="images/mobile/regsuccess.png" class="simg" />
	</div>
	<div class="above">
		<h3>恭喜您注册成功</h3>
		<p style="margin-bottom:35px;"><br />下载中国马拉松赛事联盟APP<br/>查看您的中国马拉松电子护照与积分,享受您的护照权益！<br /> <br /></p>
		<button onclick="downApp()">中国马拉松赛事联盟APP下载</button>
		<br />
		<button onclick="toOrder()" style="background:#B01F24; margin-top:25px">中国马拉松护照纸质版办理</button>
	</div>
	<br>
	<script>
		function toOrder() {
			var paras = location.href.substr(location.href.indexOf("?"));
			location.href = "mobile/passport/passportOrder.jsp" + paras;
		}
	
		function userAgent() {
			var sUserAgent = navigator.userAgent.toLowerCase();
	
			var o = {};
			o.isIpad = /ipad/i.test(sUserAgent);
			o.isIpod = /ipod/i.test(sUserAgent);
			o.isIphone = /iphone os/i.test(sUserAgent);
			o.isUc7 = /rv:1.2.3.4/i.test(sUserAgent);
			o.isUc = /ucweb/i.test(sUserAgent);
			o.isAndroid = /android/i.test(sUserAgent);
			o.isWM = /windows mobile/i.test(sUserAgent);
	
			o.isPhone = o.isIphone || o.isAndroid || o.isWM || o.isUc7 || o.isUc;
			o.isMobile = o.isIpad || o.isPhone || o.isAndroid;
			o.isPc = !o.isMobile;
			o.isIOS = o.isIpad || o.isIphone || o.isIpod;
	
			return o;
		}
	
		function isWeiXin() {
			//window.navigator.userAgent属性包含了浏览器类型、版本、操作系统类型、浏览器引擎类型等信息，这个属性可以用来判断浏览器类型
			var ua = window.navigator.userAgent.toLowerCase();
			//通过正则表达式匹配ua中是否含有MicroMessenger字符串
			if (ua.match(/MicroMessenger/i) == 'micromessenger') {
				return true;
			} else {
				return false;
			}
		}
	
		function downApp() {
			var uagent = userAgent();
			if (uagent.isIOS) {
				//alert("ios");
				window.location.href = "http://itunes.apple.com/cn/app/jie-zou-da-shi/id1297179847?mt=8";
			} else if (uagent.isAndroid) {
				if (isWeiXin()) {
					document.getElementById('mask').style.width = document.documentElement.clientWidth;
					document.getElementById('mask').style.height = document.documentElement.clientHeight;
					document.getElementById('mask').style.display = "block";
					document.getElementById('cover').style.display = "block";
				} else {
					window.location.href = "app/androiddownload.html";
				}
			} else {
				alert("请使用移动端设备！");
			}
		}
	</script>
</body>
</html>
