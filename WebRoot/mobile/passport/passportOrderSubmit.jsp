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

<title>提交订单</title>
<meta name="viewport"
	content="width=drvice-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="中国马拉松护照">
<meta http-equiv="description" content="中国马拉松护照是中国田径协会官方认证的材料">
<link rel="stylesheet" href="css/jquery.toastmessage.css" />
<style>
* {
	margin: 0px;
	padding: 0px;
	font-size: 20px;
	font-family: SimHei;
}

td {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

body {
	height: 100%;
}

#head {
	background: url(images/mobile/head.png) no-repeat;
	width: 100%;
	height: 80px;
	background-size: 100% 100%;
}

#head table {
	height: 100%;
}

#head tbody, #head tr, #head td {
	height: 100%;
}

#head tr td:nth-child(1) {
	width: 70%;
	font-size: 20px;
	color: #fff;
	text-indent: 5%;
}

#head tr td:nth-child(1) span, #head tr td:nth-child(1) img {
	vertical-align: middle;
}

#head tr td:nth-child(2), #head tr td:nth-child(3) {
	width: 15%;
}

#head tr td:nth-child(2) img, #head tr td:nth-child(3) img {
	width: 75%;
}

#main {
	background-color: #f8f8f8;
}

#main td, #main table, #main p, #main span {
	font-size: 16px;
}

#foot {
	position: fixed;
	bottom: 0px;
	height: 68px;
	width: 100%;
	background-color: #fff;
}

.foot-fixer {
	height: 88px;
}

#foot table {
	width: 100%;
	height: 100%;
}

#foot table tr td:nth-child(1) {
	width: 65%;
	text-indent: 5%;
	font-size: 22px;
}

#foot table tr td:nth-child(2) {
	width: 35%;
}

#foot button {
	width: 100%;
	height: 100%;
	background-color: #212D59;
	border: none;
	color: #fff;
}

#main .address {
	width: 90%;
	height: 70px;
	margin: 0px auto;
	table-layout: fixed;
}

#main .address tr {
	height: 50%;
}

.address-cont {
	background-color: #fff;
	height: 90px;
	width: 100%;
}

.address-border {
	width: 100%;
	height: 10px;
	background: url(images/mobile/border-bg.png) repeat-x;
	background-size: 17%;
}

.pp-info {
	width: 100%;
	height: 200px;
	background: #fff;
	height: 190px;
	margin-top: 20px;
	padding-top: 20px;
}

.pp-info table {
	width: 90%;
	margin: 0px auto;
	height: 150px;
}

.pp-info table tr {
	height: 20%
}

.pp-info table td {
	font-size: 16px !important;
	white-space: nowrap;
}

.pp-info table td:nth-child(1) {
	color: #aeaeae;
}

.pp-info table td:nth-child(2) {
	width: 100%;
}

.pp-title {
	margin-bottom: 10px;
	background-color: #1F2D61;
	width: 10px;
	white-space: nowrap;
	text-indent: 17px;
	margin-left: 2px;
}

.pp-tip {
	margin-top: 25px;
	width: 100%;
	color: #D6B492;
	text-align: center;
	font-size: .62rem !important;
	width: 100%;
}

.payblock {
	margin-top: 20px;
	width: 100%;
	height: 90px;
	background-color: #fff;
	width: 100%;
}

.payblock table {
	width: 90%;
	margin-left: 5%;
	height: 100%;
}

.payblock td {
	font-size: 0.56rem !important;
	color: #aeaeae !important;
	line-height: 0.88rem;
}

.payblock tr {
	height: 50%;
}

.payblock h5 {
	font-size: 0.8rem;
	font-weight: normal;
	color: #000;
}

.payblock hr {
	position: absolute;
	width: 100%;
	margin-top: 44px;
	height: 1px;
	border: none;
	border-top: 1px solid #d7d7d7;
}

.loading {
	width: 100%;
	height: 140px;
	text-align: center;
	font-size: 16px !important;
	display: none;
}

#sp-add-title, #sp-add-title a {
	font-size: 0.55rem !important;
	color: #D6B492 !important;
}

#sp-add-title {
	display: none;
}
</style>
</head>

<body>
	<div id="head">
		<table>
			<tr>
				<td id="link-back" onclick="javascript:history.back()"><img
					src="images/tools/left.png" width="20" height="20" /><span>订单信息确认</span></td>
				<td><img src="extra-images/logs/caa.png" /></td>
				<td><img src="extra-images/logs/CML2.png" style="width:55%" /></td>
			</tr>
		</table>
	</div>
	<div id="main">
		<div class="address-cont">
			<table class="address">
				<tr>
					<td rowspan="2" style="width:10%;"><img src="images/local.png"
						width="25" height="25" style="margin-top:5px;"></td>
					<td>收货人： <span id="inp-name"></span></td>
					<td style="text-align:right" id="inp-phone"></td>
				</tr>
				<tr>
					<td colspan="2"
						style="line-height:22px;white-space:normal !important;"><span
						id="sp-stype">收货地址</span>：<span id="inp-address"></span><br /> <span
						id="sp-add-title">合作赛事办理需要在赛事现场领取，<a target="_blank"
							href="passport/marathonQA.jsp#div-qid1">点击查看详情</a></span></td>
				</tr>
			</table>
		</div>
		<div class="address-border"></div>
		<div class="pp-info">
			<div class="pp-title">
				<p>商品信息</p>
			</div>
			<div class="loading">
				<img src="images/loading/Preloader_8.gif" style="margin-top:20px" /><br />正在为您创建订单
			</div>
			<table>
				<tr>
					<td>商品&nbsp;&nbsp;&nbsp;&nbsp;：</td>
					<td id="inp-good">中国马拉松护照</td>
				</tr>
				<tr>
					<td>姓名&nbsp;&nbsp;&nbsp;&nbsp;：</td>
					<td id="inp-name2"></td>
				</tr>
				<tr>
					<td>性别&nbsp;&nbsp;&nbsp;&nbsp;：</td>
					<td id="inp-sex"></td>
				</tr>
				<tr>
					<td>证件类型：</td>
					<td id="inp-cardtype"></td>
				</tr>
				<tr>
					<td>证件号&nbsp;&nbsp;：</td>
					<td id="inp-card"></td>
				</tr>
			</table>
		</div>
		<p class="pp-tip">注：本产品为定制产品，一经购买，非质量问题不可退换。</p>
		<div class="payblock">
			<hr />
			<table>
				<tr style="border:1px red solid;" id="tr-apay">
					<td><img src="images/paylogo/apay_small.png" width="25"
						height="25" /></td>
					<td style="width:100%;padding-left:5%"><h5>支付宝支付</h5>跳转到支付宝APP支付或登录支付宝支付<br />“中国马拉松赛事联盟”公众号可微信支付</td>
					<td><img src="images/tools/selected.png" width="18"
						height="18" data-val="1" class="payimg" /></td>
				</tr>
				<tr id="tr-wpay">
					<td><img src="images/paylogo/wpay_small.png" width="25"
						height="25" /></td>
					<td style="width:100%;padding-left:5%"><h5>微信支付</h5>支持安装微信6.0.2及以上版本的APP<br />使用浏览器打开本页面可支付宝支付</td>
					<td><img src="images/tools/unselect.png" width="18"
						height="18" data-val="2" class="payimg" /></td>
				</tr>
			</table>
		</div>
		<div class="foot-fixer"></div>
	</div>
	<div id="foot">
		<table>
			<tr>
				<td>待支付：<span style="color:#A3302D" id="sp-price">￥50.00</span></td>
				<td>
					<button id="btn-pay">去支付</button>
				</td>
			</tr>
		</table>
	</div>
	<form name='alipayment' action='tradePages/alipay.trade.page.pay.jsp'
		method='post' target="_self" id="payform" style="display:none">
		<input id="WIDout_trade_no" name="WIDout_trade_no" value="" /> <input
			id="WIDsubject" name="WIDsubject" value="" /> <input
			id="WIDtotal_amount" name="WIDtotal_amount" value="0" /> <input
			id="WIDbody" name="WIDbody" value="" />
	</form>
	<form name='wechatpay' action='tradePages/wechatpay.jsp' method='post'
		target="_self" id="payWechatform" style="display:none">
		<input id="pay_wechat_QRCode" name="pay_wechat_QRCode" value="" /> <input
			id="pay_wechat_tradeno" name="pay_wechat_tradeno" value="" /> <input
			id="pay_wechat_fee" name="pay_wechat_fee" value="" /> <input
			id="pay_wechat_tradetype" name="pay_wechat_tradetype" value="1" />
	</form>
	<script src="js/jquery.js"></script>
	<script src="js/ajax.js"></script>
	<script src="js/commonTools.js"></script>
	<script src="js/jquery.toastmessage.js"></script>
	<script>
		var isWechartOpen = false; //false;
	
		var raceID = -1;
		var orderInfo = {
			userName : "",
			sex : "",
			cardType : "",
			cardNo : "",
			phoneNo : "",
			payType : "",
			purcahseType : "",
			coName : "",
			province : "",
			district : "",
			address : "",
			city : "",
			test : "",
			commonpay : "",
			racename : "",
			isvip : ""
		};
	
		var img_sele = "images/tools/selected.png";
		var img_unsele = "images/tools/unselect.png";
	
		$(function() {
			isWechartOpen = isWeiXin();
	
			if (isWechartOpen) { //公众号打开，禁用支付宝相关功能
				orderInfo.payType = 2;
				$("#tr-wpay .payimg").attr("src", img_sele);
				$("#tr-apay .payimg").attr("src", img_unsele);
				$("#tr-apay").hide();
				$(".payblock hr").hide();
			} else {
				$("#tr-wpay").hide();
				$(".payblock hr").hide();
			}
	
			getPara();
	
			$(".payblock tr").click(function() {
				$(".payimg").attr("src", img_unsele);
				$(this).find(".payimg").attr("src", img_sele);
				orderInfo.payType = $(this).find(".payimg").data("val");
			});
	
			$("#btn-pay").click(function() {
				toOrder();
			});
		});
	
		function toOrder() {
			readyToPay(1);
	
			var url = 'order.do';
			async(url, orderInfo, function(res) {
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
						if (data.payType == 1) { //支付宝支付
							var serialNum = data.serialNum;
							var payFee = data.payFee;
							var title = data.title;
							$('#WIDout_trade_no').val(serialNum);
							$('#WIDtotal_amount').val(payFee);
							$('#WIDsubject').val(title);
							document.getElementById("payform").submit(); //付款
							return;
						} else { //微信支付
							if (isWechartOpen) {
								var returnUrlPara = "payfee%3D" + data.payFee + "%26title%3D" + data.title + "%26tradeno%3D" + data.serialNum + "%26tradetype%3D" + 1;
								location.href = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxd7036ba1c611afa6&redirect_uri=http%3A%2F%2Fwww.chinesemarathonleague.com%2Fpassport%2FmarathonPassport_wechat.jsp%3F" + returnUrlPara + "&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect";
							} else {
								var QRUrl = data.QRUrl;
								if (QRUrl == "QRCODE_ERROR") {
									alert("微信支付链接生成失败！请检查网络稍后再试！");
								} else {
									$("#pay_wechat_QRCode").val(QRUrl);
									$("#pay_wechat_tradeno").val(data.serialNum);
									$("#pay_wechat_fee").val(data.payFee);
									document.getElementById("payWechatform").submit(); //微信付款页面
									return;
								}
							}
						}
					} else {
						var message = result.message;
						message = message ? message : '订单提交失败!';
						showRequestMessage('notice', message);
					}
				} else {
					var message = result.message;
					if (message.indexOf("您已报名") >= 0) {
						showRequestMessage('notice', "您已拥有或办理护照,请勿重复提交!");
						readyToPay(0);
					} else {
						message = message ? message : '订单提交失败!';
						showRequestMessage('notice', message);
						readyToPay(0);
					}
				}
			}, function() {
				showRequestMessage('notice', '请检查您的网络!');
				readyToPay(0);
			}, 'POST');
		}
	
		//step 0:初始状态
		//step 1:准备支付，创建订单
		function readyToPay(step) {
			switch (step) {
			case 0:
			default:
				$(".pp-info table").show();
				$(".pp-info .loading").hide();
				$("#btn-pay").html("去支付");
				$("#btn-pay").css({
					"background-color" : "#212D59"
				});
				$(".payblock hr").show();
				$(".payblock tr").show();
				break;
			case 1:
				$(".pp-info table").hide();
				$(".pp-info .loading").show();
				$("#btn-pay").html("创建中");
				$("#btn-pay").css({
					"background-color" : "#aeaeae"
				});
				$(".payblock hr").hide();
				$(".payimg[src='" + img_unsele + "']").parents("tr").hide();
				break;
			}
	
			if (isWechartOpen) {
				$("#tr-apay").hide();
				$(".payblock hr").hide();
			}
		}
	
		function getPara() {
			var raceID = getPar("sel_race");
			with(orderInfo){
			address = getPar("info-address");
			province = getPar("info-province");
			city = getPar("info-city");
			district = getPar("info-district");
			commonpay = isWechartOpen ? 1 : 0;
			payType = isWechartOpen ? 2 : 1;
			userName = getPar("info-name");
			sex = getPar("rad-sex");
			cardType = getPar("info-cardtype");
			cardNo = getPar("info-card");
			phoneNo = getPar("info-phone");
			test = getPar("istest");
			purcahseType = 50; //默认50
			coName = raceID;
			isvip = getPar("isvip");
	
	
			if (test) {
				purcahseType = 0.1;
			} else {
				purcahseType = getPar("info-payfee");
				if (isNaN(purcahseType)) {
					purcahseType = 50;
				}
	
				if (isvip == 1) {
					purcahseType = 49.5;
					$("#inp-good").html("跑友汇VIP（含护照一本）");
				}
			}
			$("#sp-price").html("￥" + moneyFormat(purcahseType));
			}
	
			setPara();
		}
	
		function moneyFormat(m) {
			if (isNaN(m))
				return "0.00";
	
			if (m.toString().indexOf(".") >= 0)
				return m;
	
			return parseInt(m).toFixed(2);
		}
	
		function setPara() {
			with(orderInfo){
			$("#inp-name").html(userName);
			$("#inp-name2").html(userName);
			$("#inp-phone").html(phoneNo);
			$("#inp-address").html(province + city + district + address);
			/* if (orderType == -1) {
							$("#inp-address").html(province + city + district + address);
						} else {
							$("#inp-address").html(racename);
						} */
			$("#inp-sex").html(sex == 1 ? "男" : "女");
			$("#inp-cardtype").html(cardType == 1 ? "身份证" : "护照");
			$("#inp-card").html(cardNo);
			}
		}
	</script>
</body>
</html>
