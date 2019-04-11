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
<title>中国马拉松电子护照注册</title>
<script src="js/transfromer.js"></script>
<script>

</script>
<%@ include file="../staticFiles/globalCSS.html"%>
<link href="passport/passportBuy.css" rel="stylesheet">
<script src="js/jquery.js"></script>
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
										<span>中国马拉松电子护照-注册</span>

										<!-- 	 <a class="prv_btn"
											href="javascript:alert('暂未开放');">批量购买（10人起购）&raquo;</a> -->
									</h6>

								</div>
								<div id="passport-sell">
									<a style="font-size:16px;color: #337ab7;padding-left:20px;"
										href="passport/Instruction/marathonInstructions_Electronic.jsp">什么是中国马拉松电子护照？</a>
									<form class="form-horizontal">
										<div class="form-group title_a">
											<label for="realName" class="col-sm-2 control-label"></label>
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
											<label for="selectPaymentMethod"
												class="col-sm-2 control-label"></label>
											<div class="col-sm-10">
												<p>
													中国马拉松电子护照完全免费，注册后请下载APP或关注公众号享受权益与服务。<br /><a style="font-size:16px;color: #337ab7;padding-left:20px;"
														href="passport/Instruction/marathonInstructions_Electronic.jsp">详情点击中国马拉松电子护照</a>
												</p>
											</div>
										</div>
										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-10">
												<button type="button" style="width:120px"
													class="btn btn-primary" data-toggle="modal" id="btn_buy">立即注册</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
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
								<br />
								<tr>
									<td colspan="2" class="">*欢迎注册中国马拉松电子护照，请核对您的信息。<br />
										*中国马拉松电子护照完全免费，注册后请下载APP或关注公众号享受权益与服务。<br /> <a
										href="passport/Instruction/marathonInstructions_Electronic.jsp">*查看马拉松电子护照详细介绍</a>。
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
								onclick="genNewElecPassport()">提交注册</button>
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
	<script>
		$("#btn_buy").click(function() {
			if (!getOrderParams())
				return;
	
			$("#div_infoCheck").modal("toggle");
		});
		var cardTypes = new Array("身份证", "护照", "港澳通行证");
		var telReg = /^(([0\+]\d{2,3}-)?(0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/;
		var cardNumReg = /(^\d{15}$)|(^\d{17}([0-9]|X)$)/;
		var mobileReg = /^\d{7,11}$/;
		function getOrderParams() {
			var userName = $("#txt_uname").val();
			var sex = $("#rab_male").is(":checked") ? 1 : 2;
			var cardType = $("#sel_cardtype").val();
			var cardNo = $("#txt_cardno").val();
			var phoneNo = $("#txt_phone").val();
	
			if (userName == null || userName.length <= 0) {
				showRequestMessage('notice', "请填写姓名！");
				return false;
			}
	
			if (isNaN(cardType)) {
				showRequestMessage('notice', "请选择证件类型！");
				return false;
			}
	
			if (cardType == 1 && !cardNumReg.test(cardNo)) { //只验证身份证号
				showRequestMessage('notice', "请填写正确的证件号！");
				return false;
			}
	
			if (!(mobileReg.test(phoneNo.trim()) || telReg.test(phoneNo.trim()))) {
				showRequestMessage('notice', "请填写正确的手机号！");
				return false;
			}
	
			$("#sp_info_name").html(userName);
			$("#sp_info_sex").html(sex == 1 ? "男" : "女");
			$("#sp_info_cardtype").html(cardTypes[cardType - 1]);
			$("#sp_info_cardno").html(cardNo);
			$("#sp_info_phone").html(phoneNo);
			return true;
		}
	
		//在新APP数据库生成电子护照
		function genNewElecPassport() {
			var uname = $("#txt_uname").val().trim();
			var usex = $("#rab_male").is(":checked") ? 0 : 1;
			var uid = $("#txt_cardno").val().trim();
			var uidt = $("#sel_cardtype").val();
			var umobile = $("#txt_phone").val();
	
			var api = 'http://run.geexek.com/geeRunner/webapi/createPassport';
			var para = {
				'name' : uname,
				'sex' : usex,
				'idCardType' : uidt,
				'idCard' : uid,
				'mobile' : umobile,
				'dataFrom' : '2'
			};
			var status = 0;
	
			$.ajax({
				url : api,
				async : false,
				data : para,
				type : 'post',
				dataType : 'json',
				success : function(r) {
					status = r.status;
					if (r.status == 0) {
						alert(r.message);
					} else {
						status = 1;
					}
				},
				error : function() {
					alert("网络错误！");
				}
			});
	
			return status == 1;
		}
	</script>
</body>
</html>

