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
<script src="js/transfromer.js"></script>
<title>我要上奥运万人名单</title>
<meta name="viewport"
	content="width=drvice-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="我要上奥运,万人名单">
<meta http-equiv="description" content="我要上奥运万人名单查询">
<style>
* {
	margin: 0px;
	padding: 0px;
	font-family: NSimSun;
}

body {
	background-color: #f8f8f8;
}

#header {
	position: fixed;
	top: 0px; width : 100%;
	height: 10%;
	background: url(images/mobile/tlist/header.png) no-repeat;
	background-size: 100% 100%;
	padding-top: 5%;
	background-color: #23336A;
	width: 100%;
}

#header p {
	color: #fff;
	margin-left: 20px;
}

#main {
	position: fixed;
	top: 14%;
	height: calc(100% - 15% - 34px - 32px);
	width: 100%;
}

#footer {
	position: fixed;
	bottom: 0px;
	height: 32px;
	width: 100%;
	font-size: 0.6em;
}

#div-drop {
	background-color: #fff;
	height: 34px;
	padding-top: 10px;
}

#div-drop select {
	padding: 5px 10px;
	color: #5f6887;
	border: none;
	text-indent: 10%;
	width: calc(33.33% - 6px);
}

#tab-list {
	height: 100%;
	border-collapse: collapse;
	font-size: 0.82em;
	width: calc(100% - 1px);
}

#tab-list tr {
	height: 10%;
	background-color: #fff;
	border-bottom: 1px #f8f8f8 solid;
}

#tab-list td {
	border-right: 1px #fff solid;
}

#footer span {
	vertical-align: middle;
}

#btn-prev, #btn-next {
	width: 20px;
	height: 20px;
	border: none;
	vertical-align: middle;
	cursor: pointer;
}

#btn-prev {
	background: url("images/mobile/tlist/la.png");
	background-size: 100% 100%;
}

#btn-next {
	background: url("images/mobile/tlist/ra.png");
	background-size: 100% 100%;
}

#footer p {
	width: 94%;
	text-align: right;
	margin-top: 4px;
}

#inp-page {
	width: 34px;
	display: none;
	text-align: right;
	font-size: 0.6em;
}

#img-search {
	display: block;
	position: absolute;
	right: 5%;
	bottom: calc(15% + 32px);
	opacity: 0.6;
}

#img-search:hover {
	opacity: 1.0;
}

#mask {
	width: 100%;
	height: 100%;
	background-color: #999;
	opacity: 0.4;
	position: absolute;
	left: 0px;
	top: 0px;
	z-index: 998;
	display: none;
}

#topper {
	background-color: #fff;
	position: fixed;
	z-index: 999;
	width: 90%;
	height: 34%;
	left: 5%;
	border-radius: 5px;
	top: 35%;
	display: none;
}

#topper #img-title {
	width: 46%;
	height: 65%;
	margin-left: 28%;
	margin-top: -20%;
}

#inp-idcard {
	width: 80%;
	margin-left: 10%;
	height: 20%;
	text-align: center;
	border-radius: 5px;
	color: #868787;
	background-color: #F0F1F4;
	border: none;
	font-size: 0.91em;
	margin-top: 5%;
	min-width: 100px;
	min-height: 20px;
}

#btn-query {
	min-width: 100px;
	min-height: 20px;
	width: 40%;
	height: 16%;
	margin-left: 30%;
	font-size: 0.82em;
	font-family: SimHei;
	color: #fff;
	margin-top: 5%;
	border: none;
	border-radius: 5px;
	background: url(images/mobile/tlist/btn.png);
	background-size: 100% 100%;
}

#img-close {
	display: block;
	position: absolute;
	left: calc(50% - 21px);
	bottom: -32%;
}

#topper ul {
	list-style: none;
	width: 100%;
	text-align: center;
	font-family: Microsoft YaHei;
	margin-bottom: -2%;
	display: none;
}

#topper ul li:nth-child(1) {
	font-size: 0.9em;
	color: #2E375B;
}

#topper ul li:nth-child(2) {
	font-size: 1.6em;
	line-height: 2em;
	color: #C00019;
	font-family: SimHei;
}

#topper ul li:nth-child(3) {
	font-size: 0.55em;
	color: #2E375B;
}

#p-nonerank {
	font-size: 0.9em;
	text-align: center;
	margin: 8% 0 5% 0;
	color: #6B6B6B;
	display: none;
}
</style>
<script src="js/jquery.js"></script>
</head>

<body>
	<div id="topper">
		<img src="images\mobile\tlist\onborad.png" id="img-title" /> <input
			type="text" placeholder="请输入证件号查询" id="inp-idcard" />
		<p id="p-nonerank">您当前不在本期名单</p>
		<ul id="ul-rankinfo">
			<li></li>
			<!-- 杨雨琪女士，您当前排名 -->
			<li></li>
			<!-- 第 492 名 -->
			<li></li>
			<!-- 第三期万人名单男子组 -->
		</ul>
		<button id="btn-query">查询排名</button>
		<img src="images\mobile\tlist\close.png" width="42" height="42"
			id="img-close" />
	</div>
	<div id="mask"></div>
	<div id="header">
		<table>
			<tr>
				<td style="width:100%">
					<p>万人名单-第五期</p>
				</td>
				<td style="min-width:55px"><img
					src="images/mobile/tlist/logo.png" width="35" height="50" /></td>
			</tr>
		</table>
	</div>
	<div id="main">
		<div id="div-drop">
			<select id="sel-sex">
				<option value="男">男子组</option>
				<option value="女">女子组</option>
			</select> <select style="text-indent:3%;" id="sel-type">
				<option value="0">万人跑团</option>
				<option value="1">十人跑团</option>
				<option value="2">百人跑团</option>
				<option value="3">千人跑团</option>
			</select> <select id="sel-bath">
				<option>第五期</option>
			</select>
		</div>
		<div id="div-tb-con"></div>
		<img id="img-search" width="62" height="62"
			src="images\mobile\tlist\search.png" />
	</div>
	<div id="footer">
		<p>
			<button id="btn-prev"></button>
			<input type="number" min="0" id="inp-page" value="1" /> <span
				id="sp-page-c">1</span>/<span id="sp-page-t">1</span>
			<button id="btn-next"></button>
		<p>
	</div>
</body>
<script src="js/bootstrap/bootstraptable/bootstrap-table.min.js"></script>
<script src="js/bootstrap/bootstraptable/bootstrap-table-zh-CN.min.js"></script>
<script>
	var pageSize = 10;
	var curPage = 1;
	var maxPage = 999;
	var shiningIndex = -1;
	var bootstraptableReg = function() {
		$("#sp-page-c").html(curPage);
		$("#inp-page").val(curPage);
		var sex = $("#sel-sex").val();
		var gtype = $("#sel-type").val();
		$("#div-tb-con").html("<table id='tab-list'></table>");
		var pageNum = (curPage - 1) * pageSize;
		colInit();
		$("#tab-list").bootstrapTable({ // 对应table标签的id
			method : "post",
			url : "tlist/getList.do", // 获取表格数据的url
			cache : false, // 设置为 false 禁用 AJAX 数据缓存， 默认为true
			pageSize : pageSize, // 页面数据条数
			pageNumber : pageNum, // 首页页码
			sidePagination : 'server', // 设置为服务器端分页
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			queryParams : function(params) { // 请求服务器数据时发送的参数，可以在这里添加额外的查询参数，返回false则终止请求
				return {
					pageSize : pageSize, //页面大小
					pageNumber : pageNum,
					qType : sex,
					gType : gtype
				}
			},
			columns : colSet,
			onLoadSuccess : function(data) { //加载成功时执行
				if (!isNaN(data.total)) {
					maxPage = Math.ceil(data.total / pageSize);
					$("#sp-page-t").html(maxPage);
					$("#inp-page").attr("max", maxPage);
				}
				if (curPage > 1 && shiningIndex >= 0) { //搜索进入
					TheShining();
				}
			},
			onLoadError : function() { //加载失败时执行
				console.info("加载数据失败");
			}
		})
	}

	bootstraptableReg("男", 0);

	function colInit() {
		colSet = [ {
			field : 'ranking',
			align : 'center', // 左右居中
			valign : 'middle', // 上下居中
			width : '20%',
			cellStyle : function(a, b, c) {
				return {
					css : {
						"min-width" : "60px"
					}
				}
			},
			formatter : function(value, row, index) { // 单元格格式化函数
				if (value <= 3) {
					return "<img src='images//mobile//tlist//no" + value + ".png' width='20px' height='35px'/>";
				}
				return value;
			}
		}, {
			field : 'name', // 返回json数据中的name
			width : '40%',
			cellStyle : function(a, b, c) {
				return {
					css : {
						"min-width" : "80px"
					}
				}
			},
			align : 'center', // 左右居中
			valign : 'middle' // 上下居中
		}, {
			field : 'gameName',
			width : '100%',
			cellStyle : function(a, b, c) {
				return {
					css : {
						"min-width" : "150px"
					}
				}
			},
			align : 'center',
			valign : 'middle'
		}
		];
	}

	$("#btn-query").click(function() {
		if ($("#btn-query").html() == "继续查询") {
			$("#inp-idcard").show();
			$("#ul-rankinfo").hide();
			$("#p-nonerank").hide();
			$("#btn-query").html("查询排名");
			$("#inp-idcard").focus();
			return;
		}

		if ($("#inp-idcard").val() == null || $("#inp-idcard").val().length <= 0) {
			return;
		}

		$.ajax({
			type : "POST",
			url : "tlist/onesRanking.do",
			data : {
				"uname" : "",
				"cardNo" : $("#inp-idcard").val()
			},
			success : function(result) {
				var jsonS = JSON.parse(result);
				if (jsonS != null && jsonS.ranking != null) {
					var sex = $("#ul-rankinfo li:eq(0)").html(jsonS.name + (jsonS.sex == '男' ? "先生" : "女士") + ",您当前排名");
					$("#ul-rankinfo li:eq(1)").html("第&nbsp;" + jsonS.ranking + "&nbsp;名");
					$("#ul-rankinfo li:eq(2)").html($("#sel-bath option:selected").html() + "万人名单" + jsonS.sex + "子组");
					$("#inp-idcard").hide();
					$("#ul-rankinfo").show();

					$("#btn-query").html("继续查询");

					focusRow(jsonS.ranking, jsonS.sex);
				} else {
					$("#inp-idcard").hide();
					$("#p-nonerank").show();
					$("#btn-query").html("继续查询");
				}
			}
		});
	});

	$("#mask").click(function() {
		$("#mask").hide();
		$("#topper").hide();
	});

	$("#img-close").click(function() {
		$("#mask").hide();
		$("#topper").hide();
	});

	$("#img-search").click(function() {
		$("#mask").show();
		$("#topper").show();
		$("#inp-idcard").focus();
	});

	$("#inp-idcard").focus(function() {
		$("#inp-idcard").select();
	});

	$("#btn-prev").click(function() {
		if (curPage <= 1) {
			return;
		}
		curPage--;
		bootstraptableReg();
	});

	$("#btn-next").click(function() {
		if (curPage >= maxPage) {
			return;
		}
		curPage++;
		bootstraptableReg();
	});

	$("#footer span").click(function() {
		$("#inp-page").show();
		$("#inp-page").focus();
		$("#sp-page-c").hide();
		event.stopPropagation();
	});

	$("input").click(function() {
		event.stopPropagation();
	});

	$("body").click(function() {
		if ($("#inp-page").is(":hidden")) {
			return;
		}

		$("#inp-page").hide();
		if (!setCurpage($("#inp-page").val())) {
			$("#sp-page-c").html(curPage);
			$("#sp-page-c").show();
			$("#inp-page").val(curPage);
			return;
		}
		$("#sp-page-c").html(curPage);
		$("#sp-page-c").show();
		bootstraptableReg();
	});

	$("select").change(function() {
		curPage = 1;
		bootstraptableReg();
	});

	function setCurpage(page) {
		if (page > maxPage)
			return false;
		if (page < 1)
			return false;
		if (isNaN(page))
			return false;

		curPage = page;
		return true;
	}

	var focusRow = function(rank, sex) {
		var page = rank % pageSize == 0 ? (rank / pageSize) : (rank / pageSize) + 1;
		page = parseInt(page); //去除小数点
		var index = rank - (page - 1) * pageSize;

		if (sex != "男" && sex != "女")
			sex = "男";

		$("#sel-sex").val(sex);
		$("#sel-type").val(0);

		curPage = page;
		shiningIndex = index;
		bootstraptableReg();
	}

	function TheShining() {
		tempTimer = setInterval("_theShining()", 400);
	}

	var sCount = 0;
	var tempTimer;
	function _theShining() {
		$("#tab-list tr:eq(" + shiningIndex + ")").css({
			"background-color" : sCount % 2 == 0 ? "pink" : "white"
		});
		$("#tab-list tr:eq(" + shiningIndex + ") td").css({
			"border-right-color" : sCount % 2 == 0 ? "pink" : "white"
		});
		sCount++;
		if (sCount >= 5) {
			window.clearInterval(tempTimer);
			shiningIndex = -1;
			sCount = 0;
		}
	}
</script>
</html>
