<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<meta name="baidu-site-verification" content="m7d0dwTe7t" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords"
	content="马拉松,马拉松赛事联盟,跑友科技,上海跑友,上海跑友科技,中国马拉松赛事联盟,马拉松护照">
<meta name="description"
	content="中国马拉松赛事联盟（Chinese Marathon League,简称CML）是中国田径协会发起，由符合条件的全国各马拉松及相关运动赛事联合组成。旨在适应全国迅猛发展的马拉松及相关运动赛事数量的快速增长，吸引高水平赛事聚集，促进赛事间以及与国际同行间的培训、交流和协作，整合资源，共同开发市场，宣传、提升赛事的品牌形象，推动马拉松以及相关运动赛事健康发展。">
<title>中国马拉松赛事联盟</title>
<%@ include file="staticFiles/globalCSS.html"%>
<style>
.carousel-inner {
	cursor: pointer;
}
</style>
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
						<%
							/* 	String diskPath = application.getRealPath("");
								String[] bigBanners = com.apew.marathon.controller.FileReader.GetAllBigBanner(diskPath); */
						%>
						<ol class="carousel-indicators">
							<li data-target='carousel-example-generic'
								style='margin-right:5px;' data-slide-to='0' class='active'></li>
							<li data-target='carousel-example-generic'
								style='margin-right:5px;' data-slide-to='1'></li>
							<%
								/* 								boolean active = false;
																if (bigBanners != null) {
																	for (int i = 0; i < bigBanners.length; i++) {
																		out.print("<li data-target=''#carousel-example-generic' style='margin-right:5px;' data-slide-to='"
																				+ i + "'  " + (active ? "" : "class='active'") + "></li>");
																		active = true;
																	}
																} */
							%>
						</ol>

						<div class="carousel-inner" role="listbox">
							<%
								/* 							active = false;
															String[] links = new String[]{"pages/runnerList.jsp"};
															int i = 0;
															if (bigBanners != null) {
																for (String f : bigBanners) {
																	String pathName = "upload/images/bigBanner/" + f;
																	out.print("<div class='item " + (active ? "" : "active") + "'><div class='thumb'><a href='"
																			+ links[i] + "'><img src='" + pathName + "' height='100%'/></a></div></div>");
																	active = true;
																	i++;
																}
															} */
							%>

							<div class='item active'>
								<div class='thumb'>
									<a href='pages/runnerList.jsp'><img
										src='upload/images/bigBanner/big_banner_1.png' height='100%' /></a>
								</div>
							</div>
							<div class='item'>
								<div class='thumb'>
									<a href='passport/marathonPassport.jsp'><img
										src='upload/images/bigBanner/big_banner_2.png' height='100%' /></a>
								</div>
							</div>

						</div>
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
					if (window.screen.availWidth > 680) {
						var headH = document.getElementById("kode_header_2").offsetHeight; // $("#kode_header_2").height();
						var flagH = document.getElementById("result_slide_wrap").offsetHeight; // $("#result_slide_wrap").height();
						document.getElementById("kode_banner_1").style.height = (document.documentElement.clientHeight - flagH - headH) + "px";
					} else {
						document.getElementById("kode_banner_1").style.height = window.screen.availWidth * 0.4 + "px";
					}
				</script>
				<div class="result_slider">
					<div>
						<div class="kf_result_thumb">
							<span>2018年3月25日</span>
							<div class="kf_result">
								<img src="extra-images/gamesLog/glog_1.png" alt="" width="100px"
									height="100px" />
							</div>
							<a class="p_gname">重庆国际马拉松<br />&lt;首站&gt;
							</a>
						</div>
					</div>
					<div>
						<div class="kf_result_thumb">
							<span>2018年3月25日</span>
							<div class="kf_result">
								<img src="extra-images/gamesLog/glog_2.png" alt="" width="100px"
									height="100px" />
							</div>
							<a class="p_gname">徐州国际马拉松<br />&lt;第二站&gt;
							</a>
						</div>
					</div>
					<div>
						<div class="kf_result_thumb">
							<span>2018年4月15日</span>
							<div class="kf_result">
								<img src="extra-images/gamesLog/glog_3.png" alt="" width="100px"
									height="100px" />
							</div>
							<a class="p_gname">杨凌国际马拉松<br />&lt;第三站&gt;
							</a>
						</div>
					</div>
					<div>
						<div class="kf_result_thumb">
							<span>2018年5月13日</span>
							<div class="kf_result">
								<img src="extra-images/gamesLog/glog_4.png" alt="" width="100px"
									height="100px" />
							</div>
							<a class="p_gname">秦皇岛马拉松<br />&lt;第四站&gt;
							</a>
						</div>
					</div>
					<div>
						<div class="kf_result_thumb">
							<span>2018年5月5日</span>
							<div class="kf_result">
								<img src="extra-images/gamesLog/glog_5.png" alt="" width="100px"
									height="100px" />
							</div>
							<a class="p_gname">黄河口（东营）马拉松<br />&lt;第五站&gt;
							</a>
						</div>
					</div>
					<div>
						<div class="kf_result_thumb">
							<span>2018年6月10日</span>
							<div class="kf_result">
								<img src="extra-images/gamesLog/glog_6.png" alt="" width="100px"
									height="100px" />
							</div>
							<a class="p_gname">兰州国际马拉松<br />&lt;第六站&gt;
							</a>
						</div>
					</div>
					<div>
						<div class="kf_result_thumb">
							<span>2018年6月10日</span>
							<div class="kf_result">
								<img src="extra-images/gamesLog/glog_7.png" alt="" width="100px"
									height="100px" />
							</div>
							<a class="p_gname">吉林市国际马拉松<br />&lt;第七站&gt;
							</a>
						</div>
					</div>
					<div>
						<div class="kf_result_thumb">
							<span>2018年7月29日</span>
							<div class="kf_result">
								<img src="extra-images/gamesLog/glog_8.png" alt="" width="100px"
									height="100px" />
							</div>
							<a class="p_gname">六盘水国际马拉松<br />&lt;第八站&gt;
							</a>
						</div>
					</div>
					<div>
						<div class="kf_result_thumb">
							<span>2018年9月29日</span>
							<div class="kf_result">
								<img src="extra-images/gamesLog/glog_9.png" alt="" width="100px"
									height="100px" />
							</div>
							<a class="p_gname">衡水湖国际马拉松<br />&lt;第九站&gt;
							</a>
						</div>
					</div>
					<div>
						<div class="kf_result_thumb">
							<span>2018年9月23日(待定)</span>
							<div class="kf_result">
								<img src="extra-images/gamesLog/glog_10.png" alt=""
									width="100px" height="100px" />
							</div>
							<a class="p_gname">北京国际马拉松<br />&lt;第十站&gt;
							</a>
						</div>
					</div>
					<div>
						<div class="kf_result_thumb">
							<span>2018年10月21日</span>
							<div class="kf_result">
								<img src="extra-images/gamesLog/glog_11.png" alt=""
									width="100px" height="100px" />
							</div>
							<a class="p_gname">南京国际马拉松<br />&lt;第十一站&gt;
							</a>
						</div>
					</div>
					<div>
						<div class="kf_result_thumb">
							<span>2018年11月04日</span>
							<div class="kf_result">
								<img src="extra-images/gamesLog/glog_12.png" alt=""
									width="100px" height="100px" />
							</div>
							<a class="p_gname">宜昌国际马拉松<br />&lt;第十二站&gt;
							</a>
						</div>
					</div>
					<div>
						<div class="kf_result_thumb">
							<span>2018年11月11日</span>
							<div class="kf_result">
								<img src="extra-images/gamesLog/glog_13.png" alt=""
									width="100px" height="100px" />
							</div>
							<a class="p_gname">合肥国际马拉松<br />&lt;第十三站&gt;
							</a>
						</div>
					</div>
					<div>
						<div class="kf_result_thumb">
							<span>2018年11月(待定)</span>
							<div class="kf_result">
								<img src="extra-images/gamesLog/glog_14.png" alt=""
									width="100px" height="100px" />
							</div>
							<a class="p_gname">上海国际马拉松<br />&lt;第十四站&gt;
							</a>
						</div>
					</div>
					<div>
						<div class="kf_result_thumb">
							<span>2019年01月07日</span>
							<div class="kf_result">
								<img src="extra-images/gamesLog/glog_15.png" alt=""
									width="100px" height="100px" />
							</div>
							<a class="p_gname">厦门国际马拉松<br />&lt;第十五站&gt;
							</a>
						</div>
					</div>
					<div>
						<div class="kf_result_thumb">
							<span>(待定)</span>
							<div class="kf_result">
								<!-- 	<img src="extra-images/gamesLog/glog_14.png" alt=""> -->
							</div>
							<a class="p_gname">敬请期待<br />&lt;第十六站&gt;
							</a>
						</div>
					</div>
				</div>
			</div>

			<section style="padding-bottom:0px;">
				<div class="express-entrance-wapper">
					<div class="what-we-do bg">
						<div class="row">
							<div class="col-md-4 col-sm-6 col-xs-4 wow fadeInUp icon-buttons"
								data-url="passport/marathonPassport.jsp">
								<div class="single-block tran3s">
									<img src="extra-images/icon/passport-buy.png" alt=""
										class="tran4s">
									<h6>马拉松护照办理</h6>
									<h5>中国马拉松护照是马拉松跑者的唯一认证标识</h5>
									<a class="tran3s theme-button" href="javascript:;">马拉松护照办理</a>
								</div>
								<!-- /.single-block -->
							</div>
							<!-- /.col- -->
							<div class="col-md-4 col-sm-6 col-xs-4 wow fadeInUp icon-buttons"
								data-wow-delay="0.1s" data-url="passport/passportUnreceive.jsp">
								<div class="single-block tran3s">
									<img src="extra-images/icon/passport-eplacement.png" alt=""
										class="tran4s">
									<h6>马拉松护照补领</h6>
									<h5>在合作赛事官网购买的马拉松护照忘记领？</h5>
									<a class="tran3s theme-button" href="javascript:;">马拉松护照补领</a>
								</div>
								<!-- /.single-block -->
							</div>
							<!-- /.col- -->
							<div
								class="col-md-4 hidden-sm col-xs-4 wow fadeInUp icon-buttons"
								data-wow-delay="0.150s" data-url="pages/runnerList.jsp">
								<div class="single-block tran3s">
									<img src="extra-images/icon/select-range.png" alt=""
										class="tran4s">
									<h6>万人名单查询</h6>
									<h5>万人跑团，你是否位列其中？马上查询！</h5>
									<a class="tran3s theme-button" href="javascript:;">万人名单查询</a>
								</div>
								<!-- /.single-block -->
							</div>
							<!-- /.col- -->
						</div>
						<!-- /.row -->
					</div>
				</div>
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
											href="passport/Instruction/marathonInstructions.jsp">了解更多&raquo;</a>
									</h6>
									<!--Heading 1 END-->
									<!--Featured 2 thumb Start-->
									<div class="kf_featured_thumb">
										<div class="text_wrper">
											<div class="text">
												<h2>
													<a href="javascript:;">中国马拉松护照简介</a>
												</h2>
												<p style="margin-top:20px;">中国马拉松护照是马拉松文化推广的核心载体之一。</p>
												<p>为了更好的推广马拉松文化，为了更好的提升马拉松爱好者的体验感，让每一名马拉松爱好者拥有一份专属于自己的身份识别码；让每一名马拉松爱好者能记载自己参赛的历程，见证属于自己的荣耀，中国田径协会授权中国马拉松赛事联盟颁发《中国马拉松护照》。</p>
												<p>
													《中国马拉松护照》为中国田径协会下属认证赛事的官方认证材料，是极具收藏价值和实用价值的官方认证书，一人一证，护照号与参赛者身份证号绑定，具备唯一性。
												</p>
												<br /> <a class="btn_2"
													href="passport/Instruction/marathonInstructions.jsp">查看详情&raquo;</a>
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
											href="passport/marathonPassport.jsp">前往办理&raquo;</a>
									</h6>
									<!--Heading 1 END-->
									<div class="kf_border" style="padding:0px;">
										<iframe src="passport/passportbook/passportbook.html"
											width="320" height="330"></iframe>
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
											<img src="extra-images/olympics/img2.png" alt="">
										</figure>
										<div class="text_wrper">
											<div class="text">
												<h2>我要上奥运细则说明</h2>
												<p>搭载全新精品系列赛事——中国马拉松大奖赛，利用现有优秀赛事资源，选拔大众跑者最优秀选手。</p>
												<p>选手资格
													以2018年2月中国田径协会官方公布的“万人大名单”（男子5000人，女子5000人）为基础，利用赛事进行动态更新。考虑到2017年中国马拉松比赛参赛选手实际男女比例为73%：27%，为了更接近实际情况，及提升比赛的竞争程度，缩短总决赛关门......
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
									<div class="kf_featured_thumb">
										<div class="text_wrper">
											<div class="text">
												<h2>
													<a href="javascript:;">中国跑友与奥运同行</a>
												</h2>
												<p>3月20日，“我要上奥运”新闻发布会在京召开。本次发布会由中国田径协会领导以及来自“我要上奥运”系列活动的指定马拉松赛事组委会代表、合作赛事运营单位代表、特邀嘉宾和媒体出席。国家体育总局田径运动管理中心党委书记、副主任，中国田径协会副主席......</p>
												<a class="btn_2" href="pages/temp/temp2.jsp">查看详情&raquo;</a>
											</div>
											<div class="thumb_footer">
												<div class="admin_thumb">
													<img src="extra-images/admin.png" class="marathon-img">
													<h6>中国马拉松赛事联盟</h6>
												</div>
											</div>
										</div>
										<figure>
											<img src="extra-images/olympics/img1.png" alt="">
										</figure>
									</div>
									<!-- 站点统计 start -->
									<div class="kf_featured_thumb match-list">
										<div class="text_wrper" style="width:100%;">
											<div class="text">
												<h2>
													<a href=" ">中国马拉松大奖赛福利</ a> 
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
																<h5>万人名单的前100名可获得直通车名额且免交报名费</h5>
																<h5>（任意一场认证赛事）</h5>
															</div>
															<!-- /.single-block -->
														</div>
														<!-- /.col- -->
														<div class="col-md-4 hidden-sm col-xs-12 wow fadeInUp"
															data-wow-delay="0.150s">
															<div class="single-block tran3s">
																<img src="extra-images/3.png" alt="" class="tran4s">
																<h6>免抽签直通车名额</h6>
																<h5>万人名单的前100名可获得直通车名额</h5>
																<h5>（任意一场认证赛事）</h5>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- 站点统计 end -->
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
										<ul class="kf_table" id="ul_tlist">


										</ul>
									</div>
								</div>
								<!-- <div class="widget widget_nextmatch">
									Heading 1 Start
									<h6 class="kf_hd1">
										<span>近期比赛倒计时</span> <a class="prv_btn"
											href="pages/memberEvents.jsp">查看更多赛事&raquo;</a>
									</h6>
									Heading 1 END
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
												Slider Widget END
											</div>
											Widget COUNT Down Start
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
											Widget COUNT Down End
										</div>
										Widget Next Match Dec End
									</div>
								</div> -->
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
											href="pages/cmlApp.jsp">了解更多&raquo;</a>
									</h6>
									<!--Heading 1 END-->
									<!--Featured 2 thumb Start-->
									<div class="kf_featured_thumb">
										<div class="text_wrper">
											<div class="text">
												<h2>
													<a href="javascript:;">中国马拉松赛事联盟APP简介</a>
												</h2>
												<p>中国马拉松赛事联盟APP作为中国马拉松赛事联盟唯一运营平台，希望打造成中国最大的马拉松衍生服务和社区入口，配合中国马拉松让用户拥有更好的体验，同时通过产业信息化合作模式以及庞大的用户交互数据，为中国马拉松赛事联盟提升商业价值。</p>
												<p>为方便跑者随时随地了解马拉松赛事资讯，轻松管理中国马拉松护照、一键查看自己的奔跑历史数据，中国马拉松赛事联盟推出了中国马拉松赛事联盟APP。</p>
												<p>若您已拥有中国马拉松护照，您可在APP上查看到对应的电子护照，完赛后还可查看到您的完赛勋章，集齐指定勋章数量还可兑换相应奖品。</p>
												<a class="btn_2" href="pages/cmlApp.jsp">查看详情&raquo;</a>
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
															<h6>用户注册</h6>
															<h6>5秒注册，数据永久保留</h6>
															<br>
															<figure>
																<img src="extra-images/app/apps-1.png" alt="">
															</figure>
														</div>
													</div>
													<div>
														<div class="slider_thumb">
															<h6>个人数据</h6>
															<h6>查看您的马拉松成绩，分析每场赛事数据</h6>
															<br>
															<figure>
																<img src="extra-images/app/apps-2.png" alt="">
															</figure>
														</div>
													</div>
													<div>
														<div class="slider_thumb">
															<h6>成绩概览</h6>
															<h6>生成您的赛事曲线，分享您马拉松记录</h6>
															<br>
															<figure>
																<img src="extra-images/app/apps-3.png" alt="">
															</figure>
														</div>
													</div>
													<div>
														<div class="slider_thumb">
															<h6>历史成绩</h6>
															<h6>跑马每一场不丢失！</h6>
															<br>
															<figure>
																<img src="extra-images/app/apps-4.png" alt="">
															</figure>
														</div>
													</div>
													<div>
														<div class="slider_thumb">
															<h6>积分商城</h6>
															<h6>跑马累计积分，积分兑换装备！</h6>
															<br>
															<figure>
																<img src="extra-images/app/apps-5.png" alt="">
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
	<script src="js/index.js"></script>
</body>
</html>


