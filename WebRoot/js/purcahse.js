$(function() {
	// 性别选择功能
	$('.purchase_content .usersex').click(function() {
		if ($(this).hasClass('selected')) {
			return false;
		}
		var $usersex = $('.purchase_content .usersex');
		$usersex.removeClass('selected');
		$usersex.find('img').attr('src', 'images/radio_blank.png');
		$(this).addClass('selected');
		$(this).find('img').attr('src', 'images/radio_selected.png');
	});

	$('.col-xs-10 img').click(function() {
		var isAliPay = $(this).attr('src').indexOf('alipay') >= 0;
		$("#rad_pay_ali").prop("checked", isAliPay);
		$("#rad_pay_wechat").prop("checked", !isAliPay);
	});

	$("#purcahseType").bind("input propertychange change", function(event) {});

	$("#link_cancel").click(function() {
		$(".mask").hide();
		$("#zc_pop_prompt").hide();
	});

	var userAgent = navigator.userAgent; //为IE浏览器时需要特殊处理
	var isIE = userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1;

	var stopArr=new Array("tongzhou");
	var gameNames=new Array("通州马拉松");
	
	var coName=decodeURI(getPar("coname"));
	for(var i=0;i<stopArr.length;i++){
		if(coName==stopArr[i]){
			$("#gameName").html(gameNames[i]);
			$('.purchase_submit').remove();
			document.getElementById("alarmError2").style.display = "inherit";
			return;
		}	
	}
	
	var paycahsetype = getPar("t");
	var paycahsetypeKey="";
	if(paycahsetype!=null && paycahsetype.length>0){
		paycahsetypeKey= hex_md5(paycahsetype.toUpperCase())
	}
  
	switch (paycahsetypeKey) {
	case '84f85c2249db98a652660e5c2830395d': //d
		$("#purcahseType").val("payDiscount");
		document.getElementById("lbl_discount").style.display = "inherit";
		break;
	case '53ba4f6c4e13b834ca3b3ebfc0657b39': //f
		$("#purcahseType").val("payFull");
		$("#lbl_realPrice").html("28.00");
		break;
	case '8853e887a4b0b516022195b9bb7cc18c': //t
		$("#purcahseType").val("payTest");
		document.getElementById("alarmPrivate").style.display = "inherit";
		break;
	default:
		$("#purcahseType").val("");
		$('.purchase_submit').remove();
		document.getElementById("alarmError").style.display = "inherit";
		break;
	}

});

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
/*
 * @fn 订单提交
 * */
function submitOrder() {
	var url = 'order.do';
	var params = getOrderParams();
	var resultParams = OrderParamsVerify(params);
	var verfyStatus = resultParams.verfyStatus; //验证状态
	var errorMsg = resultParams.errorMsg; //错误信息
	if (!verfyStatus) {
		showRequestMessage('notice', errorMsg);
		return false;
	}
	showConfirmOrderInfo(params); //显示弹窗
}
function queryPassport(){
	var cardNo = $('#cardNo').val(); //证件号
	if (cardNo==null || cardNo.length==0) {
		showRequestMessage('notice', '查询护照需要填写身份证号码');
		return;
	}
	
	var params = {
			cardNo : cardNo,
		};

	async("queryPassport.do", params, function(res) {
		var result = {};
		if (typeof res == 'string') {
			result = JSON.parse(res);
			alert(result.passportStatus==0?"您尚未购买护照！":"您已购买护照！");
		} else {
			if(res['passportStatus']==0){
				alert("您尚未购买护照！");
			}else{
				alert("您已购买护照！");
			}
		}
	}, function() {
		showRequestMessage('notice', '请检查您的网络!');
	}, 'GET');
}
/*
 * @fn 获取订单参数
 * */
function getOrderParams() {
	var $username = $('#username'); //姓名
	var $usersex = $('.usersex.selected'); //性别
	var $cardType = $('#cardType'); //证件类型
	var $cardNo = $('#cardNo'); //证件号
	var $phoneNo = $('#phoneNo'); //联系电话
	var $payTtpe = $('#rad_pay_ali').is(":checked") ? 1 : 2;
	var userName = $username.val();
	var sex = $usersex.attr('_code');
	var cardType = $cardType.val();
	var cardNo = $cardNo.val();
	var phoneNo = $phoneNo.val();
	var coName=decodeURI(getPar("coname"));
    if(coName=="false"){
    	coName="";  //参数为空 decodeURL会返回false
    }
	var purcahseType = $("#purcahseType").val();

	var params = {
		userName : userName,
		sex : sex,
		cardType : cardType,
		cardNo : cardNo,
		phoneNo : phoneNo,
		payType : $payTtpe,
		purcahseType : purcahseType,
		coName:coName
	};
	return params;
}
/*
 * @fn 参数验证
 * */
function OrderParamsVerify(param) {
	var sureArr = [ "userName", "sex", "cardType", "cardNo", "phoneNo", "payType" ];
	var isSuccess = true; //是否成功
	var message = "";
	var result = [];
	var telReg = /^(([0\+]\d{2,3}-)?(0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/;
	var mobileReg = /^1[3|4|5|7|8][0-9]\d{4,8}$/;
	mobileReg = /^1\d{6,10}$/;
	mobileReg = /^\d{7,11}$/;

	var cardNumReg = /(^\d{15}$)|(^\d{17}([0-9]|X)$)/;

	var sureTip = {
		"userName" : "请填写姓名",
		"sex" : "请选择性别",
		"cardType" : "请选择证件类型",
		"cardNo" : "请填写证件号",
		"phoneNo" : "请填写联系电话",
		"payType" : "请选择购买方式"
	};
	param = param ? param : {};
	for (var key in param) { //验证
		var value = param[key];
		if (typeof value == "number") {
			value = value + "";
		}
		var valueTrim = typeof value == "string" ? value.trim() : "";
		if (sureArr.indexOf(key) != -1) { //必填字段
			if (!valueTrim) {
				message += sureTip[key];
				isSuccess = false;
				break;
			} else if (key == 'phoneNo') {
				if (!(mobileReg.test(valueTrim) || telReg.test(valueTrim))) {
					message += '请填写正确的联系电话';
					isSuccess = false;
					break;
				}
			} else if (key == 'cardNo' && param["cardType"] == 1) {
				//身份证验证
				valueTrim = valueTrim.toUpperCase()
				if (!cardNumReg.test(valueTrim)) {
					message += '请填写正确的身份证号码';
					isSuccess = false;
					break;
				}


			}
		} else if (valueTrim) { //非必填字段

		}
	}
	param.errorMsg = message;
	param.verfyStatus = isSuccess;
	return param;
}
/*
 * @fn 显示弹窗确认订单
 * */
function showConfirmOrderInfo(params) {
	var username = params.userName;
	var sex = params.sex;
	var sexName = sex == 1 ? '男' : '女';
	var phoneNo = params.phoneNo;
	var cardNo = params.cardNo;
	var cardType = params.cardType; //证件类型
	$('#pop_username').html(username);
	$('#pop_usersex').html(sexName);
	$('#pop_usercardno').html(cardNo);
	$('#pop_usertel').html(phoneNo);
	if (cardType == 1) {
		$('#pop_usercardname').html('身份证号');
	} else if (cardType == 2) {
		$('#pop_usercardname').html('台胞证号');
	} else if (cardType == 3) {
		$('#pop_usercardname').html('护照号');
	} else if (cardType == 4) {
		$('#pop_usercardname').html('军官证号');
	}
	$(".div_title_already").hide();
	$(".pop_prompt_body").show();
	$(".mask").show();
	$(".pop_prompt_title").show();
	$("#zc_pop_prompt").show();
}
/*
 * @确认订单
 * */
function confirmPopOrderInfo() {
	$(".purchase_submit").hide();
	$("#div_loading").show();

	var url = 'order.do';
	var params = getOrderParams();
	concelPopOrderInfo(); //取消弹窗
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
		$(".purchase_submit").show();
		$("#div_loading").hide();
	}, function() {
		$("").hide();
		$("#div_loading").show();
		showRequestMessage('notice', '请检查您的网络!');
	}, 'POST');
}
/*
 * @取消订单
 * */
function concelPopOrderInfo() {
	$(".mask").hide();
	$("#zc_pop_prompt").hide();
}