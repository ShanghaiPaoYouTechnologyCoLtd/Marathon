<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<base href="<%=basePath%>" />
<title>我要上奥运 ▪ 中国马拉松大奖赛</title>
<%@ include file="../staticFiles/globalCSS.html"%>
<link href="js/bootstrap/bootstraptable/bootstrap-table.min.css"
	rel="stylesheet">
<link href="js/bootstrap/bootstraptable/bootstrap.min.css"
	rel="stylesheet">
<script src="js/jquery.js"></script>
<style>
.nav-pills li {
	cursor: pointer;
}

#div_logs {
	
}

#div_logs img {
	
}
</style>
</head>

<body>
	<div class="kode_wrapper">
		<%@ include file="../staticFiles/head.html"%>
		<div class="kode_content_wrap">
			<section class="team_schedule_page">
				<div class="container">
					<div class="row kf_query_ranking" id="ranking-details-search">
						<div class="col-md-5 search-info">
							<input type="text" placeholder="请输入姓名" id="txt_uname" />
						</div>
						<div class="col-md-5 search-info">
							<input type="text" placeholder="请输入证件号" id="txt_cardNo" />
						</div>
						<div class="col-md-2 search-btn">
							<button type="button" class="btn btn-primary" id="queryRanking">查询排名</button>
						</div>
						<div class="col-md-12 kf_ranking_result">
							<p class="p_searchtitle">
								请输入信息后查询<span></span>
							</p>
						</div>
					</div>
					<!--filter conditions Start-->
					<!-- 					<ul class="nav nav-pills filter-conditions">
						<li role="presentation" class="active"><a>全部</a></li>
						<li role="presentation"><a>男子组</a></li>
						<li role="presentation"><a>女子组</a></li>
					</ul> -->
					<div class="row">
						<div class="col-md-4" style="margin-top:30px">
							<div class="btn-group" id="div-male">
								<button type="button" class="btn btn-primary btn-query"
									data-sex="男" data-type="0">男子(完整名单)</button>
								<button type="button" class="btn btn-primary dropdown-toggle"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">
									<span class="caret"></span> <span class="sr-only"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="javascript:;" data-type="0">男子(完整名单)</a></li>
									<li role="separator" class="divider"></li>
									<li><a href="javascript:;" data-type="1">男子(十人跑团)</a></li>
									<li><a href="javascript:;" data-type="2">男子(百人跑团)</a></li>
									<li><a href="javascript:;" data-type="3">男子(千人跑团)</a></li>
								</ul>
							</div>
							<div class="btn-group" style="margin-left:10px; " id="div-female">
								<button type="button" class="btn btn-default btn-query"
									data-sex="女" data-type="0">女子(完整名单)</button>
								<button type="button" class="btn btn-default dropdown-toggle"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">
									<span class="caret"></span> <span class="sr-only"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="javascript:;" data-type="0">女子(完整名单)</a></li>
									<li role="separator" class="divider"></li>
									<li><a href="javascript:;" data-type="1">女子(十人跑团)</a></li>
									<li><a href="javascript:;" data-type="2">女子(百人跑团)</a></li>
									<li><a href="javascript:;" data-type="3">女子(千人跑团)</a></li>
								</ul>
							</div>
						</div>
						<div class="col-md-8 text-right">
							<div id="div_logs">
								<img src="extra-images/logs/caa.png" width="100px"
									height="100px" /> <img src="extra-images/logs/wysay.png"
									width="100px" height="100px" /> <img
									src="extra-images/logs/cmgp.png" width="100px" height="100px" />
							</div>
						</div>
					</div>

					<!--filter conditions end-->
					<div class="kf_overview_contant" style="margin-top:30px;">
						<!--Heading 1 Start-->
						<h6 class="kf_hd1 margin_0">
							<span>万人动态名单<i
								style="font-size:12px;font-weight:normal;color:#999">（每2个月更新一次）</i></span>
						</h6>
						<div id="tb_con">
							<table id="table"></table>
						</div>
					</div>
				</div>
			</section>
		</div>
		<%@ include file="../staticFiles/foot.html"%>
	</div>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/bootstrap/bootstraptable/bootstrap-table.min.js"></script>
	<script src="js/bootstrap/bootstraptable/bootstrap-table-zh-CN.min.js"></script>
	<script>
		var shiningIndex = -1;
		$(".btn-query").click(function() {
			/* 			if ($(this).attr("class").indexOf("btn-primary") >= 0) {
							return;
						} */
	
			$(this).parent().siblings(".btn-group").find(".dropdown-toggle").removeClass("btn-primary");
			$(this).parent().siblings(".btn-group").find(".dropdown-toggle").addClass("btn-default");
			$(this).parent().siblings(".btn-group").find(".btn-query").removeClass("btn-primary");
			$(this).parent().siblings(".btn-group").find(".btn-query").addClass("btn-default");
	
			$(this).removeClass("btn-default");
			$(this).addClass("btn-primary");
			$(this).next().removeClass("btn-default");
			$(this).next().addClass("btn-primary");
	
			reloadQuery();
		});
	
		$(".dropdown-menu li a").click(function() {
			$(this).parents(".dropdown-menu").siblings(".btn-query").html($(this).html());
			$(this).parents(".dropdown-menu").siblings(".btn-query").data("type", $(this).data("type"));
	
			$(this).parents(".dropdown-menu").siblings(".btn-query").click();
		});
	
		function reloadQuery(page, index) {
			var sextype = $(".btn-primary.btn-query").data("sex");
			var grouptype = $(".btn-primary.btn-query").data("type");
			bootstraptableReg(sextype, grouptype, 1);
		}
	
		$("#queryRanking").click(function() {
			if ($("#txt_uname").val() == null || $("#txt_uname").val().length <= 0) {
				alert("请填写姓名！");
				return;
			}
			if ($("#txt_cardNo").val() == null || $("#txt_cardNo").val().length <= 0) {
				alert("请填写证件号！");
				return;
			}
	
			$.ajax({
				type : "POST",
				url : "tlist/onesRanking.do",
				data : {
					"uname" : $("#txt_uname").val(),
					"cardNo" : $("#txt_cardNo").val()
				},
				success : function(result) {
					var jsonS = JSON.parse(result);
					if (jsonS != null && jsonS.ranking != null) {
						$(".p_searchtitle").html("选手姓名：" + $("#txt_uname").val() + "，性别：" + jsonS.sex + "，当前排名为：第" + jsonS.ranking + "名！");
						var idStr = jsonS.sex == '男' ? "#div-male" : "#div-female";
						var ridStr = jsonS.sex == '男' ? "#div-female" : "#div-male";
						$(ridStr + " .btn-query").removeClass("btn-primary");
						$(ridStr + " .dropdown-toggle").removeClass("btn-primary");
						$(ridStr + " .btn-query").addClass("btn-default");
						$(ridStr + " .dropdown-toggle").addClass("btn-default");
						$(idStr + " .btn-query").removeClass("btn-default");
						$(idStr + " .dropdown-toggle").removeClass("btn-default");
						$(idStr + " .btn-query").addClass("btn-primary");
						$(idStr + " .dropdown-toggle").addClass("btn-primary");
						$(idStr + " .btn-query").html(jsonS.sex + "子(完整名单)");
						$(idStr + " .btn-query").data("type", 0);
						focusRow(jsonS.ranking);
					} else {
						$(".p_searchtitle").html("抱歉，" + $("#txt_uname").val() + "当前不在排行榜上。");
					}
				}
			});
		});
	
		var focusRow = function(rank) {
			var page = rank % pageSize == 0 ? (rank / pageSize) : (rank / pageSize) + 1;
			page = parseInt(page); //去除小数点
			var index = rank - (page - 1) * pageSize;
			$(".nav-pills li").removeClass("active");
			$(".nav-pills li:eq(0)").addClass("active");
	
			var sextype = $(".btn-primary.btn-query").data("sex");
			var grouptype = $(".btn-primary.btn-query").data("type");
	
			shiningIndex = index;
			bootstraptableReg(sextype, grouptype, page);
		}
	
		var $table = $("#table");
		var colSet;
		var pageSize = 15;
		var bootstraptableReg = function(type, gtype, page) {
			$("#tb_con").html("<table id='table'></table>");
			colInit();
			$("#table").bootstrapTable({ // 对应table标签的id
				method : "post",
				url : "tlist/getList.do", // 获取表格数据的url
				cache : false, // 设置为 false 禁用 AJAX 数据缓存， 默认为true
				striped : true, //表格显示条纹，默认为false
				pagination : true, // 在表格底部显示分页组件，默认false
				pageList : [ 10, 15, 30, 50 ], // 设置页面可以显示的数据条数
				pageSize : pageSize, // 页面数据条数
				pageNumber : page, // 首页页码
				sidePagination : 'server', // 设置为服务器端分页
				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				queryParams : function(params) { // 请求服务器数据时发送的参数，可以在这里添加额外的查询参数，返回false则终止请求
					return {
						pageSize : params.limit, //页面大小
						pageNumber : params.offset,
						qType : type,
						gType : gtype
					}
				},
				columns : colSet,
				onLoadSuccess : function() { //加载成功时执行
					if (page > 1 && shiningIndex >= 0) { //搜索进入
						theShining();
					}
				},
				onLoadError : function() { //加载失败时执行
					console.info("加载数据失败");
				}
			})
		}
		bootstraptableReg("男", 0, 1);
		var currentIndex;
		var sCount = 0;
		var tempTimer;
		function theShining(index) {
			tempTimer = setInterval("_theShining()", 400);
		}
	
		function _theShining() {
			$("#table tr:eq(" + shiningIndex + ")").css({
				"background-color" : sCount % 2 == 0 ? "pink" : "white"
			});
			sCount++;
			if (sCount >= 5) {
				window.clearInterval(tempTimer);
				shiningIndex = -1;
				sCount = 0;
			}
		}
	
		function arrive_timer_format(s) {
			var t;
			if (s > -1) {
				hour = Math.floor(s / 3600);
				min = Math.floor(s / 60) % 60;
				sec = s % 60;
				day = parseInt(hour / 24);
				if (day > 0) {
					hour = hour - 24 * day;
					t = day + "day " + hour + ":";
				}
				else
					t = hour + ":";
				if (min < 10) {
					t += "0";
				}
				t += min + ":";
				if (sec < 10) {
					t += "0";
				}
				t += sec;
			}
			return t;
		}
	
		function colInit() {
			colSet = [ {
				field : 'ranking',
				title : '排名',
				align : 'center', // 左右居中
				valign : 'middle', // 上下居中
				width : '20%',
				formatter : function(value, row, index) { // 单元格格式化函数
	
					return value;
				}
			}, {
				field : 'name', // 返回json数据中的name
				title : '姓名', // 表格表头显示文字
				width : '35%',
				align : 'center', // 左右居中
				valign : 'middle' // 上下居中
			}, {
				field : 'sex',
				title : '性別',
				width : '20%',
				align : 'center',
				valign : 'middle'
			}, {
				field : 'gameName',
				title : '赛事名称',
				width : '35%',
				align : 'center',
				valign : 'middle'
			}
			];
	
		/* if (type > 0) { //小组
			colSet = [ {
				title : '小组排名',
				align : 'center', // 左右居中
				valign : 'middle', // 上下居中
				width : '15%',
				formatter : function(value, row, index) {
					var page = $(".pagination .active a").html();
					return (page - 1) * pageSize + index + 1;
				}
			}, {
				field : 'ranking',
				title : '总排名',
				align : 'center', // 左右居中
				valign : 'middle', // 上下居中
				width : '15%'
			}, {
				field : 'name', // 返回json数据中的name
				title : '姓名', // 表格表头显示文字
				width : '30%',
				align : 'center', // 左右居中
				valign : 'middle' // 上下居中
			}, {
				field : 'sex',
				title : '性別',
				width : '15%',
				align : 'center',
				valign : 'middle'
			}, {
				field : 'sourceSeconds',
				title : '成绩',
				width : '25%',
				align : 'center',
				valign : 'middle',
				formatter : function(value, row, index) { // 单元格格式化函数
					return arrive_timer_format(value);
				}
			}
			];
		} */
		}
	</script>
</body>
</html>

