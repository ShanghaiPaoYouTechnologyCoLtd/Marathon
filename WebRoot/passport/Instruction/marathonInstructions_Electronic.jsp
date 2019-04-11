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

<title>中国马拉松电子护照-简介</title>
<%@ include file="../../staticFiles/globalCSS.html"%>
<script src="js/jquery.js"></script>
<link href="css/marathonInc.css" rel="stylesheet">
<style>
p a:hover {
	text-decoration: underline !important;
}

img {
	border: 0;
	vertical-align: top;
}

ul, li {
	list-style: none;
}

.shutter {
	max-width: 420px;
	max-height: 420px;
	overflow: hidden;
	width: 85%;
	position: relative;
	margin: 10px auto;
	border-radius: 10px;
	overflow: hidden;
}

.shutter2 {
	max-width: 240px;
	max-height: 500px;
	width: 85%;
}

.shutter2 li.prev {
	left: 0px !important;
}

.shutter2 li.next {
	right: 0px !important;
}

.shutter3 {
	max-width: 420px;
	max-height: 310px;
	width: 85%;
}

.shutter-img {
	z-index: 1;
}

.shutter-img, .shutter-img a {
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
}

.shutter-img a {
	cursor: default;
}

.shutter-img a>img {
	width: 100%;
	height: 100%;
}

.shutter-img .created {
	overflow: hidden;
	position: absolute;
	z-index: 20;
}

.shutter-btn {
	
}

.shutter-btn li {
	position: absolute;
	z-index: 2;
	top: 50%;
	width: 49px;
	height: 49px;
	margin-top: -25px;
	cursor: pointer;
}

.shutter-btn li.prev {
	left: 20px;
	background: url(images/tools/shutter_prevBtn.png) no-repeat 0 -49px;
}

.shutter-btn li.next {
	right: 20px;
	background: url(images/tools/shutter_nextBtn.png) no-repeat 0 -49px;
}

.shutter-desc {
	position: absolute;
	z-index: 2;
	left: 0;
	bottom: 0;
	width: 100%;
	height: 36px;
	background: url(images/tools/shutter_shadow.png) repeat;
}

.shutter-desc p {
	padding-left: 20px;
	line-height: 36px;
	color: #fff;
	font-size: 14px;
}

.qrcode ul {
	width: 100%;
	text-align: center;
}

.qrcode li {
	display: inline-block;
	list-style: none;
	width: 200px;
}
</style>
</head>

<body>
	<%@ include file="../../staticFiles/head.html"%>
	<div class="kode_content_wrap section">
		<div class="kf_shoppage">
			<div class="container">
				<div class="row">
					<aside class="col-md-3">
						<!--Widget category Start-->
						<div class="widget widget_category2">
							<!--Heading 5 Start-->
							<div class="kf_h5">
								<h5>中国马拉松护照（纸质版）</h5>
							</div>
							<div class="kf_border-2">
								<%@ include file="../../staticFiles/passportMenu.html"%>
							</div>
						</div>
						<!--Widget category End-->
					</aside>
					<div class="col-md-9 kf_shop_wrap">
						<!-- possport info start -->
						<div class="kf_overview kf_overview_roster">
							<!--Heading 1 Start-->
							<h6 class="kf_hd1 margin_0">
								<span>中国马拉松电子护照-简介</span>
							</h6>
							<!--Heading 1 End-->
						</div>

						<!--Featured 2 thumb Start-->
						<div class="kf_featured_thumb">
							<div style="float:right;display:none;">
								<div class="adbar">
									<img src="extra-images/passport-imgs/passport-small.png"
										class="adbar_bg" />
									<p class="adbar_text">立即办理</p>
								</div>
							</div>
							<div class="text_wrper">
								<div class="text">
									<h2>
										<a href="javascript:;">中国马拉松电子护照</a>
									</h2>
									<p>
										<a href="passport/passportReg.jsp" style="color:blue; ">立即前往免费注册中国马拉松电子护照</a>
									</p>
									<br /> <br />
									<p>&nbsp;&nbsp;中国马拉松护照是马拉松文化推广的核心载体之一。</p>
									<p>&nbsp;&nbsp;为了更好的推广马拉松文化，中国田径协会授权中国马拉松赛事联盟颁发《中国马拉松护照》。并于2018年9月18日正式推出免办理费用的中国马拉松护照电子版。</p>
									<div class="shutter shutter2" data-hx="2.2">
										<div class="shutter-img">
											<a href="javascript:;" data-shutter-title="电子护照"><img
												src="extra-images/passport-imgs/Elec/pe1.png" alt="#"></a>
											<a href="javascript:;" data-shutter-title="浏览电子护照"><img
												src="extra-images/passport-imgs/Elec/pe2.png" alt="#"></a>
										</div>
										<ul class="shutter-btn">
											<li class="prev"></li>
											<li class="next"></li>
										</ul>
										<div class="shutter-desc">
											<p>中国马拉松电子护照</p>
										</div>
									</div>
									<p>&nbsp;&nbsp;中国马拉松护照是中国田径协会正在实施的全国跑者信息的基础管理手段，护照编码拥有唯一性。</p>
									<p>&nbsp;&nbsp;马拉松护照分为电子版和实体版，电子版护照可在APP上查询赛事完赛章以及马拉松护照信息。</p>
									<p>&nbsp;&nbsp;从2018年初起，每参与一场田协认证马拉松赛事即可累计相应马拉松电子护照积分，兑换优惠券直通车名额等。</p>
									<div class="shutter shutter3" data-hx="0.8">
										<div class="shutter-img">
											<a href="javascript:;"><img
												src="extra-images/passport-imgs/Elec/pe3.png" alt="#"></a>
											<a href="javascript:;"><img
												src="extra-images/passport-imgs/Elec/pe4.png" alt="#"></a>
										</div>
										<ul class="shutter-btn">
											<li class="prev"></li>
											<li class="next"></li>
										</ul>
										<div class="shutter-desc">
											<p>电子护照印章</p>
										</div>
									</div>
									<p>&nbsp;&nbsp;中国马拉松护照是中国田径协会正在实施的全国跑者信息的基础管理手段，护照编码拥有唯一性。</p>
									<p>&nbsp;&nbsp;马拉松护照分为电子版和实体版，电子版护照可在APP上查询赛事完赛章以及马拉松护照信息。</p>
									<p>&nbsp;&nbsp;从2018年初起，每参与一场田协认证马拉松赛事即可累计相应马拉松电子护照积分，兑换优惠券直通车名额等。</p>
									<p>&nbsp;&nbsp;电子护照将与跑者赛事成绩进行同步。跑者所参与过的赛事（田径协会A类共办赛事）在电子护照中会自动显示赛事完赛章。另外您参与的每一场马拉松赛事成绩会转化成积分及等级。护照持有者可根据护照积分兑换各类优惠商家服务以及品牌运动装备等。</p>
									<div class="shutter shutter2" data-hx="2.2">
										<div class="shutter-img">
											<a href="javascript:;"><img
												src="extra-images/passport-imgs/Elec/pe5.png" alt="#"></a>
											<a href="javascript:;"><img
												src="extra-images/passport-imgs/Elec/pe6.png" alt="#"></a>
										</div>
										<ul class="shutter-btn">
											<li class="prev"></li>
											<li class="next"></li>
										</ul>
										<div class="shutter-desc">
											<p>APP积分商城</p>
										</div>
									</div>

									<p style="text-align:center">中国马拉松电子护照申请流程</p>

									<p style="text-align:center">&nbsp;&nbsp;一、如何申请电子护照</p>
									<p style="text-align:center">&nbsp;&nbsp;1.百度搜索中国马拉松赛事联盟官网进行免费注册。</p>
									<p style="text-align:center">&nbsp;&nbsp;2.微信关注中国马拉松赛事联盟公众号进行电子护照注册。</p>
									<p style="text-align:center">
										<img src="extra-images/wechat_code.jpg" width="200"
											height="200" /><label style="text-align:center">中国马拉松赛事联盟公众号</label>
									</p>
									<p style="text-align:center">&nbsp;&nbsp;二、如何使用电子护照</p>
									<p style="text-align:center">&nbsp;&nbsp;下载中国马拉松赛事联盟APP，注册账号并验证身份证信息后，点击下方马拉松护照即可使用各项功能。</p>
									<p style="text-align:center">
										<img src="extra-images/download_app.png" width="200"
											height="200" /><br /> <label style="text-align:center">中国马拉松赛事联盟APP</label>
									</p>

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
		<script src="js/album/velocity.js"></script>
		<script src="js/album/shutter.js"></script>
		<script type="text/javascript">
			$(function() {
				$('.shutter').each(function() {
					var hx = $(this).data("hx");
					$(this).shutter({
						shutterW : $(this).width(), // 容器宽度
						shutterH : $(this).width() * hx, // 容器高度
						isAutoPlay : true, // 是否自动播放
						playInterval : 3000, // 自动播放时间
						curDisplay : 3, // 当前显示页
						fullPage : false // 是否全屏展示
					});
				});
		
				$(".adbar").click(function() {
					location.href = "passport/marathonPassport.jsp";
				});
			});
		</script>
		<%@ include file="../../staticFiles/foot.html"%>
	</div>
</body>
</html>


