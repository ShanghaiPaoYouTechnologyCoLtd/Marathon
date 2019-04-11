/**
 * 
 */
var compatibleUrls = [ [ "pages/runnerList.jsp", "mobile/tlist/tlist.jsp" ], [ "passport/marathonPassport.jsp", "mobile/passport/passportOrder.jsp" ], [ "passport/marathonPassport_third.jsp", "mobile/passport/passportOrder.jsp" ] ];

function userAgent() {
	var sUserAgent = navigator.userAgent.toLowerCase();

	var o = {};
	o.isIpad = /ipad/i.test(sUserAgent);
	o.isIpod = /ipod/i.test(sUserAgent);
	o.isIphone = /iphone os/i.test(sUserAgent);
	o.isUc7 = /rv:1.2.3.4/i.test(sUserAgent);
	o.isUc = /ucweb/i.test(sUserAgent);
	o.isAndroid = /android/i.test(sUserAgent);
	o.isWM = /windows mobile/i.test(sUserAgent);

	o.isPhone = o.isIphone || o.isAndroid || o.isWM || o.isUc7 || o.isUc;
	o.isMobile = o.isIpad || o.isPhone || o.isAndroid;
	o.isPc = !o.isMobile;
	o.isIOS = o.isIpad || o.isIphone || o.isIpod;

	return o;
}

function isCompatible() {
	var url = location.href;
	for (var i in compatibleUrls) {
		if (url.indexOf(compatibleUrls[i][0]) >= 0 || url.indexOf(compatibleUrls[i][1]) >= 0) {
			return i; //存在兼容性选择
		}
	}
	return false;
}

function getPar() {
	try {
		var local_url = document.location.href;
		//获取要取得的get参数位置
		var get = local_url.indexOf("?");
		if (get == -1) {
			return "";
		}

		var get_par = local_url.slice(get);
		return get_par;
	} catch (ex) {
		return "";
	}
}

function transfrom() {
	var i = isCompatible();
	if (!i)
		return;

	var uagent = userAgent();
	if (uagent.isIOS || uagent.isAndroid) {
		//移动端访问
		if(location.href.indexOf(compatibleUrls[i][1])>=0){
			//已经是访问移动端网站，无需操作
		}else{
			location.href=compatibleUrls[i][1]+getPar();
		}
	} else {
		//PC端访问
		if(location.href.indexOf(compatibleUrls[i][0])>=0){
			//已经是访问PC端网站，无需操作
		}else{
			location.href=compatibleUrls[i][0]+getPar();
		}
	}
}

transfrom();