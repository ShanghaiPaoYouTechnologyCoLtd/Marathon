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
<title>在线万人名单对比</title>
<%@ include file="../../staticFiles/globalCSS.html"%>
<link href="js/bootstrap/bootstraptable/bootstrap-table.min.css"
	rel="stylesheet">
<link href="js/bootstrap/bootstraptable/bootstrap.min.css"
	rel="stylesheet">
<script src="js/jquery.js"></script>
<script src="js/echarts/echarts.min.js"></script>
<script src="js/echarts/html2canvas.min.js"></script>
<style>
#maincontainer, #div_con_head {
	margin: 0px auto;
	width: 70%;
	max-width: 1020px;
	min-width: 400px;
	z-index: 9999;
}

#maincontainer {
	padding-top: 56px;
}

.head_sel {
	width: 20%;
	border: 1px solid #ccc;
	border-right: none;
	padding: 10px 0px;
	text-align: center;
	vertical-align: middle;
	padding: 10px 0px;
}

#div_con_head {
	background-color: #fff;
	left: 0px;
	right: 0px;
	top: 0px;
	margin-left: auto;
	margin-right: auto;
}

.head_sel select {
	width: 90%;
	text-align: center;
	display: inline;
}

.head_sel:first-child {
	width: 40%;
	border-top-left-radius: 15px;
}

.head_sel:last-child {
	border-right: 1px solid #ccc;
	border-top-right-radius: 15px;
}

.head_sel:nth-child(3) {
	
}

.inner_p {
	font-size: 12px;
	line-height: 40px;
	height: 34px;
	margin: 0px;
}

.table-striped  td {
	width: 20%;
}

.table-striped  td:nth-child(1), .table-striped  td:nth-child(2) {
	width: 10%;
}

.table-striped td {
	text-align: center;
	vertical-align: middle !important;
}

.div_timespan {
	width: 33.33%;
	float: left;
	padding-top: 20px;
}

.div_agebar {
	width: 50%;
	float: left;
}
</style>
</head>

<body>
	<div class="kode_wrapper">
		<%@ include file="../../staticFiles/head.html"%>
		<div class="kode_content_wrap" id="main_container_div"
			style="padding-top:40px;">
			<div id="div_con_head">
				<div class="head_sel col-lg-1 col-xs-1">
					<p class="inner_p">本报告由中国马拉松赛事联盟分析提供，请勿用于商业用途！</p>
				</div>
				<div class="head_sel col-lg-1 col-xs-1">
					<select class="form-control selBatchs" id="sel_listA">
						<option value='0'>加载中请稍后</option>
					</select>
				</div>
				<div class="head_sel col-lg-1 col-xs-1">
					<select class="form-control selBatchs" id="sel_listB">
						<option value='0'>加载中请稍后</option>
					</select>
				</div>
				<div class="head_sel col-lg-1 col-xs-1">
					<p class="inner_p" style="line-height:30px">
						<button type="button" class="btn btn-primary" id="btnSaveImg">保存完整图片</button>
					</p>
				</div>
			</div>
			<div id="maincontainer">
				<div id="div_con_body">
					<table
						class="table table-striped table-bordered table-hover table-responsive">
						<tr id="tr_data_count_male">
							<td rowspan="5" class="colresize2">人数(人)</td>
							<td class="colresize2" colspan="2">男性</td>
							<td class="td_data_cells_a">--</td>
							<td class="td_data_cells_b">--</td>
							<td class="td_data_cells_c">--</td>
						</tr>
						<tr id="tr_data_count_female">
							<td class="colresize2" colspan="2">女性</td>
							<td class="td_data_cells_a">--</td>
							<td class="td_data_cells_b">--</td>
							<td class="td_data_cells_c">--</td>
						</tr>
						<tr id="tr_data_count_total">
							<td class="colresize2" colspan="2">总数</td>
							<td class="td_data_cells_a">--</td>
							<td class="td_data_cells_b">--</td>
							<td class="td_data_cells_c">--</td>
						</tr>
						<tr>
							<td class="colresize2" colspan="2">名单变化</td>
							<td colspan="3" id="td_data_count_compare"
								class="td_data_cells_c">-- <!-- 相比第一期万人名单，第二期万人名单共有3702新选手进入名单 -->
							</td>
						</tr>
						<tr>

							<td colspan="5">
								<div id="div_chart_numberofplayer"
									style="height:400px;margin-top:20px;"></div>
							</td>
						</tr>
						<tr id="tr_data_avgsource_male">
							<td rowspan="7" class="colresize2">成绩</td>
							<td class="colresize2" colspan="2">男子平均</td>
							<td class="td_data_cells_a">--</td>
							<td class="td_data_cells_b">--</td>
							<td class="td_data_cells_c">--</td>
						</tr>
						<tr id="tr_data_avgsource_female">
							<td class="colresize2" colspan="2">女子平均</td>
							<td class="td_data_cells_a">--</td>
							<td class="td_data_cells_b">--</td>
							<td class="td_data_cells_c">--</td>
						</tr>
						<tr id="tr_data_avgsource_total">
							<td class="colresize2" colspan="2">总平均</td>
							<td class="td_data_cells_a">--</td>
							<td class="td_data_cells_b">--</td>
							<td class="td_data_cells_c">--</td>
						</tr>
						<tr id="tr_data_bestsource_male">
							<td class="colresize2" colspan="2">男子最佳</td>
							<td class="td_data_cells_a">--</td>
							<td class="td_data_cells_b">--</td>
							<td class="td_data_cells_c">--</td>
						</tr>
						<tr id="tr_data_bestsource_female">
							<td class="colresize2" colspan="2">女子最佳</td>
							<td class="td_data_cells_a">--</td>
							<td class="td_data_cells_b">--</td>
							<td class="td_data_cells_c">--</td>
						</tr>
						<tr id="tr_data_bestsource_total">
							<td class="colresize2" colspan="2">总最佳</td>
							<td class="td_data_cells_a">--</td>
							<td class="td_data_cells_b">--</td>
							<td class="td_data_cells_c">--</td>
						</tr>
						<tr>
							<td colspan="5">
								<div id="div_chart_scoreline"
									style="height:400px;margin-top:20px;"></div>
							</td>
						</tr>
						<tr id="tr_data_timespan_male_1">
							<td rowspan="19" class="colresize3">完成时间段(人)</td>
							<td rowspan="5" class="colresize3">男子</td>
							<td>2:30&lt;</td>
							<td class="td_data_cells_a">--</td>
							<td class="td_data_cells_b">--</td>
							<td class="td_data_cells_c">--</td>
						</tr>
						<tr id="tr_data_timespan_male_2">
							<td>2:30-3:00</td>
							<td class="td_data_cells_a">--</td>
							<td class="td_data_cells_b">--</td>
							<td class="td_data_cells_c">--</td>
						</tr>
						<tr id="tr_data_timespan_male_3">
							<td>3:00-3:30</td>
							<td class="td_data_cells_a">--</td>
							<td class="td_data_cells_b">--</td>
							<td class="td_data_cells_c">--</td>
						</tr>
						<tr id="tr_data_timespan_male_4">
							<td>3:30-4:00</td>
							<td class="td_data_cells_a">--</td>
							<td class="td_data_cells_b">--</td>
							<td class="td_data_cells_c">--</td>
						</tr>
						<tr id="tr_data_timespan_male_5">
							<td>&gt;4:00</td>
							<td class="td_data_cells_a">--</td>
							<td class="td_data_cells_b">--</td>
							<td class="td_data_cells_c">--</td>
						</tr>
						<tr id="tr_data_timespan_female_1">
							<td rowspan="5" class="colresize3">女子</td>
							<td>2:30&lt;</td>
							<td class="td_data_cells_a">--</td>
							<td class="td_data_cells_b">--</td>
							<td class="td_data_cells_c">--</td>
						</tr>
						<tr id="tr_data_timespan_female_2">
							<td>2:30-3:00</td>
							<td class="td_data_cells_a">--</td>
							<td class="td_data_cells_b">--</td>
							<td class="td_data_cells_c">--</td>
						</tr>
						<tr id="tr_data_timespan_female_3">
							<td>3:00-3:30</td>
							<td class="td_data_cells_a">--</td>
							<td class="td_data_cells_b">--</td>
							<td class="td_data_cells_c">--</td>
						</tr>
						<tr id="tr_data_timespan_female_4">
							<td>3:30-4:00</td>
							<td class="td_data_cells_a">--</td>
							<td class="td_data_cells_b">--</td>
							<td class="td_data_cells_c">--</td>
						</tr>
						<tr id="tr_data_timespan_female_5">
							<td>&gt;4:00</td>
							<td class="td_data_cells_a">--</td>
							<td class="td_data_cells_b">--</td>
							<td class="td_data_cells_c">--</td>
						</tr>
						<tr id="tr_data_timespan_total_1">
							<td rowspan="5" class="colresize3">全部</td>
							<td>2:30&lt;</td>
							<td class="td_data_cells_a">--</td>
							<td class="td_data_cells_b">--</td>
							<td class="td_data_cells_c">--</td>
						</tr>
						<tr id="tr_data_timespan_total_2">
							<td>2:30-3:00</td>
							<td class="td_data_cells_a">--</td>
							<td class="td_data_cells_b">--</td>
							<td class="td_data_cells_c">--</td>
						</tr>
						<tr id="tr_data_timespan_total_3">
							<td>3:00-3:30</td>
							<td class="td_data_cells_a">--</td>
							<td class="td_data_cells_b">--</td>
							<td class="td_data_cells_c">--</td>
						</tr>
						<tr id="tr_data_timespan_total_4">
							<td>3:30-4:00</td>
							<td class="td_data_cells_a">--</td>
							<td class="td_data_cells_b">--</td>
							<td class="td_data_cells_c">--</td>
						</tr>
						<tr id="tr_data_timespan_total_5">
							<td>&gt;4:00</td>
							<td class="td_data_cells_a">--</td>
							<td class="td_data_cells_b">--</td>
							<td class="td_data_cells_c">--</td>
						</tr>
						<tr>
							<td colspan="5" id="td_title_timepie_1">时间段饼图</td>
						</tr>
						<tr>
							<td colspan="5">
								<div id="div_chart_timespan_race1_pie1"
									class="div_timespan col-lg-1 col-xs-1" style="height:200px;"></div>
								<div id="div_chart_timespan_race1_pie2"
									class="div_timespan col-lg-1 col-xs-1" style="height:200px;"></div>
								<div id="div_chart_timespan_race1_pie3"
									class="div_timespan col-lg-1 col-xs-1" style="height:200px;"></div>
							</td>
						</tr>
						<tr>
							<td colspan="5" id="td_title_timepie_2">时间段饼图</td>
						</tr>
						<tr>
							<td colspan="5">
								<div id="div_chart_timespan_race2_pie1"
									class="div_timespan col-lg-1 col-xs-1" style="height:200px;"></div>
								<div id="div_chart_timespan_race2_pie2"
									class="div_timespan col-lg-1 col-xs-1" style="height:200px;"></div>
								<div id="div_chart_timespan_race2_pie3"
									class="div_timespan col-lg-1 col-xs-1" style="height:200px;"></div>
							</td>
						</tr>
						<tr id="tr_data_avgage_male">
							<td rowspan="19">年龄</td>
							<td rowspan="3" class="colresize3">平均(岁)</td>
							<td>男子平均</td>
							<td class="td_data_cells_a">--</td>
							<td class="td_data_cells_b">--</td>
							<td class="td_data_cells_c">--</td>
						</tr>
						<tr id="tr_data_avgage_female">
							<td>女子平均</td>
							<td class="td_data_cells_a">--</td>
							<td class="td_data_cells_b">--</td>
							<td class="td_data_cells_c">--</td>
						</tr>
						<tr id="tr_data_avgage_total">
							<td>总平均</td>
							<td class="td_data_cells_a">--</td>
							<td class="td_data_cells_b">--</td>
							<td class="td_data_cells_c">--</td>
						</tr>
						<tr id="tr_data_agespan_total_1">
							<td rowspan="5" class="colresize3">总体年龄段</td>
							<td>20岁以下</td>
							<td class="td_data_cells_a">--</td>
							<td class="td_data_cells_b">--</td>
							<td class="td_data_cells_c">--</td>
						</tr>
						<tr id="tr_data_agespan_total_2">
							<td>20-30岁</td>
							<td class="td_data_cells_a">--</td>
							<td class="td_data_cells_b">--</td>
							<td class="td_data_cells_c">--</td>
						</tr>
						<tr id="tr_data_agespan_total_3">
							<td>30-40岁</td>
							<td class="td_data_cells_a">--</td>
							<td class="td_data_cells_b">--</td>
							<td class="td_data_cells_c">--</td>
						</tr>
						<tr id="tr_data_agespan_total_4">
							<td>40-50岁</td>
							<td class="td_data_cells_a">--</td>
							<td class="td_data_cells_b">--</td>
							<td class="td_data_cells_c">--</td>
						</tr>
						<tr id="tr_data_agespan_total_5">
							<td>50岁以上</td>
							<td class="td_data_cells_a">--</td>
							<td class="td_data_cells_b">--</td>
							<td class="td_data_cells_c">--</td>
						</tr>
						<tr id="tr_data_agespan_male_1">
							<td rowspan="5" class="colresize3">男子年龄段</td>
							<td>20岁以下</td>
							<td class="td_data_cells_a">--</td>
							<td class="td_data_cells_b">--</td>
							<td class="td_data_cells_c">--</td>
						</tr>
						<tr id="tr_data_agespan_male_2">
							<td>20-30岁</td>
							<td class="td_data_cells_a">--</td>
							<td class="td_data_cells_b">--</td>
							<td class="td_data_cells_c">--</td>
						</tr>
						<tr id="tr_data_agespan_male_3">
							<td>30-40岁</td>
							<td class="td_data_cells_a">--</td>
							<td class="td_data_cells_b">--</td>
							<td class="td_data_cells_c">--</td>
						</tr>
						<tr id="tr_data_agespan_male_4">
							<td>40-50岁</td>
							<td class="td_data_cells_a">--</td>
							<td class="td_data_cells_b">--</td>
							<td class="td_data_cells_c">--</td>
						</tr>
						<tr id="tr_data_agespan_male_5">
							<td>50岁以上</td>
							<td class="td_data_cells_a">--</td>
							<td class="td_data_cells_b">--</td>
							<td class="td_data_cells_c">--</td>
						</tr>
						<tr id="tr_data_agespan_female_1">
							<td rowspan="5" class="colresize3">女子年龄段</td>
							<td>20岁以下</td>
							<td class="td_data_cells_a">--</td>
							<td class="td_data_cells_b">--</td>
							<td class="td_data_cells_c">--</td>
						</tr>
						<tr id="tr_data_agespan_female_2">
							<td>20-30岁</td>
							<td class="td_data_cells_a">--</td>
							<td class="td_data_cells_b">--</td>
							<td class="td_data_cells_c">--</td>
						</tr>
						<tr id="tr_data_agespan_female_3">
							<td>30-40岁</td>
							<td class="td_data_cells_a">--</td>
							<td class="td_data_cells_b">--</td>
							<td class="td_data_cells_c">--</td>
						</tr>
						<tr id="tr_data_agespan_female_4">
							<td>40-50岁</td>
							<td class="td_data_cells_a">--</td>
							<td class="td_data_cells_b">--</td>
							<td class="td_data_cells_c">--</td>
						</tr>
						<tr id="tr_data_agespan_female_5">
							<td>50岁以上</td>
							<td class="td_data_cells_a">--</td>
							<td class="td_data_cells_b">--</td>
							<td class="td_data_cells_c">--</td>
						</tr>
						<tr>
							<td colspan="5">
								<div id="div_chart_agebar1" class="div_agebar"
									style="height:460px;"></div>
								<div id="div_chart_agebar2" class="div_agebar"
									style="height:460px;"></div>
							</td>
						</tr>
						<tr id="tr_data_races_1">
							<td rowspan="2">赛事</td>
							<td colspan="5">如果是近期新赛事，旧的名单中可能没有该赛事下的选手及成绩，则显示为0</td>
						</tr>
						<!-- 		<tr>
							<td colspan="2">模板</td>
							<td>0人</td>
							<td>20人</td>
							<td>+20人</td>
						</tr> -->
						<tr>
							<td colspan="5">
								<div id="div_chart_races" style="height:500px;margin-top:20"></div>
							</td>
						</tr>
						<tr id="tr_data_area_most_total">
							<td rowspan="7">地区</td>
							<td colspan="2">人数最多的省份</td>
							<td class="td_data_cells_a">--</td>
							<td class="td_data_cells_b">--</td>
							<td class="td_data_cells_c">--</td>
						</tr>
						<tr id="tr_data_area_most_male">
							<td colspan="2">男性最多的省份</td>
							<td class="td_data_cells_a">--</td>
							<td class="td_data_cells_b">--</td>
							<td class="td_data_cells_c">--</td>
						</tr>
						<tr id="tr_data_area_most_female">
							<td colspan="2">女性最多的省份</td>
							<td class="td_data_cells_a">--</td>
							<td class="td_data_cells_b">--</td>
							<td class="td_data_cells_c">--</td>
						</tr>
						<tr>
							<td colspan="5" id="td_title_map_1">热度地图</td>
						</tr>
						<tr>
							<td colspan="5">
								<div id="div_chart_map1" style="height:600PX;"></div>
							</td>
						</tr>
						<tr>
							<td colspan="5" id="td_title_map_2">热度地图</td>
						</tr>
						<tr>
							<td colspan="5">
								<div id="div_chart_map2" style="height:600PX;"></div>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<%@ include file="../../staticFiles/foot.html"%>
	</div>
	<script src="js/commonTools.js"></script>
	<script>
		var sourceTimeSpan = new Array(14400, 12600, 10800, 9000, 0); //成绩区间
		var ageSpan = new Array(50, 40, 30, 20, 0); //年龄区间
		var initHeadScroll = 300;
		var allBatchs = [];
		var listA = null;
		var listB = null;
		var dataA = null;
		var dataB = null;
		var count_span = 0;
		var chart_players;
		var chart_scoreline;
		var chart_timespan_1;
		var chart_timespan_2;
		var chart_timespan_3;
		var chart_timespan_4;
		var chart_timespan_5;
		var chart_timespan_6;
		var chart_agebar_1;
		var chart_agebar_2;
		var chart_lrbar;
		var chart_map_1;
		var chart_map_2;
		var raceList = new Array();
		var raceList_data = new Array();
	
		function chartsInit() {
			chart_players = echarts.init(document.getElementById("div_chart_numberofplayer"));
			chart_scoreline = echarts.init(document.getElementById("div_chart_scoreline"));
			chart_timespan_1 = echarts.init(document.getElementById("div_chart_timespan_race1_pie1"));
			chart_timespan_2 = echarts.init(document.getElementById("div_chart_timespan_race1_pie2"));
			chart_timespan_3 = echarts.init(document.getElementById("div_chart_timespan_race1_pie3"));
			chart_timespan_4 = echarts.init(document.getElementById("div_chart_timespan_race2_pie1"));
			chart_timespan_5 = echarts.init(document.getElementById("div_chart_timespan_race2_pie2"));
			chart_timespan_6 = echarts.init(document.getElementById("div_chart_timespan_race2_pie3"));
			chart_agebar_1 = echarts.init(document.getElementById("div_chart_agebar1"));
			chart_agebar_2 = echarts.init(document.getElementById("div_chart_agebar2"));
			chart_lrbar = echarts.init(document.getElementById("div_chart_races"));
			chart_map_1 = echarts.init(document.getElementById("div_chart_map1"));
			chart_map_2 = echarts.init(document.getElementById("div_chart_map2"));
		}
	
		function listObject() {
			this.TotalPlayers = 0; //总选手数
			this.MalePlayers = 0; //男性选手数
			this.FemalePlayers = 0; //女性选手数
			this.BestSource = 0; //最高纪录
			this.MaleBestSource = 0; //男性最高好记录
			this.FemaleBestSource = 0; //女性最高纪录
			this.AvgSource = 0; //平均成绩
			this.MaleAvgSource = 0; //男性平均成绩
			this.FemaleAvgSource = 0; //女性平均成绩
			this.MaleFirstHalfAvgSource = 0; //男性前半段平均成绩
			this.FemaleFirstHalfAvgSource = 0; //女性前半段平均成绩
			this.FirstHalfAvgSource = 0; //总体前半段平均成绩
			this.MaleLastHalfAvgSource = 0; //男性后半段平均成绩
			this.FemaleLastHalfAvgSource = 0; //女性后半段平均成绩
			this.LastHalfAvgSource = 0; //总体后半段平均成绩
			this.MaleFirstHalfPlayers = 0; //男性前半段人数
			this.FemaleFirstHalfPlayers = 0; //女性前半段人数
			this.MaleLastHalfPlayers = 0; //男性后半段人数
			this.FemaleLastHalfPlayers = 0; //女性后半段人数
			this.WorstSource = 0; //最差成绩
			this.MaleWorstSource = 0; //男子最差成绩
			this.FemaleWorstSource = 0; //女子最差成绩
			this.MaleTimeSpan = [ 0, 0, 0, 0, 0 ]; //男子成绩区间段人数
			this.FemaleTimeSpan = [ 0, 0, 0, 0, 0 ]; //女子成绩区间段人数
			this.TimeSpan = [ 0, 0, 0, 0, 0 ]; //总体成绩区间段人数
			this.MaleAvgAge = 0; //男子平均年龄
			this.FemaleAvgAge = 0; //女子平均年龄
			this.AvgAge = 0; //总体平均年龄
			this.MaleAgeSpan = [ 0, 0, 0, 0, 0 ]; //男子年龄区间段人数
			this.FemaleAgeSpan = [ 0, 0, 0, 0, 0 ]; //女子年龄区间段人数
			this.AgeSpan = [ 0, 0, 0, 0, 0 ]; //总体年龄区间段人数
			this.MostPlayerProvince = ""; //人数最多的省
			this.MostMalePlayerProvince = ""; //男性人数最多的省
			this.MostFemalePlayerProvince = ""; //女性人数最多的省
			this.FastPlayerProvince = ""; //均速最快的省
			this.FastMalePlayerProvince = ""; //男性均速最快的省
			this.FastFemalePlayerProvince = ""; //女性均速最快的省
			this.PlayersOfProvince = { //每个省份对应的人数
				"北京市" : [ 0, 0, 0 ],
				"天津市" : [ 0, 0, 0 ],
				"河北省" : [ 0, 0, 0 ],
				"山西省" : [ 0, 0, 0 ],
				"内蒙古自治区" : [ 0, 0, 0 ],
				"辽宁省" : [ 0, 0, 0 ],
				"吉林省" : [ 0, 0, 0 ],
				"黑龙江省" : [ 0, 0, 0 ],
				"上海市" : [ 0, 0, 0 ],
				"江苏省" : [ 0, 0, 0 ],
				"浙江省" : [ 0, 0, 0 ],
				"安徽省" : [ 0, 0, 0 ],
				"福建省" : [ 0, 0, 0 ],
				"江西省" : [ 0, 0, 0 ],
				"山东省" : [ 0, 0, 0 ],
				"河南省" : [ 0, 0, 0 ],
				"湖北省" : [ 0, 0, 0 ],
				"湖南省" : [ 0, 0, 0 ],
				"广东省" : [ 0, 0, 0 ],
				"广西壮族自治区" : [ 0, 0, 0 ],
				"海南省" : [ 0, 0, 0 ],
				"重庆市" : [ 0, 0, 0 ],
				"四川省" : [ 0, 0, 0 ],
				"贵州省" : [ 0, 0, 0 ],
				"云南省" : [ 0, 0, 0 ],
				"西藏自治区" : [ 0, 0, 0 ],
				"陕西省" : [ 0, 0, 0 ],
				"甘肃省" : [ 0, 0, 0 ],
				"青海省" : [ 0, 0, 0 ],
				"宁夏回族自治区" : [ 0, 0, 0 ],
				"新疆维吾尔自治区" : [ 0, 0, 0 ],
				"台湾省" : [ 0, 0, 0 ],
				"香港特别行政区" : [ 0, 0, 0 ],
				"澳门特别行政区" : [ 0, 0, 0 ]
			};
		}
	
		window.onload = function() {
			initHeadScroll = $('#div_con_head').offset().top;
			chartsInit();
			getListBatchs();
			drawNumberOfPlayer();
			drawScoreLine();
			drawTimespanPie();
			drawAgeBars();
			drawLRBar();
		}
		window.onscroll = function() {
			if (document.body.scrollTop >= initHeadScroll) {
				$("#div_con_head").attr("style", "position:fixed;");
			} else {
				$("#div_con_head").removeAttr("style");
			}
		}
	
		function regiestChange() {
			$(".selBatchs").change(function() {
				var otherID = $(this).attr("id") == "sel_listA" ? "#sel_listB" : "#sel_listA";
				var isa = otherID == "#sel_listB";
				if ($(this).val() == 0) {
					if ($(this).attr("id") == "sel_listA") {
						listA = null;
						dataA = null;
					} else {
						listB = null;
						dataB = null;
					}
					reloadView(isa ? 0 : 1);
					chartsFill();
					racesCalc();
				} else {
					$(this).attr("disabled", "disabled");
					$(otherID).find("option").show();
					$(otherID).find("option[value=" + $(this).val() + "]").hide(); //删除对比方的同等值
					if (isa) {
						listA = new listObject();
						getData(listA, $(this).val(), true);
					} else {
						listB = new listObject();
						getData(listB, $(this).val(), false);
					}
				}
			});
	
			$(".selBatchs").change(); //注册完成后触发一次
		}
	
		function chartsLoading(isa) {
			chart_players.showLoading();
			chart_scoreline.showLoading();
			if (isa) {
				chart_timespan_1.showLoading();
				chart_timespan_2.showLoading();
				chart_timespan_3.showLoading();
				chart_agebar_1.showLoading();
				chart_map_1.showLoading();
			} else {
				chart_timespan_4.showLoading();
				chart_timespan_5.showLoading();
				chart_timespan_6.showLoading();
				chart_agebar_2.showLoading();
				chart_map_2.showLoading();
			}
			chart_lrbar.showLoading();
		}
	
		function getData(list, bnum, isa) {
			reloadView(isa ? 0 : 1);
			count_span = 0;
			$.ajax({
				url : "tlist/getOneBatchJSON.do",
				async : true,
				type : "POST",
				data : {
					"batchnum" : bnum
				},
				dataType : "json",
				success : function(r) {
					if (isa) {
						dataA = r;
					} else {
						dataB = r;
					}
					list.TotalPlayers = r.length;
					var totalSeconds = 0; //总秒数
					var maleTotalSeconds = 0; //男性总秒数
					var feTotalSeconds = 0; //女性总秒数
					var maleFirstHalfSeconds = 0; //男性前半部分总秒数
					var femaleFirstHalfSeconds = 0; //女性前半部分总秒数
					var firstHalfSeconds = 0; //总体前半部分总秒数
					var maleLastHalfSeconds = 0; //男性后半部分总秒数
					var femaleLastHalfSeconds = 0; //女性后半部分总秒数
					var lastHalfSeconds = 0; //总体后半部分总秒数
					var maleFirstHalfPlayers = 0; //男性前半段人數
					var femaleFirstHalfPlayers = 0; //女性前半段人數
					var maleLastHalfPlayers = 0; //男性後半段人數
					var femaleLastHalfPlayers = 0; //女性后半段人數
					var totalAge = 0; //总年龄叠加
					var maleTotalAge = 0; //男子总年龄
					var femaleTotalAge = 0; //女子总年龄
	
					for (var i in r) {
						totalSeconds += r[i].sourceseconds;
						var rAge = getAgeByID(r[i].idcard);
						totalAge += rAge;
						if (r[i].sex == "男") {
							maleTotalAge += rAge;
							list.MalePlayers++;
							maleTotalSeconds += r[i].sourceseconds;
							if (list.MaleBestSource == 0 || r[i].sourceseconds < list.MaleBestSource) {
								list.MaleBestSource = r[i].sourceseconds;
							}
							if (r[i].sourceseconds > list.MaleWorstSource) {
								list.MaleWorstSource = r[i].sourceseconds;
							}
						} else {
							femaleTotalAge += rAge;
							feTotalSeconds += r[i].sourceseconds;
							list.FemalePlayers++;
							if (list.FemaleBestSource == 0 || r[i].sourceseconds < list.FemaleBestSource) {
								list.FemaleBestSource = r[i].sourceseconds;
							}
							if (r[i].sourceseconds > list.FemaleWorstSource) {
								list.FemaleWorstSource = r[i].sourceseconds;
							}
						}
	
						//统计前后半段总成绩，用于计算平均值
						if (i <= (r.length / 2)) { //前半部分
							firstHalfSeconds += r[i].sourceseconds;
							if (r[i].sex == "男") {
								maleFirstHalfPlayers++;
								maleFirstHalfSeconds += r[i].sourceseconds;
							} else {
								femaleFirstHalfPlayers++;
								femaleFirstHalfSeconds += r[i].sourceseconds;
							}
						} else {
							lastHalfSeconds += r[i].sourceseconds;
							if (r[i].sex == "男") {
								maleLastHalfPlayers++;
								maleLastHalfSeconds += r[i].sourceseconds;
							} else {
								femaleLastHalfPlayers++;
								femaleLastHalfSeconds += r[i].sourceseconds;
							}
						}
	
						//统计赛事区间
						for (var st in sourceTimeSpan) {
							var ss = 4 - st;
							if (r[i].sourceseconds >= sourceTimeSpan[st]) { //大于该区间，则改成绩为该区间内
								list.TimeSpan[ss]++;
								if (r[i].sex == "男") {
									list.MaleTimeSpan[ss]++;
								} else {
									list.FemaleTimeSpan[ss]++;
								}
								break;
							}
						}
	
						//统计年龄区间
						for (var as in ageSpan) {
							var ss = 4 - as;
							if (rAge >= ageSpan[as]) { //大于该区间，则改成绩为该区间内
								list.AgeSpan[ss]++;
								if (r[i].sex == "男") {
									list.MaleAgeSpan[ss]++;
								} else {
									list.FemaleAgeSpan[ss]++;
								}
								break;
							}
						}
	
						try {
							var proName = getProvinceByID(r[i].idcard);
							if (list.PlayersOfProvince[proName][0] != null) {
								list.PlayersOfProvince[proName][0]++;
								if (r[i].sex == "男") {
									list.PlayersOfProvince[proName][1]++;
								} else {
									list.PlayersOfProvince[proName][2]++;
								}
							}
						} catch (err) {}
					}
	
					list.WorstSource = list.FemaleWorstSource > list.MaleWorstSource ? list.FemaleWorstSource : list.MaleWorstSource;
					list.BestSource = list.FemaleBestSource > list.MaleBestSource ? list.MaleBestSource : list.FemaleBestSource;
					list.AvgSource = Math.round(totalSeconds / r.length);
					list.MaleAvgSource = Math.round(maleTotalSeconds / list.MalePlayers);
					list.FemaleAvgSource = Math.round(feTotalSeconds / list.FemalePlayers);
					list.MaleFirstHalfPlayers = maleFirstHalfPlayers;
					list.FemaleFirstHalfPlayers = femaleFirstHalfPlayers;
					list.MaleLastHalfPlayers = maleLastHalfPlayers;
					list.FemaleLastHalfPlayers = femaleLastHalfPlayers;
					list.MaleFirstHalfAvgSource = Math.round(maleFirstHalfSeconds / maleFirstHalfPlayers);
					list.FemaleFirstHalfAvgSource = Math.round(femaleFirstHalfSeconds / femaleFirstHalfPlayers);
					list.FirstHalfAvgSource = Math.round(firstHalfSeconds / (r.length / 2));
					list.MaleLastHalfAvgSource = Math.round(maleLastHalfSeconds / maleLastHalfPlayers);
					list.FemaleLastHalfAvgSource = Math.round(femaleLastHalfSeconds / femaleLastHalfPlayers);
					list.LastHalfAvgSource = Math.round(lastHalfSeconds / (r.length / 2));
					list.AvgAge = (totalAge / r.length).toFixed(2);
					list.MaleAvgAge = (maleTotalAge / list.MalePlayers).toFixed(2);
					list.FemaleAvgAge = (femaleTotalAge / list.FemalePlayers).toFixed(2);
	
	
					for (var px in list.PlayersOfProvince) {
						if (list.MostPlayerProvince.length == 0 ||
							list.PlayersOfProvince[list.MostPlayerProvince][0] < list.PlayersOfProvince[px][0]) {
							list.MostPlayerProvince = px;
						}
						if (list.MostMalePlayerProvince.length == 0 ||
							list.PlayersOfProvince[list.MostMalePlayerProvince][1] < list.PlayersOfProvince[px][1]) {
							list.MostMalePlayerProvince = px;
						}
						if (list.MostFemalePlayerProvince.length == 0 ||
							list.PlayersOfProvince[list.MostFemalePlayerProvince][2] < list.PlayersOfProvince[px][2]) {
	
							list.MostFemalePlayerProvince = px;
						}
					}
	
					if (dataA != null && dataB != null && typeof (Worker) !== "undefined") {
						var worker = new Worker("pages/tlist/playerSpanCalc.js");
						var dataLists = new Array(dataA, dataB);
						worker.postMessage(dataLists);
						worker.onmessage = function(event) {
							document.getElementById("td_data_count_compare").innerHTML = "相比" + $("#sel_listA option:selected").text() + "，" + $("#sel_listB option:selected").text() + "共有" + event.data + "新选手进入名单";
						};
					}
	
					fillData(isa);
				}
			});
		}
	
		//赛事需要独立计算，避免叠加
		function racesCalc() {
			var datas = new Array(dataA, dataB);
			raceList = new Array();
			raceList_data = new Array();
			$("tr[id^='tr_data_races_temp_']").remove();
			for (var i in datas) {
				if (datas[i] == null)
					continue;
	
				for (var k in datas[i]) {
					if ($.inArray(datas[i][k].gamename, raceList) < 0) {
						raceList.push(datas[i][k].gamename);
						var html = '<tr id="tr_data_races_temp_' + (raceList.length + 1) + '"><td colspan="2">' + datas[i][k].gamename + '</td><td>--</td><td>--</td><td>请选择</td></tr>';
						$("#tr_data_races_1").after(html);
					}
					if (raceList_data[datas[i][k].gamename] == null) {
						raceList_data[datas[i][k].gamename] = [ 0, 0 ];
					}
					raceList_data[datas[i][k].gamename][i]++;
				}
			}
			$("#tr_data_races_1 td:eq(0)").attr("rowspan", raceList.length + 2);
	
			$("tr[id^='tr_data_races_temp_']").each(function() {
				var racename = $(this).find("td:eq(0)").html();
				if ($.inArray(racename, raceList) < 0)
					return;
	
				if (listA != null)
					$(this).find("td:eq(1)").html(raceList_data[racename][0]);
				if (listB != null)
					$(this).find("td:eq(2)").html(raceList_data[racename][1]);
				if (listA != null && listB != null)
					fillSpanValue(raceList_data[racename][1] - raceList_data[racename][0], $(this).find("td:eq(3)"), "人");
			});
		}
	
		function fillData(isa) {
			racesCalc();
			var classname = (listA != null && isa) ? ".td_data_cells_a" : ".td_data_cells_b";
			var tempList = (listA != null && isa) ? listA : listB;
			//人数
			$("#tr_data_count_male " + classname).html(tempList.MalePlayers + "人");
			$("#tr_data_count_female " + classname).html(tempList.FemalePlayers + "人");
			$("#tr_data_count_total " + classname).html(tempList.TotalPlayers + "人");
	
			//成绩
			$("#tr_data_avgsource_male " + classname).html(secondsCalc(tempList.MaleAvgSource));
			$("#tr_data_avgsource_female " + classname).html(secondsCalc(tempList.FemaleAvgSource));
			$("#tr_data_avgsource_total " + classname).html(secondsCalc(tempList.AvgSource));
			$("#tr_data_bestsource_male " + classname).html(secondsCalc(tempList.MaleBestSource));
			$("#tr_data_bestsource_female " + classname).html(secondsCalc(tempList.FemaleBestSource));
			$("#tr_data_bestsource_total " + classname).html(secondsCalc(tempList.BestSource));
	
			//成绩段
			for (var i = 0; i < tempList.MaleTimeSpan.length; i++) {
				$("#tr_data_timespan_male_" + (i + 1) + " " + classname).html(tempList.MaleTimeSpan[i] + "人");
				$("#tr_data_timespan_female_" + (i + 1) + " " + classname).html(tempList.FemaleTimeSpan[i] + "人");
				$("#tr_data_timespan_total_" + (i + 1) + " " + classname).html(tempList.TimeSpan[i] + "人");
			}
	
			//年龄
			$("#tr_data_avgage_total " + classname).html(tempList.AvgAge);
			$("#tr_data_avgage_male " + classname).html(tempList.MaleAvgAge);
			$("#tr_data_avgage_female " + classname).html(tempList.FemaleAvgAge);
	
			//年龄段
			for (var i = 0; i < tempList.MaleAgeSpan.length; i++) {
				$("#tr_data_agespan_male_" + (i + 1) + " " + classname).html(tempList.MaleAgeSpan[i] + "人");
				$("#tr_data_agespan_female_" + (i + 1) + " " + classname).html(tempList.FemaleAgeSpan[i] + "人");
				$("#tr_data_agespan_total_" + (i + 1) + " " + classname).html(tempList.AgeSpan[i] + "人");
			}
	
			//地区
			$("#tr_data_area_most_total " + classname).html(tempList.MostPlayerProvince + '<br/>' + tempList.PlayersOfProvince[tempList.MostPlayerProvince][0] + "人");
			$("#tr_data_area_most_male " + classname).html(tempList.MostMalePlayerProvince + '<br/>' + tempList.PlayersOfProvince[tempList.MostMalePlayerProvince][1] + "人");
			$("#tr_data_area_most_female " + classname).html(tempList.MostFemalePlayerProvince + '<br/>' + tempList.PlayersOfProvince[tempList.MostFemalePlayerProvince][2] + "人");
	
			if (listA != null && listB != null) { //两个都选择了，需要进行比对
				//年龄
				var data_TotalPlayers_span = listB.TotalPlayers - listA.TotalPlayers;
				fillSpanValue(data_TotalPlayers_span, $("#tr_data_count_total .td_data_cells_c"), "人");
				var data_MalePlayers_span = listB.MalePlayers - listA.MalePlayers;
				fillSpanValue(data_MalePlayers_span, $("#tr_data_count_male .td_data_cells_c"), "人");
				var data_FemalePlayers_span = listB.FemalePlayers - listA.FemalePlayers;
				fillSpanValue(data_FemalePlayers_span, $("#tr_data_count_female .td_data_cells_c"), "人");
	
				//成绩
				var data_agvsource_male = listB.MaleAvgSource - listA.MaleAvgSource;
				var data_agvsource_female = listB.FemaleAvgSource - listA.FemaleAvgSource;
				var data_agvsource_total = listB.AvgSource - listA.AvgSource;
				var data_bestsource_male = listB.MaleBestSource - listA.MaleBestSource;
				var data_bestsource_female = listB.FemaleBestSource - listA.FemaleBestSource;
				var data_bestsource_total = listB.BestSource - listA.BestSource;
				fillSpanValue(data_agvsource_male, $("#tr_data_avgsource_male .td_data_cells_c"), "秒", "下降", "上升");
				fillSpanValue(data_agvsource_female, $("#tr_data_avgsource_female .td_data_cells_c"), "秒", "下降", "上升");
				fillSpanValue(data_agvsource_total, $("#tr_data_avgsource_total .td_data_cells_c"), "秒", "下降", "上升");
				fillSpanValue(data_bestsource_male, $("#tr_data_bestsource_male .td_data_cells_c"), "秒", "下降", "上升");
				fillSpanValue(data_bestsource_female, $("#tr_data_bestsource_female .td_data_cells_c"), "秒", "下降", "上升");
				fillSpanValue(data_bestsource_total, $("#tr_data_bestsource_total .td_data_cells_c"), "秒", "下降", "上升");
	
				//成绩段
				for (var i = 0; i < sourceTimeSpan.length; i++) {
					var data_malespan = listB.MaleTimeSpan[i] - listA.MaleTimeSpan[i];
					var data_femalespan = listB.FemaleTimeSpan[i] - listA.FemaleTimeSpan[i];
					var data_totalspan = listB.TimeSpan[i] - listA.TimeSpan[i];
	
					fillSpanValue(data_malespan, $("#tr_data_timespan_male_" + (i + 1) + " .td_data_cells_c"), "人");
					fillSpanValue(data_femalespan, $("#tr_data_timespan_female_" + (i + 1) + " .td_data_cells_c"), "人");
					fillSpanValue(data_totalspan, $("#tr_data_timespan_total_" + (i + 1) + " .td_data_cells_c"), "人");
				}
	
				var data_avgage_male = (listB.MaleAvgAge - listA.MaleAvgAge).toFixed(2);
				var data_avgage_female = (listB.FemaleAvgAge - listA.FemaleAvgAge).toFixed(2);
				var data_avgage_total = (listB.AvgAge - listA.AvgAge).toFixed(2);
				fillSpanValue(data_avgage_male, $("#tr_data_avgage_male .td_data_cells_c"), "岁", "↑", "↓");
				fillSpanValue(data_avgage_female, $("#tr_data_avgage_female .td_data_cells_c"), "岁", "↑", "↓");
				fillSpanValue(data_avgage_total, $("#tr_data_avgage_total .td_data_cells_c"), "岁", "↑", "↓");
				//年龄段
				for (var i = 0; i < ageSpan.length; i++) {
					var data_maleagespan = listB.MaleAgeSpan[i] - listA.MaleAgeSpan[i];
					var data_femaleagespan = listB.FemaleAgeSpan[i] - listA.FemaleAgeSpan[i];
					var data_totalagespan = listB.AgeSpan[i] - listA.AgeSpan[i];
	
					fillSpanValue(data_maleagespan, $("#tr_data_agespan_male_" + (i + 1) + " .td_data_cells_c"), "人", "上升", "下降");
					fillSpanValue(data_femaleagespan, $("#tr_data_agespan_female_" + (i + 1) + " .td_data_cells_c"), "人", "上升", "下降");
					fillSpanValue(data_totalagespan, $("#tr_data_agespan_total_" + (i + 1) + " .td_data_cells_c"), "人", "上升", "下降");
				}
	
				try {
					var data_area_mostspan = listB.PlayersOfProvince[listB.MostPlayerProvince][0] - listA.PlayersOfProvince[listA.MostPlayerProvince][0];
					var data_area_malemostspan = listB.PlayersOfProvince[listB.MostMalePlayerProvince][1] - listA.PlayersOfProvince[listA.MostMalePlayerProvince][1];
					var data_area_femalemostspan = listB.PlayersOfProvince[listB.MostFemalePlayerProvince][2] - listA.PlayersOfProvince[listA.MostFemalePlayerProvince][2];
				} catch (err) {}
				//地區
				fillSpanValue(data_area_mostspan, $("#tr_data_area_most_total .td_data_cells_c"), "人", "上升", "下降");
				fillSpanValue(data_area_malemostspan, $("#tr_data_area_most_male .td_data_cells_c"), "人", "上升", "下降");
				fillSpanValue(data_area_femalemostspan, $("#tr_data_area_most_female .td_data_cells_c"), "人", "上升", "下降");
			}
	
			chartsFill();
	
			if (listA != null) {
				$("#td_title_timepie_1").html($("#sel_listA option:selected").text() + "时间段饼图");
				$("#td_title_map_1").html($("#sel_listA option:selected").text() + "热度地图");
				$("#sel_listA").removeAttr("disabled");
			}
			if (listB != null) {
				$("#td_title_timepie_2").html($("#sel_listB option:selected").text() + "时间段饼图");
				$("#td_title_map_2").html($("#sel_listB option:selected").text() + "热度地图");
				$("#sel_listB").removeAttr("disabled");
			}
		}
	
		function secondsCalc(s) {
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
			return t + "(" + s + "秒)";
		}
	
		//图标绘制，在任何情况下，图标均需要重绘
		function chartsFill() {
			drawNumberOfPlayer();
			drawScoreLine();
			drawTimespanPie();
			drawAgeBars();
			drawLRBar();
			drawHotmap();
		}
	
		function fillSpanValue(val, ele, unit, uph, downh) {
			var html = "无变化";
			var uphtml = uph == null ? "上升" : uph;
			var downhtml = downh == null ? "下降" : downh;
			if (val > 0) {
				html = uphtml + val + unit;
			} else if (val < 0) {
				html = downhtml + (-val) + unit;
			}
			$(ele).html(html)
		}
	
		function getListBatchs() {
			$.ajax({
				url : "tlist/getBatchsJson.do",
				async : false,
				type : "POST",
				data : [],
				dataType : "JSON",
				contentType : "application/json",
				success : function(r) {
					allBatchs = r;
					var html = "";
					for (var i in r) {
						html += "<option value='" + r[i].number + "'>" + r[i].name + "</option>"
					}
					$(".selBatchs").html(html);
					$("#sel_listA option").eq(1).attr('selected', 'true'); //左边选择倒数第二期
					regiestChange();
				}
			});
		}
	
		function drawLRBar() {
			myChart = chart_lrbar;
			var legend = [ '请选择名单1', '请选择名单2' ]; //'第一期万人名单', '第二期万人名单'
			var sdatas = [
				{
					name : '请选择名单1',
					type : 'bar',
					stack : '总量',
					label : {
						normal : {
							show : true,
							position : 'left',
							formatter : function(a) {
								if (a.value < 0) {
									return -a.value;
								}
								return a.value;
							}
						}
					},
					data : []
				},
				{
					name : '请选择名单2',
					type : 'bar',
					stack : '总量',
					label : {
						normal : {
							show : true,
							position : 'right',
							formatter : function(a) {
								if (a.value < 0) {
									return -a.value;
								}
								return a.value;
							}
						}
					},
					data : []
				}
			];
			var ydatas = []; //赛事
	
			var lists = new Array(listA, listB);
			for (var i in lists) {
				if (lists[i] != null) {
					sdatas[i].name = (i == 0 ? $("#sel_listA option:selected").text() : $("#sel_listB option:selected").text());
					legend[i] = (i == 0 ? $("#sel_listA option:selected").text() : $("#sel_listB option:selected").text());
					for (var k in raceList) {
						if ($.inArray(raceList[k], ydatas) < 0) {
							ydatas.push(raceList[k]);
						}
						if (i == 0 && listB != null)
							sdatas[i].data.push(-(raceList_data[raceList[k]][i]));
						else if (i == 0 && listB == null)
							sdatas[i].data.push(raceList_data[raceList[k]][i]);
						else
							sdatas[i].data.push(raceList_data[raceList[k]][i]);
					}
				} else {
					legend[i] = "请选择";
				}
			}
			option = {
				tooltip : {
					trigger : 'axis',
					axisPointer : { // 坐标轴指示器，坐标轴触发有效
						type : 'shadow' // 默认为直线，可选为：'line' | 'shadow'
					},
					formatter : function(params) {
						var html = "";
						html += params[0].name + '<br/>';
						html += '<span style="color:#D53A35">❶&nbsp;</span>' + params[0].seriesName + ' : ' + (params[0].value < 0 ? -params[0].value : params[0].value) + '<br/>';
						if (params[1] != null)
							html += '<span style="color:#334B5C">❷&nbsp;</span>' + params[1].seriesName + ' : ' + params[1].value;
						return html;
					}
				},
				legend : {
					data : legend
				},
				grid : {
					left : '3%',
					right : '4%',
					bottom : '3%',
					containLabel : true
				},
				xAxis : [
					{
						type : 'value'
					}
				],
				yAxis : [
					{
						type : 'category',
						axisTick : {
							show : false
						},
						data : ydatas
					}
				],
				series : sdatas
			};
			if (option && typeof option === "object") {
				myChart.setOption(option, true);
			}
			chart_lrbar.hideLoading();
		}
	
	
	
		function drawHotmap() {
			var lists = new Array(listA, listB);
			for (var i in lists) {
				var datas = [];
				if (lists[i] != null) {
					for (var k in lists[i].PlayersOfProvince) {
						datas.push({
							name : k,
							value : lists[i].PlayersOfProvince[k][0]
						});
					}
					try {
						var tempChart = i == 0 ? chart_map_1 : chart_map_2;
						mapDraw(tempChart, datas, (i == 0 ? $("#sel_listA option:selected").text() : $("#sel_listB option:selected").text()) + "热力图",
							lists[i].PlayersOfProvince[lists[i].MostPlayerProvince][0], 0);
					} catch (err) {}
				}
			}
		}
	
		function drawAgeBars() {
			app.config = {
				rotate : 90,
				align : 'left',
				verticalAlign : 'middle',
				position : 'insideBottom',
				distance : 15,
				onChange : function() {
					var labelOption = {
						normal : {
							rotate : app.config.rotate,
							align : app.config.align,
							verticalAlign : app.config.verticalAlign,
							position : app.config.position,
							distance : app.config.distance
						}
					};
					myChart.setOption({
						series : [ {
							label : labelOption
						}, {
							label : labelOption
						}, {
							label : labelOption
						}, {
							label : labelOption
						} ]
					});
				}
			};
			var legend = [ '整体', '男子', '女子' ];
			var ydatas = [ '20岁以下', '20-30岁', '30-40岁', '40-50岁', '50岁以上' ];
			var xaxis = [];
			var lists = new Array(listA, listB);
			for (var i in lists) {
				var sdatas = [ {
					name : '整体',
					type : 'bar',
					data : []
				},
					{
						name : '男子',
						type : 'bar',
						data : []
					}
					,
					{
						name : '女子',
						type : 'bar',
						data : []
					} ];
				var tempchart = i == 0 ? chart_agebar_1 : chart_agebar_2;
				if (lists[i] != null) {
					//年龄段
					for (var yx = 0; yx < ageSpan.length; yx++) {
						sdatas[0].data.push(lists[i].AgeSpan[yx]);
						sdatas[1].data.push(lists[i].MaleAgeSpan[yx]);
						sdatas[2].data.push(lists[i].FemaleAgeSpan[yx]);
					}
					var htext = i == 0 ? $("#sel_listA option:selected").text() : $("#sel_listB option:selected").text();
					htext = htext.replace("万人名单", "");
					barDraw(tempchart, setPara(legend, xaxis, sdatas, htext + "年龄层", false, "", false, 'item', ydatas));
				} else {
					barDraw(tempchart, setPara(legend, xaxis, sdatas, "请选择", false, "", false, 'item', ydatas));
				}
			}
		}
	
		function drawTimespanPie() {
			app.config = {
				rotate : 90,
				align : 'left',
				verticalAlign : 'middle',
				position : 'insideBottom',
				distance : 15,
				onChange : function() {
					var labelOption = {
						normal : {
							rotate : app.config.rotate,
							align : app.config.align,
							verticalAlign : app.config.verticalAlign,
							position : app.config.position,
							distance : app.config.distance
						}
					};
					myChart.setOption({
						series : [ {
							label : labelOption
						}, {
							label : labelOption
						}, {
							label : labelOption
						}, {
							label : labelOption
						} ]
					});
				}
			};
			/* 			var legend = []; // [ '2:30<', '2:30-3:00', '3:00-3:30', '3:30-4:00', '4:00-4:30', '>4:30' ];
						var xaxis = []; */
			var sdatas = [ [], [], [], [], [], [] ];
			var lists = new Array(listA, listB);
			for (var li in lists) {
				if (lists[li] != null) {
					var dataValues = new Array(lists[li].TimeSpan, lists[li].MaleTimeSpan, lists[li].FemaleTimeSpan);
					for (var i = 0; i <= 2; i++) {
						var values = dataValues[i];
						var sdataI = li == 0 ? i : i + 3;
						sdatas[sdataI] = [
							{
								name : '人数',
								type : 'pie',
								radius : '55%',
								label : {
									normal : {
										formatter : '{b}({d}%)',
										backgroundColor : '#eee',
										borderColor : '#aaa',
										borderWidth : 1,
										borderRadius : 4,
										padding : 5
									}
								},
								data : [
									{
										value : values[0],
										name : '2:30<'
									},
									{
										value : values[1],
										name : '2:30-3:00'
									},
									{
										value : values[2],
										name : '3:00-3:30'
									},
									{
										value : values[3],
										name : '3:30-4:00'
									},
									{
										value : values[4],
										name : '>4:00'
									}
								],
								itemStyle : {
									emphasis : {
										shadowBlur : 10,
										shadowOffsetX : 0,
										shadowColor : 'rgba(0, 0, 0, 0.5)'
									}
								}
							}
						];
					}
				}
			}
	
			var htext = listA != null ? $("#sel_listA option:selected").text() : null;
			if (htext != null)
				htext.replace("万人名单", "");
			pieDraw(chart_timespan_1, setPara([], [], sdatas[0], htext == null ? "请选择" : htext + "全部", false, "", false, 'item'));
			pieDraw(chart_timespan_2, setPara([], [], sdatas[1], htext == null ? "请选择" : htext + "男子", false, "", false, 'item'));
			pieDraw(chart_timespan_3, setPara([], [], sdatas[2], htext == null ? "请选择" : htext + "女子", false, "", false, 'item'));
			htext = listB != null ? $("#sel_listB option:selected").text() : null;
			if (htext != null)
				htext.replace("万人名单", "");
			pieDraw(chart_timespan_4, setPara([], [], sdatas[3], htext == null ? "请选择" : htext + "全部", false, "", false, 'item'));
			pieDraw(chart_timespan_5, setPara([], [], sdatas[4], htext == null ? "请选择" : htext + "男子", false, "", false, 'item'));
			pieDraw(chart_timespan_6, setPara([], [], sdatas[5], htext == null ? "请选择" : htext + "女子", false, "", false, 'item'));
		}
	
		function drawScoreLine() {
			app.config = {
				rotate : 90,
				align : 'left',
				verticalAlign : 'middle',
				position : 'insideBottom',
				distance : 15,
				onChange : function() {
					var labelOption = {
						normal : {
							rotate : app.config.rotate,
							align : app.config.align,
							verticalAlign : app.config.verticalAlign,
							position : app.config.position,
							distance : app.config.distance
						}
					};
					myChart.setOption({
						series : [ {
							label : labelOption
						}, {
							label : labelOption
						}, {
							label : labelOption
						}, {
							label : labelOption
						} ]
					});
				}
			};
			var labelOption = {
				normal : {
					show : true,
					position : app.config.position,
					distance : app.config.distance,
					align : app.config.align,
					verticalAlign : app.config.verticalAlign,
					rotate : app.config.rotate,
					formatter : '{c}  {name|{a}}',
					fontSize : 16,
					rich : {
						name : {
							textBorderColor : '#fff'
						}
					}
				}
			};
			var xaxis = [ '最低', '后半部分平均', '整体平均', '前半部分平均', '最高' ];
			drawScoreLineLoad = true;
	
			var legend = []; //'第一期整体', '第一期男性', '第一期女性', '第二期整体', '第二期男性', '第二期女性' 
			var sdatas = [];
			var lists = new Array(listA, listB);
			for (var i in lists) {
				if (lists[i] != null) {
					var temp = lists[i];
					var htext = i == 0 ? $("#sel_listA option:selected").text() : $("#sel_listB option:selected").text();
					htext = htext.replace("万人名单", "");
					legend.push(htext + "整体");
					legend.push(htext + "男性");
					legend.push(htext + "女性");
					sdatas.push({
						name : htext + "整体",
						type : 'line',
						data : [ temp.WorstSource, temp.LastHalfAvgSource, temp.AvgSource, temp.FirstHalfAvgSource, temp.BestSource ]
					});
					sdatas.push({
						name : htext + "男性",
						type : 'line',
						data : [ temp.MaleWorstSource, temp.MaleLastHalfAvgSource, temp.MaleAvgSource, temp.MaleFirstHalfAvgSource, temp.MaleBestSource ]
					});
					sdatas.push({
						name : htext + "女性",
						type : 'line',
						data : [ temp.FemaleWorstSource, temp.FemaleLastHalfAvgSource, temp.FemaleAvgSource, temp.FemaleFirstHalfAvgSource, temp.FemaleBestSource ]
					});
				}
			}
			chartDraw_Line(chart_scoreline, setPara(legend, xaxis, sdatas, "成绩曲线图(秒)", true, "", true, 'axis'));
			chart_scoreline.hideLoading();
		}
	
		function drawNumberOfPlayer() {
			app.config = {
				rotate : 0,
				align : 'center',
				verticalAlign : 'middle',
				position : 'top',
				distance : 18,
				onChange : function() {
					var labelOption = {
						normal : {
							rotate : app.config.rotate,
							align : app.config.align,
							verticalAlign : app.config.verticalAlign,
							position : app.config.position,
							distance : app.config.distance
						}
					};
					myChart.setOption({
						series : [ {
							label : labelOption
						}, {
							label : labelOption
						}, {
							label : labelOption
						}, {
							label : labelOption
						} ]
					});
				}
			};
			var labelOption = {
				normal : {
					show : true,
					position : app.config.position,
					distance : app.config.distance,
					align : app.config.align,
					verticalAlign : app.config.verticalAlign,
					rotate : app.config.rotate,
					formatter : '{name|{a}} \n {c}',
					fontSize : 16,
					rich : {
						name : {
							textBorderColor : '#fff'
						}
					}
				}
			};
			var legend = [ '总人数', '男性', '女性' ];
			drawNumberOfPlayerLoad = true;
			var xaxis = [];
			var sdatas = [ {
				name : '总人数',
				type : 'bar',
				barGap : 0,
				label : labelOption,
				data : []
			},
				{
					name : '男性',
					type : 'bar',
					label : labelOption,
					data : []
				},
				{
					name : '女性',
					type : 'bar',
					label : labelOption,
					data : []
				} ];
	
			if (listA != null) {
				xaxis.push($("#sel_listA option:selected").text());
				sdatas[0].data.push(listA.TotalPlayers);
				sdatas[1].data.push(listA.MalePlayers);
				sdatas[2].data.push(listA.FemalePlayers);
			}
			if (listB != null) {
				xaxis.push($("#sel_listB option:selected").text());
				sdatas[0].data.push(listB.TotalPlayers);
				sdatas[1].data.push(listB.MalePlayers);
				sdatas[2].data.push(listB.FemalePlayers);
			}
			chartDraw_Bar(chart_players, setPara(legend, xaxis, sdatas, "选手人数图表", false, "", true, 'axis'));
			chart_players.hideLoading();
		}
	
		function setPara(lege, xax, sdata, title, isYinv, subtitle, showtools, tooltipT, ydatas) {
			var params = {
				"legendD" : lege,
				"xAxisD" : xax,
				"xdatas" : sdata,
				"titleD" : title,
				"isYinverse" : isYinv,
				"subtext" : subtitle,
				"showtools" : showtools,
				"tooltipT" : tooltipT,
				"ydatas" : ydatas
			};
			return params;
		}
	
		function mapDraw(myChart, datas, title, max, min) {
			var jsonURL = 'pages/tlist/china_full.json';
	
			$.get(jsonURL, function(geoJson) {
	
				echarts.registerMap('CHN', geoJson);
	
				myChart.setOption(option = {
					title : {
						text : title,
						subtext : '地图数据由百度提供',
						sublink : 'http://echarts.baidu.com/download-map.html'
					},
					tooltip : {
						trigger : 'item',
						formatter : '{b}<br/>{c} (人)'
					},
					toolbox : {
						show : true,
						orient : 'vertical',
						left : 'right',
						top : 'center',
						feature : {
							dataView : {
								readOnly : false
							},
							restore : {},
							saveAsImage : {}
						}
					},
					visualMap : {
						min : min,
						max : max,
						text : [ '火热', '冷清' ],
						realtime : false,
						calculable : true,
						inRange : {
							color : [ '#fff', 'lightskyblue', '#006699' ]
						}
					},
					series : [
						{
							name : title,
							type : 'map',
							mapType : 'CHN', // 自定义扩展图表类型
							itemStyle : {
								normal : {
									label : {
										show : true
									}
								},
								emphasis : {
									label : {
										show : true
									}
								}
							},
							data : datas
						}
					]
				});
			});
			myChart.hideLoading();
		}
	
		function pieDraw(myChart, params) {
			option = {
				color : [ '#002242', '#003366', '#006699', '#4cabce', '#96d0e7' ],
				title : {
					text : params.titleD,
					top : -5,
					x : 'center',
					textStyle : {
						fontSize : 12
					}
				},
				tooltip : {
					trigger : 'item',
					formatter : "时间段：{b}<br/>总人数：{c}<br/>占比：{d}%"
				},
				series : params.xdatas
			};
			if (option && typeof option === "object") {
				myChart.setOption(option, true);
			}
			myChart.hideLoading();
		}
	
		function barDraw(myChart, params) {
			option = {
				color : [ '#006699', '#4cabce', '#e5323e' ],
				title : {
					text : params.titleD,
					padding : [ 10, 0, 0, 20 ],
					subtext : params.subtext
				},
				tooltip : {
					trigger : params.tooltipT,
					axisPointer : {
						type : 'shadow'
					}
				},
				legend : {
					top : 30,
					data : params.legendD
				},
				toolbox : {
					show : true,
					orient : 'vertical',
					left : 'right',
					top : 'center',
					feature : {
						saveAsImage : {
							show : true
						}
					}
				},
				calculable : true,
				xAxis : {
					type : 'value',
					boundaryGap : [ 0, 0.01 ]
				},
				yAxis : {
					nameTextStyle : {
						fontSize : 14
					},
					axisLabel : {
						interval : 0,
						rotate : 45,
						margin : 3,
						textStyle : {
							align : 'right',
							baseline : 'middle'
						}
					},
					type : 'category',
					data : params.ydatas
				},
				series : params.xdatas
			};
			if (option && typeof option === "object") {
				myChart.setOption(option, true);
			}
			myChart.hideLoading();
		}
	
		var toolboxD = {
			show : true,
			orient : 'vertical',
			left : 'right',
			top : 'center',
			feature : {
				mark : {
					show : true
				},
				dataView : {
					show : true,
					readOnly : false
				},
				magicType : {
					show : true,
					type : [ 'line', 'bar', 'stack', 'tiled', "pie" ]
				},
				restore : {
					show : true
				},
				saveAsImage : {
					show : true
				}
			}
		};
	
		function chartDraw_Line(myChart, params) {
			toolboxD = {};
			var colorList = [ '#003366', '#006699', '#4cabce', '#e5323e', '#F2646F', '#F28A92' ];
	
			option = {
				color : colorList,
				title : {
					text : params.titleD,
					padding : [ 0, 0, 0, 70 ],
					subtext : params.subtext
				},
				tooltip : {
					trigger : params.tooltipT,
					axisPointer : {
						type : 'shadow'
					},
					formatter : function(params) {
						var html = "";
						html += params[0].name + '<br/>';
						for (var i in params) {
							html += '<span style="color:' + params[i].color + '">❶&nbsp;</span>' + params[i].seriesName + ' : ' + secondsCalc(params[i].value) + '<br/>';
						}
						return html;
					}
				},
				legend : {
					top : 30,
					data : params.legendD
				},
				toolbox : toolboxD,
				calculable : true,
				xAxis : [
					{
						type : 'category',
						axisTick : {
							show : false
						},
						data : params.xAxisD
					}
				],
				yAxis : [
					{
						type : 'value',
						inverse : params.isYinverse
					}
				],
				series : params.xdatas
			};
			if (option && typeof option === "object") {
				myChart.setOption(option, true);
			}
			myChart.hideLoading();
		}
	
		function chartDraw_Bar(myChart, params) {
			option = {
				color : [ '#003366', '#006699', '#4cabce', '#e5323e', '#F2646F', '#F28A92' ],
				title : {
					text : params.titleD,
					padding : [ 0, 0, 0, 70 ],
					subtext : params.subtext
				},
				tooltip : {
					trigger : params.tooltipT,
					axisPointer : {
						type : 'shadow'
					}
				},
				legend : {
					top : 30,
					data : params.legendD
				},
				toolbox : toolboxD,
				calculable : true,
				xAxis : [
					{
						type : 'category',
						axisTick : {
							show : false
						},
						data : params.xAxisD
					}
				],
				yAxis : [
					{
						type : 'value',
						inverse : params.isYinverse
					}
				],
				series : params.xdatas
			};
			if (option && typeof option === "object") {
				myChart.setOption(option, true);
			}
			myChart.hideLoading();
		}
	
		var app = {};
		var option = null;
		var posList = [
			'left', 'right', 'top', 'bottom',
			'inside',
			'insideTop', 'insideLeft', 'insideRight', 'insideBottom',
			'insideTopLeft', 'insideTopRight', 'insideBottomLeft', 'insideBottomRight'
		];
	
		app.configParameters = {
			rotate : {
				min : -90,
				max : 90
			},
			align : {
				options : {
					left : 'left',
					center : 'center',
					right : 'right'
				}
			},
			verticalAlign : {
				options : {
					top : 'top',
					middle : 'middle',
					bottom : 'bottom'
				}
			},
			position : {
				options : echarts.util.reduce(posList, function(map, pos) {
					map[pos] = pos;
					return map;
				}, {})
			},
			distance : {
				min : 0,
				max : 100
			}
		};
	
		$("#btnSaveImg").click(function() {
			html2canvas(document.querySelector("#main_container_div")).then(canvas => {
				var tempSrc = canvas.toDataURL("image/png");
	
				var aLink = document.createElement('a');
				aLink.href = tempSrc;
				aLink.download = "第X期与第X期万人名单的对比.png";
				var event;
				if (window.MouseEvent)
					event = new MouseEvent('click');else {
					event = document.createEvent('MouseEvents');
					event.initMouseEvent('click', true, false, window, 0, 0, 0, 0, 0, false, false, false, false, 0, null);
				}
				aLink.dispatchEvent(event);
			});
		});
	
		//0重新加载A 1 重新加载B 2重新加载所有
		function reloadView(type) {
			if (type == 0 || type == 2) {
				$(".td_data_cells_a").html("--");
			} else if (type == 1 || type == 2) {
				$(".td_data_cells_b").html("--");
			}
	
			var loadtext = listA != null && listB != null ? "计算中" : "请选择";
	
			//以下为公共计算，任意一方重置则必须重置
			$(".td_data_cells_c").html(loadtext);
			chartsLoading(type == 0);
		}
	</script>
</body>
</html>

