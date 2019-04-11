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

<title>未领取护照补领取</title>
<%@ include file="../staticFiles/globalCSS.html"%>
<script src="js/jquery.js"></script>
<script src="js/iconfont.js"></script>
<style>
.text h2 a {
	font-size: 14px;
}
</style>
<style>
select {
	width: calc(21% + 7px);
	margin-right: 7px;
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

#frmLeft {
	width: calc(50% - 20px);
	float: left;
}

#frmRight {
	width: 50%;
	float: right;
}

#frmMain {
	transition: all 1500ms;
	-moz-transition: all 1500ms;
	-webkit-transition: all 1500ms;
	-o-transition: all 1500ms;
}

#frmRight .form-control {
	width: 70% !important;
}

#frmRight .form-group label {
	text-align: right;
}

.form-group {
	margin-bottom: 45px !important;
}

.radio-inline {
	padding-left: 0px !important;
}

.pay-way-radio {
	margin-left: 0px !important;
}

.table-bordered {
	width: 340px !important;
	margin: 10px 0px 0px 67px;
}

.inpCardno {
	width: 407px;
	float: left;
	margin-right: 10px;
}

@media ( max-width : 620px) {
	#frmRight {
		
	}
	.bigBlock {
		width: 98% !important;
	}
	.separateBlock img {
		width: 80px;
		height: 80px;
	}
	.separateBlock {
		padding-top: 20px;
	}
	.separateBlock a {
		margin-top: 10px;
	}
	.table-bordered {
		width: 100% !important;
		margin: 10px 0px 0px 0px;
	}
	.inpCardno {
		width: calc(70% - 5px);
		float: left;
		margin-right: 5px;
	}
	#basic-addon1 {
		display: none;
	}
	#frmLeft button {
		width: calc(15% - 5px);
		font-size: 12px;
		padding-left: 3%;
	}
	#txt_uname {
		border-radius: 4px;
	}
	.form-group label {
		float: left;
		width: 26%;
		min-width: 84px;
		margin-top: 7px;
	}
	select {
		width: 21%;
		margin-right: 3px;
		font-size: 12px;
		padding-left: 2px;
	}
	.form-group {
		padding-top: 0px !important;
		margin-top: 0px !important;
		margin-bottom: 10px !important;
	}
	#frmRight {
		font-size: 12px !important;
	}
	.pay-way-icon {
		width: 100% !important;
		height: 30px;
		margin-top: 10px;
		margin-left: 8px;
	}
	.form-group button {
		width: 30% !important;
		height: 32px !important;
		font-size: 14px !important;
		margin-top: 20px !important;
	}
	#lbl_wechatpay {
		margin-left: 4px;
	}
	#txt_address {
		margin-left: 23%;
	}
	.payIcon label {
		margin: 0px;
		margin-right: 0px !important;
		width: 30%;
	}
	.payIcon input {
		top: 4px;
		right: -20px;
	}
	.payIcon .col-sm-10 {
		height: 30px;
	}
	#lbl_zfb {
		margin-left: -17px;
	}
	#lbl_wechatpay {
		margin-left: 22px;
	}
	#frmMain {
		transition: all 500ms;
		-moz-transition: all 500ms;
		-webkit-transition: all 500ms;
		-o-transition: all 500ms;
	}
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
								<!--Heading 5 End-->
								<div class="kf_border-2">
									<%@ include file="../staticFiles/passportMenu.html"%>
								</div>
							</div>
							<!--Widget category End-->
						</aside>
						<div class="col-md-9 kf_shop_wrap">
							<!-- possport info start -->
							<div class="kf_overview kf_overview_roster">
								<!--Heading 1 Start-->
								<h6 class="kf_hd1 margin_0">
									<span>未领取护照补领</span>
								</h6>
								<!--Heading 1 End-->
							</div>

							<!--Featured 2 thumb Start-->
							<div class="kf_featured_thumb">
								<div class="text_wrper">
									<div class="text">
										<h2>
											<a href="javascript:;">Q:什么是未领取护照？</a>
										</h2>
										<p>A:未领取护照是指选手在网站或其他途径购买了赛事合作护照后，没有在赛事现场领取的护照。</p>
									</div>
									<div class="text">
										<h2>
											<a href="javascript:;">Q：补领护照需要什么条件？</a>
										</h2>
										<p>A：赛事现场未领取的护照发回至中国马拉松赛事联盟后，工作人员会将数据录入，未领取的选手则可在下方查询框中查询到自己的未领取护照信息。填写地址并缴纳快递费用后即可重新领取。</p>
									</div>
									<form class="form-search" id="frmMain"
										style="padding-left:20px; margin-bottom:20px;width: 200%;overflow: hidden;">
										<div id="frmLeft">
											<div class="input-group inpCardno">
												<span class="input-group-addon" id="basic-addon1">证件号</span>
												<input type="text" class="form-control" placeholder="请输入证件号"
													id="cardno" aria-describedby="basic-addon1">
											</div>
											<div>
												<button class="btn btn-primary" type="button" id="btnQuery">查询</button>
												<button type="button" class="btn" disabled id="btnReceive">补领</button>
											</div>
											<table class="table table-bordered">
												<tr>
													<td style="width:35%">姓名：</td>
													<td id="td_name"></td>
												</tr>
												<tr>
													<td>购买赛事：</td>
													<td id="td_race"></td>
												</tr>
												<tr>
													<td>购买时间：</td>
													<td id="td_date"></td>
												</tr>
												<tr>
													<td>是否领取：</td>
													<td id="td_isr"></td>
												</tr>
											</table>
										</div>
										<div id="frmRight">
											<div class="form-group">
												<label for="realName" class="col-sm-2 control-label">*真实姓名</label>
												<div class="col-sm-10">
													<input type="text" class="form-control" id="txt_uname"
														placeholder="请填写您的真实姓名">
												</div>
											</div>
											<div class="form-group">
												<label for="inputTel" class="col-sm-2 control-label">*联系电话</label>
												<div class="col-sm-10">
													<input type="text" class="form-control" id="txt_phone"
														placeholder="请填写您联系电话">
												</div>
											</div>
											<div class="form-group" style="padding-top: 45px;">
												<label for="inputAdd" class="col-sm-2 control-label">*收件地址</label>
												<div class="col-sm-10">
													<div data-toggle="distpicker" style="margin-bottom:10px;">
														<select data-province="---- 选择省 ----" id="sel_prov"></select>
														<select data-city="---- 选择市 ----" id="sel_city"></select>
														<select data-district="---- 选择区 ----" id="sel_dist"></select>
													</div>
													<input type="text" class="form-control" id="txt_address"
														placeholder="请填写详细街道信息">
												</div>
											</div>
											<div class="form-group payIcon" style="padding-top: 40px;">
												<label for="selectPaymentMethod"
													class="col-sm-2 control-label">*快递费支付方式(￥<span
													id="spPrice" style="float:none">10.00</span>)
												</label>
												<div class="col-sm-10">
													<label class="radio-inline" id="lbl_zfb" for="rab_zfb"
														style="margin-left:-12px; margin-right:20px;"> <span>
															<svg class="icon pay-way-icon" aria-hidden="true">
																 <use xlink:href="#icon-zhifubaozhifu"></use>
                                                </svg>
													</span> <input type="radio" name="inlineRadioOptions"
														class="pay-way-radio" id="rab_zfb" value="zhifubao"
														checked>
													</label> <label class="radio-inline" id="lbl_wechatpay"
														for="rab_wechat"><span> <svg
																class="icon pay-way-icon" aria-hidden="true">
																<use xlink:href="#icon-weixinzhifu1"></use>
                                                </svg>
													</span> <input type="radio" name="inlineRadioOptions"
														class="pay-way-radio" style="margin-left:20px;"
														id="rab_wechat" value="weixin"> </label>
												</div>
											</div>
											<div class="form-group">

												<div class="col-sm-offset-2 col-sm-10">
													<button type="button"
														style="width:120px; margin-right:13px"
														class="btn btn-primary" data-toggle="modal" id="btn_buy">确认补领</button>
													<button type="button" style="width:120px" class="btn"
														id="btn_back">返回查询</button>
													<span style="display:none; color:red; font-size:14px;"
														id="testTitle">本页面用于跑友科技内部测试，订单不具备法律效应！</span>
													<!-- 	<button type="button" onclick="confirmPopOrderInfo()"
													class="btn btn-primary passport-sell-btn">去购买</button> -->
												</div>
												<div style="clear:both;"></div>
											</div>
										</div>
									</form>
									<div class="thumb_footer">
										<div class="admin_thumb">
											<img src="extra-images/admin.png" class="marathon-img">
											<h6>中国马拉松赛事联盟</h6>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Modal -->
		<div class="modal fade" id="div_infoCheck" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLongTitle">请核对您的收件信息</h5>
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
								<td>电话：</td>
								<td><span id="sp_info_phone"></span></td>
							</tr>
							<tr>
								<td>收件地址：</td>
								<td><span id="sp_info_address"></span></td>
							</tr>
							<tr>
								<td>快递费用：</td>
								<td><span id="sp_info_price"></span></td>
							</tr>
							<tr>
								<td colspan="2" class="td_title">*成功申领后，视收件地址距离大概需要2-6天到达。<br />
									*订单创建后不可修改，不可取消，如有问题请联系客服人员。
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
							onclick="confrimReceive()">确认提交</button>
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
		<form name='wechatpay' action='tradePages/wechatpay.jsp' method='post'
			target="_self" id="payWechatform" style="display:none">
			<input id="pay_wechat_QRCode" name="pay_wechat_QRCode" value="" /> <input
				id="pay_wechat_tradeno" name="pay_wechat_tradeno" value="" /> <input
				id="pay_wechat_fee" name="pay_wechat_fee" value="" /> <input
				id="pay_wechat_tradetype" name="pay_wechat_tradetype" value="2" />
		</form>
		<script src="js/distpicker/distpicker.data.min.js"></script>
		<script src="js/distpicker/distpicker.min.js"></script>
		<script>
			var current = null;
			var uoloading = false;
			var params;
			var test;
		
			window.onload = function() {
				testCheck();
			};
		
			function testCheck() {
				test = getPar("pytest");
				if (test != null && test.length > 0 && test == "1") {
					$("#testTitle").show();
					$("#cardno").val("420984199101100839");
					$(".td_title").html("*本页面为测试页面，仅供跑友（上海）体育发展内部使用。<br/>*所有订单无效且不具备法律效应，请悉知。<br/>*若您希望返回正常页面进行购买，请点击左侧菜单。");
				}
			}
		
			$("#btn_buy").click(function() {
				getOrderParams();
			});
		
			function confrimReceive() {
				$(".purchase_submit").hide();
				$("#div_loading").show();
		
				var url = 'receive.do';
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
								var title = data.title;
								$('#WIDout_trade_no').val(serialNum);
								$('#WIDtotal_amount').val(payFee);
								$('#WIDsubject').val(title);
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
						message = message ? message : '订单提交失败!';
						showRequestMessage('notice', message);
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
				var userName = $('#txt_uname').val();
				var phoneNo = $('#txt_phone').val();
				var province = $("#sel_prov").val();
				var city = $("#sel_city").val();
				var district = $("#sel_dist").val();
				var address = $("#txt_address").val();
				var paytype = $("#rab_zfb").is(":checked") ? 1 : 2;
				var payfee = $("#spPrice").html();
				var orderid = current.ID;
		
		
				if (userName == null || userName.length == 0) {
					showRequestMessage('notice', "请填写姓名");
					return;
				} else if (phoneNo == null || phoneNo.length == 0) {
					showRequestMessage('notice', "请填写电话");
					return;
				} else if (province == null || province.length <= 0) {
					showRequestMessage('notice', "请选择省份！");
					return false;
				} else if (city == null || city.length <= 0) {
					showRequestMessage('notice', "请选择城市！");
					return false;
				} else if (address == null || address.length <= 4) {
					showRequestMessage('notice', "详细地址不能少于5个字符！");
					return false;
				} else if (orderid == null || orderid.length <= 0 || orderid == "-1") {
					showRequestMessage('notice', "护照数据有误，请重新查询！");
					return false;
				} else if (payfee == null || payfee.length == 0 || isNaN(payfee)) {
					showRequestMessage('notice', "快递费用计算错误，请刷新重试！");
					return false;
				}
		
				params = {
					name : userName,
					phone : phoneNo,
					province : province,
					city : city,
					district : district,
					address : address,
					orderid : orderid,
					paytype : paytype,
					payfee : payfee,
					test : test
				};
		
				$("#sp_info_name").html(userName);
				$("#sp_info_phone").html(phoneNo);
				$("#sp_info_address").html(province + " " + city + " " + district + "<br/>" + address);
				$("#sp_info_price").html($("#spPrice").html() + "元");
		
				$("#div_infoCheck").modal("toggle");
			}
		
		
			$("#sel_prov").change(function() {
				var prov = $(this).val().trim();
				for (var i in prices) {
					for (var j in prices[i].provs) {
						if (prices[i].provs[j] == prov) {
							$("#spPrice").html(prices[i].price + ".00");
							return;
						}
					}
				}
			});
		
			$("#sel_dist").change(function() {
				if ($("#sel_prov").val() == "上海市" && $(this).val() == "崇明县") {
					$("#spPrice").html("10.00");
				}
			});
		
			$("#btnReceive").click(function() {
				if (typeof ($(this).attr("disabled")) != "undefined") {
					return;
				}
		
				$("#txt_uname").val(current.USER_NAME);
				$("#txt_phone").val(current.PHONE_NO);
		
				$("#frmMain").css({
					"margin-left" : "calc(-100% - 10px)"
				});
			});
		
			$("#btn_back").click(function() {
				$("#frmMain").css({
					"margin-left" : "0px"
				});
			});
		
			$("#btnQuery").click(function() {
				if ($("#cardno").val() == null || $("#cardno").val().trim().length == 0) {
					showRequestMessage('notice', "请填写证件号");
					return;
				}
				var url = "back/unreceiveQuery.do";
				var params = {
					"cardno" : $("#cardno").val().trim()
				};
				async(url, params, function(res) {
					current = null;
					$("#btnReceive").removeClass("btn-primary");
					$("#btnReceive").attr("disabled", "");
					if (typeof res == 'string') {
						res = JSON.parse(res);
					}
					if (res == null || res.length == 0) {
						showRequestMessage('error', "证件号未找到！");
						return;
					}
					if (res[0].STATUS == "0") {
						showRequestMessage('notice', "未找到您的未领取信息，由于护照从赛事场地寄回至中国马拉松赛事联盟并录入需要一定时间，请耐心等待几个工作日后再试。", undefined, 10000);
						return;
					}
					$("#td_name").html(res[0].USER_NAME);
					$("#td_race").html(res[0].RACE);
					$("#td_date").html(getTime(res[0].PAY_TIME));
					$("#td_isr").html(res[0].ISRECEIVE == null || res[0].ISRECEIVE == 0 ? "未领取" : "已领取");
					current = res[0];
					if (res[0].ISRECEIVE == null || res[0].ISRECEIVE == 0) {
						$("#btnReceive").removeAttr("disabled");
						$("#btnReceive").addClass("btn-primary");
					}
				}, function() {
					showRequestMessage('error', "网络异常");
				}, 'POST');
			});
		
			function getTime(obj) {
				var time = "";
				time += obj.year + 1900 + "-";
				time += obj.month + 1 + "-";
				time += obj.date + " ";
				time += obj.hours + ":";
				time += obj.minutes + ":";
				time += obj.seconds;
				return time;
			}
		
			//参数获取
			function getPar(par) {
				//获取当前URL
				var local_url = document.location.href;
				//获取要取得的get参数位置
				var get = local_url.indexOf(par + "=");
				if (get == -1) {
					return false;
				}
				//截取字符串
				var get_par = local_url.slice(par.length + get + 1);
				//判断截取后的字符串是否还有其他get参数
				var nextPar = get_par.indexOf("&");
				if (nextPar != -1) {
					get_par = get_par.slice(0, nextPar);
				}
				return get_par;
			}
		
			var prices = [ {
				price : 6,
				provs : [ "上海市" ]
			}, {
				price : 8,
				provs : [ "江苏省", "浙江省" ]
			},
				{
					price : 10,
					provs : [ "安徽省", "山东省", "广东省", "北京市", "福建省", "湖南省", "湖北省", "江西省", "天津市", "河北省", "河南省" ]
				},
				{
					price : 12,
					provs : [ "四川省", "重庆市", "海南省", "辽宁省", "吉林省", "陕西省", "黑龙江省", "广西壮族自治区", "陕西省", "云南省", "贵州省" ]
				},
				{
					price : 16,
					provs : [ "青海省", "宁夏回族自治区", "甘肃省", "内蒙古自治区" ]
				},
				{
					price : 25,
					provs : [ "新疆维吾尔自治区", "西藏自治区" ]
				},
				{
					price : 35,
					provs : [ "香港特别行政区" ]
				},
				{
					price : 45,
					provs : [ "澳门特别行政区" ]
				}
				,
				{
					price : 80,
					provs : [ "台湾省" ]
				}
			];
		</script>
		<%@ include file="../staticFiles/foot.html"%>
	</div>
</body>
</html>

