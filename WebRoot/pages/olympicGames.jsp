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
								<!--Overview Contant Start-->
								<div class="kf_featured_wrap2">
									<!--Featured 2 thumb Start-->
									<div class="kf_featured_thumb">
										<div class="text_wrper">
											<div class="text">
												<h2>
													<a href="#">我要上奥运细则</a>
												</h2>
												<p>2018年3月20日，田协召开了新闻发布会2018年3月20日，田协召开了新闻发布会2018年3月20日，田协召开了新闻发布会2018年3月20日，田协2018年3月20日，田协召开了新闻发布会2018年3月20日，田协召开了新闻发布会2018年3月20</p>
												<a class="btn_2" href="#">查看更多</a>
											</div>
											<div class="thumb_footer">
												<div class="admin_thumb">
													<img src="extra-images/admin.png" class="marathon-img">
													<h6>中国马拉松赛事联盟</h6>
												</div>
											</div>
										</div>
										<figure>
											<img src="extra-images/tokyo.png" alt="">
										</figure>
									</div>
									<!--Featured 2 thumb End-->
								</div>
								<!-- 16站说明 start -->
								<div class="kf_overview kf_overview_roster">
									<!--Heading 1 Start-->
									<h6 class="kf_hd1 margin_0">
										<span>中国马拉松大奖赛-成员赛事</span> <a class="prv_btn"
											href="pages/memberEvents.jsp">查看更多&raquo;</a>
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
											<div class="tb2_height ">
												<span>参与人数</span>
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
												<span>A类金牌赛事</span>
											</div>
											<div class="tb2_age">
												<span>2018/3/25</span>
											</div>
											<div class="tb2_height ">
												<span>30000</span>
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
												<span>A类金牌赛事</span>
											</div>
											<div class="tb2_age">
												<span>2018/3/25</span>
											</div>
											<div class="tb2_height ">
												<span>30000</span>
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
												<span>A类金牌赛事</span>
											</div>
											<div class="tb2_age">
												<span>2018/3/25</span>
											</div>
											<div class="tb2_height ">
												<span>30000</span>
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
												<span>A类金牌赛事</span>
											</div>
											<div class="tb2_age">
												<span>2018/3/25</span>
											</div>
											<div class="tb2_height ">
												<span>30000</span>
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
												<span>黄河口（东营）国际马拉松</span>
											</div>
											<div class="tb2_position">
												<span>A类金牌赛事</span>
											</div>
											<div class="tb2_age">
												<span>2018/3/25</span>
											</div>
											<div class="tb2_height ">
												<span>30000</span>
											</div>
											<div class="tb2_weight">
												<span>黄河口</span>
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
												<span>A类金牌赛事</span>
											</div>
											<div class="tb2_age">
												<span>2018/3/25</span>
											</div>
											<div class="tb2_height ">
												<span>30000</span>
											</div>
											<div class="tb2_weight">
												<span>兰州</span>
											</div>
										</li>
									</ul>
									<!--Table 2 End-->
								</div>
								<!-- 16站说明 end -->
							</div>
							<aside class="col-md-4">
								<!--Widget Ranking Start-->
								<div class="widget widget_ranking">
									<!--Heading 1 Start-->
									<h6 class="kf_hd1">
										<span>万人动态名单</span> <a class="prv_btn" href="pages/runnerList.jsp">查看更多&raquo;</a>
									</h6>
									<!--Heading 1 END-->
									<div class="kf_border">
										<!--Table Wrap Start-->
										<ul class="kf_table">
											<li>
												<div class="table_no">
													<span>1</span>
												</div>
												<div class="team_logo">
													<!--  <span><img src="images/team_logo.png" alt=""></span> -->
													<a href="#">杨雨琪NO.1</a>
												</div>
												<div class="team_point">
													<span>1:30:30</span>
												</div>
											</li>
											<li>
												<div class="table_no">
													<span>2</span>
												</div>
												<div class="team_logo">
													<!-- <span><img src="images/team_logo2.png" alt=""></span> -->
													<a href="#">杨雨琪NO.2</a>
												</div>
												<div class="team_point">
													<span>1:30:31</span>
												</div>
											</li>
											<li>
												<div class="table_no">
													<span>3</span>
												</div>
												<div class="team_logo">
													<!--  <span><img src="images/team_logo3.png" alt=""></span> -->
													<a href="#">Real Madrid</a>
												</div>
												<div class="team_point">
													<span>1:30:32</span>
												</div>
											</li>
											<li>
												<div class="table_no">
													<span>4</span>
												</div>
												<div class="team_logo">
													<!-- <span><img src="images/team_logo4.png" alt=""></span> -->
													<a href="#">Bryan munich</a>
												</div>
												<div class="team_point">
													<span>1:30:33</span>
												</div>
											</li>
											<li>
												<div class="table_no">
													<span>5</span>
												</div>
												<div class="team_logo">
													<!-- <span><img src="images/team_logo5.png" alt=""></span> -->
													<a href="#">Sevilla FC</a>
												</div>
												<div class="team_point">
													<span>1:30:34</span>
												</div>
											</li>
											<li>
												<div class="table_no">
													<span>6</span>
												</div>
												<div class="team_logo">
													<!-- <span><img src="images/team_logo6.png" alt=""></span> -->
													<a href="#">Athletico Madris</a>
												</div>
												<div class="team_point">
													<span>1:30:35</span>
												</div>
											</li>
											<li>
												<div class="table_no">
													<span>7</span>
												</div>
												<div class="team_logo">
													<!-- <span><img src="images/team_logo7.png" alt=""></span> -->
													<a href="#">Valencia FC</a>
												</div>
												<div class="team_point">
													<span>1:30:36</span>
												</div>
											</li>
											<li>
												<div class="table_no">
													<span>8</span>
												</div>
												<div class="team_logo">
													<!-- <span><img src="images/team_logo8.png" alt=""></span> -->
													<a href="#">Real Belts</a>
												</div>
												<div class="team_point">
													<span>1:30:37</span>
												</div>
											</li>
											<li>
												<div class="table_no">
													<span>9</span>
												</div>
												<div class="team_logo">
													<!-- <span><img src="images/team_logo9.png" alt=""></span> -->
													<a href="#">FC barcelona</a>
												</div>
												<div class="team_point">
													<span>1:30:38</span>
												</div>
											</li>
											<li>
												<div class="table_no">
													<span>10</span>
												</div>
												<div class="team_logo">
													<!-- <span><img src="images/team_logo10.png" alt=""></span> -->
													<a href="#">malaga FC</a>
												</div>
												<div class="team_point">
													<span>1:30:39</span>
												</div>
											</li>
										</ul>
										<!--Table Wrap End-->
									</div>
								</div>

								<!--Widget Team News Start-->
								<div class="widget widget_teamnews">
									<!--Heading 1 Start-->
									<h6 class="kf_hd1">
										<span>相关新闻</span>
									</h6>
									<!--Heading 1 END-->
									<div class="kf_border">
										<!--Recent Post Dec Start-->
										<div class="recentpost_dec">
											<p>我要上奥运发布会在3.20号正式举行，意味着我要上奥运项目的正式发行，这一历史性的时刻</p>
											<span>2018/3/20&nbsp;&nbsp;&nbsp;我要上奥运</span>
										</div>
										<!--Recent Post Dec End-->
										<!--Recent Post Dec Start-->
										<div class="recentpost_dec">
											<p>我要上奥运发布会在3.20号正式举行，意味着我要上奥运项目的正式发行，这一历史性的时刻</p>
											<span>2018/3/20&nbsp;&nbsp;&nbsp;我要上奥运</span>
										</div>
										<!--Recent Post Dec End-->
									</div>
								</div>
								<!--Widget Team News End-->
							</aside>
						</div>
					</div>
				</div>
			</section>
		</div>
	<%@ include file="../staticFiles/foot.html"%>
	</div>

</body>
</html>

