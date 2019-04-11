<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String QRCodeUrl = request.getParameter("pay_wechat_QRCode");
	String tradeNo = request.getParameter("pay_wechat_tradeno");
	String payFee = request.getParameter("pay_wechat_fee");
	String tradeType = request.getParameter("pay_wechat_tradetype");
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>中国马拉松护照购买-微信支付</title>
<link rel="stylesheet" type="text/css"
	href="css/jquery.toastmessage.css" />
<link rel="stylesheet" href="css/wechatpay.css" />
<script type="text/javascript" src="js/jquery-2.1.1.js"></script>
<script type="text/javascript" src="js/jquery.toastmessage.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="js/jquery.qrcode.min.js"></script>
<style>
.toast-position-middle-center {
	top: 30% !important;
}

.div_reload {
	z-index: 100;
	position: absolute;
	top: 30%;
	left: 200px;
	font-size: 22px;
	font-weight: bold;
	cursor: pointer;
	display: none;
}
</style>
</head>
<body>

	<div class="main">
		<div class="w">
			<!-- order 订单信息 -->
			<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
			<div class="order clearfix order-init order-init-oldUser-noQr">
				<!-- 订单信息 -->
				<div class="o-left">
					<h3 class="o-title">
						订单提交成功，请尽快付款！订单号：<%=tradeNo%></h3>

					<p class="o-tips">
						<span class="o-tips-time" id="deleteOrderTip"></span>

					</p>
				</div>
				<!-- 订单信息 end -->
				<!-- 订单金额 -->
				<div class="o-right">
					<div class="o-price">
						<em>应付金额</em><strong><%=payFee%></strong><em>元</em>
					</div>
					<div class="o-detail"></div>
				</div>
				<!-- 订单金额 end -->
				<div class="o-list j_orderList" id="listPayOrderInfo">
					<!-- 单笔订单 -->

					<!-- 多笔订单 end -->
				</div>
			</div>
			<!-- payment 支付方式选择 -->
			<div class="payment">
				<!-- 微信支付 -->
				<div class="pay-weixin">
					<div class="p-w-hd">
						<img src="/Marathon/images/wcpay_logo.png" />
					</div>
					<div class="p-w-bd" style="position:relative">
						<div class="j_weixinInfo"
							style="position:absolute; top: -26px; left: 130px; font-size:14px;">
							请在<span id="sp_seconds" style="color:red; font-weight:bold;">60</span>秒内操作，逾时则需要刷新二维码。
						</div>
						<div class="p-w-box">
							<div class="pw-retry j_weixiRetry"
								style="display: block !important;">
								<div class="pw-box-hd">
									<div id="qrcode"></div>
									<input type="hidden" value="<%=QRCodeUrl%>" id="qrcode_val" />
								</div>
								<div class="div_reload">
									<a style="color: white !important;">点击刷新二维码</a>
								</div>
							</div>
							<div class="pw-box-ft">
								<p>请使用微信扫一扫</p>
								<p>扫描二维码支付</p>
							</div>
							<p
								style="font-size:17px; color:blue; font-weight:bold; cursor:pointer; margin-top:15px;margin-left:50px;">
								<a style=" text-decoration:underline;" id="link_send">我已成功支付，立即跳转</a>
							</p>
						</div>
						<div class="p-w-sidebar"></div>
					</div>
				</div>
				<!-- 微信支付 end -->
				<!-- payment-change 变更支付方式 -->
				<div class="payment-change">
					<a class="pc-wrap" onclick="window.history.go(-1)"> <i
						class="pc-w-arrow-left">&lt;</i> <strong>返回上一页</strong>
					</a>
				</div>
				<!-- payment-change 变更支付方式 end -->
			</div>
			<!-- payment 支付方式选择 end -->
		</div>
		<script>
			var maxSeconds = 60;
			var i = 0;
			var currInterval;
			var timerInterval;
			var tradeType = "<%=tradeType%>"; //1护照购买 2补领快递费
			$(function() {
				$("#qrcode").qrcode({
					render : "table", //table方式
					width : 300, //宽度
					height : 300, //高度
					text : $("#qrcode_val").val() //任意内容
				});
		
				i = maxSeconds;
				currInterval = setInterval("checkPayStatus(false)", 1500);
				timerInterval = setInterval("timer()", 1000);
		
				$("#link_send").click(function() {
					checkPayStatus(true);
				});
		
				$(".div_reload").click(function() {
					i = maxSeconds;
					$(".div_reload").hide();
					$("#qrcode").show();
					currInterval = setInterval("checkPayStatus(false)", 1000);
					timerInterval = setInterval("timer()", 1000);
				});
			});
		
			function timer() {
				$("#sp_seconds").html(i--);
				if (i < 0) {
					$(".div_reload").show();
					$("#qrcode").hide();
					clearInterval(currInterval);
					clearInterval(timerInterval);
				}
			}
		
			function checkPayStatus(isTitle) {
				var url = 'payCheck.do';
				var params = {
					tradeNo : "<%=tradeNo%>",
					tradeType : tradeType
				};
				async(url, params, function(res) {
					var result = {};
					if (typeof res == 'string') {
						result = JSON.parse(res);
					} else {
						result = res;
					}
					var status = result.status;
					if (status == 'ok') { //购买成功
						var data = result.data;
						if (data) {
							if (data.payStatus == 0) {
								if (isTitle)
									showRequestMessage('notice', "尚未获取到支付信息,请稍候重试或联系客服人员。");
							} else {
								window.location = "tradePages/marathonPassportSuccess.jsp?tradeType=" + tradeType;
							}
						} else {
							var message = result.message;
							message = message ? message : '状态查询失败!';
							showRequestMessage('notice', message);
						}
					} else {
						message = message ? message : '状态查询失败!';
						if (isTitle)
							showRequestMessage('notice', message);
					}
				}, function() {
					showRequestMessage('notice', '请检查您的网络!');
				}, 'POST');
			}
		</script>
	</div>
</body>
</html>
