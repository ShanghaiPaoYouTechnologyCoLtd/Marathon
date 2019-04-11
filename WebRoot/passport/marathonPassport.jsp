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
<meta name="viewport"
	content="width=drvice-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
<title>中国马拉松护照</title>
<script src="js/transfromer.js"></script>
<script>
/* 	var local_url = document.location.href;
	var get = local_url.indexOf("?");
	if (get > 0) {
		var get_par = local_url.slice(get);
		if (get_par.indexOf("rid=") > 0) { //有赛事编号，跳转到合作购买链接
			location.href = "passport/marathonPassport_third.jsp" + get_par;
		}
	} */
</script>

<%@ include file="../staticFiles/globalCSS.html"%>
<link href="css/Radio.css" rel="stylesheet">
<link href="css/tools.css" rel="stylesheet">
<link href="passport/passportBuy.css" rel="stylesheet">
<script src="js/jquery.js"></script>
<style>
input[type='radio'] {
	width: 16px;
	height: 16px;
}

#inp-ckb-pas:after, #inp-ckb-vip:after {
	top: 9px;
	left: 3px;
}

#rab_zfb:after, #rab_wechat:after {
	top: 3px;
	left: 2px;
}

#rab_male:after, #rab_female:after {
	top: 6px;
	left: 18px;
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
							<div>
								<div class="kf_overview kf_overview_roster">
									<h6 class="kf_hd1 margin_0">
										<span>中国马拉松护照-办理</span>

										<!-- 	 <a class="prv_btn"
											href="javascript:alert('暂未开放');">批量购买（10人起购）&raquo;</a> -->
									</h6>

								</div>
								<div id="passport-sell">
									<a style="font-size:16px;color: #337ab7;padding-left:20px;"
										href="passport/Instruction/marathonInstructions.jsp">什么是马拉松护照？</a>
									<form class="form-horizontal">
										<div class="form-group title_a">
											<label for="realName" class="col-sm-2 control-label"></label>
											<div class="col-sm-10" style="text-align:right;">
												<a href="passport/marathonPassport_third.jsp"
													style="font-size:13px; display:none">本页面为个人购买页面，如果您是赛事选手购买，点击跳转到赛事合作购买页面。</a>
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
													for="rab_male" style="display:inline;text-indent:1%">男</label>&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="radio" name='sex' id="rab_female" /><label
													for="rab_female" style="display:inline;text-indent:1%">女</label>
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
										<div class="form-group" id="div-races">
											<label for="selectIdType" class="col-sm-2 control-label">*合作赛事</label>
											<div class="col-sm-10">
												<select class="form-control" id="sel_race">
													<option value='-1'>赛事获取中...</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label for="inputAdd" class="col-sm-2 control-label">*收件地址</label>
											<div class="col-sm-10" id="div_address">
												<div data-toggle="distpicker" style="margin-bottom:10px;">
													<select data-province="---- 选择省 ----" id="sel_prov"></select>
													<select data-city="---- 选择市 ----" id="sel_city"></select> <select
														data-district="---- 选择区 ----" id="sel_dist"></select>
												</div>
												<input type="text" class="form-control" id="txt_address"
													placeholder="请填写详细街道信息">
											</div>
										</div>
										<div class="form-group" id="div-buytype">
											<label for="selectIdType" class="col-sm-2 control-label">*购买方式</label>
											<div class="col-sm-10">
												<p>
													<input type="radio" id="inp-ckb-pas" name="inp-ckb-isvip"
														value=0 /> <label for="inp-ckb-pas" class="blink"
														style="display:inline-block !important; text-indent:1%;">单独购买护照（￥50）</label>
												</p>
												<p>
													<input type="radio" id="inp-ckb-vip" name="inp-ckb-isvip"
														value=1 /> <label for="inp-ckb-vip"
														style="display:inline-block !important; text-indent:1%;">成为跑友汇会员赠送护照（优惠价￥49.5<label
														style="text-decoration:line-through; font-size:0.4em; color:#A8A8A8;display:inline-block">99</label>
														/年）
													</label>
												</p>
											</div>
										</div>
										<div class="form-group">
											<label for="selectPaymentMethod"
												class="col-sm-2 control-label">*选择支付方式<br /> (￥<span
												id="sp_price" style="float:none;"></span>)
											</label>
											<div class="col-sm-10">
												<label class="radio-inline" id="lbl_alipay"> <input
													type="radio" name="inlineRadioOptions"
													class="pay-way-radio" id="rab_zfb" value="zhifubao" checked>
													<span> <svg class="icon pay-way-icon"
															aria-hidden="true">
                                                    <use
																xlink:href="#icon-zhifubaozhifu"></use>
                                                </svg>
												</span>
												</label> <label class="radio-inline" id="lbl_wcpay"> <input
													type="radio" name="inlineRadioOptions"
													class="pay-way-radio" id="rab_wechat" value="weixin">
													<span> <svg class="icon pay-way-icon"
															aria-hidden="true">
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
												<!-- 	<p>办理费用50元，包含工本费、快递费、包装费。</p> -->
												<p style="color: #b02126;font-weight: 300;">注：本产品为定制产品，一经购买，非质量问题不可退换。</p>
												本次购买会为您免费生成电子护照,查看<a href="#" style="color:blue">《中国马拉松护照注册协议》</a>。
											</div>
										</div>
										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-10">
												<p style="display:none; color:red; font-size:20px;"
													id="testTitle">本页面用于跑友科技内部测试，订单不具备法律效应！</p>
												<button type="button" style="width:120px"
													class="btn btn-primary" data-toggle="modal" id="btn_buy">立即办理</button>
												<span style="color:red; font-size:14px;" id="sp_btnTitle"></span>
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
				<input id="pay_wechat_fee" name="pay_wechat_fee" value="" /> <input
					id="pay_wechat_tradetype" name="pay_wechat_tradetype" value="1" />
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
										*如果您是赛事选手，您可以前往和作购买页面享受优惠价购买。<br /> *本次购买会为您免费生成电子护照,<a
										href="#">查看电子护照说明</a>。
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
	<script src="js/distpicker/distpicker.data.min.js"></script>
	<script src="js/distpicker/distpicker.min.js"></script>
	<script src="js/iconfont.js"></script>
	<script type="text/javascript" src="js/ajax.js"></script>
	<script type="text/javascript" src="passport/passportOrder.js"></script>
	<script>
		function raceIDSet() {
			if (sessionStorage.rid != null && sessionStorage.rid.length > 0) { //发现会话缓存
				rID = sessionStorage.rid;
			}
			var paraID = getPar("rid");
			if (paraID && paraID != null && paraID.length > 0) { //发现传入参数
				rID = paraID;
				sessionStorage.rid = paraID; //更新参数
			}
			if (paraID == 4) {
				sessionStorage.rid = "";
				rID = "";
				$("#div-races").hide();
			} else {
				$("#div-races").show();
			}
		}
		raceIDSet();
	
		var raceChange = function() {
			$("#div-pack").hide();
			$("#rad-pack-1").prop("checked", true)
			for (var i in races) {
				if (races[i].ID == $("#sel_race").val() && races[i].ID != 4) {
					$("#sp_price").html(races[i].Price.toFixed(2));
					$("#sp-pack-normal-price").html(races[i].Price.toFixed(2));
					var now = new Date();
					var sDate = new Date(parseInt(races[i].StartTime.time));
					var eDate = new Date(parseInt(races[i].EndTime.time));
					if (sDate > now || eDate < now) {
						$("#sp_btnTitle").show();
						$("#btn_buy").html("已截止");
						$("#btn_buy").removeClass("btn-primary");
						$("#btn_buy").addClass("btn-secondary");
						$("#sp_btnTitle").html("*" + races[i].RaceName + "报名已截止,无法购买赛事合作护照。但您可以选择其他赛事继续办理。");
						buyEnable = false;
					} else {
						if (races[i].Pack == 1) { //允许使用礼盒装
							$("#div-pack").show();
						}
						$("#sp_btnTitle").hide();
						$("#btn_buy").html("立即办理");
						$("#btn_buy").removeClass("btn-secondary");
						$("#btn_buy").addClass("btn-primary");
						buyEnable = true;
					}
					break;
				}
			}
		}
	
		var races = {};
		var url = 'getAllRaces.do';
		var params = {
			currentID : rID,
			isAll : 0
		};
		async(url, params, function(res) {
			var result = {};
			if (result != null) {
				if (typeof res == 'string') {
					result = JSON.parse(res);
				} else {
					result = res;
				}
				races = result;
				$("#sel_race").html("");
				var flag = false;
				if (result == null || result.length == 0) {
					$("#sel_race").html("<option value='-2'>没有正在进行的合作赛事</option>");
					$("#sel_race").val(-2);
					$("#sp_btnTitle").show();
					$("#btn_buy").html("未选择赛事");
					$("#btn_buy").removeClass("btn-primary");
					$("#btn_buy").addClass("btn-secondary");
					$("#sp_btnTitle").html("*当前没有正在进行的合作赛事，您可以<a href='passport/marathonPassport.jsp' style='color:blue'>点击返回个人办理页面</a>继续办理！");
					return;
				}
				for (var i in result) {
					$("#sel_race").append("<option value='" + result[i].ID + "'>" + result[i].RaceName + "</option>")
					if (!flag && rID == result[i].ID)
						flag = true;
				}
				if (rID == null || rID.length == 0)
					flag = true; //传入空ID，搜索所有
				if (!flag) {
					$("#sel_race").html("<option value='-1'>未找到您对应的赛事,请重新操作！！</option>");
					$("#sel_race").val(-1);
					$("#sp_btnTitle").show();
					$("#btn_buy").html("无法办理");
					$("#btn_buy").removeClass("btn-primary");
					$("#btn_buy").addClass("btn-secondary");
					$("#sp_btnTitle").html("*未找到您对应的赛事，请返回您跳转前的马拉松网站重新操作，或联系工作人员！");
				} else if (rID != -1) {
					$("#sel_race").val(rID);
				}
				raceChange();
			} else {
				$("#sel_race").html("赛事加载失败！");
			}
		}, function() {
			$("#sel_race").html("赛事加载失败！");
		}, 'POST');
	
		$("#sel_race").change(raceChange);
	
		$("#inp-ckb-pas").change(buytupeChange);
		$("#inp-ckb-vip").change(buytupeChange);
	
		function buytupeChange() {
			if ($("#inp-ckb-pas").is(":checked")) {
				$("#sp_price").html("50.00");
			} else {
				$("#sp_price").html("49.50");
			}
		}
	</script>
</body>
</html>

