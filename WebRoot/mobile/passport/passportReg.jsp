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

<title>中国马拉松电子护照注册</title>

<meta name="viewport"
	content="width=drvice-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="中国马拉松护照，电子护照">
<meta http-equiv="description" content="中国马拉松电子护照注册">
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
	font-size: 0.90em;
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
</style>
</head>

<body>
	<div id="head">
		<table>
			<tr>
				<td>中国马拉松电子护照注册</td>
				<td><img src="extra-images/logs/caa.png" /></td>
				<td><img src="extra-images/logs/CML2.png" style="width:55%" /></td>
			</tr>
		</table>
	</div>
	<form action="mobile/passport/passportRegSuccess.jsp" method="GET"
		id="info-form" onsubmit="return submitCheck()">
		<div id="main">
			<table>
				<tr>
					<td><label>真实姓名</label>
						<div class="boxdiv">
							<input type="text" placeholder="请输入您的真实姓名" id="uname"
								name="uname" />
						</div></td>
				</tr>
				<tr>
					<td><label>性别</label>
						<div
							style="font-size:20px;	background-color: #f8f8f8;height: 50px; line-height: 50px;"
							class="boxdiv">
							<label class="demo--label" style="margin-left:5%"><input
								class="demo--radio" type="radio" name="usex" value="1"
								id="inp-male" checked="checked"><span
								class="demo--radioInput"></span>男</label><label class="demo--label"
								style="margin-left:20%"><input value="2"
								class="demo--radio" type="radio" name="usex"><span
								class="demo--radioInput"></span>女</label>
						</div></td>
				</tr>
				<tr>
					<td><label>证件类型</label>
						<div class="boxdiv">
							<select name="uctype" id="sel-ctype">
								<option value="1">身份证</option>
								<option value="3">护照</option>
							</select>
						</div></td>
				</tr>
				<tr>
					<td><label>证件号</label>
						<div class="boxdiv">
							<input type="text" placeholder="请输入您的证件号" id="ucard" name="ucard" />
						</div></td>
				</tr>
				<tr>
					<td><label>手机号</label>
						<div class="boxdiv">
							<input type="text" placeholder="请输入您的手机号" id="uphone"
								name="uphone" />
						</div></td>
				</tr>
			</table>
		</div>
		<p class="pp-tip"></p>
		<div id="foot">
			<input type="hidden" name="otype" id="info-otype" /> <input
				type="hidden" name="istest" id="istest" />
			<button id="btn-confrim">立即注册</button>
		</div>
	</form>
	<script src="js/jquery.js"></script>
	<script src="js/ajax.js"></script>
	<script>
		function submitCheck() {
			$(".arrow_box").removeClass("arrow_box"); //防止两个控件同时闪动
	
			if ($("#uname").val().trim().length == 0) {
				inputAlert($("#uname"));
				return false;
			}
	
			if ($("#ucard").val().trim().length == 0) {
				inputAlert($("#ucard"));
				return false;
			}
	
			if ($("#uphone").val().trim().length == 0) {
				inputAlert($("#uphone"));
				return false;
			}
	
			var api = 'http://run.geexek.com/geeRunner/webapi/createPassport';
			var para = {
				'name' : $("#uname").val().trim(),
				'sex' : $("#inp-male").is(":checked") ? 0 : 1,
				'idCardType' : $("#sel-ctype").val() == "1" ? 1 : 2,
				'idCard' : $("#ucard").val().trim(),
				'mobile' : $("#uphone").val().trim(),
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
					}
				},
				error : function() {
					alert("网络错误！");
				}
			});
	
			if (status == 0)
				return false;
			else
				return true;
		}
	
		function inputAlert(ele) {
			$("body").animate({
				scrollTop : $(ele).offset().top - 60
			}, 500);
	
			$(ele).focus();
			$(ele).addClass("arrow_box");
			setTimeout(function() {
				$(ele).removeClass("arrow_box");
			}, 5000);
		}
	</script>
</body>
</html>
