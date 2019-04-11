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

<title>中国马拉松护照（纸质版）-简介</title>
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
								<span>中国马拉松护照（纸质版）-简介</span>
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
										<a href="javascript:;">中国马拉松护照（纸质版）</a>
									</h2>
									<p>
										<a href="passport/marathonPassport.jsp" style="color:blue; ">立即前往办理中国马拉松护照（纸质版）</a>
									</p>
									<br /> <br />
									<p>&nbsp;&nbsp;中国马拉松护照是马拉松文化推广的核心载体之一。</p>
									<p>&nbsp;&nbsp;为了更好的推广马拉松文化，为了更好的提升马拉松爱好者的体验感，让每一名马拉松爱好者拥有一份专属于自己的身份识别码；让每一名马拉松爱好者能记载自己参赛的历程，见证属于自己的荣耀，中国田径协会授权中国马拉松赛事联盟颁发《中国马拉松护照》。</p>
									<div class="shutter" data-hx="1">
										<div class="shutter-img">
											<a href="javascript:;" data-shutter-title="中国马拉松护照与包装"><img
												src="extra-images/passport-imgs/passport-big-2.png" alt="#"></a>
											<a href="javascript:;" data-shutter-title="中国马拉松护照内页"><img
												src="extra-images/passport-imgs/passport-big-10.png" alt="#"></a>
											<a href="javascript:;" data-shutter-title="中国马拉松护照实拍图"><img
												src="extra-images/passport-imgs/passport-big-11.png" alt="#"></a>
										</div>
										<ul class="shutter-btn">
											<li class="prev"></li>
											<li class="next"></li>
										</ul>
										<div class="shutter-desc">
											<p>中国马拉松护照实拍图</p>
										</div>
									</div>
									<p>&nbsp;&nbsp;《中国马拉松护照》为中国田径协会下属认证赛事的官方认证材料，是极具收藏价值和实用价值的官方认证书，一人一证，护照号与参赛者身份证号绑定，具备唯一性。</p>
									<p style="text-align:center">目前有以下三种途径进行购买：</p>
									<p style="text-align:center">1.下载“中国马拉松赛事联盟APP”进行办理</p>
									<p style="text-align:center">2.搜索“中国马拉松赛事联盟”官网进行办理</p>
									<p style="text-align:center">3.合作赛事现场或线上进行办理</p>
									<p>&nbsp;&nbsp;同时，中国马拉松护照的使用者，可通过中国马拉松赛事联盟APP进行相应的更换和遗失申领。</p>
									<p>&nbsp;&nbsp;《中国马拉松护照》的使用者在参加完赛事后，可进行相应的“马拉松完赛贴纸/马拉松完赛印章”，将完赛包中的贴纸贴于护照“印章/贴纸收集站相应的赛事类型中。</p>
									<p>&nbsp;&nbsp;同时在您的电子版马拉松护照中也会同步相应的完赛贴纸与完赛印章。</p>
									<p>&nbsp;&nbsp;《中国马拉松护照》分为全马、半马、健康跑三类印章/贴纸收集站，使用者贴满或盖满相应参赛部分后，可进行护照的更换。</p>
									<div class="shutter shutter3" data-hx="0.8">
										<div class="shutter-img">
											<a href="javascript:;" data-shutter-title="上海半程马拉松印章"><img
												src="extra-images/seals/上海半马最终.jpg" alt="#"></a> <a
												href="javascript:;" data-shutter-title="武汉马拉松印章"><img
												src="extra-images/seals/武汉马拉松全马.jpg" alt="#"></a> <a
												href="javascript:;" data-shutter-title="2018六盘水马拉松"><img
												src="extra-images/seals/六盘水全马.jpg" alt="#"></a> <a
												href="javascript:;" data-shutter-title="2018清远马拉松全马印章"><img
												src="extra-images/seals/2018清远马拉松全马.png" alt="#"></a> <a
												href="javascript:;" data-shutter-title="2018成都双遗全马印章"><img
												src="extra-images/seals/2018成都双遗全马.png" alt="#"></a> <a
												href="javascript:;" data-shutter-title="厦门马拉松印章"><img
												src="extra-images/seals/夏马.jpg" alt="#"></a> <a href="javascript:;"
												data-shutter-title="盖章效果图"><img
												src="extra-images/seals/seals.png" alt="#"></a>
										</div>
										<ul class="shutter-btn">
											<li class="prev"></li>
											<li class="next"></li>
										</ul>
										<div class="shutter-desc">
											<p>中国马拉松护照实拍图</p>
										</div>
									</div>
									<p>&nbsp;&nbsp;《中国马拉松护照》同时有线下实体版和线上电子版，拥有实体护照的参赛者可登陆中国马拉松赛事联盟APP自动生成电子版护照。电子护照将与实体护照进行同步，您参与的每一场马拉松赛事参赛记录会转化为积分及等级，护照持有者可根据等级兑环各类优惠商家服务以及品牌运动装备等多项奖励。</p>
									<p>&nbsp;&nbsp;(具体盖章赛事请以各大赛事组委会官网公告或中国马拉松赛事联盟公众号为准。)</p>
									<div class="shutter shutter2" data-hx="2.2">
										<div class="shutter-img">
											<a href="javascript:;" data-shutter-title="中国马拉松护照与包装"><img
												src="extra-images/app/apps-1.png" alt="#"></a> <a href="javascript:;"
												data-shutter-title="APP截图"><img
												src="extra-images/app/apps-2.png" alt="#"></a> <a href="javascript:;"
												data-shutter-title="中国马拉松护照实拍图"><img
												src="extra-images/app/apps-3.png" alt="#"></a> <a href="javascript:;"
												data-shutter-title="中国马拉松护照实拍图"><img
												src="extra-images/app/apps-4.png" alt="#"></a>
										</div>
										<ul class="shutter-btn">
											<li class="prev"></li>
											<li class="next"></li>
										</ul>
										<div class="shutter-desc">
											<p>中国马拉松护照实拍图</p>
										</div>
									</div>
									<div style="width:100%;" class="qrcode">
										<ul>
											<li><img src="extra-images/download_app.png" width="200"
												height="200" /><br /> <label style="text-align:center">中国马拉松赛事联盟APP</label></li>
											<li><img src="extra-images/wechat_code.jpg" width="200"
												height="200" /><label style="text-align:center">中国马拉松赛事联盟公众号</label>
											</li>
										</ul>
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


