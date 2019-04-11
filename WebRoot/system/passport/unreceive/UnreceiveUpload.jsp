<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../../master/systemHeader.jsp"%>
<form class="form-search">
	证件号：<input type="text" placeholder="请输入证件号" id="cardno" />
	<button class="btn" type="button" id="btnQuery">查询</button>
	<button type="button" class="btn" disabled id="btnUp">上传</button>
	<button type="button" class="btn" id="btnBack">返回列表</button>
	<table class="table table-bordered"
		style="width:340px !important; margin:10px 0px 0px 51px;">
		<tr>
			<td style="width:35%">姓名：</td>
			<td id="td_name"></td>
		</tr>
		<tr>
			<td>手机号：</td>
			<td id="td_phone"></td>
		</tr>
		<tr>
			<td>证件号：</td>
			<td id="td_card"></td>
		</tr>
		<tr>
			<td>购买赛事：</td>
			<td id="td_race"></td>
		</tr>
		<tr>
			<td>购买时间：</td>
			<td id="td_date"></td>
		</tr>
		<tr>
			<td>状态：</td>
			<td id="td_status"></td>
		</tr>
		<tr>
			<td>短信通知：</td>
			<td id="td_message"></td>
		</tr>
		<tr>
			<td>是否领取：</td>
			<td id="td_isr"></td>
		</tr>
	</table>
</form>
<form class="form-search">
	批　量：
	<input type="file" />
	<button type="button" class="btn" disabled id="btnUp">上传</button>
	<button type="button" class="btn" id="btnBack">下载模板</button>
</form>
<script>
	var currentID = -1;
	var uoloading = false;

	$("#btnBack").click(function() {
		window.location.href = "system/passport/unreceive/UnreceiveList.jsp";
	});

	$("#btnUp").click(function() {
		if (uoloading)
			return;

		if (currentID == -1 || currentID == null) {
			showRequestMessage('warning', "请先查询啊哥");
			return;
		}

		uoloading = true;
		var url = "back/unreceiveUpload.do"
		var params = {
			"oid" : currentID
		};
		async(url, params, function(res) {
			if (res.status == 1) {
				showRequestMessage('success', "上传成功！");
				$("#td_status").html("已上传");
				$("#td_message").html("1次");
				currentID = "-1";
				$("#btnUp").attr("disabled", "");
				$("#btnUp").val("已上传");

			} else {
				showRequestMessage('error', "上传失败！");
			}

			uoloading = false;
		}, function() {
			uoloading = false;
			showRequestMessage('error', "网络异常上传失败！");
		}, 'POST');
	});

	$("#btnQuery").click(function() {
		if ($("#cardno").val() == null || $("#cardno").val().trim().length == 0) {
			showRequestMessage('notice', "证件号不给我吗");
			return;
		}
		var url = "back/unreceiveQuery.do";
		var params = {
			"cardno" : $("#cardno").val().trim()
		};
		async(url, params, function(res) {
			currentID = -1;
			$("#btnUp").attr("disabled", "");
			if (typeof res == 'string') {
				res = JSON.parse(res);
			}
			if (res == null || res.length == 0) {
				showRequestMessage('error', "这个人没有购买呢");
				return;
			}
			$("#td_name").html(res[0].USER_NAME);
			$("#td_phone").html(res[0].PHONE_NO);
			$("#td_card").html(res[0].CARD_NO);
			$("#td_race").html(res[0].RACE);
			$("#td_date").html(getTime(res[0].PAY_TIME));
			$("#td_status").html(res[0].STATUS > 0 ? "已上传" : "未上传");
			$("#td_message").html((res[0].MSG == null ? 0 : res[0].MSG) + "次");
			$("#td_isr").html(res[0].ISRECEIVE == null || res[0].ISRECEIVE == 0 ? "未领取" : "已领取");
			currentID = res[0].ID;
			if (res[0].STATUS <= 0) {
				$("#btnUp").val("已上传");
			} else {
				$("#btnUp").val("上传");
			}
			if (currentID != null && currentID != -1 && res[0].STATUS <= 0) {
				$("#btnUp").removeAttr("disabled");
			}
		}, function() {
			showRequestMessage('error', "网络异常");
		}, 'POST');
	});

	function getTime(obj) {
		var time = "";
		time += obj.year + 1900 + "-";
		time += obj.month + 1 + "-";
		time += obj.date + " ";
		time += obj.hours + ":";
		time += obj.minutes + ":";
		time += obj.seconds;
		return time;
	}
</script>
<%@ include file="../../master/systemFooter.jsp"%>