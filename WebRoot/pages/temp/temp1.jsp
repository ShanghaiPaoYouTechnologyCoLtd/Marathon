<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<!DOCTYPE html>
<html>
<head>

<base href="<%=basePath%>" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>我要上奥运细则说明</title>
<%@ include file="../../staticFiles/globalCSS.html"%>
<script src="js/jquery.js"></script>
</head>

<body>
	<div class="kode_wrapper">
		<%@ include file="../../staticFiles/head.html"%>
		<div class="kode_content_wrap section">
			<div class="kf_shoppage">
				<div class="container" style="width:100%; text-align:center">
				<img src="extra-images/olympics/info.png"/>
				</div>	
			</div>
		</div>
		<%@ include file="../../staticFiles/foot.html"%>
	</div>
	<%@ include file="../../staticFiles/globalScript.html"%>
</body>
</html>


