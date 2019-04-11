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

<title>中国马拉松护照-办理/补领/查询</title>
<%@ include file="../staticFiles/globalCSS.html"%>
<link href="js/bootstrap/bootstrapselect/bootstrap-select.min.css"
	rel="stylesheet">
<style>
.bigBlock {
	height: 600px;
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
						<aside class="col-md-3" style="height:38px">
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
									<span>中国马拉松护照·印章墙</span>
								</h6>
								<!--Heading 1 End-->
							</div>
							<select class="selectpicker" multiple data-live-search="true"
								data-actions-box="true">
								<option value="1">广东省</option>
								<option value="2">广西省</option>
								<option value="3">福建省</option>
								<option value="4">湖南省</option>
								<option value="5">山东省</option>
							</select> <select class="selectpicker" multiple 
								data-actions-box="true">
								<option value="1">全马</option>
								<option value="2">半马</option>
								<option value="3">10KM</option>
								<option value="4">5KM</option>
								<option value="5">其他</option>
							</select>
							<div class="bigBlock"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script>
			$(".separateBlock").click(function() {
				var url = $(this).data("url");
				if (url != null && url.length > 0) {
					location.href = url;
				} else {
					alert("抱歉，该功能暂未开放。");
				}
			});
		</script>
		<%@ include file="../staticFiles/foot.html"%>
		<script src="js/bootstrap/bootstrapselect/bootstrap-select.js"></script>
	</div>
</body>
</html>

