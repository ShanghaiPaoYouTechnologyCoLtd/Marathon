var buyEnable=true;

$("#btn_buy").click(function() {
	if(!buyEnable)
		return;
	
	if (!getOrderParams())
		return;

	$("#div_infoCheck").modal("toggle");
});

var params;
function confirmPopOrderInfo() {
	if(!buyEnable)
		return;
	
	$("#div_loading").show();
	$(".modal-footer button").hide();

	var url = 'order.do';
	async(url, params, function(res) {
		var result = {};
		if (typeof res == 'string') {
			result = JSON.parse(res);
		} else {
			result = res;
		}
		var status = result.status;
		if (status == 'ok') { //购买成功
			var data = result.data;
			if (data) {
				if (data.payType == 1) { //支付宝支付
					var serialNum = data.serialNum;
					var payFee = data.payFee;
					var title = data.title;
					$('#WIDout_trade_no').val(serialNum);
					$('#WIDtotal_amount').val(payFee);
					$('#WIDsubject').val(title);
					document.getElementById("payform").submit(); //付款
					return;
				} else { //微信支付
					var QRUrl = data.QRUrl;
					if (QRUrl == "QRCODE_ERROR") {
						alert("微信支付链接生成失败！请检查网络稍后再试！");
					} else {
						$("#pay_wechat_QRCode").val(QRUrl);
						$("#pay_wechat_tradeno").val(data.serialNum);
						$("#pay_wechat_fee").val(data.payFee);
						document.getElementById("payWechatform").submit(); //微信付款页面
						return;
					}
				}
			} else {
				var message = result.message;
				message = message ? message : '订单提交失败!';
				showRequestMessage('notice', message);
			}
		} else {
			var message = result.message;
			if (message == "您已报名,请勿重复提交!") {
				$(".div_title_already").show();
				$(".pop_prompt_body").hide();
				$(".mask").show();
				$(".pop_prompt_title").hide();
				$("#zc_pop_prompt").show();
			} else {
				message = message ? message : '订单提交失败!';
				showRequestMessage('notice', message);
			}
		}
		$("#div_loading").hide();
		$(".modal-footer button").show();
	}, function() {
		$("#div_loading").hide();
		$(".modal-footer button").show();
		showRequestMessage('notice', '请检查您的网络!');
	}, 'POST');
}

function getOrderParams() {
	var userName = $("#txt_uname").val();
	var sex = $("#rab_male").is(":checked") ? 1 : 2;
	var cardType = $("#sel_cardtype").val();
	var cardNo = $("#txt_cardno").val();
	var phoneNo = $("#txt_phone").val();
	var coName = "paoyou";
	var province = $("#sel_prov").val();
	var city = $("#sel_city").val();
	var district = $("#sel_dist").val();
	var address = $("#txt_address").val();
	var purcahseType = "";
	var payTtpe = $("#rab_zfb").is(":checked") ? 1 : 2;

	var telReg = /^(([0\+]\d{2,3}-)?(0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/;
	var cardNumReg = /(^\d{15}$)|(^\d{17}([0-9]|X)$)/;
	var mobileReg = /^\d{7,11}$/;
	if (userName == null || userName.length <= 0) {
		showRequestMessage('notice', "请填写姓名！");
		return false;
	}

	if (isNaN(cardType)) {
		showRequestMessage('notice', "请选择证件类型！");
		return false;
	}

	if (cardType == 1 && !cardNumReg.test(cardNo)) { //只验证身份证号
		showRequestMessage('notice', "请填写正确的证件号！");
		return false;
	}

	if (!(mobileReg.test(phoneNo.trim()) || telReg.test(phoneNo.trim()))) {
		showRequestMessage('notice', "请填写正确的手机号！");
		return false;
	}

	if (province == null || province.length <= 0) {
		showRequestMessage('notice', "请选择省份！");
		return false;
	}

	if (city == null || city.length <= 0) {
		showRequestMessage('notice', "请选择城市！");
		return false;
	}

	if (address == null || address.length <= 4) {
		showRequestMessage('notice', "详细地址不能少于5个字符！");
		return false;
	}


	params = {
		userName : userName,
		sex : sex,
		cardType : cardType,
		cardNo : cardNo,
		phoneNo : phoneNo,
		payType : payTtpe,
		purcahseType : purcahseType,
		coName : coName,
		province : province,
		district : district,
		address : address,
		city : city
	};
	var cardTypes = new Array("身份证", "护照", "港澳通行证");
	$("#sp_info_name").html(userName);
	$("#sp_info_sex").html(sex == 1 ? "男" : "女");
	$("#sp_info_cardtype").html(cardTypes[cardType - 1]);
	$("#sp_info_cardno").html(cardNo);
	$("#sp_info_phone").html(phoneNo);
	$("#sp_info_address").html(province + " " + city + " " + district + "<br/>" + address);
	$("#sp_info_paytype").html(payTtpe == 1 ? "支付宝支付" : "微信支付");
	return true;
}

//参数获取
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
//json日期格式转换为正常格式
function jsonDateFormat(jsonDate) {
	 try {
	  var date = new Date(parseInt(jsonDate.replace("/Date(", "").replace(")/", ""), 10));
	  var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
	  var day = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
	  var hours = date.getHours();
	  var minutes = date.getMinutes();
	  var seconds = date.getSeconds();
	  var milliseconds = date.getMilliseconds();
	  return date.getFullYear() + "-" + month + "-" + day + " " + hours + ":" + minutes + ":" + seconds + "." + milliseconds;
	 } catch (ex) {
	  return "";
	 }
	}