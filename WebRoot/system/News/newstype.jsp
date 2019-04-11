<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%@ include file="../master/systemHeader.jsp"%>
<link href="js/bootstrap/bootstrapswitch/bootstrap-switch.min.css"
	rel="stylesheet" type="text/css" />
<script src="js/bootstrap/bootstrapswitch/bootstrap-switch.min.js"></script>
<style>
.div_block {
	border: 1px solid #D3D3D3;
	height: 300PX;
	padding-top: 10px;
}

.div-ul {
	width: 20%;
	min-width: 120px;
	float: left;
	cursor: pointer;
	position: relative;
	margin-left: 25px;
}

.p-title {
	width: 100;
	text-indent: 25px;
}

.loading {
	position: absolute;
	left: calc(50% - 12px);
	top: calc(50% - 32px);
	z-index: 999;
	top: calc(50% - 32px);
	display: none;
}

#btn-createtype, #btn-createstype {
	margin-bottom: 10px;
}

.modal, .modal input {
	-moz-user-select: none; /*火狐*/
	-webkit-user-select: none; /*webkit浏览器*/
	-ms-user-select: none; /*IE10*/
	-khtml-user-select: none; /*早期浏览器*/
	user-select: none;
}

.modal-body table {
	font-size: 14px;
	width: 100%;
}

.modal-body tr {
	height: 45px;
	line-height: 40px;
}

.modal-body table td {
	border: none !important;
	border-top: 1px solid #dddddd !important;
	padding-top: 7px;
}

.modal-body table tr td:first-child {
	text-align: right;
	width: 25%;
}

.modal-body table tr:last-child {
	text-align: right;
	width: 25%;
	border-bottom: 1px solid #dddddd !important;
}
</style>

<div class="div_block">
	<p class="p-title">单击选中，双击编辑</p>
	<div class="div-ul-left div-ul">
		<button class="btn btn-primary" id="btn-createtype">新增主栏目</button>
		<img src="images/loading.gif" class="loading" />
		<ul class="list-group" id="ul-types">
		</ul>
	</div>
	<div class="div-ul-right div-ul">
		<button class="btn btn-primary" id="btn-createstype">新增二级栏目</button>
		<img src="images/loading.gif" class="loading" />
		<ul class="list-group" id="ul-secondtypes">
		</ul>
	</div>
</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="div-editor" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="div-editor-title">新增主栏目</h4>
			</div>
			<div class="modal-body">
				<input type="hidden" id="hid-cid" value="" />
				<table>
					<tr>
						<td>栏目标题：</td>
						<td><input type="text" class="form-control" id="inp-title"
							placeholder="请输入标题"></td>
					</tr>
					<tr>
						<td>排序号：</td>
						<td><input type="number" min="0" max="100"
							class="form-control" id="inp-sort" style="float:left;"><span
							class="sp-title">*0~100</span></td>
					</tr>
					<tr>
						<td>启用状态：</td>
						<td><input type="checkbox" checked id="ckb-status" /></td>
					</tr>
					<tr id="tr-sel-mtype">
						<td>上级栏目：</td>
						<td><select class="form-control" id="sel-maintype"
							style="float:left;">

						</select></td>
					</tr>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-danger" onclick="deleteType()"
					id="btn-delete">删除</button>
				<button type="button" class="btn btn-primary" onclick="saveChange()">提交更改</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
</div>
<!-- /.modal -->
<script>
	var mtypes;
	var typeLevel = 0; //当前修改栏目等级。0主级，1二级

	$(function() {
		typeLoad();

		$("#ckb-status").bootstrapSwitch({
			onText : "启用", // 设置ON文本  
			offText : "禁用", // 设置OFF文本  
			onColor : "primary", // 设置ON文本颜色     (info/success/warning/danger/primary)  
			offColor : "danger", // 设置OFF文本颜色        (info/success/warning/danger/primary)  
			size : "small", // 设置控件大小,从小到大  (mini/small/normal/large)  
			handleWidth : "30", //设置控件宽度
			// 当开关状态改变时触发  
			onSwitchChange : function(event, state) {}
		});

		$("#btn-createtype").click(function() {
			$("#hid-cid").val("");
			typeLevel = 0;
			$("#tr-sel-mtype").hide();
			$("#div-editor-title").html("新增主栏目");
			$("#div-editor").modal("show");
			$("#inp-title").val("");
			$("#inp-sort").val(1);
			$("#btn-delete").hide();
			$("#ckb-status").bootstrapSwitch('state', true, true);
		});

		$("#btn-createstype").click(function() {
			$("#hid-cid").val("");
			typeLevel = 1;
			$("#tr-sel-mtype").show();
			$("#div-editor-title").html("在‘" + $("#ul-types .active").html() + "’下新增二级栏目");
			$("#div-editor").modal("show");
			$("#inp-title").val("");
			$("#inp-sort").val(1);
			$("#btn-delete").hide();
			$("#sel-maintype").val($("#ul-types .active").data("id"));
			$("#ckb-status").bootstrapSwitch('state', true, true);
		});
	});

	function deleteType() {
		showConfirm("确定删除" + (typeLevel == 0 ? "主栏目" : "二级栏目") + "‘" + $("#inp-title").val() + "’？" + (typeLevel == 0 ? "该栏目下的子栏目均会同时删除" : ""), 1, function() {
			var para_name = $("#inp-title").val();
			var para_sort = $("#inp-sort").val();
			var para_id = $("#hid-cid").val();
			var para_pid = $("#sel-maintype").val();
			var para_status = 2;

			if (typeLevel == 0) {
				updateNewsType(para_name, para_sort, para_status, para_id);
			} else {
				updateNewsSType(para_name, para_sort, para_status, para_id, para_pid);
			}
		});
	}

	function saveChange() {
		var para_name = $("#inp-title").val();
		var para_sort = $("#inp-sort").val();
		var para_id = $("#hid-cid").val();
		var para_pid = $("#sel-maintype").val();
		var para_status = $("#ckb-status").is(":checked") ? 1 : 0;
		var isUpdate = para_id != null && para_id.length > 0; //是否为新建

		if (isUpdate && typeLevel == 1 && $("#sel-maintype").val() != $("#ul-secondtypes .active").data("pid")) {
			showConfirm("您修改了上级栏目，该操作会将‘" + $("#ul-secondtypes .active").html() + "’移至‘" + $("#sel-maintype option:selected").html() + "’栏目下，确定保存？", 1, function() {
				updateNewsSType(para_name, para_sort, para_status, para_id, para_pid); //修改子类型
				$("#ul-types li[data-id='" + $("#sel-maintype").val() + "']").trigger("click");
			});
		} else {
			if (!isUpdate) { //创建
				if (typeLevel == 0) {
					createNewsType(para_name, para_sort); //创建主类型
				} else {
					createNewsSType(para_name, para_sort, para_pid); //创建子类型
				}
			} else { //修改
				if (typeLevel == 0) {
					updateNewsType(para_name, para_sort, para_status, para_id); //修改主类型
				} else {
					updateNewsSType(para_name, para_sort, para_status, para_id, para_pid); //修改子类型
				}
			}
		}
	}

	function createNewsType(p_name, p_sort) {
		async("sys/createNewsType.do", {
			name : p_name,
			sort : p_sort
		}, function(res) {
			if (res == "1") {
				addTopMessage("保存成功！");
				$("#div-editor").modal("hide");
				typeLoad();
			} else {
				addTopMessage("操作失败！", "error", 7500);
			}
		}, function() {}, 'POST');
	}

	function createNewsSType(p_name, p_sort, p_pid) {
		async("sys/createNewsSType.do", {
			name : p_name,
			sort : p_sort,
			pid : p_pid
		}, function(res) {
			if (res == "1") {
				addTopMessage("保存成功！");
				$("#div-editor").modal("hide");
				loadSecondType($("#ul-types .active"), true);
			} else {
				addTopMessage("操作失败！", "error", 7500);
			}
		}, function() {}, 'POST');
	}

	function updateNewsType(p_name, p_sort, p_status, p_id) {
		async("sys/updateNewsType.do", {
			name : p_name,
			sort : p_sort,
			status : p_status,
			id : p_id
		}, function(res) {
			if (res == "1") {
				addTopMessage("保存成功！");
				typeLoad();
				$("#div-editor").modal("hide");
			} else {
				addTopMessage("操作失败！", "error", 7500);
			}
		}, function() {}, 'POST');
	}

	function updateNewsSType(p_name, p_sort, p_status, p_id, p_pid) {
		async("sys/updateNewsSType.do", {
			name : p_name,
			sort : p_sort,
			pid : p_pid,
			status : p_status,
			id : p_id
		}, function(res) {
			if (res == "1") {
				addTopMessage("保存成功！");
				loadSecondType($("#ul-types .active"), true);
				$("#div-editor").modal("hide");
			} else {
				addTopMessage("操作失败！", "error", 7500);
			}
		}, function() {}, 'POST');
	}

	function loadSecondType(e, isCompulsive) {
		if ($(e).attr("class").indexOf("active") >= 0 && !isCompulsive) {
			return;
		}

		sTypeLoading = true;
		$("#ul-secondtypes li").html("");
		$("#ul-secondtypes").prev(".loading").show();
		$("#ul-types li").removeClass("active");
		$(e).addClass("active");
		async("sys/getNewsSecondType.do", {
			pid : $(e).data("id")
		}, function(res) {
			if (typeof res == "string") {
				res = JSON.parse(res);
			}
			var html = "";
			for (var i in res) {
				html += '<li class="list-group-item" data-status="' + res[i].Status + '" data-pid="' + res[i].ParentType + '" data-sort="' + res[i].Sort + '" data-id="' + res[i].ID + '" >' + res[i].Name + '</li>';
			}
			$("#ul-secondtypes").html(html);
			$("#ul-secondtypes").prev(".loading").hide();
			$("#ul-secondtypes li").click(function() {
				$("#ul-secondtypes li").removeClass("active");
				$(this).addClass("active");
			});
			if (res.length > 0) {
				$("#ul-secondtypes li:eq(0)").trigger("click");
			}
			$("#ul-secondtypes li").dblclick(function() {
				$("#hid-cid").val($(this).data("id"));
				typeLevel = 1;
				$("#tr-sel-mtype").show();
				$("#div-editor").modal("show");
				$("#div-editor-title").html('编辑二级栏目“' + $(this).html() + '”');
				$("#inp-title").val($(this).html());
				$("#inp-sort").val($(this).data("sort"));
				$("#sel-maintype").val($(this).data("pid"));
				$("#btn-delete").show();
				$("#ckb-status").bootstrapSwitch('state', $(this).data("status") == 1, $(this).data("status") == 1);
			});
		}, function() {}, 'POST');
	}

	function typeLoad() {
		$("#ul-types").html("");
		$("#sel-maintype option").remove();
		async("sys/getNewsType.do", {}, function(res) {
			$("#ul-types").prev(".loading").show();
			if (typeof res == "string") {
				mtypes = res = JSON.parse(res);
			}
			for (var i in res) {
				var html = '<li class="list-group-item" data-status="' + res[i].Status + '" data-sort="' + res[i].Sort + '" data-id="' + res[i].ID + '" onclick="javascript:loadSecondType(this,false)">' + res[i].Name + '</li>';
				$("#ul-types").append(html);
				html = '<option value="' + res[i].ID + '">' + res[i].Name + '</option>';
				$("#sel-maintype").append(html);
			}
			$("#ul-types").prev(".loading").hide();
			if (res.length > 0) {
				$("#ul-types li:eq(0)").trigger("click");
			}
			$("#ul-types li").dblclick(function() {
				$("#hid-cid").val($(this).data("id"));
				typeLevel = 0;
				$("#tr-sel-mtype").hide();
				$("#div-editor").modal("show");
				$("#div-editor-title").html('编辑主栏目“' + $(this).html() + '”');
				$("#inp-title").val($(this).html());
				$("#inp-sort").val($(this).data("sort"));
				$("#btn-delete").show();
				$("#ckb-status").bootstrapSwitch('state', $(this).data("status") == 1, $(this).data("status") == 1);
			});
		}, function() {}, 'POST');
	}
</script>
<%@ include file="../master/systemFooter.jsp"%>