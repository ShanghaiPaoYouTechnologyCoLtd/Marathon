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

<title>中国马拉松护照办理</title>
<script src="js/transfromer.js"></script>
<meta name="viewport"
	content="width=drvice-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="中国马拉松护照">
<meta http-equiv="description" content="中国马拉松护照是中国田径协会官方认证的材料">
<link rel="stylesheet" href="css/Radio.css" />
<link rel="stylesheet" href="css/inputAlert.css" />
<link rel="stylesheet" href="js/mobileSelect/mobileSelect.css" />
<style>
* {
	margin: 0px;
	padding: 0px;
	font-size: 20px;
	font-family: SimHei;
}

body {
	transition: all 1s;
}

input[type="text"], select, button {
	border-radius: 5px;
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

#head tbody, tr, td {
	height: 100%;
}

#head tr td:nth-child(1) {
	width: 70%;
	font-size: 20px;
	color: #fff;
	text-indent: 5%;
}

#head tr td:nth-child(2), #head tr td:nth-child(3) {
	width: 15%;
}

#head tr td img {
	width: 75%;
}

#main {
	width: 100%;
}

#main table {
	width: 100%;
}

#main table td {
	width: 100%;
	line-height: 60px;
	text-indent: 5%;
	height: 120px;
}

#main table td .boxdiv {
	width: 90%;
	margin: 0px auto;
	text-indent: 0px;
}

#main input[type='text'], #main textarea, select {
	height: 50px;
	width: 100%;
	border: none;
	background-color: #f8f8f8;
	text-indent: 5%;
}

#main label {
	color: #000;
}

#info-address {
	margin-top: 20px;
	height: 140px !important;
	line-height: 50px;
	text-indent: 0px !important;
	padding-left: 5%;
}

#foot {
	height: 100px;
	background-color: #f8f8f8;
	margin-top: 20px;
}

#foot button {
	width: 90%;
	height: 60px;
	margin-top: 20px;
	margin-left: 5%;
	background-color: #212D59;
	color: #fff;
	font-size: 1rem;
	border: none;
}

#sel-address {
	background-color: #f8f8f8;
	height: 50px;
	line-height: 50px;
	border-radius: 5px;
	text-indent: 5%;
}

.pp-tip {
	display: none;
	margin-top: 25px;
	width: 100%;
	color: #D6B492;
	text-align: center;
	font-size: .83rem !important;
	width: 100%;
	margin-top: 25px;
}

#tr-pack {
	display: none;
}

#inp-sex-male:after, #inp-sex-female:after {
	display: none;
}

.boxdiv p {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	max-width: 75%;
}
</style>
</head>

<body>
	<div id="head">
		<table>
			<tr>
				<td>中国马拉松护照办理</td>
				<td><img src="extra-images/logs/caa.png" /></td>
				<td><img src="extra-images/logs/CML2.png" style="width:55%" /></td>
			</tr>
		</table>
	</div>
	<form action="mobile/passport/passportOrderSubmit.jsp" method="GET"
		id="info-form">
		<div id="main">
			<table>
				<tr>
					<td><label>真实姓名</label>
						<div class="boxdiv">
							<input type="text" placeholder="请输入您的真实姓名" id="info-name"
								name="info-name" />
						</div></td>
				</tr>
				<tr>
					<td><label>性别</label>
						<div
							style="font-size:20px;	background-color: #f8f8f8;height: 50px; line-height: 50px;"
							class="boxdiv">
							<label style="margin-left:5%"><input type="radio"
								name="rad-sex" value="1" id="inp-sex-male" checked="checked"><span></span>男</label><label
								style="margin-left:20%"><input value="2" type="radio"
								name="rad-sex" id="rad-sex-female"><span></span>女</label>
						</div></td>
				</tr>
				<!-- 			<tr id="tr-pack">
					<td><label>包装</label>
						<div
							style="font-size:20px;	background-color: #f8f8f8;height: 100px; line-height: 50px; padding-left:10%"
							class="boxdiv">
							<label class="demo--label"><input class="demo--radio"
								id="inp-pack-normal" type="radio" name="rad-pack" value="1"
								checked="checked"><span class="demo--radioInput"></span>普通包装(￥28)</label><label
								class="demo--label"><br /> <input value="2"
								id="inp-pack-gift" class="demo--radio" type="radio"
								name="rad-pack"><span class="demo--radioInput"></span>精致包装(￥50)</label>
						</div></td>
				</tr> -->
				<tr>
					<td><label>证件类型</label>
						<div class="boxdiv">
							<select name="info-cardtype" id="info-cardtype">
								<option value="1">身份证</option>
								<option value="3">护照</option>
							</select>
						</div></td>
				</tr>
				<tr>
					<td><label>证件号</label>
						<div class="boxdiv">
							<input type="text" placeholder="请输入您的证件号" id="info-card"
								name="info-card" />
						</div></td>
				</tr>
				<tr>
					<td><label>手机号</label>
						<div class="boxdiv">
							<input type="text" placeholder="请输入您的手机号" id="info-phone"
								name="info-phone" />
						</div></td>
				</tr>
				<tr>
					<td><label>购买方式</label>
						<div class="boxdiv">
							<p>
								<input type="radio" id="inp-ckb-pas" name="isvip"
									value="0" /> <label for="inp-ckb-pas" class="blink"
									style="display:inline-block !important; text-indent:1%;">单独购买护照（￥50）</label>
							</p>
							<p style="line-height:22px;">
								<input type="radio" id="inp-ckb-vip" name="isvip"
									value="1" style="margin-top:-20px" /> <label for="inp-ckb-vip"
									style="display:inline-block !important; text-indent:1%;">成为跑友汇会员赠送护照<br />（优惠价￥49.5<label
									style="text-decoration:line-through; font-size:0.4em; color:#A8A8A8;display:inline-block">99</label>
									/年）
								</label>
							</p>
						</div></td>
				</tr>
				<tr id="tr-info-race">
					<td><label>报名赛事</label>
						<div class="boxdiv">
							<select id="sel_race" name="sel_race">
								<option value="4">赛事加载中</option>
							</select> <input type="hidden" id="info-payfee" name="info-payfee"
								value="50" /><input type="hidden" id="info-racename"
								name="info-racename" value="" />
						</div></td>
				</tr>
				<tr id="tr-info-address">
					<td><label>收件地址</label>
						<div class="boxdiv">
							<div id="sel-address">请选择地址▼</div>
							<input type="hidden" id="info-province" name="info-province" />
							<input type="hidden" id="info-city" name="info-city" /> <input
								type="hidden" id="info-district" name="info-district" />

							<textarea placeholder="请输入您的详细地址" id="info-address"
								name="info-address"></textarea>
						</div></td>
				</tr>
			</table>
		</div>
		<p class="pp-tip"></p>
		<div id="foot">
			<input type="hidden" name="otype" id="info-otype" /> <input
				type="hidden" name="istest" id="istest" />
			<button id="btn-confrim">立即办理</button>
		</div>
	</form>
	<script src="js/jquery.js"></script>
	<script src="js/commonTools.js"></script>
	<script src="js/ajax.js"></script>
	<script src="js/mobileSelect/mobileSelect.js"></script>
	<script src="js/mobileSelect/areaJSON.js"></script>
	<script>
		var orderType = -1; //-1官网购买,>=0指定赛事购买，并且orderType等于赛事编号
		var price = 50;
		var raceinfo = null;
		var rid;
	
		$(function() {
			var istest = getPar("pytest");
			var otype = getPar("otype");
			var ucard = getPar("ucard");
			var uname = getPar("uname");
			var usex = getPar("usex");
			var uctype = getPar("uctype");
			var uphone = getPar("uphone");
	
			if (istest == "1") {
				$("#istest").val(istest);
			}
	
			rid = getPar("rid");
			if (rid != null && rid.length > 0) {
				orderType = rid;
				sessionStorage.rid = rid;
			} else {
	
				if (otype != null && otype.length > 0) { //强制清空赛事ID
					orderType = -1;
				} else if (sessionStorage.rid != null && sessionStorage.rid.length > 0) {
					orderType = sessionStorage.rid; //防止用户错误刷新
				}
			}
	
			if (ucard != null && ucard.length > 0) {
				$("#info-card").val(ucard);
			}
			if (uname != null && uname.length > 0) {
				$("#info-name").val(uname);
			}
			if (usex != null && usex.length > 0 && usex == 2) {
				$("#rad-sex-female").prop("checked", true);
			}
			if (uctype != null && uctype.length > 0 && uctype == 3) {
				$("#info-cardtype").val(uctype);
			}
			if (uphone != null && uphone.length > 0) {
				$("#info-phone").val(uphone);
			}
	
			$("#info-otype").val(orderType);
			if (orderType == -1 || rid == 4) {
				$("#tr-info-race").hide();
			} else {
	
				raceLoad();
			}
	
			$("#tr-pack input").click(function() {
				if ($("#inp-pack-gift").is(":checked")) {
					$("#info-payfee").val(50);
				} else {
					$("#info-payfee").val(raceinfo.Price);
				}
			});
		});
	
		function raceLoad() {
			var races = {};
			var url = 'getAllRaces.do';
			var params = {
				currentID : orderType,
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
						$(".pp-tip").show();
						$("#btn-confrim").html("赛事选择错误");
						$("#btn-confrim").removeClass("btn-primary");
						$("#btn-confrim").addClass("btn-secondary");
						$(".pp-tip").html("*您选择的赛事有误，请返回上级页面或<a href='passport/marathonPassport.jsp' style='color:blue'>点击返回个人办理页面</a>继续办理！");
						return;
					}
					for (var i in result) {
						$("#sel_race").append("<option value='" + result[i].ID + "'>" + result[i].RaceName + "</option>");
						raceinfo = result[i];
						price = result[i].Price.toFixed(2)
						if (result[i].Pack == 1) { //允许礼品（精致）包装
							/* 	$("#tr-pack").show(); */
						}
						var now = new Date();
						var sDate = new Date(parseInt(result[i].StartTime.time));
						var eDate = new Date(parseInt(result[i].EndTime.time));
						if (sDate > now || eDate < now) {
							$("#sp_btnTitle").show();
							$("#btn-confrim").html("已截止");
							$("#btn-confrim").removeClass("btn-primary");
							$("#btn-confrim").addClass("btn-secondary");
							$(".pp-tip").html("*" + races[i].RaceName + "报名已截止,无法购买赛事合作护照。但您可以选择其他赛事继续办理。");
						}
						if (!flag && orderType == result[i].ID) {
							flag = true;
							$("#info-payfee").val(result[i].Price);
							$("#info-racename").val(races[i].RaceName);
							break;
						}
					}
					if (orderType == -1)
						flag = true; //传入空ID，搜索所有
					if (!flag) {
						$("#sel_race").html("<option value='-1'>未找到您对应的赛事,请重新操作！！</option>");
						$("#sel_race").val(-1);
						$(".pp-tip").show();
						$("#btn-confrim").html("无法办理");
						$("#btn-confrim").removeClass("btn-primary");
						$("#btn-confrim").addClass("btn-secondary");
						$(".pp-tip").html("*未找到您对应的赛事，请返回您跳转前的马拉松网站重新操作，或联系工作人员！");
					} else if (orderType != -1) {
						$("#sel_race").val(orderType);
					}
				} else {
					$("#sel_race").html("赛事加载失败！");
				}
			}, function() {
				$("#sel_race").html("赛事加载失败！");
			}, 'POST');
		}
	
		var mobileSelect = new MobileSelect({
			trigger : '#sel-address',
			title : '请选择地区',
			wheels : [
				{
					data : areas
				}
			],
			transitionEnd : function(indexArr, data) {
				//console.log(data);
			},
			callback : function(indexArr, data) {
				console.log(data);
			}
		});
	
		$("#btn-confrim").click(function() {
			if ($(this).hasClass("btn-secondary")) {
				return false;
			}
			if (!inputCheck()) {
				return false;
			}
		});
	
		function inputCheck() {
			$(".arrow_box").removeClass("arrow_box"); //防止两个控件同时闪动
	
			if ($("#info-name").val().trim().length == 0) {
				inputAlert($("#info-name"));
				return false;
			}
	
			if ($("#info-card").val().trim().length == 0) {
				inputAlert($("#info-card"));
				return false;
			}
	
			if ($("#info-phone").val().trim().length == 0 || $("#info-phone").val().trim().length != 11) {
				inputAlert($("#info-phone"));
				return false;
			}
	
			if ($("#sel-address").html() == "请选择地址") {
				inputAlert($("#sel-address"));
				return false;
			}
	
			if (!$("#inp-ckb-pas").is(":checked") && !$("#inp-ckb-vip").is(":checked")) {
				inputAlert($("#inp-ckb-vip"));
				return false;
			}
	
			if ($("#info-address").val().trim().length == 0) {
				inputAlert($("#info-address"));
				return false;
			}
	
			var areas = mobileSelect.getValue();
			if (areas == null || areas.length != 3) {
				inputAlert($("#sel-address"));
				return false;
			}
	
			$("#info-province").val(areas[0]["value"]);
			$("#info-city").val(areas[1]["value"]);
			$("#info-district").val(areas[2]["value"]);
	
			return genNewElecPassport($("#info-name").val().trim(), $("#inp-sex-male").is(":checked") ? 0 : 1,
				$("#info-card").val().trim(), $("#info-cardtype").val() == 1 ? 1 : 2, $("#info-phone").val().trim());
		}
	
		//在新APP数据库生成电子护照
		function genNewElecPassport(uname, usex, uid, uidt, umobile) {
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
					if (r.status == 0 && r.message.indexOf("证件号已存在") < 0) {
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
