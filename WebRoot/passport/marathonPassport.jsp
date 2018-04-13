<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>中国马拉松护照</title>
<%@ include file="../staticFiles/globalCSS.html"%>
<script src="js/jquery.js"></script>
<style>
select {
    width: 24%;
    margin-right:10px;
    height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    display: inline-block;
    vertical-align: middle;
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
								<div class="kf_border-2">
									<%@ include file="../staticFiles/passportMenu.html"%>
								</div>
								<div style="clear:both;"></div>
							</div>
						</aside>
						<div class="col-md-9 kf_shop_wrap">
							<div style="display:block;">
								<div class="kf_overview kf_overview_roster">
									<h6 class="kf_hd1 margin_0">
										<span>中国马拉松护照-购买</span> <a class="prv_btn"
											href="runnerList.html">批量购买（10人起购）&raquo;</a>
									</h6>
								</div>
								<div id="passport-sell">
									<form class="form-horizontal">
										<div class="form-group">
											<label for="realName" class="col-sm-2 control-label">*真实姓名</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="inputEmail3"
													placeholder="请填写您的真实姓名">
											</div>
										</div>
										<div class="form-group">
											<label for="selectIdType" class="col-sm-2 control-label">*证件类型</label>
											<div class="col-sm-10">
												<select class="form-control">
													<option>请选择证件类型</option>
													<option>身份证</option>
													<option>护照</option>
													<option>港澳通行证</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label for="inputID" class="col-sm-2 control-label">*证件号</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="inputPassword3"
													placeholder="请填写您的证件号">
											</div>
										</div>
										<div class="form-group">
											<label for="inputTel" class="col-sm-2 control-label">*联系电话</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="inputPassword3"
													placeholder="请填写您联系电话">
											</div>
										</div>
										<div class="form-group">
											<label for="inputAdd" class="col-sm-2 control-label">*收件地址</label>
											<div class="col-sm-10">
											<div data-toggle="distpicker" style="margin-bottom:10px;">
												<select data-province="---- 选择省 ----"></select> <select
													data-city="---- 选择市 ----"></select> <select
													data-district="---- 选择区 ----"></select>
										   	</div>
												<input type="text" class="form-control" id="inputPassword3"
													placeholder="请填写详细街道信息">
											</div>
										</div>
										<div class="form-group">
											<label for="selectPaymentMethod"
												class="col-sm-2 control-label">*选择支付方式(￥50.00)</label>
											<div class="col-sm-10">
												<label class="radio-inline"> <input type="radio"
													name="inlineRadioOptions" class="pay-way-radio"
													id="inlineRadio1" value="zhifubao" checked> <span>
														<svg class="icon pay-way-icon" aria-hidden="true">
                                                    <use
																xlink:href="#icon-zhifubaozhifu"></use>
                                                </svg>
												</span>
												</label> <label class="radio-inline"> <input type="radio"
													name="inlineRadioOptions" class="pay-way-radio"
													id="inlineRadio2" value="weixin"> <span> <svg
															class="icon pay-way-icon" aria-hidden="true">
                                                    <use
																xlink:href="#icon-weixinzhifu1"></use>
                                                </svg>
												</span>
												</label>
											</div>
										</div>
										<div class="form-group">
											<label for="selectPaymentMethod"
												class="col-sm-2 control-label"></label>
											<div class="col-sm-10">
												<p style="color: #b02126;font-weight: 300;">注：本产品为定制产品，一经购买，不可退换。</p>
											</div>
										</div>
										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-10">
												<button type="submit"
													class="btn btn-primary passport-sell-btn">去购买</button>
											</div>
										</div>
									</form>
								</div>
							</div>
							<div style="display:none;">
								<div class="kf_overview kf_overview_roster">
									<!--Heading 1 Start-->
									<h6 class="kf_hd1 margin_0">
										<span>中国马拉松护照-问答中心</span>
									</h6>
								</div>
								<div id="passport-QA">
									<p>中国马拉松护照是巴拉巴拉啊啊啊</p>
									<p>中国马拉松护照是巴拉巴拉啊啊啊</p>
									<p>中国马拉松护照是巴拉巴拉啊啊啊</p>
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
	<script src="js/distpicker/distpicker.data.min.js"></script>
	<script src="js/distpicker/distpicker.min.js"></script>
</body>
</html>

