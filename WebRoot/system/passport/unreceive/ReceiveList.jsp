<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%@ include file="../../master/systemHeader.jsp"%>

<link rel="stylesheet" href="css/layui.css" media="all">
<style>
.inline-div {
	width: 12%;
	float: left;
	margin-right: 1%;
}

.inline-div2 {
	width: 12%;
	float: left;
	margin-right: 1%;
}

.inline-div3 {
	width: 35%;
	float: left;
	min-witth: 470px;
}

.inline-div label {
	width: 40px;
	display: unset !important;
}

.inline-div input[type=text] {
	width: calc(100% - 60px);
	height: 15px;
	margin-bottom: 0px;
}

.layui-select-title {
	padding-top: 0px !important;
}

.layui-table-view {
	clear: both;
}

.modal.fade.in {
	top: 30% !important;
}

.modal-body p input, .modal-body p select {
	margin-bottom: 0px !important;
}

.modal-body span {
	font-size: 12px;
	color: blue;
	cursor: pointer;
}

.modal-body span:hover {
	text-decoration: underline;
}

.modal-body p {
	height: 40px;
}
</style>
<div style="margin: 20px;">
	<div class="orderTable">

		<form class="layui-form layui-form-pane" action="">
			<div class="inline-div">
				<label>姓名：</label><input name="name" id="name" autocomplete="off"
					type="text" />
			</div>
			<div class="inline-div">
				<label>电话：</label><input name="phone" id="phone" autocomplete="off"
					type="text" />
			</div>
			<div class="inline-div">
				<label>证件：</label><input name="card" id="card" autocomplete="off"
					type="text" />
			</div>

			<div class="inline-div2">
				<div class="layui-input-block">
					<select name="status" id="status">
						<option value="-1">发货状态</option>
						<option value="2">已发货</option>
						<option value="1">未发货</option>
					</select>
				</div>
			</div>

			<div class="inline-div2">
				<div class="layui-input-block">
					<select name="coname" id="coname">
						<option value="-1">合作方/赛事</option>
					</select>
				</div>
			</div>

			<div class="inline-div3">
				<button class="layui-btn" data-type="reload" type="button"
					style="margin-left:20px;">搜索</button>
				<button class="layui-btn" id="btnAdd" type="button"
					style="margin-left:10px;">导出完整数据</button>
				<button class="layui-btn" id="btnAdd" type="button"
					style="margin-left:10px;">导出圆通模板</button>
				<button class="layui-btn" id="btnAdd" type="button"
					style="margin-left:10px;">导入圆通单号</button>
			</div>
		</form>
	</div>
	<table class="layui-hide" id="LAY_table_user" lay-filter="user"
		style="height: 550px; clear:both;"></table>
</div>
<div class="modal fade" id="modal-expressInfo" tabindex="-1"
	style="width:400px;" role="dialog" aria-labelledby="myModalLabel"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">物流信息</h4>
			</div>
			<div class="modal-body">
				<p>
					物流单号：<input type="text" id="txt-express" class="form-control" />&nbsp;&nbsp;<span
						onclick="javascript:queryExpress()">查询进度</span>
				</p>
				<p>
					物流公司：<select id="sel-express" class="form-control"><option
							value="yuantong">圆通快递</option>
						<option value="shunfeng">顺丰速递</option>
						<option value="shentong">申通快递</option></select>
				</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary"
					onclick="saveExpressInfo()">保存</button>
			</div>
		</div>
	</div>
</div>

<script src="js/layui.js" charset="utf-8"></script>
<script src="js/commonTools.js" charset="utf-8"></script>
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
				url : 'back/receiveList.do',
				height : 'full-550',
				cols : [ [ {
					field : 'USER_NAME',
					width : '7%',
					title : '姓名',
					align : 'center'
				}, {
					field : 'sex',
					width : '5%',
					title : '性别',
					align : 'center'
				}, {
					field : 'Phone_no',
					width : '8%',
					title : '护照预留电话',
					align : 'center'
				}, {
					field : 'phone2',
					width : '8%',
					title : '补领预留电话',
					align : 'center'
				}, {
					field : 'CARD_NO',
					width : '12%',
					title : '证件号',
					align : 'center'
				}, {
					field : 'Status',
					width : '7%',
					title : '发货状态',
					align : 'center',
					templet : function(d) {
						if (d.Status == 1)
							return "未发货";
						else
							return "已发货";
					}
				}, {
					field : 'rname',
					width : '10%',
					title : '赛事名称',
					align : 'center',
				}, {
					field : 'province',
					width : '6%',
					title : '省份',
					align : 'center',
				}, {
					field : 'city',
					width : '6%',
					title : '城市',
					align : 'center',
				}, {
					field : 'district',
					width : '6%',
					title : '地区',
					align : 'center',
				}, {
					field : 'address',
					width : '15%',
					title : '详细地址',
					align : 'center',
				}, {
					field : 'id',
					width : '9%',
					title : '操作',
					align : 'center',
					templet : function(d) {
						if (d.ExpressNo == null || d.ExpressNo.length == 0)
							return '<a class="layui-btn layui-btn-xs" lay-event="edit" style="width:80%" onclick="javascript:expressInfo(' + d.id + ')">登记快递信息</a>';
						else
							return '<a class="layui-btn layui-btn-danger" lay-event="edit" style="width:80%" onclick="javascript:expressInfo(' + d.id + ')">查看快递信息</a>';
					}
				}
				]
				],
				id : 'testReload',
				page : true,
				height : tbHeight,
				limit : 15
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
								card : $("#card").val().trim(),
								name : $("#name").val().trim(),
								phone : $("#phone").val().trim(),
								status : $("#status").val().trim(),
								coname : $("#coname").val().trim()
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
			layui.form.render("select");
		}, function() {}, 'POST');
	}

	function expressInfo(rid) {
		$("#txt-express").val("");
		$("#sel-express").val(0);

		dataid = rid;

		var params = {
			"id" : rid
		};

		async("back/getReceiveExpress.do", params, function(res) {
			if (res != null && res.length > 0 && res[0].ExpressNo != null && res[0].ExpressNo.length > 0) {
				$("#txt-express").val(res[0].ExpressNo);
				$("#sel-express").val(res[0].ExpressCo);

				curExpressNo = res[0].ExpressNo;
				curExpressCo = res[0].ExpressCo;
			}
			$("#modal-expressInfo").modal("show");
		}, function() {
			addTopMessage("网络错误", "error");
		}, 'POST');
	}

	function queryExpress() {
		window.open("https://www.kuaidi100.com/chaxun?com=" + $("#sel-express").val() + "&nu=" + $("#txt-express").val());
	}

	var curExpressNo = "";
	var curExpressCo = "";
	var dataid = "";

	function saveExpressInfo() {
		if ($("#sel-express").val() != curExpressCo || $("#txt-express").val() != curExpressNo) {
			curExpressNo = $("#txt-express").val();
			curExpressCo = $("#sel-express").val();

			var params = {
				"no" : curExpressNo,
				"co" : curExpressCo,
				"id" : dataid
			};

			async("back/saveExpress.do", params, function(res) {
				if (res == "1") {
					addTopMessage("保存成功", "done");
					$("#modal-expressInfo").modal("hide");
				} else {
					addTopMessage("保存失败", "error");
				}
			}, function() {
				addTopMessage("网络错误", "error");
			}, 'POST');
		} else {
			$("#modal-expressInfo").modal("hide");
		}
	}
</script>

<%@ include file="../../master/systemFooter.jsp"%>