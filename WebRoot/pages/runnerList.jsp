<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
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
			<section class="team_schedule_page">
				<div class="container">
					<div class="row kf_query_ranking" id="ranking-details-search">
						<div class="col-md-5 search-info">
							<input type="text" placeholder="请输入您的姓名">
						</div>
						<div class="col-md-5 search-info">
							<input type="text" placeholder="请输入您的证件号">
						</div>
						<div class="col-md-2 search-btn">
							<button type="button" class="btn btn-primary">查询排名</button>
						</div>
						<div class="col-md-12 kf_ranking_result">
							<p>
								您当前排名为：<span>NO.94</span>
							</p>
						</div>
					</div>
					<!--filter conditions Start-->
					<ul class="nav nav-pills filter-conditions">
						<li role="presentation" class="active"><a>全部</a></li>
						<li role="presentation"><a>男子组</a></li>
						<li role="presentation"><a>女子组</a></li>
					</ul>
					<!--filter conditions end-->
					<div class="kf_overview_contant">
						<!--Heading 1 Start-->
						<h6 class="kf_hd1 margin_0">
							<span>万人动态名单<i
								style="font-size:12px;font-weight:normal;color:#999">（每2个月更新一次）</i></span>
						</h6>
						<!--Heading 1 End-->
						<!--Table 2 Start-->
						<ul class="kf_table2">
							<li class="table_head">
								<div class="tb2_date">
									<span>排名</span>
								</div>
								<div class="versus">
									<span>选手姓名</span>
								</div>
								<div class="tb2_status">
									<span>性别</span>
								</div>
								<div class="tb2_time">
									<span>成绩</span>
								</div>
							</li>
							<li>
								<div class="tb2_date">
									<span>1</span>
								</div>
								<div class="versus">
									<div>
										<!-- <span><img src="images/team_logo.png" alt=""></span> -->
										<p>杨雨琪</p>
									</div>
								</div>
								<div class="tb2_status">
									<span>女</span>
								</div>
								<div class="tb2_time">
									<span>2:00:30</span>
								</div>
							</li>
							<li>
								<div class="tb2_date">
									<span>2</span>
								</div>
								<div class="versus">
									<div>
										<!-- <span><img src="images/team_logo.png" alt=""></span> -->
										<p>杨雨琪</p>
									</div>
								</div>
								<div class="tb2_status">
									<span>女</span>
								</div>
								<div class="tb2_time">
									<span>2:00:30</span>
								</div>
							</li>
							<li>
								<div class="tb2_date">
									<span>3</span>
								</div>
								<div class="versus">
									<div>
										<!-- <span><img src="images/team_logo.png" alt=""></span> -->
										<p>杨雨琪</p>
									</div>
								</div>
								<div class="tb2_status">
									<span>女</span>
								</div>
								<div class="tb2_time">
									<span>2:00:30</span>
								</div>
							</li>
							<li>
								<div class="tb2_date">
									<span>4</span>
								</div>
								<div class="versus">
									<div>
										<!-- <span><img src="images/team_logo.png" alt=""></span> -->
										<p>杨雨琪</p>
									</div>
								</div>
								<div class="tb2_status">
									<span>女</span>
								</div>
								<div class="tb2_time">
									<span>2:00:30</span>
								</div>
							</li>
							<li>
								<div class="tb2_date">
									<span>5</span>
								</div>
								<div class="versus">
									<div>
										<!-- <span><img src="images/team_logo.png" alt=""></span> -->
										<p>杨雨琪</p>
									</div>
								</div>
								<div class="tb2_status">
									<span>女</span>
								</div>
								<div class="tb2_time">
									<span>2:00:30</span>
								</div>
							</li>
							<li>
								<div class="tb2_date">
									<span>6</span>
								</div>
								<div class="versus">
									<div>
										<!-- <span><img src="images/team_logo.png" alt=""></span> -->
										<p>杨雨琪</p>
									</div>
								</div>
								<div class="tb2_status">
									<span>女</span>
								</div>
								<div class="tb2_time">
									<span>2:00:30</span>
								</div>
							</li>
							<li>
								<div class="tb2_date">
									<span>7</span>
								</div>
								<div class="versus">
									<div>
										<!-- <span><img src="images/team_logo.png" alt=""></span> -->
										<p>杨雨琪</p>
									</div>
								</div>
								<div class="tb2_status">
									<span>女</span>
								</div>
								<div class="tb2_time">
									<span>2:00:30</span>
								</div>
							</li>
							<li>
								<div class="tb2_date">
									<span>8</span>
								</div>
								<div class="versus">
									<div>
										<!-- <span><img src="images/team_logo.png" alt=""></span> -->
										<p>杨雨琪</p>
									</div>
								</div>
								<div class="tb2_status">
									<span>女</span>
								</div>
								<div class="tb2_time">
									<span>2:00:30</span>
								</div>
							</li>
							<li>
								<div class="tb2_date">
									<span>9</span>
								</div>
								<div class="versus">
									<div>
										<!-- <span><img src="images/team_logo.png" alt=""></span> -->
										<p>杨雨琪</p>
									</div>
								</div>
								<div class="tb2_status">
									<span>女</span>
								</div>
								<div class="tb2_time">
									<span>2:00:30</span>
								</div>
							</li>
							<li>
								<div class="tb2_date">
									<span>10</span>
								</div>
								<div class="versus">
									<div>
										<!-- <span><img src="images/team_logo.png" alt=""></span> -->
										<p>杨雨琪</p>
									</div>
								</div>
								<div class="tb2_status">
									<span>女</span>
								</div>
								<div class="tb2_time">
									<span>2:00:30</span>
								</div>
							</li>
						</ul>
						<!--Table 2 End-->
						<!--Pagination Start-->
						<nav class="pagination-btns">
							<ul class="pagination">
								<li class="disabled"><span> <span aria-hidden="true">&laquo;</span>
								</span></li>
								<li class="active"><span>1 <span class="sr-only"></span></span>
								</li>
								<li><span>2 <span class="sr-only"></span></span></li>
								<li><span>3 <span class="sr-only"></span></span></li>
								<li><span> <span aria-hidden="true">&raquo;</span>
								</span></li>
							</ul>
						</nav>
						<!--Pagination End-->
					</div>
					<!--Overview Contant End-->
				</div>
			</section>
		</div>
		<%@ include file="../staticFiles/foot.html"%>
	</div>

</body>
</html>

