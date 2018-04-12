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

<title>中国马拉松护照</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="中国马拉松护照">
<meta http-equiv="description" content="中国马拉松护照">
<meta name="format-detection" content="telephone=no" />
<meta name="viewport"
	content="width=device-width,initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="wap-font-scale" content="no">
<!-- 防止浏览器字体修改 -->
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/general.css" />
<link rel="stylesheet" href="css/purchase.css" />
<script type="text/javascript" src="js/jquery-2.1.1.js"></script>
</head>
<body>
	<div class="purchase_container">
		<div class='purchase_header'>
			<img src="images/banner.png" />
		</div>
		<div class='purchase_content purchaseok_content'>
			<div id="div_head" class="purchaseok_content_header text-center"
				style="display:none">
				<img class='pull-left' src="images/pay_success.png">
				<div class="pull-left">付款成功</div>
				<div class="clearfix"></div>
			</div>
			<div class="purchase_content_body center-block text-center"
				style="margin-top:20px;">
				<p class='purchaseok_content_descr' id="title2" style="display:none;">
					您已成功购买中国马拉松护照~护照将打包在赛事包内，请注意查看！</p>
				<p class='purchaseok_content_descr'>
					下载「中国马拉松赛事联盟」官方APP查看您的电子护照</p>
				<p class='purchaseok_content_descr'>还可以获取更多护照相关权益</p>
				<div class="QRcode_container">
					<div class="QRcode">
						<img src="images/qr_code.png">
					</div>
					<div class="QRDescr">
						<p class='purchaseok_content_descr'>扫描二维码下载</p>
						<p class='purchaseok_content_descr'>「中国马拉松赛事联盟」官方APP</p>
					</div>
				</div>
			</div>
		</div>
		<div class='purchase_footer center-block'>
			<div class="pull-left">
				<img src='images/company_logo.png'>
			</div>
			<div class="pull-left customer_tel_container">
				客服电话：<span>021-50897802-601</span>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<script>
		window.onload = function() {
			if (location.search == null || location.search.length == 0) {
				document.getElementById("div_head").style.display = "block";
				document.getElementById("title2").style.display = "block";
			}
		}
	</script>
</body>
</html>
