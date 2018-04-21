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
<link rel="stylesheet" type="text/css"
	href="css/jquery.toastmessage.css" />
<link rel="stylesheet" href="css/general.css" />
<link rel="stylesheet" href="css/purchase.css?v=20180310" />
<script type="text/javascript" src="js/jquery-2.1.1.js"></script>
<script type="text/javascript" src="js/jquery.toastmessage.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="js/md5.js"></script>
<script type="text/javascript" src="js/purcahse.js?v=20180310"></script>
</head>
<body>
	<div class='mask'></div>
	<div class="purchaser_body">
		<div class='pop_prompt' id='zc_pop_prompt'>
			<div class='pop_prompt_header'>
				<div class='pop_prompt_title'>核对您的信息</div>
			</div>
			<input id="purcahseType" value="" style="display: none" />
			<div class="div_title_already">
				<p style="font-size:28px; margin-top:60px;">您已拥有中国马拉松护照</p>
				<p style="font-size:17px;">
					下载中国马拉松赛事联盟APP<BR />查看您的电子护照，享受更多权益
				</p>
				<p style="margin-top:40px;">
					<a href="purchase_success.jsp?t"
						style="padding: 10px 15px;background-color: #1E2B5B;color: #fff;font-size: 16px;border-radius: 4px;">点击下载APP</a>
					<br /> <br /> <a id="link_cancel"
						style="cursor:pointer;font-size:16px;">取消</a>
				</p>
			</div>
			<div class='pop_prompt_body'>
				<div class="pop_prompt_row">
					<div class='pull-left col-xs-2'>姓名：</div>
					<div class='pull-left col-xs-6' id='pop_username'></div>
					<div class='pull-left col-xs-2'>性别：</div>
					<div class='pull-left col-xs-2' id='pop_usersex'></div>
					<div class="clearfix"></div>
				</div>
				<div class="pop_prompt_row">
					<div class='pull-left'>
						<span id='pop_usercardname'>身份证号</span>：
					</div>
					<div class='pull-left' style="width: 225px;" id='pop_usercardno'></div>
					<div class="clearfix"></div>
				</div>
				<div class="pop_prompt_row">
					<div class='pull-left'>联系电话：</div>
					<div class='pull-left' style="width: 225px;" id='pop_usertel'></div>
					<div class="clearfix"></div>
				</div>
				<div class="pop_prompt_row" style="margin-top: 18px;">
					<div class='pull-left pop_prompt_btn btn_cancel'
						onclick="concelPopOrderInfo()">修改</div>
					<div class='pull-right pop_prompt_btn btn_confirm'
						onclick="confirmPopOrderInfo()">确认无误</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
		<div class="purchase_container">
			<div class='purchase_header'>
				<img src="images/banner.png" />
			</div>
			<div class='purchase_content'>
				<h3 class="purchase_content_title">护照基本信息填写</h3>
				<div class="purchase_content_body center-block">
					<form class="form-horizontal" role="form" onsubmit="return false;">
						<div class="form-group">
							<label for="username" class="col-xs-2 control-label">姓名*</label>
							<div class="col-xs-10">
								<input type="text" class="form-control" id="username"
									placeholder="请输入您的真实姓名">
							</div>
						</div>
						<div class="form-group">
							<label for="usersex" class="col-xs-2 control-label">性别*</label>
							<div class="col-xs-10">
								<div class='usersex pull-left selected' _code='1'
									style="margin-right: 30px;">
									<img class="pull-left" src="images/radio_selected.png">
									<div class="pull-left">男</div>
									<div class="clearfix"></div>
								</div>
								<div class='usersex pull-left' _code='2'>
									<img class="pull-left" src="images/radio_blank.png">
									<div class="pull-left">女</div>
									<div class="clearfix"></div>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
						<div class="form-group">
							<label for="usercertificate" class="col-xs-2 control-label">证件类型*</label>
							<div class="col-xs-10">
								<select class="form-control" id='cardType'>
									<option selected value="1">身份证</option>
									<option value="2">台胞证</option>
									<option value="3">护照</option>
									<option value="4">军官证</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="usersex" class="col-xs-2 control-label">证件号*</label>
							<div class="col-xs-10">
								<input type="text" class="form-control" id="cardNo"
									placeholder="请填写您的证件号">
							</div>
						</div>
						<div class="form-group">
							<label for="usertel" class="col-xs-2 control-label">联系电话*</label>
							<div class="col-xs-10">
								<input type="text" class="form-control" id="phoneNo"
									placeholder="请填写您的联系方式">
							</div>
						</div>
						<div class="form-group">
							<label for="usertel" class="col-xs-2 control-label purchaseType">
								选择购买方式<br> (¥<span id='lbl_realPrice'>23.00</span>/本)*
							</label>
							<div class="col-xs-10">
								<input type='radio' id='rad_pay_ali' name='payWay' checked /> <img
									src='images/alipay_logo.png'
									style="width: 80px; margin-right:20px"> <input
									type='radio' id='rad_pay_wechat' name='payWay' /> <img
									src='images/wcpay_logo.png' width='120' height='35' />
							</div>
						</div>
						<div class='noticeTip'>
							注：中国田径协会指导价为28元/本&nbsp;&nbsp; <span id='lbl_discount'>组委会回馈北京长跑节参赛选手的优惠价为23元/本</span>
						</div>
						<div class="form-group text-center">
							<div id="alarmPrivate" class='div_alarmTitle'>
								警告！！该链接为内部测试连接，订单不具备法律效应！！！任何操作均视为无效！</div>
							<button class='btn purchase_submit' onclick='submitOrder()'>购买</button>
							<a id='link_queryStatus'
								style='display:block; cursor:pointer; color:#25abee; font-size:14px; margin:15px 0px 20px 0px;'
								onclick='queryPassport()'>查询是否已购买</a>
							<div id="div_loading">
								<img src="/Marathon/images/loading.gif" /><br /> 正在获取，请稍候
							</div>
							<div id="alarmError" class='div_alarmTitle'>
								参数错误！请返回上级网站重新输入，或重新复制正确完整的连接进入！</div>
							<div id="alarmError2" class='div_alarmTitle' style="font-size:16px; margin-bottom:20px">
								<span id="gameName"></span>报名已截至！<br/>如果您依旧希望购买马拉松护照，可访问中国
								<a href="http://www.caa-paoyou.com/passport/marathonInstructions.jsp">马拉松赛事联盟官网</a>进行购买。<br/></div>
						</div>
					</form>
				</div>
			</div>
			<div style='width: 86%;' class='center-block'>
				<div class='noticeTip'
					style="width: 64%;margin: auto;color: #808080;">
					<div class="pull-left" style="width: 7%;">说明：</div>
					<div class="pull-left" style="width: 93%;">
						仅本赛事报名成功者可在本页面进行购买，若未报名成功、违规报名或被禁赛者，核实信息后将进行退款</div>
					<div class="clearfix"></div>
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
		<div id="request-time-record">
			<!-- <img src='images/loading.gif' width='20px' /> -->
		</div>
	</div>
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
			id="pay_wechat_fee" name="pay_wechat_fee" value="" />
	</form>
</body>
</html>
