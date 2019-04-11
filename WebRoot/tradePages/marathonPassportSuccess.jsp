<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<title>中国马拉松护照</title>
<%@ include file="../staticFiles/globalCSS.html"%>
<script src="js/jquery.js"></script>
<style>
.sell-result {
	width: 100%;
	text-align: center;
}
</style>

</head>

<body>

	<div class="kode_wrapper">
		<header class="kode_header_2">
			<%@ include file="../staticFiles/head.html"%>
		</header>
		<!--Header 2 Wrap End-->
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
								<div style="clear:both;"></div>
							</div>
							<!--Widget category End-->
						</aside>
						<div class="col-md-9 kf_shop_wrap">
							<!-- possport sell start -->
							<div class="sell-result">
								<div class="kf_overview kf_overview_roster">
									<!--Heading 1 Start-->
									<h6 class="kf_hd1 margin_0">
										<span>中国马拉松护照-购买成功</span> <a class="prv_btn"
											href="runnerList.html"></a>
									</h6>
									<!--Heading 1 End-->
								</div>
								<p>
									<span class="glyphicon glyphicon-ok"
										style="font-size:42px;color:green;"></span>
								</p>
								<p id="p_info">
									您已成功购买中国马拉松护照！<br />因本产品为定制类商品，打印制作需要约一周时间。<br />制作完成会立刻为您寄出,请您耐心等待
								</p>
								<p>
									<img src="extra-images/download_app.png" style="width:120px;">
								</p>
								<p>扫描上方二维码即可查看您的电子护照</p>
							</div>
							<!-- possport sell end -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<script>
			window.onload = function() {
				var tradeType = getPar("tradeType");
				if (tradeType && tradeType != null && tradeType!="false") { //微信返回
					if (tradeType == 1) { //购买护照
						//默认文本
					} else if (tradeType == 2) { //重领护照
						$("#p_info").html("您的申请已经提交！<br/><br/>工作人员会在3个工作日内为您发货，请您耐心等待。");
					}
					return;
				}
				var outtradeno = getPar("out_trade_no");
				if (outtradeno != null && typeof outtradeno == "string") {
					if (outtradeno.toLowerCase().indexOf("rece_") >= 0) { //重领护照
						$("#p_info").html("您的申请已经提交！<br/><br/>工作人员会在3个工作日内为您发货，请您耐心等待。");
					}
				}
			}
		
			function getPar(par) {
				//获取当前URL
				var local_url = document.location.href;
				//获取要取得的get参数位置
				var get = local_url.indexOf(par + "=");
				if (get == -1) {
					return false;
				}
				//截取字符串
				var get_par = local_url.slice(par.length + get + 1);
				//判断截取后的字符串是否还有其他get参数
				var nextPar = get_par.indexOf("&");
				if (nextPar != -1) {
					get_par = get_par.slice(0, nextPar);
				}
				return get_par;
			}
		</script>
		<%@ include file="../staticFiles/foot.html"%>
	</div>
</body>
</html>

