<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<script src="js/jquery.js"></script>
<style>
.div_logs {
margin-bottom:40px;
}
.div_logs td{
   width:50%;
   border:none;
   text-align:center;
}
</style>
</head>

<body>
	<div class="kode_wrapper">
		<%@ include file="../staticFiles/head.html"%>
		<div class="kode_content_wrap">
			<section class="kf_overview_page">
				<div class="container">

					<div class="overview_wrap">
						<div class="row">
							<div class="col-md-8">
							<a href="passport/Instruction/marathonInstructions.jsp" style="color: #b12025;text-decoration: underline;">点击前往了解办理《中国马拉松护照》</a><br/>
								<!--Overview Contant Start-->
								<div class="kf_featured_wrap2" style="margin-top:20px;">
									<!--Featured 2 thumb Start-->
									<div class="kf_featured_thumb">
										<figure>
											<img src="extra-images/olympics/img2.png" alt="">
										</figure>
										<div class="text_wrper">
											<div class="text">
												<h2>我要上奥运细则说明</h2>
												<p>搭载全新精品系列赛事——中国马拉松大奖赛，利用现有优秀赛事资源，选拔大众跑者最优秀选手。</p>
												<p>A. 选手资格 i.
													以2018年2月中国田径协会官方公布的“万人大名单”（男子6000人，女子4000人）为基础，利用赛事进行动态更新。考虑到2017年中国马拉松比赛参赛选手实际男女比例为73%：27%，为了更接近实际情况，及提升比赛的竞争程度，缩短总决赛关门......
												</p>
												<a class="btn_2" href="pages/temp/temp1.jsp">查看详情&raquo;</a>
											</div>
											<div class="thumb_footer">
												<div class="admin_thumb">
													<img src="extra-images/admin.png" class="marathon-img">
													<h6>中国马拉松赛事联盟</h6>
												</div>
											</div>
										</div>
									</div>
									<!--Featured 2 thumb End-->
								</div>
								<!-- 16站说明 start -->
								<div class="kf_overview kf_overview_roster">
									<!--Heading 1 Start-->
									<h6 class="kf_hd1 margin_0">
										<span>中国马拉松大奖赛-成员赛事</span>
										<!-- 	<a class="prv_btn"
											href="pages/memberEvents.jsp">查看更多&raquo;</a> -->
									</h6>
									<!--Heading 1 End-->
									<!--Table 2 Start-->
									<ul class="kf_table2">
										<li class="table_head">
											<div class="tb2_nbr">
												<span>序号</span>
											</div>
											<div class="tb2_name">
												<span>赛事名称</span>
											</div>
											<div class="tb2_position">
												<span>赛事类型</span>
											</div>
											<div class="tb2_age">
												<span>比赛时间</span>
											</div>
											<div class="tb2_weight">
												<span>比赛地点</span>
											</div>
										</li>
										<li>
											<div class="tb2_nbr">
												<span>1</span>
											</div>
											<div class="tb2_name">
												<span>重庆国际马拉松</span>
											</div>
											<div class="tb2_position">
												<span>A类赛事</span>
											</div>
											<div class="tb2_age">
												<span>2018/3/25</span>
											</div>
											<div class="tb2_weight">
												<span>重庆</span>
											</div>
										</li>
										<li>
											<div class="tb2_nbr">
												<span>2</span>
											</div>
											<div class="tb2_name">
												<span>徐州国际马拉松</span>
											</div>
											<div class="tb2_position">
												<span>A类赛事</span>
											</div>
											<div class="tb2_age">
												<span>2018/3/25</span>
											</div>
											<div class="tb2_weight">
												<span>徐州</span>
											</div>
										</li>
										<li>
											<div class="tb2_nbr">
												<span>3</span>
											</div>
											<div class="tb2_name">
												<span>杨凌国际马拉松</span>
											</div>
											<div class="tb2_position">
												<span>A类赛事</span>
											</div>
											<div class="tb2_age">
												<span>2018/4/15</span>
											</div>
											<div class="tb2_weight">
												<span>杨凌</span>
											</div>
										</li>
										<li>
											<div class="tb2_nbr">
												<span>4</span>
											</div>
											<div class="tb2_name">
												<span>秦皇岛国际马拉松</span>
											</div>
											<div class="tb2_position">
												<span>A类赛事</span>
											</div>
											<div class="tb2_age">
												<span>2018/5/13</span>
											</div>
											<div class="tb2_weight">
												<span>秦皇岛</span>
											</div>
										</li>
										<li>
											<div class="tb2_nbr">
												<span>5</span>
											</div>
											<div class="tb2_name">
												<span>黄河口（东营）马拉松</span>
											</div>
											<div class="tb2_position">
												<span>A类赛事</span>
											</div>
											<div class="tb2_age">
												<span>2018/5/5</span>
											</div>
											<div class="tb2_weight">
												<span>东营</span>
											</div>
										</li>
										<li>
											<div class="tb2_nbr">
												<span>6</span>
											</div>
											<div class="tb2_name">
												<span>兰州国际马拉松</span>
											</div>
											<div class="tb2_position">
												<span>A类赛事</span>
											</div>
											<div class="tb2_age">
												<span>2018/6/10</span>
											</div>
											<div class="tb2_weight">
												<span>兰州</span>
											</div>
										</li>
										<li>
											<div class="tb2_nbr">
												<span>7</span>
											</div>
											<div class="tb2_name">
												<span>吉林市国际马拉松</span>
											</div>
											<div class="tb2_position">
												<span>A类赛事</span>
											</div>
											<div class="tb2_age">
												<span>2018/6/10</span>
											</div>
											<div class="tb2_weight">
												<span>吉林</span>
											</div>
										</li>
										<li>
											<div class="tb2_nbr">
												<span>8</span>
											</div>
											<div class="tb2_name">
												<span>六盘水国际马拉松</span>
											</div>
											<div class="tb2_position">
												<span>A类赛事</span>
											</div>
											<div class="tb2_age">
												<span>2018/7/29</span>
											</div>
											<div class="tb2_weight">
												<span>六盘水</span>
											</div>
										</li>
										<li>
											<div class="tb2_nbr">
												<span>9</span>
											</div>
											<div class="tb2_name">
												<span>衡水湖国际马拉松</span>
											</div>
											<div class="tb2_position">
												<span>A类赛事</span>
											</div>
											<div class="tb2_age">
												<span>2018/9/22</span>
											</div>
											<div class="tb2_weight">
												<span>衡水湖</span>
											</div>
										</li>
										<li>
											<div class="tb2_nbr">
												<span>10</span>
											</div>
											<div class="tb2_name">
												<span>北京国际马拉松</span>
											</div>
											<div class="tb2_position">
												<span>A类赛事</span>
											</div>
											<div class="tb2_age">
												<span>2018/9/23</span>
											</div>
											<div class="tb2_weight">
												<span>北京</span>
											</div>
										</li>
										<li>
											<div class="tb2_nbr">
												<span>11</span>
											</div>
											<div class="tb2_name">
												<span>南京国际马拉松</span>
											</div>
											<div class="tb2_position">
												<span>A类赛事</span>
											</div>
											<div class="tb2_age">
												<span>2018/10/21</span>
											</div>
											<div class="tb2_weight">
												<span>南京</span>
											</div>
										</li>
										<li>
											<div class="tb2_nbr">
												<span>12</span>
											</div>
											<div class="tb2_name">
												<span>宜昌国际马拉松</span>
											</div>
											<div class="tb2_position">
												<span>A类赛事</span>
											</div>
											<div class="tb2_age">
												<span>2018/11/4</span>
											</div>
											<div class="tb2_weight">
												<span>宜昌</span>
											</div>
										</li>
										<li>
											<div class="tb2_nbr">
												<span>13</span>
											</div>
											<div class="tb2_name">
												<span>合肥国际马拉松</span>
											</div>
											<div class="tb2_position">
												<span>A类赛事</span>
											</div>
											<div class="tb2_age">
												<span>2018/11/11</span>
											</div>
											<div class="tb2_weight">
												<span>合肥</span>
											</div>
										</li>
										<li>
											<div class="tb2_nbr">
												<span>14</span>
											</div>
											<div class="tb2_name">
												<span>上海国际马拉松</span>
											</div>
											<div class="tb2_position">
												<span>A类赛事</span>
											</div>
											<div class="tb2_age">
												<span>2018/11(待定)</span>
											</div>
											<div class="tb2_weight">
												<span>上海</span>
											</div>
										</li>
										<li>
											<div class="tb2_nbr">
												<span>15</span>
											</div>
											<div class="tb2_name">
												<span>厦门国际马拉松</span>
											</div>
											<div class="tb2_position">
												<span>A类赛事</span>
											</div>
											<div class="tb2_age">
												<span>2019/1/7</span>
											</div>
											<div class="tb2_weight">
												<span>厦门</span>
											</div>
										</li>
										<li>
											<div class="tb2_nbr">
												<span>16</span>
											</div>
											<div class="tb2_name">
												<span>(待定)</span>
											</div>
											<div class="tb2_position">
												<span>A类赛事</span>
											</div>
											<div class="tb2_age">
												<span>2019/3(待定)</span>
											</div>
											<div class="tb2_weight">
												<span>(待定)</span>
											</div>
										</li>
									</ul>
									<!--Table 2 End-->
								</div>
								<!-- 16站说明 end -->
								<div class="kf_featured_thumb match-list">
									<div class="text_wrper" style="width:100%;">
										<div class="text">
											<h2>
												<a href="javascript:;">中国马拉松大奖赛福利</a>
											</h2>
											<div class="what-we-do bg">
												<div class="row">
													<div class="col-md-4 col-sm-6 col-xs-12 wow fadeInUp">
														<div class="single-block tran3s">
															<img src="extra-images/1.png" alt="" class="tran4s">
															<h6>奥运会参赛名额</h6>
															<h5>总决赛前十名可获得奥运会参赛名额或助威名额</h5>
														</div>
														<!-- /.single-block -->
													</div>
													<!-- /.col- -->
													<div class="col-md-4 col-sm-6 col-xs-12 wow fadeInUp"
														data-wow-delay="0.1s">
														<div class="single-block tran3s">
															<img src="extra-images/2.png" alt="" class="tran4s">
															<h6>免费直通车名额</h6>
															<h5>千人跑团前100位报名赛事的选手享有免费直通名额</h5>
														</div>
														<!-- /.single-block -->
													</div>
													<!-- /.col- -->
													<div class="col-md-4 hidden-sm col-xs-12 wow fadeInUp"
														data-wow-delay="0.150s">
														<div class="single-block tran3s">
															<img src="extra-images/3.png" alt="" class="tran4s">
															<h6>免抽签直通车名额</h6>
															<h5>万人名单选手前500位报名赛事的选手享有付费直通名额</h5>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<aside class="col-md-4">
								<div class="div_logs">
									<table>
										<tr>
											<td><img src="extra-images/logs/caa.png" width="90%"/></td>
											<td><img src="extra-images/logs/wysay.png" width="90%"/></td>
										</tr>
										<tr style="padding-top:30px;">
											<td><img src="extra-images/logs/cmgp.png" width="90%"/></td>
											<td><img src="extra-images/logs/CML.png" width="90%"/></td>
										</tr>
									</table>
								</div>
								<script>
								   $(".div_logs img").each(function(){
								   $(this).attr("height",$(this).width());
								   });
								</script>
								<!--Widget Ranking Start-->
								<div class="widget widget_ranking">
									<!--Heading 1 Start-->
									<h6 class="kf_hd1">
										<span>万人动态名单</span> <a class="prv_btn"
											href="pages/runnerList.jsp">查看更多&raquo;</a>
									</h6>
									<!--Heading 1 END-->
									<div class="kf_border">
										<!--Table Wrap Start-->
										<ul class="kf_table" id="ul_tlist">

										</ul>
										<!--Table Wrap End-->
									</div>
								</div>

								<!--Widget Team News Start-->
								<!-- 								<div class="widget widget_teamnews">
									Heading 1 Start
									<h6 class="kf_hd1">
										<span>相关新闻</span>
									</h6>
									Heading 1 END
									<div class="kf_border">
										Recent Post Dec Start
										<div class="recentpost_dec">
											<p>我要上奥运发布会在3.20号正式举行，意味着我要上奥运项目的正式发行，这一历史性的时刻</p>
											<span>2018/3/20&nbsp;&nbsp;&nbsp;我要上奥运</span>
										</div>
										Recent Post Dec End
										Recent Post Dec Start
										<div class="recentpost_dec">
											<p>我要上奥运发布会在3.20号正式举行，意味着我要上奥运项目的正式发行，这一历史性的时刻</p>
											<span>2018/3/20&nbsp;&nbsp;&nbsp;我要上奥运</span>
										</div>
										Recent Post Dec End
									</div>
								</div> -->
								<!--Widget Team News End-->
							</aside>
						</div>
					</div>
				</div>
			</section>
		</div>
		<%@ include file="../staticFiles/foot.html"%>
	</div>
	<script>
		$.ajax({
			type : "POST",
			url : "tlist/getList.do",
			data : {
				"pageSize" : 10,
				"pageNumber" : 0,
				"qType" : '男',
				"gType" : 0
			},
			success : function(result) {
				var jsonS = JSON.parse(result);
				if (jsonS != null) {
					$("#ul_tlist").append('<li><div class="table_no" style=""><span>男子组</span></div></li>');
					for (var i = 0; i < jsonS.rows.length; i++) {
						$("#ul_tlist").append('<li><div class="table_no"><span>' + jsonS.rows[i].ranking + '</span></div><div class="team_logo"><a href="javascript:;">' + jsonS.rows[i].name + '</a></div><div class="team_point"><span>' + jsonS.rows[i].gameName + '</span></div></li>');
					}
				} else {
				}
			}
		});
		$.ajax({
			type : "POST",
			url : "tlist/getList.do",
			data : {
				"pageSize" : 10,
				"pageNumber" : 0,
				"qType" : '女',
				"gType" : 1
			},
			success : function(result) {
				var jsonS = JSON.parse(result);
				if (jsonS != null) {
					$("#ul_tlist").append('<li><div class="table_no" style=""><span>女子组</span></div></li>');
					for (var i = 0; i < jsonS.rows.length; i++) {
						$("#ul_tlist").append('<li><div class="table_no"><span>' + jsonS.rows[i].ranking + '</span></div><div class="team_logo"><a href="javascript:;">' + jsonS.rows[i].name + '</a></div><div class="team_point"><span>' + jsonS.rows[i].gameName + '</span></div></li>');
					}
				} else {
				}
			}
		});
	</script>
</body>
</html>

