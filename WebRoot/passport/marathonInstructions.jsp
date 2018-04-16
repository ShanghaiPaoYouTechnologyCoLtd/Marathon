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
									<span>中国马拉松护照-简介</span>
								</h6>
								<!--Heading 1 End-->
							</div>

							<!--Featured 2 thumb Start-->
							<div class="kf_featured_thumb">
								<div class="text_wrper">
									<div class="text">
										<h2>
											<a href="#">中国马拉松护照简介</a>
										</h2>
										<p>中国马拉松护照是马拉松文化推广的核心载体之一。</p>
										<p>为了更好的推广马拉松文化，为了更好的提升马拉松爱好者的体验感，让每一名马拉松爱好者拥有一份专属于自己的身份识别码；让每一名马拉松爱好者能记载自己参赛的历程，见证属于自己的荣耀，中国田径协会授权中国马拉松赛事联盟颁发《中国马拉松护照》。</p>
										<p style="text-align:center;">
											<img src="extra-images\passport-imgs\passport-big-1.png"
												width="600px" height="400px" />
										</p>
										<p>《中国马拉松护照》为中国田径协会下属认证赛事的官方认证材料，是极具收藏价值和实用价值的官方认证书，一人一证，护照号与参赛者身份证号绑定，具备唯一性，由参赛者第一次参加部分田径协会认证赛事报名自动生成。非认证赛事参赛者，目前可通过中国马拉松赛事联盟APP申请购买。同时，中国马拉松护照的使用者，可通过中国马拉松赛事联盟APP进行相应的更换和遗失申领。</p>
										<p style="text-align:center;">
											<img src="extra-images\passport-imgs\passport-big-2.png"
												width="600px" height="400px" />
										</p>
										<p>《中国马拉松护照》的使用者在参加完赛事后，可进行相应的“马拉松完赛贴纸/马拉松完赛印章”，将完赛包中的贴纸贴于护照“印章/贴纸收集站相应的赛事类型中。</p>
										<p>同时在您的电子版马拉松护照中也会同步相应的完赛贴纸与完赛印章。</p>
										<p>《中国马拉松护照》分为全马、半马、健康跑三类印章/贴纸收集站，使用者贴满相应参赛部分的贴纸后，可进行护照的更换。</p>
										<p style="text-align:center;">
											<img src="extra-images\passport-imgs\passport-big-3.png"
												width="600px" height="400px" />
										</p>
										<p>《中国马拉松护照》同时有线下实体版和线上电子版，拥有实体护照的参赛者可登陆中国马拉松赛事联盟APP自动生成电子版护照。</p>
										<p>(护照积分功能目前正在规划中，上线后护照持有者会结合实体实体护照以及线下参赛记录转化为有效积分为每一名马拉松爱好者提供线上的多种奖励，且护照拥有者在赛事期间可享受到相关合作商家提供的各项优惠便民服务)。</p>
										<p>最后提醒下各位跑友们，2018年4月份之后部分田径协会认证A类马拉松赛事将会在指定地点进行盖章详细地点以及可进行完赛盖章赛事请留意各大赛事组委会官网。</p>
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
	<%@ include file="../staticFiles/globalScript.html"%>
</body>
</html>


