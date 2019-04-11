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
<%@ include file="../../staticFiles/globalCSS.html"%>
<style>
.text h2 a {
	font-size: 14px;
}

.bigBlock {
	width: 70%;
	height: 420px;
	margin: 0px auto;
}

.separateBlock {
	width: 50%;
	height: 50%;
	float: left;
	text-align: center;
	padding-top: 45px;
	cursor: pointer;
}

.separateBlock img {
	width: 100px;
	height: 100px;
}

.separateBlock:hover img {
	width: 95px;
	height: 95px;
}

.separateBlock a {
	display: inline-block;
	margin-top: 20px;
	color: #212d5c;
	font-size: 15px;
	font-weight: bold;
}

.separateBlock:hover {
	background: #fff;
	-webkit-box-shadow: 0px 4px 70px 0px rgba(86, 103, 146, 0.1);
	box-shadow: 0px 4px 70px 0px rgba(86, 103, 146, 0.1);
}

.separate1, .separate4 {
	background-color: #f0f0f2;
}

@media ( max-width : 620px) {
	.bigBlock {
		width: 98% !important;
		height: 300px;
	}
	.separateBlock img {
		width: 80px;
		height: 80px;
	}
	.separateBlock {
		padding-top: 20px;
	}
	.separateBlock a {
		margin-top: 10px;
	}
}
</style>
</head>

<body>
	<div class="kode_wrapper">
		<%@ include file="../../staticFiles/head.html"%>
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
									<span>中国马拉松护照办理&补领</span>
								</h6>
								<!--Heading 1 End-->
							</div>
							<div class="bigBlock">
								<div class="separateBlock separate1  tran3s"
									data-url="passport/Instruction/marathonInstructions.jsp">
									<img src="extra-images/icon/book.png" /> <br /> <a
										class="tran3s theme-button" href="javascript:;">纸质版</a>
								</div>
								<div class="separateBlock separate2  tran3s"
									data-url="passport/Instruction/marathonInstructions_Electronic.jsp">
									<img src="extra-images/icon/phone.png" /><br /> <a
										class="tran3s theme-button" href="javascript:;">电子版</a>
								</div>
							</div>
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
		<%@ include file="../../staticFiles/foot.html"%>
	</div>
</body>
</html>

