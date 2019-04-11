<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>中国马拉松护照</title>
<base href="<%=basePath%>">
<meta name="viewport"
	content="width=drvice-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">

<meta name="apple-mobile-web-app-capable " content=" yes " />
<meta name=" apple-mobile-web-app-status-bar-style " content=" black " />
<meta content="telephone = no" name=" format-detection " />
<meta charset="UTF-8" />

<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/mobile/passportIntro.css">

</head>
<body>
	<div class=".preload"></div>
	<div class="intro-wap">
		<img src="images/leftlets/passport/passport.png" id="img-1" />
		<div class="imgcont">
			<p id="title1">中国马拉松护照</p>
			<p id="title2">记录奔跑，存档马拉松人生</p>
			<img src="images/leftlets/passport/handleBtn.png" id="btn-buy" /><br />
		</div>
		<div class="track-bg"></div>
		<div class="nextbtn">
			<img src="images/leftlets/passport/bottomBtn.png" />
		</div>
	</div>
	<script src="js/jquery.js"></script>
	<script src="js/jquery.stamper.js"></script>
	<script>
		var imgRoot = "images/leftlets/passport/";
		var gifSrc = "images/leftlets/passport/running.gif";
		var pngSrc = "images/leftlets/passport/runner-person.png";
		var curPage = 0;
		var degInti = 100;
	
		$(function() {
			$("#btn-buy").on("touchstart", function() {
				addAnimate("#btn-buy", "hinge");
	
				setTimeout(function() {
					$("#btn-buy").hide();
					location.href = "mobile/passport/passportOrder.jsp";
				}, 1980);
			});
	
			$("#img-1").on("touchstart", function() {
				addAnimate('#img-1', staticAnimate[curPage]);
				if (curPage == 3 && $("#img-1").attr("src").indexOf("shop2") > 0) {
					setTimeout(function() {
						$("#img-1").attr("src", imgRoot + "/shop3.png");
					}, 200);
					window.clearInterval(animateTimer); //切换盒子后停止动画
				}
				if ($("#jquery_stamper_img_1").length > 0) {
					addAnimate("#jquery_stamper_img_1", staticAnimate[curPage]);
				}
			});
	
			$("body").on("touchstart", function(e) {
				e.preventDefault();
				startX = e.originalEvent.changedTouches[0].pageX,
				startY = e.originalEvent.changedTouches[0].pageY;
			});
	
			$("body").on("touchmove", function(e) {
				$("body").off("touchmove");
				touchMove(e);
			});
	
			$(".nextbtn").on("touchstart", function() {
				nextPage();
			});
	
			pageShowAnimate();
		});
	
		var appearAnimate = [ [ "fadeInLeft", "fadeInRight", "fadeInUpBig" ],
			[ "lightSpeedIn", "lightSpeedIn", "lightSpeedIn" ],
			[ "fadeInLeft", "fadeInRight", "fadeInUpBig" ],
			[ "fadeInRight", "fadeInLeft", "fadeInDownBig" ],
			[ "rotateInUpLeft", "rotateInUpRight", "rotateInUpLeft" ],
			[ "zoomInLeft", "zoomInRight", "zoomIn" ] ];
		var disappearAnimate = [ [ "fadeOutLeft", "fadeOutRight", "fadeOutDownBig" ],
			[ "lightSpeedOut", "lightSpeedOut", "lightSpeedOut" ],
			[ "fadeOutLeft", "fadeOutRight", "fadeOutDownBig" ],
			[ "fadeOutRight", "fadeOutLeft", "fadeOutDownBig" ],
			[ "rotateOutUpLeft", "rotateOutUpRight", "rotateOutUpLeft" ],
			[ "zoomOutLeft", "zoomOutRight", "zoomOut" ] ];
		var displayInfo = [ [ "中国马拉松护照", "记录奔跑历程，见证你的荣耀", "passport.png" ],
			[ "完赛章盖印", "奔跑是习惯，跑马是挑战<br/>每一次进步，马拉松护照帮您记录", "shanghai.png" ],
			[ "多样化印章", "不同的赛事，不同的印章<br/>根据赛事特点所设计独一无二的印章", "beijing.png" ],
			[ "积分兑换", "跑马不止荣誉，更有积分！<br/>每场赛事根据成绩获取相应积分", "shop2.png" ],
			[ "【福利合影】", "优惠券/直通车名额/运动装备等你拿", "rewards.png" ],
			[ "持证跑马", "你还选择裸奔吗？？？", "winner.png" ] ];
		var position = [ [ "60%", "20%", "150px" ],
			[ "100%", "0", "135px" ],
			[ "100%", "0", "117px" ],
			[ "80%", "10%", "130px" ],
			[ "80%", "10%", "170px" ],
			[ "80%", "10%", "120px" ] ];
		var staticAnimate = [ "bounce", "rubberBand", "jello", "wobble", "tada", "flash" ];
		var stampSize = [ [ 400, 193 ], [ 200, 134.5 ] ];
	
		function pageHideAnimate() {
			window.clearInterval(animateTimer);
	
			addAnimate('#title1', disappearAnimate[curPage][0]);
			addAnimate('#title2', disappearAnimate[curPage][1]);
			addAnimate('#img-1', disappearAnimate[curPage][2]);
		}
	
		function pageShowAnimate() {
			$("#title1").html(displayInfo[curPage][0]);
			$("#title2").html(displayInfo[curPage][1]);
			$("#img-1").attr("src", imgRoot + displayInfo[curPage][2]);
			$("#img-1").css({
				"width" : position[curPage][0],
				"left" : position[curPage][1],
				"bottom" : position[curPage][2]
			});
			setTimeout(function() {
				addAnimate('#title1', appearAnimate[curPage][0]);
				addAnimate('#title2', appearAnimate[curPage][1]);
				addAnimate('#img-1', appearAnimate[curPage][2]);
	
				setTimeout(function() {
					if (curPage == 3) { //礼品盒抖动提示
						addAnimate('#img-1', staticAnimate[curPage]);
					}
				}, 800);
	
				animateTimer = setInterval(function() {
					addAnimate('#img-1', staticAnimate[curPage]);
					if ($("#jquery_stamper_img_1").length > 0) {
						addAnimate("#jquery_stamper_img_1", staticAnimate[curPage]);
					}
				}, 5000);
	
				if (curPage == 1 || curPage == 2) {
					stampTimer = setTimeout("setStamper()", 1000);
				}
			}, 100);
		}
	
		var stampTimer = null;
		var animateTimer = null;
	
		//盖章
		function setStamper() {
			var stame = curPage == 1 ? "/shstamp.png" : "/bjstamp.png";
	
			$("#img-1").stamper({
				image : imgRoot + stame,
				iwitdh : stampSize[curPage - 1][0],
				iheight : stampSize[curPage - 1][1],
				complete : function() {
					$("#jquery_stamper_img_1").on("touchstart", function() {
						addAnimate('#img-1', staticAnimate[curPage]);
						if ($("#jquery_stamper_img_1").length > 0) {
							addAnimate("#jquery_stamper_img_1", staticAnimate[curPage]);
						}
					});
				}
			});
		}
	
		function addAnimate(e, x) {
			$(e).removeClass().addClass(x + ' animated').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function() {
				$(this).removeClass();
			});
		}
	
		function touchMove(e) {
			e.preventDefault();
	
			setTimeout(function() {
				$("body").on("touchmove", function(e) {
					$("body").off("touchmove");
					touchMove(e);
				});
			}, 800);
	
			moveEndX = e.originalEvent.changedTouches[0].pageX,
			moveEndY = e.originalEvent.changedTouches[0].pageY,
			X = moveEndX - startX,
			Y = moveEndY - startY;
	
			if (Math.abs(X) > Math.abs(Y) && X > 0) {
				prevPage();
			} else if (Math.abs(X) > Math.abs(Y) && X < 0) {
				nextPage();
			} else if (Math.abs(Y) > Math.abs(X) && Y > 0) {
				prevPage();
			} else if (Math.abs(Y) > Math.abs(X) && Y < 0) {
				nextPage();
			} else {
	
			}
		}
	
		function prevPage() {
			window.clearTimeout(stampTimer);
			$("#jquery_stamper_img_1").remove();
			if (curPage == 0) {
				return;
			}
			pageHideAnimate();
			$(".nextbtn").show();
			$("#btn-buy").hide();
			$("#img-1").css({
				"z-index" : "997"
			});
			curPage--;
			var curDeg = degInti * curPage;
			$(".track-bg").css({
				"left" : "-" + curDeg + "%"
			});
			setTimeout(function() {
				pageShowAnimate();
			}, 800);
		}
	
		function nextPage() {
			window.clearTimeout(stampTimer);
			$("#jquery_stamper_img_1").remove();
			if (curPage == 5) {
				return;
			}
			pageHideAnimate();
			curPage++;
			if (curPage == 5) {
				$("#img-1").css({
					"z-index" : "999"
				});
				$(".nextbtn").hide();
				$("#btn-buy").show();
				addAnimate("#btn-buy", "flip");
			}
			var curDeg = degInti * curPage;
			$(".track-bg").css({
				"left" : "-" + curDeg + "%"
			});
			setTimeout(function() {
				pageShowAnimate();
			}, 800);
		}
	</script>
</body>
</html>