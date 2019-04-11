/**
 *  通过证件号获取年龄
 */
function getAgeByID(identityCard) {
	var len = (identityCard + "").length;
	if (len == 0) {
		return 0;
	} else {
		if ((len != 15) && (len != 18)) //身份证号码只能为15位或18位其它不合法
		{
			return 0;
		}
	}
	var strBirthday = "";
	if (len == 18) //处理18位的身份证号码从号码中得到生日和性别代码
	{
		strBirthday = identityCard.substr(6, 4) + "/" + identityCard.substr(10, 2) + "/" + identityCard.substr(12, 2);
	}
	if (len == 15) {
		strBirthday = "19" + identityCard.substr(6, 2) + "/" + identityCard.substr(8, 2) + "/" + identityCard.substr(10, 2);
	}
	//时间字符串里，必须是“/”
	var birthDate = new Date(strBirthday);
	var nowDateTime = new Date();
	var age = nowDateTime.getFullYear() - birthDate.getFullYear();
	//再考虑月、天的因素;.getMonth()获取的是从0开始的，这里进行比较，不需要加1
	if (nowDateTime.getMonth() < birthDate.getMonth() || (nowDateTime.getMonth() == birthDate.getMonth() && nowDateTime.getDate() < birthDate.getDate())) {
		age--;
	}
	return age;
}

function GetQueryString(name) {
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
	var r = window.location.search.substr(1).match(reg);
	if (r != null) return unescape(r[2]);
	return null;
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
	return decodeURI(get_par);
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

//日期转字符串
function dateToStr(date, spl) {
	if (spl == null || spl.length == 0 || !isNaN(spl)) {
		spl = "/";
	}
	return (date.year + 1900) + spl + (date.month + 1) + spl + date.date;//+ " " + date.hours + "：" + date.minutes
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

/**
 * 通过证件号识别省份
 */
function getProvinceByID(idcard) {
	var code = idcard.substring(0, 2);
	return chinaIDNums[code];
}

/**
 * 发送post请求
 */
function postIn(URL, PARAMS) {
	var temp = document.createElement("form");
	temp.action = URL;
	temp.method = "post";
	temp.style.display = "none";
	for (var x in PARAMS) {
		var opt = document.createElement("textarea");
		opt.name = x;
		opt.value = PARAMS[x];
		// alert(opt.name)        
		temp.appendChild(opt);
	}
	document.body.appendChild(temp);
	temp.submit();
	return temp;
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

var chinaIDNums = {
	11 : "北京市",
	12 : "天津市",
	13 : "河北省",
	14 : "山西省",
	15 : "内蒙古自治区",
	21 : "辽宁省",
	22 : "吉林省",
	23 : "黑龙江省",
	31 : "上海市",
	32 : "江苏省",
	33 : "浙江省",
	34 : "安徽省",
	35 : "福建省",
	36 : "江西省",
	37 : "山东省",
	41 : "河南省",
	42 : "湖北省",
	43 : "湖南省",
	44 : "广东省",
	45 : "广西壮族自治区",
	46 : "海南省",
	50 : "重庆市",
	51 : "四川省",
	52 : "贵州省",
	53 : "云南省",
	54 : "西藏自治区",
	61 : "陕西省",
	62 : "甘肃省",
	63 : "青海省",
	64 : "宁夏回族自治区",
	65 : "新疆维吾尔自治区",
	71 : "台湾省",
	81 : "香港特别行政区",
	82 : "澳门特别行政区"
};

function inputAlert(ele) {
	$("body").animate({
		scrollTop : $(ele).offset().top - 60
	}, 500);

	$(ele).focus();
	$(ele).addClass("arrow_box");
	setTimeout(function() {
		$(ele).removeClass("arrow_box");
	}, 5000);
}