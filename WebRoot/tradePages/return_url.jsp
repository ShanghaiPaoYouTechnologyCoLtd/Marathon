<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>中国马拉松护照支付成功</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="中国马拉松护照">
	<meta http-equiv="description" content="中国马拉松护照">
	<meta name="format-detection" content="telephone=no" />
	<meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="wap-font-scale" content="no"><!-- 防止浏览器字体修改 -->
	<link rel="stylesheet" href="css/bootstrap.min.css" />
	<link rel="stylesheet" href="css/general.css" />
	<link rel="stylesheet" href="css/purchase.css" />
	<script type="text/javascript" src="js/jquery-2.1.1.js" ></script>
</head>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Map"%>
<%@ page import="com.alipay.config.*"%>
<%@ page import="com.alipay.api.*"%>
<%@ page import="com.alipay.api.internal.util.*"%>
<%
/* *
 * 功能：支付宝服务器同步通知页面
 * 日期：2017-03-30
 * 说明：
 * 以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 * 该代码仅供学习和研究支付宝接口使用，只是提供一个参考。


 *************************页面功能说明*************************
 * 该页面仅做页面展示，业务逻辑处理请勿在该页面执行
 */
 
	//获取支付宝GET过来反馈信息
	Map<String,String> params = new HashMap<String,String>();
	Map<String,String[]> requestParams = request.getParameterMap();
	for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
		String name = (String) iter.next();
		String[] values = (String[]) requestParams.get(name);
		String valueStr = "";
		for (int i = 0; i < values.length; i++) {
			valueStr = (i == values.length - 1) ? valueStr + values[i]
					: valueStr + values[i] + ",";
		}
		//乱码解决，这段代码在出现乱码时使用
		valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
		params.put(name, valueStr);
	}
	
	boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type); //调用SDK验证签名

	//——请在这里编写您的程序（以下代码仅作参考）——
	if(signVerified) {
		//商户订单号
		String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
	
		//支付宝交易号
		String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
	
		//付款金额
		String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"),"UTF-8");

		//out.println("trade_no:"+trade_no+"<br/>out_trade_no:"+out_trade_no+"<br/>total_amount:"+total_amount);
		//String redirect="purchase_success.jsp";
		//out.print("<script>window.top.location.href='"+redirect+"'</script>");
	}else {
		//out.println("验签失败");
	}
	//——请在这里编写您的程序（以上代码仅作参考）——
%>
<body>
<div class="purchase_container">
			<div class='purchase_header'>
				<img src="images/banner.png"/>
			</div>
			<div class='purchase_content purchaseok_content'>
				<div class="purchaseok_content_header text-center">
					<img  class='pull-left'src="images/pay_success.png">
					<div class="pull-left">付款成功</div>
					<div class="clearfix"></div>
				</div>
				<div class="purchase_content_body center-block text-center">
					<p class='purchaseok_content_descr'>
						您已成功购买中国马拉松护照~护照将打包在赛事包内，请注意查看！
					</p>
					<p class='purchaseok_content_descr'>
						您可以下载「中国马拉松赛事联盟」官方APP查看您的电子护照
					</p>
					<p class='purchaseok_content_descr'>
						还可以获取更多护照相关权益
					</p>
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
				<div class="pull-left"><img src='images/company_logo.png'></div>
				<div class="pull-left customer_tel_container">客服电话：<span>021-50897802</span></div>
				<div class="clearfix"></div>
			</div>
		</div>
</body>
</html>