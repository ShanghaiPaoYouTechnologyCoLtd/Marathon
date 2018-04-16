<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>中国马拉松护照-简介</title>
<%@ include file="../staticFiles/globalCSS.html"%>
<script src="js/jquery.js"></script>
<style>
 .text h2 a{
    font-size:14px;
 }
</style>
</head>

<body>
	<div class="kode_wrapper">
		<%@ include file="../staticFiles/head.html"%>
		<div class="kode_content_wrap section">
			<div class="kf_shoppage">
				<div class="container">
					<div class="row">
						<aside class="col-md-3">
							<!--Widget category Start-->
							<div class="widget widget_category2">
								<!--Heading 5 Start-->
								<div class="kf_h5">
									<h5>中国马拉松护照</h5>
								</div>
								<!--Heading 5 End-->
								<div class="kf_border-2">
									<%@ include file="../staticFiles/passportMenu.html"%>
								</div>
							</div>
							<!--Widget category End-->
						</aside>
						<div class="col-md-9 kf_shop_wrap">
							<!-- possport info start -->
							<div class="kf_overview kf_overview_roster">
								<!--Heading 1 Start-->
								<h6 class="kf_hd1 margin_0">
									<span>中国马拉松护照-常见问题</span>
								</h6>
								<!--Heading 1 End-->
							</div>

							<!--Featured 2 thumb Start-->
							<div class="kf_featured_thumb">
								<div class="text_wrper">
									<div class="text">
										<h2>
											<a href="javascript:;">Q:中国马拉松护照可以做什么？</a>
										</h2>
										<p>A:购买中国马拉松护照可以在赛道终点盖章处盖印完赛章，记录您的每一场马拉松赛事。参与的每场田协认证的赛事还可兑换相应的护照积分，积分到达一定等级可换取相应福利。</p>
									</div>
																		<div class="text">
										<h2>
											<a href="javascript:;">Q：我的中国马拉松护照遗失了怎么办？</a>
										</h2>
										<p>A：您可在「中国马拉松赛事联盟APP」进行补办操作。</p>
									</div>
																					<div class="text">
										<h2>
											<a href="javascript:;">Q：我的中国马拉松护照印章收集满了怎么办？</a>
										</h2>
										<p>A：若您收集满了印章，您可在「中国马拉松赛事联盟APP」进行更换操作。</p>
									</div>
																								<div class="text">
										<h2>
											<a href="javascript:;">Q:中国马拉松电子护照是什么？需要单独购买吗？</a>
										</h2>
										<p>A:若您购买了中国马拉松护照纸质版，则会立即生成电子版中国马拉松护照。</p>
									</div>
																<div class="text">
										<h2>
											<a href="javascript:;">Q：电子护照也有印章吗？</a>
										</h2>
										<p>A：线下比赛中，若设立了盖章点且您已完赛，则会显示您的电子章。</p>
									</div>
						<div class="text">
										<h2>
											<a href="javascript:;">Q：我已经购买了护照，但是为什么一直没发货？</a>
										</h2>
										<p>A：中国马拉松护照是定制类商品，从制作到打印需要大约一周时间，请您耐心等待，制作完毕，会立即为您安排发货。</p>
									</div>					
									<div class="thumb_footer">
										<div class="admin_thumb">
											<img src="extra-images/admin.png" class="marathon-img">
											<h6>中国马拉松赛事联盟</h6>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../staticFiles/foot.html"%>
	</div>
</body>
</html>

