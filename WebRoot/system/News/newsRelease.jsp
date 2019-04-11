<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%@ include file="../master/systemHeader.jsp"%>
<link rel="stylesheet" type="text/css"
	href="js/bootstrap/bootstraptimepick/bootstrap-datetimepicker.min.css" />
<script type="text/javascript" charset="utf-8"
	src="system/UEditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="system/UEditor/ueditor.all.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8"
	src="system/UEditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" charset="utf-8"
	src="js/bootstrap/bootstraptimepick/bootstrap-datetimepicker.min.js"> </script>
<script type="text/javascript" charset="utf-8"
	src="js/bootstrap/bootstraptimepick/bootstrap-datetimepicker.zh-CN.js"> </script>
<style>
#tab-main {
	width: 100%;
	border: 1px solid #D3D3D3;
	margin-bottom: 20px;
}

#tab-main td {
	min-height: 60px;
	padding-top: 10px;
}

.col-sm-2 {
	text-align: right;
}

#tab-main tr {
	border-bottom: 1px solid #D3D3D3;
}

input, select {
	cursor: pointer;
}

#cl-dashboard {
	display: none;
}

.form_date {
	padding-right: 15px !important;
	padding-left: 15px !important;
}

#div-hidden-imgupload {
	display: none;
}

#btn-delete, #btn-close, #btn-cancel {
	display: none;
}
</style>

<div class="form-horizontal" role="form">
	<div id="div-hidden-imgupload">
		<script id="upload_image" type="text/plain"
			style="width: 0px;height: 0px; display:none"></script>
	</div>
	<table id="tab-main">
		<tr>
			<td style="width:50%;">
				<div class="form-group">
					<div class="col-sm-2">
						<label class="control-label" for="inp-title"> <span
							style="color:red">*</span>所属栏目
						</label>
					</div>
					<div class="col-sm-10">
						<select class="form-control" id="sel-maintype"
							style="float:left; width:25%;">
						</select> <select class="form-control" id="sel-stype"
							style="float:left; width:25%; margin-left:10px;">
						</select> <a href="system/News/newstype.jsp"
							style="margin-left:10px;line-height:30px;">栏目管理</a>
					</div>
				</div>
			</td>
			<td>
				<p style="text-align:right; margin-right:3%;">
					<button class="btn" id="btn-cancel">返回</button>
					<button class="btn btn-danger" id="btn-delete">删除</button>
					<button class="btn btn-info" id="btn-preview">预览</button>
					<button class="btn btn-success" id="btn-save">保存</button>
					<button class="btn btn-warning" id="btn-close">下架</button>
					<button class="btn btn-primary" id="btn-release">发布</button>
				</p>
			</td>
		</tr>
		<tr>
			<td style="width:50%;">
				<div class="form-group">
					<div class="col-sm-2">
						<label class="control-label" for="inp-title"> <span
							style="color:red">*</span>新闻标题
						</label>
					</div>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="inp-title">
					</div>
				</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td style="width:50%;">
				<div class="form-group">
					<div class="col-sm-2">
						<label class="control-label" for="inp-title"> <span
							style="color:red">*</span>封面图片
						</label>
					</div>
					<div class="col-sm-10" id="div-cover-cont">
						<input type="button" value="上传封面" class="btn" id="btn-uploadCover"
							onclick="uploadCover();return false;" />
					</div>
				</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td style="width:50%;">
				<div class="form-group">
					<div class="col-sm-2">
						<label class="control-label" for="inp-title"> <span
							style="color:red">*</span>新闻简介
						</label>
					</div>
					<div class="col-sm-10">
						<textarea class="form-control" rows="3" id="inp-synopsis"></textarea>
					</div>
				</div>
			</td>
			<td>
				<p style="text-indent:10px;">*
					用于展示在新闻列表页面的简介，请控制字数在100~220之间，以保证新闻列表页面的美观。
				<p>
				<p style="text-indent:10px;">
					* 当前字数：<span id="sp-syncount">0</span>
				<p>
			</td>
		</tr>
		<tr>
			<td style="width:50%;">
				<div class="form-group">
					<div class="col-sm-2">
						<label class="control-label" for="inp-title"> <span
							style="color:red">*</span>发布人
						</label>
					</div>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="inp-author">
					</div>
				</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td style="width:50%;">
				<div class="form-group">
					<label for="inp-newsdate" class="col-md-2 control-label"><span
						style="color:red">*</span>新闻时间</label>
					<div class="input-group date form_date col-md-5" data-date=""
						data-date-format="dd MM yyyy" data-link-field="inp-newsdate"
						data-link-format="yyyy-mm-dd">
						<input class="form-control" size="16" type="text" value=""
							readonly> <span class="input-group-addon"><span
							class="glyphicon glyphicon-remove"></span></span> <span
							class="input-group-addon"><span
							class="glyphicon glyphicon-calendar"></span></span>
					</div>
					<input type="hidden" id="inp-newsdate" value="" /><br />
				</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td colspan="2"><script id="editor" type="text/plain"
					style="width: 100%;height: 420px; margin-bottom: 10px;"></script></td>
		</tr>
		<tr>
			<td style="width:50%;">
				<div class="form-group">
					<div class="col-sm-2">
						<label class="control-label" for="inp-title">文章标签 </label>
					</div>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="inp-label">
					</div>
				</div>
			</td>
			<td><p style="text-indent:10px;">* 使用逗号分隔多个标签
				<p></td>
		</tr>
		<tr>
			<td style="width:50%;">
				<div class="form-group">
					<div class="col-sm-2">
						<label class="control-label" for="inp-title"> 新闻级别 </label>
					</div>
					<div class="col-sm-10">
						<select class="form-control" id="sel-newslevel"
							style="float:left; width:25%;">
							<option value="0">普通</option>
							<option value="1">置顶</option>
						</select> <input type="number" class="form-control" id="inp-newslevelnum"
							value="1" min="1"
							style="width:25%;float:left;margin-left:10px;display:none">
						<span style="margin-left: 10px;line-height: 30px;display:none">置顶等级（数值越大越靠前）</span>
					</div>
				</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td style="width:50%;">
				<div class="form-group">
					<div class="col-sm-2">
						<label class="control-label" for="inp-title">访问人数 </label>
					</div>
					<div class="col-sm-10">
						<input type="number" class="form-control" id="inp-visitor"
							value="0" min="0" style="width:25%;">
					</div>
				</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td style="width:50%;">
				<div class="form-group">
					<div class="col-sm-2">
						<label class="control-label" for="inp-title">文章来源 </label>
					</div>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="inp-newssource">
					</div>
				</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td style="width:50%;">
				<div class="form-group">
					<div class="col-sm-2">
						<label class="control-label" for="inp-title">原文链接 </label>
					</div>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="inp-newssourcelink">
					</div>
				</div>
			</td>
			<td></td>
		</tr>
	</table>
</div>

<script>
	var ue = UE.getEditor('editor');
	var newsID;
	var _editor;

	$(function() {
		//加载新闻类型
		typeLoad();
		//页面事件注册
		formReg();
		//参数加载，页面根据参数做出相应
		paraGet();
		//封面上传控件初始化
		coverUploadInit();
	});

	function paraGet() {
		newsID = getPar("nid");
		if (!newsID) {
			newsID = null;
		} else {
			$("#btn-delete").show();
			$("#btn-cancel").show();
			loadNewsForUpdate();
		}
	}

	//加载需要编辑的赛事
	function loadNewsForUpdate() {
		if (newsID == null || newsID.length == 0)
			return;

		var url = "sys/getNewsDetails.do";
		var para = {
			"nid" : newsID
		};
		async(url, para, function(res) {
			if (typeof (res) == "string") {
				res = JSON.parse(res);
			} else if (res.length >= 0) {
				res = res[0];
			}

			$("#inp-title").val(res.Title);
			var coverhtml = "<img src='" + res.Cover + "' height='100' width='100' />"
			$("#div-cover-cont").append(coverhtml);
			$("#inp-synopsis").val(res.Synopsis);
			var dateStr = dateToStr(res.NewsDate, "-");
			$('.form_date').datetimepicker('update', dateStr);
			$("#inp-author").val(res.Author);
			setTimeout(function() {
				UE.getEditor('editor').setContent(res.Content, false)
			}, 100);
			$("#sel-newslevel").val(res.TopNum == 0 ? 0 : 1);
			if (res.TopNum > 0) {
				$("#inp-newslevelnum").val(res.TopNum);
				$("#inp-newslevelnum").show();
			}
			$("#inp-visitor").val(res.Access_E);
			$("#inp-newssource").val(res.Source);
			$("#inp-newssourcelink").val(res.SourceLink);
			$("#inp-label").val(res.Label);
			$("#sel-maintype").val(res.newsptype);
			while (!canRequest) {
			}
			loadSecondType(res.NewsType);
			hideButtonByStatus(res.Status);
		}, function() {}, 'POST');
	}

	function formReg() {
		$('.form_date').datetimepicker({
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			minView : 2,
			forceParse : 0,
			language : "zh-CN",
			format : 'yyyy-mm-dd hh:ii'
		});

		$('.form_date').datetimepicker('update', new Date());
		//$(".form_date").data("datetimepicker").getDate()

		$("#sel-newslevel").change(function() {
			if ($(this).val() == "1") {
				$(this).parent().find("input").show();
				$(this).parent().find("span").show();
			} else {
				$(this).parent().find("input").hide();
				$(this).parent().find("span").hide();
			}
		});

		$("#btn-save").click(function() {
			if (newsID == null || newsID.length == 0) {
				createNews(0);
			} else {
				UpdateNews();
			}
		});

		$("#btn-cancel").click(function() {
			history.back();
		});

		$("#btn-close").click(function() {
			updateStatus(0);
		});

		//发布的逻辑：用户可看；当新闻创建同时发布时，使用createNews；当新闻被下架修改完成后再次发布，使用updateStatus
		$("#btn-release").click(function() {
			if (newsID == null || newsID.length == 0) {
				createNews(1);
			} else {
				updateStatus(1);
			}
		});

		$("#btn-delete").click(function() {
			showConfirm("确定删除此文章？", 1, function() {
				updateStatus(2);
			});
		});

		$("#btn-preview").click(function() {
			if (newsID == null || newsID.length == 0 || newsID == -1) {
				addTopMessage("新闻异常", "error");
				return;
			}
			window.open("NewSite/news/newRudiment.jsp?nid=" + newsID);
		});

		$("#inp-synopsis").keyup(function() {
			$("#sp-syncount").html($(this).val().length);
		});
	}

	function UpdateNews() {
		var url = "sys/updateNews.do";
		var params = getParams(status);
		if (!params)
			return;

		async(url, params, function(res) {
			if (res == "1") {
				addTopMessage("修改成功");
			} else {
				addTopMessage(res, "error");
			}
		}, function() {}, 'POST');
	}

	function updateStatus(status) {
		if (newsID == null || newsID.length == 0) {
			addTopMessage("新闻未找到", "error");
			return;
		}

		var pars = {
			"nid" : newsID,
			"status" : status
		};
		async("sys/updateStatus.do", pars, function(res) {
			if (res == "1") {
				addTopMessage("操作成功");
				hideButtonByStatus(status);
			} else {
				addTopMessage(res, "error");
			}
		}, function() {
			addTopMessage("操作失败", "error");
		}, 'POST');
	}

	function hideButtonByStatus(status) {
		switch (status) {
		case 0:
			$("#btn-release").show();
			$("#btn-close").hide();
			break;
		case 1:
			$("#btn-release").hide();
			$("#btn-close").show();
			break;
		default:
			$("button").hide();
			$("#btn-cancel").show();
			break;
		}
	}

	function createNews(status) {
		var url = "sys/createNews.do";
		var params = getParams(status);
		if (!params)
			return;

		async(url, params, function(res) {
			if (res == "1") {
				addTopMessage("保存成功");
			} else {
				addTopMessage(res, "error");
			}
		}, function() {}, 'POST');
	}

	function getParams(status) {
		$(".form-group").removeClass("has-error");
		if ($("#inp-title").val().trim().length == 0) {
			$("#inp-title").parents(".form-group").addClass("has-error");
			addTopMessage("请填写标题", "error");
			return false;
		}

		if ($("#div-cover-cont img").length == 0) {
			$("#div-cover-cont").parents(".form-group").addClass("has-error");
			addTopMessage("请添加封面", "error");
			return false;
		}

		if ($("#inp-author").val().trim().length == 0) {
			$("#inp-author").parents(".form-group").addClass("has-error");
			addTopMessage("请填写发布人", "error");
			return false;
		}

		var params = {};
		params["title"] = $("#inp-title").val();
		params["cover"] = $("#div-cover-cont img").attr("src");
		params["content"] = ue.getAllHtml();
		params["access"] = $("#inp-visitor").val();
		params["status"] = status;
		params["topnum"] = $("#sel-newslevel").val() == "0" ? 0 : $("#inp-newslevelnum").val();
		params["newstype"] = $("#sel-stype").val();
		params["sourcelink"] = $("#inp-newssourcelink").val();
		params["source"] = $("#inp-newssource").val();
		params["author"] = $("#inp-author").val();
		params["newsdate"] = getDateStr($(".form_date").data("datetimepicker").getDate());
		params["label"] = $("#inp-label").val();
		params["synopsis"] = $("#inp-synopsis").val();

		if (newsID != null && newsID.length > 0) {
			params["nid"] = newsID;
		}

		return params;
	}

	function getDateStr(date) {
		return date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDay();
	}

	//弹出图片上传的对话框
	function uploadCover() {
		var myImage = _editor.getDialog("insertimage");
		myImage.open();
		return false;
	}

	window.onbeforeunload = function(e) {
		var e = window.event || e;
		e.returnValue = ("确定离开当前页面吗？");
	}

	function coverUploadInit() {
		//重新实例化一个编辑器，防止在上面的editor编辑器中显示上传的图片或者文件
		_editor = UE.getEditor('upload_image');
		_editor.ready(function() {
			//设置编辑器不可用
			//_editor.setDisabled();
			//隐藏编辑器，因为不会用到这个编辑器实例，所以要隐藏
			_editor.hide();
			//侦听图片上传
			_editor.addListener('afterinsertimage', function(t, arg) {
				$("#div-cover-cont img").remove();
				var html = "<img src='" + arg[0].src + "' height='100' width='100' />"
				$("#div-cover-cont").append(html);
			})
		});
	}

	function typeLoad() {
		$("#sel-maintype option").remove();
		async("sys/getNewsType.do", {}, function(res) {
			if (typeof res == "string") {
				mtypes = res = JSON.parse(res);
			}
			for (var i in res) {
				var html = '<option value="' + res[i].ID + '">' + res[i].Name + '</option>';
				$("#sel-maintype").append(html);
			}
			if (newsID == null || newsID.length == 0) //传入新闻时，不需要加载二级类型，等待传入
				loadSecondType();
		}, function() {}, 'POST');

		$("#sel-maintype").change(function() {
			loadSecondType();
		});
	}

	var isSTLoading = false;
	function loadSecondType(selected) {
		$("#sel-stype option").remove();
		var p_id = $("#sel-maintype").val();
		async("sys/getNewsSecondType.do", {
			pid : p_id
		}, function(res) {
			if (typeof res == "string") {
				res = JSON.parse(res);
			}
			for (var i in res) {
				var html = '<option value="' + res[i].ID + '">' + res[i].Name + '</option>';
				$("#sel-stype").append(html);
			}
			if (selected != null) {
				$("#sel-stype").val(selected);
			}
		}, function() {}, 'POST');
	}

	//日期转字符串
	function dateToStr(date, spl) {
		if (spl == null || spl.length == 0 || !isNaN(spl)) {
			spl = "/";
		}
		return (date.year + 1900) + spl + (date.month + 1) + spl + date.date; //+ " " + date.hours + "：" + date.minutes
	}
</script>
<%@ include file="../master/systemFooter.jsp"%>