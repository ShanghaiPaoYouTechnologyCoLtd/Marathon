var buyEnable = true; //是否允许购买 
var rID = ""; //比赛ID -1为无传入，为跑友官网购买
var defaultCoName = "4";
var test = "";
var isWechartOpen = false;

window.onload = function() {
	isWechartOpen = isWeiXin();
	if (isWechartOpen) {
		$("#rab_wechat").prop("checked", true)
		$("#lbl_alipay").remove();
	}

	test = getPar("pytest");
	if (test != null && test.length > 0 && test == "1") {
		$("#testTitle").show();
		testF();
		$(".td_title").html("*本页面为测试页面，仅供跑友（上海）体育发展内部使用。<br/>*所有订单无效且不具备法律效应，请悉知。<br/>*若您希望返回正常页面进行购买，请点击左侧菜单。");
	}
};

function testF() {
	$("#txt_uname").val("跑友测试数据" + Math.ceil(Math.random() * 10000));
	$("#txt_cardno").val("520203199404140000");
	$("#txt_phone").val("18040500000");
}

$("#btn_buy").click(function() {
	if (!buyEnable)
		return;

	if (!getOrderParams())
		return;

	$("#div_infoCheck").modal("toggle");
});

var params;
function confirmPopOrderInfo() {
	if (!buyEnable)
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
					if (isWechartOpen) {
						var returnUrlPara = "payfee%3D" + data.payFee + "%26title%3D" + data.title + "%26tradeno%3D" + data.serialNum + "%26tradetype%3D" + 1;
						location.href = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxd7036ba1c611afa6&redirect_uri=http%3A%2F%2Fwww.chinesemarathonleague.com%2Fpassport%2FmarathonPassport_wechat.jsp%3F" + returnUrlPara + "&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect";
					} else {
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
				}
			} else {
				var message = result.message;
				message = message ? message : '订单提交失败!';
				showRequestMessage('notice', message);
			}
		} else {
			var message = result.message;
			if (message == "您已报名,请勿重复提交!") {
				showRequestMessage('notice', message);
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

function getCoName() {
	if ($("#sel_race").length > 0)
		return $("#sel_race").val() == null ? defaultCoName : $("#sel_race").val();
	else
		return defaultCoName;
}

function getOrderParams() {
	var userName = $("#txt_uname").val();
	var sex = $("#rab_male").is(":checked") ? 1 : 2;
	var cardType = $("#sel_cardtype").val();
	var cardNo = $("#txt_cardno").val();
	var phoneNo = $("#txt_phone").val();
	var coName = getCoName();
	var province = $("#sel_prov").val();
	var city = $("#sel_city").val();
	var district = $("#sel_dist").val();
	var address = $("#txt_address").val();
	var purcahseType = "";
	var payTtpe = isWechartOpen ? 2 : ($("#rab_zfb").is(":checked") ? 1 : 2);
	var ispack = $("#rad-pack-1").is(":checked") ? 0 : 1;
	var isvip = $("#inp-ckb-pas").is(":checked") ? 0 : 1;

	var telReg = /^(([0\+]\d{2,3}-)?(0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/;
	var cardNumReg = /(^\d{15}$)|(^\d{17}([0-9]|X|x)$)/;
	var mobileReg = /^\d{7,11}$/;

	if (!$("#inp-ckb-pas").is(":checked") && !$("#inp-ckb-vip").is(":checked")) {
		showRequestMessage('notice', "请选择购买方式！");
		$("#div-buytype label").addClass("font-blink");
		setTimeout(function() {
			$("#div-buytype label").removeClass("font-blink");
		}, 2500);
		return false;
	}

	if (coName == -1) {
		showRequestMessage('notice', "请选择赛事！");
		//showRequestMessage('notice', "未找到您对应的赛事，请返回您跳转前的马拉松网站重新操作，或联系工作人员！");
		return false;
	}

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

	if (!genNewElecPassport(userName, sex - 1, cardNo, cardType, phoneNo)) {
		return false;
	}

	var test = getPar("pytest");

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
		city : city,
		test : test,
		commonpay : isWechartOpen ? 1 : 0,
		pack : ispack,
		isvip:isvip
	};
	var cardTypes = new Array("身份证", "护照", "港澳通行证");
	$("#sp_info_name").html(userName);
	$("#sp_info_sex").html(sex == 1 ? "男" : "女");
	$("#sp_info_cardtype").html(cardTypes[cardType - 1]);
	$("#sp_info_cardno").html(cardNo);
	$("#sp_info_phone").html(phoneNo);
	$("#sp_info_address").html(province + " " + city + " " + district + "<br/>" + address);
	/*	if (coName == defaultCoName) {
			$("#sp_info_address").html(province + " " + city + " " + district + "<br/>" + address);
		} else {
			$("#sp_info_address").html("<span style='font-size:18px;color:black'>" + $("#sel_race").find("option:selected").text() + "</span><br/><span class='td_title'>*请检查赛事是否选择正确</span>");
		}*/
	$("#sp_info_paytype").html(payTtpe == 1 ? "支付宝支付" : "微信支付");
	return true;
}

//在新APP数据库生成电子护照
function genNewElecPassport(uname, usex, uid, uidt, umobile) {
	var api = 'http://run.geexek.com/geeRunner/webapi/createPassport';
	var para = {
		'name' : uname,
		'sex' : usex,
		'idCardType' : uidt,
		'idCard' : uid,
		'mobile' : umobile,
		'dataFrom' : '2'
	};
	var status = 0;

	$.ajax({
		url : api,
		async : false,
		data : para,
		type : 'post',
		dataType : 'json',
		success : function(r) {
			status = r.status;
			if (r.status == 0 && r.message.indexOf("证件号已存在") < 0) {
				alert(r.message);
			} else {
				status = 1;
			}
		},
		error : function() {
			alert("网络错误！");
		}
	});

	return status == 1;
}

//上传新的护照编号
function updateNewPno(co, no) {
	var api = "back/uploadNPNO.do";
	var para = {
		'cno' : co,
		'pno' : no
	};
	$.ajax({
		url : api,
		async : false,
		data : para,
		type : 'post',
		dataType : 'json',
		success : function(r) {
			if (r == 0) {

			}
		},
		error : function() {}
	});
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

//判断是否为微信
function isWeiXin() {
	//window.navigator.userAgent属性包含了浏览器类型、版本、操作系统类型、浏览器引擎类型等信息，这个属性可以用来判断浏览器类型
	var ua = window.navigator.userAgent.toLowerCase();
	//通过正则表达式匹配ua中是否含有MicroMessenger字符串
	if (ua.match(/MicroMessenger/i) == 'micromessenger') {
		return true;
	} else {
		return false;
	}
}