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

.modal-body table {
	font-size: 17px;
}

.modal-body table td {
	border: none !important;
	border-top: 1px solid #dddddd !important;
	padding-top: 7px;
}

.modal-body table tr td:first-child {
	text-align: right;
	width: 25%;
}

.td_title {
	text-align: left;
	font-size: 14px;
	line-height: 20px;
	color: red;
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
										<span>中国马拉松护照-购买</span>
										<!-- 	 <a class="prv_btn"
											href="javascript:alert('暂未开放');">批量购买（10人起购）&raquo;</a> -->
									</h6>
								</div>
								<div id="passport-sell">
									<form class="form-horizontal">
										<div class="form-group title_a">
											<label for="realName" class="col-sm-2 control-label"></label>
											<div class="col-sm-10">
												<a href="passport/marathonPassport_third.jsp"
													style="font-size:13px; ">本页面为个人购买页面，如果您是赛事选手购买，点击跳转到赛事合作购买页面。</a>
											</div>
										</div>
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
												<button type="button" style="width:120px"
													class="btn btn-primary" data-toggle="modal" id="btn_buy">购买</button>
												<!-- 	<button type="button" onclick="confirmPopOrderInfo()"
													class="btn btn-primary passport-sell-btn">去购买</button> -->
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
			<!-- Modal -->
			<div class="modal fade" id="div_infoCheck" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalCenterTitle"
				aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLongTitle">请确认您的信息正确无误</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<table>
								<tr>
									<td>姓名：</td>
									<td><span id="sp_info_name"></span></td>
								</tr>
								<tr>
									<td>性别：</td>
									<td><span id="sp_info_sex"></span></td>
								</tr>
								<tr>
									<td>证件类型：</td>
									<td><span id="sp_info_cardtype"></span></td>
								</tr>
								<tr>
									<td>证件号：</td>
									<td><span id="sp_info_cardno"></span></td>
								</tr>
								<tr>
									<td>联系电话：</td>
									<td><span id="sp_info_phone"></span></td>
								</tr>
								<tr>
									<td>收件地址：</td>
									<td><span id="sp_info_address"></span></td>
								</tr>
								<tr>
									<td>支付方式：</td>
									<td><span id="sp_info_paytype"></span></td>
								</tr>
								<tr>
									<td colspan="2" class="td_title">*本购买为个人购买，护照会寄送到您填写的地址。<br />
										*如果您是赛事选手，您可以前往和作购买页面享受优惠价购买。
										*合作购买的护照将会发送到赛事场地，您须前往赛事场地指定地点领取护照。
									</td>
								</tr>
							</table>
						</div>
						<div class="modal-footer">
							<div style="display:none" id="div_loading">
								<img src="images/loading.gif" /> 正在加载,清稍后...
							</div>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">返回修改</button>
							<button type="button" class="btn btn-primary"
								onclick="confirmPopOrderInfo()">提交购买</button>
						</div>
					</div>
				</div>
			</div>
			<%@ include file="../staticFiles/foot.html"%>
		</div>
	</div>
	<%@ include file="../staticFiles/globalScript.html"%>
	<script src="js/distpicker/distpicker.data.min.js"></script>
	<script src="js/distpicker/distpicker.min.js"></script>
	<script src="js/iconfont.js"></script>
	<script type="text/javascript" src="js/jquery.toastmessage.js"></script>
	<script type="text/javascript" src="js/ajax.js"></script>
	<script type="text/javascript" src="passport/passportOrder.js"></script>
</body>
</html>

