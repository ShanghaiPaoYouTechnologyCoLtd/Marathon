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

<title>我要上奥运细则说明</title>
<%@ include file="../../staticFiles/globalCSS.html"%>
<script src="js/jquery.js"></script>
</head>

<body>
	<div class="kode_wrapper">
		<%@ include file="../../staticFiles/head.html"%>
		<div class="kode_content_wrap section">
			<div class="kf_shoppage">
				<div class="container">
					<div class="row">
						<div class="col-md-12 kf_shop_wrap">
							<!-- possport info start -->
							<div class="kf_overview kf_overview_roster">
								<!--Heading 1 Start-->
								<h6 class="kf_hd1 margin_0">
									<span>我要上奥运细则说明</span>
								</h6>
								<!--Heading 1 End-->
							</div>

							<!--Featured 2 thumb Start-->
							<div class="kf_featured_thumb">
								<div class="text_wrper">
									<div class="text">
										<p>搭载全新精品系列赛事——中国马拉松大奖赛，利用现有优秀赛事资源，选拔大众跑者最优秀选手。</p>
										<br />
										<p style="font-weight:bold">选手资格</p>
										<p>1.以2018年2月中国田径协会官方公布的“万人大名单”（男子5000人，女子5000人）为基础，利用赛事进行动态更新。考虑到2017年中国马拉松比赛参赛选手实际男女比例为73%：27%，为了更接近实际情况，及提升比赛的竞争程度，缩短总决赛关门时间（现公布万人大名单，男子入围时间约为3:25，女子入围时间约为4:40），建议男女比例调整为男子6000人，女子4000人</p>
										<p>2.选手必须每年参加并完赛“中国马拉松大奖赛”的至少2站比赛（也就是2年4场），以最好成绩进行最终排名</p>
										<p>3.按照比赛成绩，如条件允许，根据赛事时间及选拔情况，推荐优秀选手男子1名，女子1名，参加2018-2020期间举办的重要国际赛事。e.g.2018年亚运会（印度尼西亚雅加达，8月18日-9月2日）、2019年世界田径锦标赛（卡塔尔多哈，2019年9月28日–
											10月6日）等国际重要赛事</p>
										<p style="font-weight:bold">选拔流程</p>
										<p style="text-align:center;"><img src="extra-images/olympics/img3.png" /></p>
										<p>1.“万人军团”名单公布后，还将同时公布“千人军团”名单（男子1000人，女子1000人），“百人军团”名单（男100人，女子100人），“十人军团”（男子10人，女子10人）</p>
										<p>2.从第一场比赛开始，以后每2个月更新一次名单，包括“千人军团”，“百人军团”， “十人军团”</p>
										<p>3.为了增加名单的悬念，每一份名单除名字外，只公布第一名成绩及最后一名成绩（即最快成绩，即入围成绩）。至第一阶段（2019年大奖赛总决赛）后，公布万人军团、千人军团、百人军团、十人军团的全部名次及成绩；同理，至2020年最后一场比赛后，公布万人军团及种子选手名单及成绩（男子5人，女子5人）。该万人军团名单将成为下一轮2024年奥运会选拔的基础名单。</p>
										<p>4.2020年最后一场比赛为中国大奖赛总决赛</p>
										<p style="font-weight:bold">最终人选的产生</p>
										<p>在最终人选的确定阶段。在产生种子选手男女各5名，进入国家队集训后，选择一场国际田联金标赛事，进行决战，一战定胜负，男女第一名自动获得东京奥运会资格，男女第二名自动成为备选，其他6人成为助威团成员。</p>
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
		<%@ include file="../../staticFiles/foot.html"%>
	</div>
	<%@ include file="../../staticFiles/globalScript.html"%>
</body>
</html>


