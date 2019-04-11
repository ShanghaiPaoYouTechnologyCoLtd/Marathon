<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<base href="<%=basePath%>" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<title>测试支付</title>
<script src="js/jquery.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
</head>
<body>
	<div class="index_box">
		<div class="apply_name">微信支付中转页面，请不要刷新或退出。</div>
	</div>
	<%
		String code = request.getParameter("code");
		String payfee = request.getParameter("payfee");
		String title = request.getParameter("title");
		String tradeno = request.getParameter("tradeno");
		String tradetype = request.getParameter("tradetype");
	%>
	<input type="hidden" id="codeReal" value="<%out.print(code);%>" />
	<input type="hidden" id="payfee" value="<%out.print(payfee);%>" />
	<input type="hidden" id="title" value="<%out.print(title);%>" />
	<input type="hidden" id="tradetype" value="<%out.print(tradetype);%>" />
	<input type="hidden" id="tradeno" value="<%out.print(tradeno);%>" />
	<script type="text/javascript">
		window.onload = function() {
			pay();
		}
	
		var appid,
			timeStamp,
			nonceStr,
			pg,
			signType,
			paySign;
		function onBridgeReady() {
			var tradeType = $("#tradetype").val();
			WeixinJSBridge.invoke(
				'getBrandWCPayRequest', {
					"appId" : appid, //公众号名称，由商户传入       
					"timeStamp" : timeStamp, //时间戳，自1970年以来的秒数       
					"nonceStr" : nonceStr, //随机串       
					"package" : "prepay_id=" + pg,
					"signType" : signType, //微信签名方式:       
					"paySign" : paySign //微信签名   
				},
				function(res) {
					if (res.err_msg == "get_brand_wcpay_request:ok") {
						location.href = "tradePages/marathonPassportSuccess.jsp?tradeType=" + tradeType;
					} else if (res.err_msg == "get_brand_wcpay_request:cancel") {
						alert('支付取消');
						history.back();
					} else if (res.err_msg == "get_brand_wcpay_request:fail") {
						alert('支付失败');
						history.back();
					}
				}
			);
		}
		function pay() {
			var code = $("#codeReal").val();
			var payfee = $("#payfee").val();
			var title = $("#title").val();
			var tradeNo = $("#tradeno").val();
			payfee = payfee.replace(".0", "").replace(".00",  ""); //微信以分为单位，不需要小数点后位数，否则报错invalid total_fee
			var path = "commonPay.do?payfee=" + payfee + "&title=" + title + "&code=" + code + "&tradeno=" + tradeNo;
			send_request(code, function(value) {
				var json = "";
				try {
					json = eval("(" + value + ")");
				} catch (err) {
					//alert("格式不正确！获取数据：" + value)
				}
				if (json.length > 0) {
					appid = json[0].appid;
					timeStamp = json[0].timeStamp;
					nonceStr = json[0].nonceStr;
					pg = json[0].pg;
					signType = json[0].signType;
					paySign = json[0].paySign;
					if (typeof WeixinJSBridge == "undefined") {
						if (document.addEventListener) {
							document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
						} else if (document.attachEvent) {
							document.attachEvent('WeixinJSBridgeReady', onBridgeReady);
							document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
						}
					} else {
						onBridgeReady();
					}
				}
			}, path);
		}
		function send_request(code, callback, urladdress) {
			var params = {
				"code" : code
			};
			async(urladdress, params, function(res) {
				callback(res);
			}, function() {
				alert("错误");
			}, 'GET');
		}
	
	
		/* 		var url = "commonPay.do";
				var params = {
					"code" : $("#code").val()
				};
				async(url, params, function(res) {
				    $("#res").html(res);
				}, function() {
		
				}, 'POST'); */
	</script>
</body>
</html>
