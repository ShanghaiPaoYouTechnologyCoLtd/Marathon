<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>中国马拉松赛事联盟</title>
<%@ include file="staticFiles/globalCSS.html"%>
<script src="js/jquery.js"></script>
</head>

<body>
	<div class="kode_wrapper">
		<%@ include file="staticFiles/head.html"%>
		<div class="kode_banner_1" id="kode_banner_1">
			<div class="main_banner banner_heightControl">
				<div>
					<!--Banner Thumb START-->
					<div id="carousel-example-generic" class="carousel slide"
						data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#carousel-example-generic" data-slide-to="0"
								class="active"></li>
							<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						</ol>

						<!-- Wrapper for slides -->
						<div class="carousel-inner" role="listbox">
							<div class="item active">
								<div class="thumb">
									<img src="extra-images/banner/index_big_1.jpg" height="100%"
										alt="广告图片" />
								</div>
							</div>
							<div class="item">
								<div class="thumb">
									<img src="extra-images/banner/index_big_2.jpg" height="100%"
										alt="广告图片" />
								</div>
							</div>
						</div>
						<!-- Controls -->
						<a class="left carousel-control" href="#carousel-example-generic"
							role="button" data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							<span class="sr-only">上一页</span>
						</a> <a class="right carousel-control"
							href="#carousel-example-generic" role="button" data-slide="next">
							<span class="glyphicon glyphicon-chevron-right"
							aria-hidden="true"></span> <span class="sr-only">下一页</span>
						</a>
					</div>
					<!--Banner Thumb End-->
				</div>
			</div>
		</div>

		<div class="kode_content_wrap">


			<div class="result_slide_wrap" id="result_slide_wrap">
	<script type='text/javascript'>
			if (window.screen.availWidth > 480) {
				var headH = document.getElementById("kode_header_2").offsetHeight; // $("#kode_header_2").height();
				var flagH = document.getElementById("result_slide_wrap").offsetHeight; // $("#result_slide_wrap").height();
				document.getElementById("kode_banner_1").style.height = (document.documentElement.clientHeight - flagH - headH) + "px";
			} else {
				document.getElementById("kode_banner_1").style.height = "160px";
				$(".action_T_tit").width("200px");
				$(".action_T_tit p").css({
					"font-size" : "10px",
					"line-height" : "30px"
				});
			}
	</script>
				<div class="result_slider">
					<div>
						<!--Result Thumb Start-->
						<div class="kf_result_thumb">
							<span>2018/3/15</span>
							<div class="kf_result">
								<img src="extra-images/chongqing.png" alt="">
							</div>
							<a href="">北京通州马拉松1</a>
						</div>
						<!--Result Slider Thumb End-->
					</div>
					<div>
						<!--Result Thumb Start-->
						<div class="kf_result_thumb">
							<span>2018/3/15</span>
							<div class="kf_result">
								<img src="extra-images/beijing.png" alt="">
							</div>
							<a href="">北京通州马拉松2</a>
						</div>
						<!--Result Slider Thumb End-->
					</div>
					<div>
						<!--Result Thumb Start-->
						<div class="kf_result_thumb">
							<span>2018/3/15</span>
							<div class="kf_result">
								<img src="extra-images/chongqing.png" alt="">
							</div>
							<a href="">北京通州马拉松3</a>
						</div>
						<!--Result Slider Thumb End-->
					</div>
					<div>
						<!--Result Thumb Start-->
						<div class="kf_result_thumb">
							<span>2018/3/15</span>
							<div class="kf_result">
								<img src="extra-images/xuzhou.png" alt="">
							</div>
							<a href="">北京通州马拉松4</a>
						</div>
						<!--Result Slider Thumb End-->
					</div>
					<div>
						<!--Result Thumb Start-->
						<div class="kf_result_thumb">
							<span>2018/3/15</span>
							<div class="kf_result">
								<img src="extra-images/chongqing.png" alt="">
							</div>
							<a href="">北京通州马拉松5</a>
						</div>
						<!--Result Slider Thumb End-->
					</div>
					<div>
						<!--Result Thumb Start-->
						<div class="kf_result_thumb">
							<span>2018/3/15</span>
							<div class="kf_result">
								<img src="extra-images/beijing.png" alt="">
							</div>
							<a href="">北京通州马拉松6</a>
						</div>
						<!--Result Slider Thumb End-->
					</div>
					<div>
						<!--Result Thumb Start-->
						<div class="kf_result_thumb">
							<span>2018/3/15</span>
							<div class="kf_result">
								<img src="extra-images/xuzhou.png" alt="">
							</div>
							<a href="">北京通州马拉松7</a>
						</div>
						<!--Result Slider Thumb End-->
					</div>
					<div>
						<!--Result Thumb Start-->
						<div class="kf_result_thumb">
							<span>2018/3/15</span>
							<div class="kf_result">
								<img src="extra-images/chongqing.png" alt="">
							</div>
							<a href="">北京通州马拉松8</a>
						</div>
						<!--Result Slider Thumb End-->
					</div>
				</div>
			</div>

			<section style="padding-bottom:0px;">

				<div
					style="width:100%; background-color:#f8f8f8; padding:20px 0px 60px;">
					<div class="container" style="margin:0px auto;">
						<div class="action_T_tit">
							<p>中国马拉松护照</p>
						</div>
						<div class="row">
							<div class="col-md-8">
								<!--中国马拉松护照 Start-->
								<div class="kf_featured_slider">
									<!--Heading 1 Start-->
									<h6 class="kf_hd1">
										<span>中国马拉松护照</span> <a class="prv_btn"
											href="passport/marathonInstructions.html">了解更多&raquo;</a>
									</h6>
									<!--Heading 1 END-->
									<!--Featured 2 thumb Start-->
									<div class="kf_featured_thumb">
										<div class="text_wrper">
											<div class="text">
												<h2>
													<a href="#">中国马拉松护照简介</a>
												</h2>
												<p>中国马拉松护照是马拉松文化推广的核心载体之一。</p>
												<p>为了更好的推广马拉松文化，为了更好的提升马拉松爱好者的体验感，让每一名马拉松爱好者拥有一份专属于自己的身份识别码；让每一名马拉松爱好者能记载自己参赛的历程，见证属于自己的荣耀，中国田径协会授权中国马拉松赛事联盟颁发《中国马拉松护照》</p>
												<p>为了更好的推广马拉松文化，为了更好的提升马拉松爱好者的体验感，让每一名马拉松爱好者拥有一份专属于自己的身份识别码；让每一名马拉松爱好者能记载自己参赛的历程，见证属于自己的荣耀，中国田径协会授权中国马拉松赛事联盟颁发《中国马拉松护照》</p>
												<a class="btn_2" href="#">查看详情&raquo;</a>
											</div>
											<!-- <div class="thumb_footer">
                                        <div class="admin_thumb">
                                            <img src="extra-images/admin.png" class="marathon-img">
                                            <h6>中国马拉松赛事联盟</h6>
                                        </div>
                                    </div> -->
										</div>
									</div>
								</div>
								<!--中国马拉松护照 Start-->
							</div>
							<aside class="col-md-4">
								<div class="widget widget_nextmatch">
									<!--Heading 1 Start-->
									<h6 class="kf_hd1">
										<span>护照预览</span> <a class="prv_btn"
											href="passport/marathonPassport.jsp">立即购买&raquo;</a>
									</h6>
									<!--Heading 1 END-->
									<div class="kf_border" style="padding:0px;">
										<iframe src="passport/passportbook/passportbook.html"
											width="320" height="330"></iframe>
										<!--Widget Next Match Dec Start-->
										<!-- <div class="nextmatch_dec">
											<div class="match_teams marathon_passport">
												Slider Widget Strat
												<div class="slider_widget app-details">
													<div>
														<div class="slider_thumb">
															<figure>
																<img src="extra-images/passport_01.png" alt="">
															</figure>
														</div>
													</div>
													<div>
														<div class="slider_thumb">
															<figure>
																<img src="extra-images/passport_02.png" alt="">
															</figure>
														</div>
													</div>
													<div>
														<div class="slider_thumb">
															<figure>
																<img src="extra-images/passport_03.png" alt="">
															</figure>
														</div>
													</div>
												</div>
												Slider Widget END
											</div>
										</div> -->
										<!--Widget Next Match Dec End-->
									</div>
								</div>
							</aside>
						</div>
					</div>
				</div>
				<!-- 中国马拉松护照 end -->
				<!-- 我要上奥运-中国马拉松大奖赛 start -->
				<div style="width:100%; padding:20px 0px 60px;">
					<div class="container" style="margin:0px auto;">
						<div class="action_T_tit">
							<p>我要上奥运-马拉松大奖赛</p>
						</div>
						<div class="row">
							<div class="col-md-8">
								<!--中国马拉松大奖赛 Start-->
								<div class="kf_featured_slider">
									<!--Heading 1 Start-->
									<h6 class="kf_hd1">
										<span>我要上奥运-中国马拉松大奖赛</span> <a class="prv_btn"
											href="pages/olympicGames.jsp">了解更多&raquo;</a>
									</h6>
									<!--Heading 1 END-->
								</div>
								<div class="kf_featured_wrap2">
									<!--Featured 2 thumb Start-->
									<div class="kf_featured_thumb">
										<figure>
											<img src="extra-images/tokyo.png" alt="">
										</figure>
										<div class="text_wrper">
											<div class="text">
												<h2>奥运离我们更进一步</h2>
												<p>2018年3月20日，田协召开了新闻发布会2018年3月20日，田协召开了新闻发布会2018年3月20日，田协召开了新闻发布会2018年3月20日，田协2018年3月20日，田协召开了新闻发布会2018年3月20日，田协召开了新闻发布会2018年3月20</p>
												<a class="btn_2" href="webSite/details.html">查看详情&raquo;</a>
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
									<!--Featured 2 thumb Start-->
									<div class="kf_featured_thumb">
										<div class="text_wrper">
											<div class="text">
												<h2>
													<a href="#">我要上奥运细则简介</a>
												</h2>
												<p>2018年3月20日，田协召开了新闻发布会2018年3月20日，田协召开了新闻发布会2018年3月20日，田协召开了新闻发布会2018年3月20日，田协2018年3月20日，田协召开了新闻发布会2018年3月20日，田协召开了新闻发布会2018年3月20</p>
												<a class="btn_2" href="#">查看详情&raquo;</a>
											</div>
											<div class="thumb_footer">
												<div class="admin_thumb">
													<img src="extra-images/admin.png" class="marathon-img">
													<h6>中国马拉松赛事联盟</h6>
												</div>
											</div>
										</div>
										<figure>
											<img src="extra-images/feature_2.jpg" alt="">
										</figure>
									</div>
									<div class="kf_featured_thumb">
										<figure>
											<img src="extra-images/tokyo.png" alt="">
										</figure>
										<div class="text_wrper">
											<div class="text">
												<h2>奥运离我们更进一步</h2>
												<p>2018年3月20日，田协召开了新闻发布会2018年3月20日，田协召开了新闻发布会2018年3月20日，田协召开了新闻发布会2018年3月20日，田协2018年3月20日，田协召开了新闻发布会2018年3月20日，田协召开了新闻发布会2018年3月20</p>
												<a class="btn_2" href="webSite/details.html">查看详情&raquo;</a>
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
								<!--中国马拉松大奖赛 End-->
							</div>
							<aside class="col-md-4">
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

								<!--Widget Next Match Start-->
								<div class="widget widget_nextmatch">
									<!--Heading 1 Start-->
									<h6 class="kf_hd1">
										<span>近期比赛倒计时</span> <a class="prv_btn"
											href="pages/memberEvents.jsp">查看更多赛事&raquo;</a>
									</h6>
									<!--Heading 1 END-->
									<div class="kf_border">
										<div class="nextmatch_dec">
											<h6>北京马拉松</h6>
											<span>2018.3.25 </span>
											<div class="match_teams">
												<div class="slider_widget">
													<div>
														<div class="slider_thumb">
															<figure>
																<img src="extra-images/beijing.png" alt="">
															</figure>
														</div>
													</div>
													<div>
														<div class="slider_thumb">
															<figure>
																<img src="extra-images/xuzhou.png" alt="">
															</figure>
														</div>
													</div>
													<div>
														<div class="slider_thumb">
															<figure>
																<img src="extra-images/chongqing.png" alt="">
															</figure>
														</div>
													</div>
												</div>
												<!--Slider Widget END-->
											</div>
											<!--Widget COUNT Down Start-->
											<ul class="kf_countdown countdown">
												<li><span class="days">69</span>
													<p class="days_ref">天</p></li>
												<li><span class="hours">13</span>
													<p class="hours_ref">时</p></li>
												<li><span class="minutes">44</span>
													<p class="minutes_ref">分</p></li>
												<li><span class="seconds last">12</span>
													<p class="seconds_ref">秒</p></li>
											</ul>
											<!--Widget COUNT Down End-->
										</div>
										<!--Widget Next Match Dec End-->
									</div>
								</div>
								<!--Widget Next Match End-->
							</aside>
						</div>
					</div>
				</div>
				<!-- 我要上奥运-中国马拉松大奖赛 end -->
				<!-- 中国马拉松赛事联盟 start -->
				<div
					style="width:100%; background-color:#f8f8f8; padding:20px 0px 60px;">
					<div class="container" style=" margin:0px auto;">
						<div class="action_T_tit">
							<p>中国马拉松赛事联盟APP</p>
						</div>
						<div class="row">
							<div class="col-md-8">
								<!--中国马拉松赛事联盟APP Start-->
								<div class="kf_featured_slider">
									<!--Heading 1 Start-->
									<h6 class="kf_hd1">
										<span>中国马拉松赛事联盟APP</span> <a class="prv_btn"
											href="pages/marathonPassport.jsp">了解更多&raquo;</a>
									</h6>
									<!--Heading 1 END-->
									<!--Featured 2 thumb Start-->
									<div class="kf_featured_thumb">
										<div class="text_wrper">
											<div class="text">
												<h2>
													<a href="#">中国马拉松赛事联盟APP简介</a>
												</h2>
												<p>为方便跑者随时随地了解马拉松赛事资讯，轻松管理中国马拉松护照、一键查看自己的奔跑历史数据，中国马拉松赛事联盟推出了中国马拉松赛事联盟APP</p>
												<p>若您已拥有中国马拉松护照，您可在APP上查看到对应的电子护照，完赛后还可查看到您的完赛勋章，集齐指定勋章数量还可兑换相应奖品。</p>
												<a class="btn_2" href="#">查看详情&raquo;</a>
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
								<!--中国马拉松赛事联盟APP Start-->
							</div>
							<aside class="col-md-4">
								<!--Widget Next Match Start-->
								<div class="widget widget_nextmatch">
									<!--Heading 1 Start-->
									<h6 class="kf_hd1">
										<span>APP功能概览</span>
									</h6>
									<!--Heading 1 END-->
									<div class="kf_border">
										<!--Widget Next Match Dec Start-->
										<div class="nextmatch_dec">
											<div class="match_teams">
												<!--Slider Widget Strat-->
												<div class="slider_widget app-details">
													<div>
														<div class="slider_thumb">
															<h6>护照购买</h6>
															<h6>一键购买/挂失补办/更换</h6>
															<br>
															<figure>
																<img src="extra-images/apps-1.png" alt="">
															</figure>
														</div>
													</div>
													<div>
														<div class="slider_thumb">
															<h6>赛事日历</h6>
															<h6>赛事日程早知道</h6>
															<br>
															<figure>
																<img src="extra-images/apps-3.png" alt="">
															</figure>
														</div>
													</div>
													<div>
														<div class="slider_thumb">
															<h6>赛事新闻</h6>
															<h6>及时了解最新最热的赛事新闻</h6>
															<br>
															<figure>
																<img src="extra-images/apps-4.png" alt="">
															</figure>
														</div>
													</div>
												</div>
												<!--Slider Widget END-->
											</div>
										</div>
										<!--Widget Next Match Dec End-->
									</div>
								</div>
								<!--Widget Next Match End-->
							</aside>
						</div>
					</div>
				</div>
			</section>
		</div>
		<%@ include file="staticFiles/foot.html"%>
	</div>
	<%@ include file="staticFiles/globalScript.html"%>
	<script src="js/index.js"></script>
</body>
</html>


