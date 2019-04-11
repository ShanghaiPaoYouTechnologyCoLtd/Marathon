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
<%@ include file="../staticFiles/globalCSS.html"%>
<script src="js/jquery.js"></script>
<script src="js/iconfont.js"></script>
<link rel="stylesheet" type="text/css"
	href="css/jquery.toastmessage.css" />
<link href="passport/passportBuy.css" rel="stylesheet">
</head>

<body style="display:none">
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
										<span>中国马拉松护照-办理(赛事合作)</span>
										<!-- 	 <a class="prv_btn"
											href="javascript:alert('暂未开放');">批量购买（10人起购）&raquo;</a> -->
									</h6>
								</div>
								<div id="passport-sell">
									<form class="form-horizontal">
										<div class="form-group title_a">
											<label for="realName" class="col-sm-2 control-label"></label>
											<div class="col-sm-10">
												<span style="font-size:13px; color:red">*赛事合作购买的护照将会发送到赛事场地，您须前往赛事场地指定地点领取护照。</span>
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
											<label for="selectIdType" class="col-sm-2 control-label">*合作赛事</label>
											<div class="col-sm-10">
												<select class="form-control" id="sel_race">
													<option value='-1'>赛事获取中...</option>
												</select>
											</div>
										</div>
										<div class="form-group" id="div-pack">
											<label for="selectPaymentMethod"
												class="col-sm-2 control-label">*选择包装<br />
											</label>
											<div class="col-sm-10" id="div-pack2">
												<input type="radio" name='rad-pack' checked id="rad-pack-1" value="0"/><label
													style="margin-left: 10px; margin-right: 30px;"
													for="rad-pack-1"><img
													src="images/paylogo/pack1.png" width="45" height='60'>
													平装版（<span id="sp-pack-normal-price" style="float:none">28</span>元）</label><input
													type="radio" name='rad-pack' id="rad-pack-2"  value="0"/><label
													for="rad-pack-2" style="margin-left: 10px; "> <img
													src="images/paylogo/pack2.png" width="80" height='60'>精装版（50.00元）
												</label>
											</div>
										</div>
										<div class="form-group">
											<label for="selectPaymentMethod"
												class="col-sm-2 control-label">*选择支付方式<br /> (￥<span
												id="sp_price" style="float:none;">50.00</span>)
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
												<p style="color: #b02126;font-weight: 300;">
													注：本产品为定制产品，一经购买，非质量问题不可退换。<br />
													您须前往赛事场地指定地点领取护照,如您未在赛事场地领取，则视为放弃。<br />
													如有疑问，请咨询客服：021-50897802-615<br/>
													本次购买会为您免费生成电子护照,查看<a href="#" style="color:blue">《中国马拉松护照注册协议》</a>。
												</p>
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
									<td>合作赛事：</td>
									<td><span id="sp_info_address"></span></td>
								</tr>
								<tr>
									<td>支付方式：</td>
									<td><span id="sp_info_paytype"></span></td>
								</tr>
								<tr>
									<td colspan="2" class="td_title">*本购买赛事合作购买,护照将会发送到赛事场地。<br />
										*您须前往赛事场地指定地点领取护照。 *如您未在赛事场地领取，则视为放弃。<br />
										*本次购买会为您免费生成电子护照,<a href="#">查看电子护照说明</a>。
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
	<script type="text/javascript" src="js/jquery.toastmessage.js"></script>
	<script type="text/javascript" src="js/ajax.js"></script>
	<script type="text/javascript" src="passport/passportOrder.js"></script>
	<script>
		var raceChange = function() {
			$("#div-pack").hide();
			$("#rad-pack-1").prop("checked", true)
			for (var i in races) {
				if (races[i].ID == $("#sel_race").val()) {
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
	
		function raceIDSet() {
			if (sessionStorage.rid != null && sessionStorage.rid.length > 0) { //发现会话缓存
				rID = sessionStorage.rid;
			}
			var paraID = getPar("rid");
			if (paraID && paraID != null && paraID.length > 0) { //发现传入参数
				rID = paraID;
				sessionStorage.rid = paraID; //更新参数
			}
		}
		raceIDSet();
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
	
		$("#div-pack2").click(function() {
			if ($("#rad-pack-1").is(":checked")) {
				$("#sp_price").html($("#sp-pack-normal-price").html());
			} else {
				$("#sp_price").html("50.00");
			}
		});
	</script>
</body>
</html>

