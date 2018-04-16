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

<title>中国马拉松护照</title>
<%@ include file="../staticFiles/globalCSS.html"%>
<script src="js/jquery.js"></script>
<script src="js/iconfont.js"></script>
<link rel="stylesheet" type="text/css"
	href="css/jquery.toastmessage.css" />
<style>
select {
	width: 24%;
	margin-right: 10px;
	height: 34px;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857143;
	color: #555;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 4px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	-webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow
		ease-in-out .15s;
	-o-transition: border-color ease-in-out .15s, box-shadow ease-in-out
		.15s;
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
	display: inline-block;
	vertical-align: middle;
}

.title_a a:hover {
	color: blue;
	text-decoration: underline;
}
</style>
</head>

<body>
	<div class="kode_wrapper">
		<%@ include file="../staticFiles/head.html"%>
		<div class="kode_content_wrap section">
			<div class="kf_shoppage">
				<div class="container">
					<div class="row">
						<aside class="col-md-3">
							<!--Widget category Start-->
							<div class="widget widget_category2">
								<!--Heading 5 Start-->
								<div class="kf_h5">
									<h5>中国马拉松护照</h5>
								</div>
								<div class="kf_border-2">
									<%@ include file="../staticFiles/passportMenu.html"%>
								</div>
								<div style="clear:both;"></div>
							</div>
						</aside>
						<div class="col-md-9 kf_shop_wrap">
							<div style="display:block;">
								<div class="kf_overview kf_overview_roster">
									<h6 class="kf_hd1 margin_0">
										<span>中国马拉松护照-购买</span> <a class="prv_btn"
											href="javascript:alert('暂未开放');">批量购买（10人起购）&raquo;</a>
									</h6>
								</div>
								<div id="passport-sell">
									<form class="form-horizontal">
							<!-- 			<div class="form-group title_a">
											<div class="col-sm-10" style="text-align: center;">
												<a href="passport/marathonPassport_third.jsp"
													style="font-size:12px; ">本页面为个人购买页面，如果您是赛事选手购买，点击跳转到赛事购买页面。</a>
											</div>
										</div> -->
										<div class="form-group">
											<label for="realName" class="col-sm-2 control-label">*真实姓名</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="txt_uname"
													placeholder="请填写您的真实姓名">
											</div>
										</div>
										<div class="form-group">
											<label for="realName" class="col-sm-2 control-label">*性
												别</label>
											<div class="col-sm-10">
												<input type="radio" name='sex' checked id="rab_male" /><label
													for="rab_male" style="display:inline;">男</label>&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="radio" name='sex' id="rab_female" /><label
													for="rab_female" style="display:inline;">女</label>
											</div>
										</div>
										<div class="form-group">
											<label for="selectIdType" class="col-sm-2 control-label">*证件类型</label>
											<div class="col-sm-10">
												<select class="form-control" id="sel_cardtype">
													<option value='1'>身份证</option>
													<option value='2'>护照</option>
													<option value='3'>港澳通行证</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label for="inputID" class="col-sm-2 control-label">*证件号</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="txt_cardno"
													placeholder="请填写您的证件号">
											</div>
										</div>
										<div class="form-group">
											<label for="inputTel" class="col-sm-2 control-label">*联系电话</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="txt_phone"
													placeholder="请填写您联系电话">
											</div>
										</div>
										<div class="form-group">
											<label for="inputAdd" class="col-sm-2 control-label">*收件地址</label>
											<div class="col-sm-10">
												<div data-toggle="distpicker" style="margin-bottom:10px;">
													<select data-province="---- 选择省 ----" id="sel_prov"></select>
													<select data-city="---- 选择市 ----" id="sel_city"></select> <select
														data-district="---- 选择区 ----" id="sel_dist"></select>
												</div>
												<input type="text" class="form-control" id="txt_address"
													placeholder="请填写详细街道信息">
											</div>
										</div>
										<div class="form-group">
											<label for="selectPaymentMethod"
												class="col-sm-2 control-label">*选择支付方式(￥50.00)</label>
											<div class="col-sm-10">
												<label class="radio-inline"> <input type="radio"
													name="inlineRadioOptions" class="pay-way-radio"
													id="rab_zfb" value="zhifubao" checked> <span>
														<svg class="icon pay-way-icon" aria-hidden="true">
                                                    <use
																xlink:href="#icon-zhifubaozhifu"></use>
                                                </svg>
												</span>
												</label> <label class="radio-inline"> <input type="radio"
													name="inlineRadioOptions" class="pay-way-radio"
													id="rab_wechat" value="weixin"> <span> <svg
															class="icon pay-way-icon" aria-hidden="true">
                                                    <use
																xlink:href="#icon-weixinzhifu1"></use>
                                                </svg>
												</span>
												</label>
											</div>
										</div>
										<div class="form-group">
											<label for="selectPaymentMethod"
												class="col-sm-2 control-label"></label>
											<div class="col-sm-10">
												<p style="color: #b02126;font-weight: 300;">注：本产品为定制产品，一经购买，不可退换。</p>
											</div>
										</div>
										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-10">
												<button type="button" onclick="confirmPopOrderInfo()"
													class="btn btn-primary passport-sell-btn">去购买</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
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
			<form name='wechatpay' action='tradePages/wechatpay.jsp'
				method='post' target="_self" id="payWechatform" style="display:none">
				<input id="pay_wechat_QRCode" name="pay_wechat_QRCode" value="" />
				<input id="pay_wechat_tradeno" name="pay_wechat_tradeno" value="" />
				<input id="pay_wechat_fee" name="pay_wechat_fee" value="" />
			</form>
			<%@ include file="../staticFiles/foot.html"%>
		</div>
		<%@ include file="../staticFiles/globalScript.html"%>
		<script src="js/distpicker/distpicker.data.min.js"></script>
		<script src="js/distpicker/distpicker.min.js"></script>
		<script src="js/iconfont.js"></script>
		<script type="text/javascript" src="js/jquery.toastmessage.js"></script>
		<script type="text/javascript" src="js/ajax.js"></script>
		<script>
			var params;
			function confirmPopOrderInfo() {
				$("#div_loading").show();
		
				var url = 'order.do';
				if (!getOrderParams())
					return;
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
							if (data.payType == 1) { //支付宝支付
								var serialNum = data.serialNum;
								var payFee = data.payFee;
								$('#WIDout_trade_no').val(serialNum);
								$('#WIDtotal_amount').val(payFee);
								document.getElementById("payform").submit(); //付款
								return;
							} else { //微信支付
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
						} else {
							var message = result.message;
							message = message ? message : '订单提交失败!';
							showRequestMessage('notice', message);
						}
					} else {
						var message = result.message;
						if (message == "您已报名,请勿重复提交!") {
							$(".div_title_already").show();
							$(".pop_prompt_body").hide();
							$(".mask").show();
							$(".pop_prompt_title").hide();
							$("#zc_pop_prompt").show();
						} else {
							message = message ? message : '订单提交失败!';
							showRequestMessage('notice', message);
						}
					}
					$(".purchase_submit").show();
					$("#div_loading").hide();
				}, function() {
					$("").hide();
					$("#div_loading").show();
					showRequestMessage('notice', '请检查您的网络!');
				}, 'POST');
			}
		
			function getOrderParams() {
				var userName = $("#txt_uname").val();
				var sex = $("#rab_male").is(":checked") ? 1 : 2;
				var cardType = $("#sel_cardtype").val();
				var cardNo = $("#txt_cardno").val();
				var phoneNo = $("#txt_phone").val();
				var coName = "paoyou";
				var province = $("#sel_prov").val();
				var city = $("#sel_city").val();
				var district = $("#sel_dist").val();
				var address = $("#txt_address").val();
				var purcahseType = "";
				var payTtpe = $("#rab_zfb").is(":checked") ? 1 : 2;
		
				var telReg = /^(([0\+]\d{2,3}-)?(0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/;
				var cardNumReg = /(^\d{15}$)|(^\d{17}([0-9]|X)$)/;
				var mobileReg = /^\d{7,11}$/;
				if (userName == null || userName.length <= 0) {
					showRequestMessage('notice', "请填写姓名！");
					return false;
				}
		
				if (isNaN(cardType)) {
					showRequestMessage('notice', "请选择证件类型！");
					return false;
				}
		
				if (!cardNumReg.test(cardNo)) {
					showRequestMessage('notice', "请填写正确的证件号！");
					return false;
				}
		
				if (!(mobileReg.test(phoneNo.trim()) || telReg.test(phoneNo.trim()))) {
					showRequestMessage('notice', "请填写正确的手机号！");
					return false;
				}
		
				if (province == null || province.length <= 0) {
					showRequestMessage('notice', "请选择省份！");
					return false;
				}
		
				if (city == null || city.length <= 0) {
					showRequestMessage('notice', "请选择城市！");
					return false;
				}
		
				if (address == null || address.length <= 4) {
					showRequestMessage('notice', "详细地址不能少于5个字符！");
					return false;
				}
		
		
				params = {
					userName : userName,
					sex : sex,
					cardType : cardType,
					cardNo : cardNo,
					phoneNo : phoneNo,
					payType : payTtpe,
					purcahseType : purcahseType,
					coName : coName,
					province : province,
					district : district,
					address : address,
					city : city
				};
				return true;
			}
		</script>
</body>
</html>

