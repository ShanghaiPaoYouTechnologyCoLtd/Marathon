<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%@ include file="../../master/systemHeader.jsp"%>

<link rel="stylesheet" href="css/layui.css" media="all">
<div style="margin: 20px;">
	<div class="orderTable">

		<form class="layui-form layui-form-pane" action="">
			姓名：
			<div class="layui-inline">
				<input class="layui-input" name="name" id="name" autocomplete="off">
			</div>
			电话：
			<div class="layui-inline">
				<input class="layui-input" name="phone" id="phone"
					autocomplete="off">
			</div>
			证件号：
			<div class="layui-inline" style="margin-right:100px;">
				<input class="layui-input" name="card" id="card" autocomplete="off"
					style="width:150%;" />
			</div>

			<div class="layui-inline" style="">
				<div class="layui-input-block" style="margin-left:20px !important;">
					<select name="status" id="status">
						<option value="-1">领取状态</option>
						<option value="1">已领取</option>
						<option value="0">未领取</option>
					</select>
				</div>
			</div>

			<div class="layui-inline">
				<div class="layui-input-block">
					<select name="coname" id="coname">
						<option value="-1">合作方/赛事</option>
					</select>
				</div>
			</div>

			<button class="layui-btn" data-type="reload" type="button"
				style="margin-left:20px;">搜索</button>
			<button class="layui-btn" id="btnAdd" type="button"
				style="margin-left:10px;">添加</button>
		</form>
	</div>
	<table class="layui-hide" id="LAY_table_user" lay-filter="user"
		style="height: 550px;"></table>
</div>

<script src="js/layui.js" charset="utf-8"></script>
<script>
	getRaces();

	$(document).ready(function() {

		$("#btnAdd").click(function() {
			window.location.href = "system/passport/unreceive/UnreceiveUpload.jsp";
		});

		layui.use('form', function() {});

		var tbHeight = $(".page-content").height() - 200;

		layui.use('table', function() {
			var table = layui.table;

			//方法级渲染
			table.render({
				elem : '#LAY_table_user',
				url : 'back/unreceivelist.do',
				height : 'full-550',
				cols : [ [ {
					field : 'USER_NAME',
					width : 160,
					title : '姓名',
					align : 'center'
				}, {
					field : 'PHONE_NO',
					width : 220,
					title : '手机号',
					align : 'center'
				}, {
					field : 'CARD_NO',
					width : 270,
					title : '证件号',
					align : 'center'
				}, {
					field : 'RaceName',
					width : 250,
					title : '购买赛事',
					align : 'center'
				}, {
					field : 'PAY_TIME',
					width : 200,
					title : '购买时间',
					align : 'center',
					templet : function(d) {
						var obj = d.PAY_TIME;
						var time = "";
						if (obj == null)
							return "";
						time += obj.year + 1900 + "-";
						time += obj.month + 1 + "-";
						time += obj.date + " ";
						time += obj.hours + ":";
						time += obj.minutes + ":";
						time += obj.seconds;
						return time;
					}
				}, {
					field : 'isreceive',
					width : 100,
					title : '领取状态',
					align : 'center',
					templet : function(d) {
						if (d.isreceive == 0)
							return '<p style="background-color:#FF5722;color:#fff">未领取</p>';
						else
							return '<p style="background-color:#009688;color:#fff">已领取</p>';
					}
				}, {
					field : 'messagesendcount',
					width : 100,
					title : '短信发送',
					align : 'center',
					templet : function(d) {
						return d.messagesendcount + "次";
					}
				}, {
					field : 'id',
					width : 350,
					title : '操作',
					align : 'center',
					templet : function(d) {
						var html = '<a class="layui-btn layui-btn-xs" lay-event="edit" style="width:80px" onclick="javascript:sendMsg(this,' + d.oid + ',' + d.id + ')">发送短信</a>' +
							'<a class="layui-btn '+(d.isreceive == 0 ?  "":"layui-btn-danger")+' layui-btn-xs" lay-event="del" style="width:140px" data-tag="' + d.isreceive + '" onclick="javascript:tagReceive(this,' + (d.id) + ')">标记为' + (d.isreceive == 0 ? "已领取" : "未领取") + '</a>';
						return html;
					}
				}
				]
				],
				id : 'testReload',
				page : true,
				height : tbHeight,
				limit : 20
			});

			var $ = layui.$,
				active = {
					reload : function() {
						var demoReload = $('#demoReload');

						//执行重载
						table.reload('testReload', {
							page : {
								curr : 1 //重新从第 1 页开始
							},
							where : {
								card : $("#card").val(),
								name : $("#name").val(),
								phone : $("#phone").val(),
								status : $("#status").val(),
								coname : $("#coname").val()
							}
						});
					}
				};

			$('.orderTable .layui-btn').on('click', function() {
				var type = $(this).data('type');
				active[type] ? active[type].call(this) : '';
			});
		});
	});
	function tagReceive(ele, id) {
		var url = "back/tagUnreceive.do";
		var tag = $(ele).data("tag");
		tag = tag == 0 ? 1 : 0;
		var params = {
			"id" : id,
			"tag" : tag
		};
		async(url, params, function(res) {
			if (res.status >= 1) {
				showRequestMessage('success', "修改成功！");
				$(ele).html("标记为" + (tag == 0 ? "已领取" : "未领取"));
				$(ele).parents("tr").find("[data-field='isreceive'] div").html(tag == 0 ? "未领取" : "已领取");
				$(ele).attr("data-tag", tag);
			} else {
				showRequestMessage('error', "上传失敗！");
			}
		}, function() {
			showRequestMessage('error', "网络错误！");
		}, 'POST');
	}

	function getRaces() {
		var params = {
			"currentID" : -1,
			"isAll" : 1
		};
		async("getAllRaces.do", params, function(res) {
			if (typeof res == "string") {
				res = JSON.parse(res);
			}
			for (var i in res) {
				$("#coname").append('<option value="' + res[i].ID + '">' + res[i].RaceName + '</option>')
			}
		}, function() {}, 'POST');
	}

	function sendMsg(ele, oid, uid) {
		var url = "msg/sendUnreceiveMsg.do";
		var params = {
			"oid" : oid,
			"uid" : uid
		};
		async(url, params, function(res) {
			if (res.result.toLowerCase() == "ok") {
				showRequestMessage('success', "发送成功！");
				var cCount = $(ele).parents("tr").find("[data-field='messagesendcount'] div").html().replace("次", "");
				$(ele).parents("tr").find("[data-field='messagesendcount'] div").html(++cCount + "次");
			} else {
				showRequestMessage('error', "发送失败！" + res.result);
			}
		}, function() {0
		
		
			showRequestMessage('error', "网络错误！");
		}, 'POST');
	}
</script>

<%@ include file="../../master/systemFooter.jsp"%>