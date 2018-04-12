/**
 * 2018-03-09 by zhangchuang
 */
var requesturls = [];
var requesttimes = []; 
var canRequest = true; 
var canRequestCache={};//是否可以请求缓存列表
function async(url, params, success, fail, method, hide) {
	var requestrecord = url;
	if (params) {
		for ( var i in params)
			requestrecord += params[i];
	}
	url.indexOf();
	for (var i = requesturls.length - 1; i >= 0; i--) {
		var u = requesturls[i];
		if (u == requestrecord) {
			var now = new Date().getTime();
			if ((now - requesttimes[i]) < 600) { 
				return;
			}
			break;
		}
	} 
	requesttimes.push(new Date().getTime());
	requesturls.push(requestrecord);
	if (requesturls.length > 300) {
		requesturls.shift();
		requesttimes.shift();
	} 
	var begin = new Date().getTime();
	method = method ? method : "GET";
	if (!hide){
		showLoading();	
	}
	var userCanRequest=canRequestAgain(url);//判断是否可以再次请求
	if(!userCanRequest){
		return false;
	}
	$.ajax({url : url,data : params,cache : false,async : true,type : method,timeout : 30000,
		success : function(rs) {
			setCanRequestAgain(url,true);
			$("#request-time-record").hide();
			var code = rs.code;
			if(typeof success=='function'){
				success(rs);
			}
		},
		error : function() {
			setCanRequestAgain(url,true);
			$("#request-time-record").hide();
			if(typeof fail=="function"){
				fail();
			}
		}
	});
}
/*
 * @无重复限制请求
 * */
function async2(url, params, success, fail, method) {
	method = method ? method : "GET";
	$.ajax({url : url,data : params,cache : false,async : true,type : method,timeout : 30000,
		success : function(rs) {
			var code = rs.code;
		    if(typeof success=='function'){
		    	success(rs);
		    }
		},
		error : function() {
			if(typeof fail=="function"){
				fail();
			}
		}
	});
}
/*
 * @fn 判断是否可以再次请求
 * */
function canRequestAgain(tp){
	var time=new Date().getTime();
	var last=0;
	last=canRequestCache["canRequest_"+tp];
	var canRequest=canRequestCache["canRequestStatus_"+tp];
	canRequest=typeof canRequest=="boolean"?canRequest:true;
	last=last?last:0;
	if((time-last)>600){//可以请求
		if(canRequest){
			canRequestCache["canRequestStatus_"+tp]=false;
			canRequestCache["canRequest_"+tp]=time;
			return true;
		}else{
			window.top.showRequestMessage('notice',"请不要频繁操作");
			return false
		}
	}else{
		window.top.showRequestMessage('notice',"请不要频繁操作");
		return false
	}
	return false;
}
/*
 * @fn 判断是否可以再次请求
 * */
function setCanRequestAgain(tp,status){
	status=status?status:false;
	canRequestCache["canRequestStatus_"+tp]=status;
}
function sync(url, params, success, fail, method) {
	if (!canRequest)
		return; 
	method = method ? method : "GET";
	$.ajax({url : url,data : params,cache : false,async : false,type : method,
		success : function(rs) {
			var code = rs.code;
			if (code != undefined&& ("-103" == code || "E000000000" == code|| "E000000002" == code|| "E000000003" == code || "E000000004" == code)) {
				if (window.location.href.indexOf("loggin.jsp") == -1) {
					//showAuthFail();
					//canRequest = false;
				}
			} else {
				success(rs);
			}
		 },
	     error : fail
	});
}

/**
 * 请求消息提示框
 * 
 * @param status   状态 (成功 - success, 失败 - error, 提示 - notice, 警告 - warning)
 * @param content  提示内容
 */
function showRequestMessage(status, content, positions) {
	var p = "";
	if (status == null || content == null) {
		return false;
	} else {
		if (positions == undefined) {
			p = "middle-center";
		} else {
			p = positions;
		}
		$().toastmessage('showToast', {
			text : content,
			sticky : false,
			position : "middle-center",
			type : status,
			closeText : '',
			close : null
		});
	}
}
function showLoading() {
	//$("#request-time-record").show().html("<img src='images/loading.gif' width='20px' />");
}
