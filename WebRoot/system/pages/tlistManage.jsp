<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%@ include file="../master/systemHeader.jsp"%>

<link rel="stylesheet" href="css/layui.css" media="all">
<div style="margin: 20px;">
	<h4>上传名单</h4>
	<hr />
	<button type="button" class="btn btn-default" data-toggle="tooltip"
		data-placement="right"
		title="上传文件必须是Excel文件，并且至少包含姓名（name）、赛事(race)、证件号（card）与成绩（score）列，如果因格式上传失败，可点击右侧下载标准模板后，按照模板格式修改">上传新万人名单</button>
	<button type="button" class="btn btn-default" data-toggle="tooltip"
		data-placement="right" title="请按照标准模板完成您的万人名单Excel，请不要删除任何列头">下载标准模板</button>
	<hr />
	<h4>名单管理</h4>
	<hr />
	<select style="margin-bottom: 0px;">
		<option>请选择期数</option>
		<option>1</option>
		<option>2</option>
		<option>3</option>
		<option>4</option>
	</select>
	<button type="button" class="btn btn-default" data-toggle="tooltip"
		data-placement="right" title="在选择的名单期数中插入一位选手，系统会自动为其排名，并且为之后的选手顺延排名">插入选手</button>
	<button type="button" class="btn btn-default" data-toggle="tooltip"
		data-placement="right" title="删除选中的选手，系统会自动提升后续选手排名">删除选中选手</button>
	<table class="layui-hide" id="LAY_table_user" lay-filter="user"
		style="height: 550px;"></table>
</div>

<script src="js/layui.js" charset="utf-8"></script>
<script>
	$(function() {
		$("[data-toggle='tooltip']").tooltip();

		setTable();
	});

	function setTable() {
		var tbHeight = $(".page-content").height() - 400;

		layui.use('table', function() {
			var table = layui.table;

			//方法级渲染
			table.render({
				elem : '#LAY_table_user',
				url : 'tlist/getList.do',
				height : 'full-550',
				cols : [
					[ {
						field : 'id',
						width : 50,
						title : '序号',
						align : 'center',
						templet : function(d) {
							return d.LAY_TABLE_INDEX + 1;
						}
					}, {
						field : 'payType',
						width : 80,
						title : '交易类型',
						align : 'center',
						templet : function(d) {
							return d.payType == 1 ? "支付宝" : "微信";
						}
					}, {
						field : 'outTradeNo',
						width : 250,
						title : '第三方订单号',
						align : 'center'
					}, {
						field : 'userName',
						width : 120,
						title : '姓名',
						align : 'center'
					}, {
						field : 'sex',
						width : 70,
						title : '性别',
						align : 'center',
						templet : function(d) {
							if (d.sex == 1)
								return "男";

							if (d.sex == 2)
								return "女";
							return "";
						}
					}, {
						field : 'cardType',
						width : 90,
						title : '证件类型',
						align : 'center',
						templet : function(d) {
							if (d.cardType == 1)
								return "身份证";
							if (d.cardType == 2)
								return "台胞证";
							if (d.cardType == 3)
								return "护照";
							if (d.cardType == 4)
								return "军官证";
							return "";
						}
					}, {
						field : 'cardNo',
						title : '证件号码',
						align : 'center',
						width : 180,
					}
						, {
							field : 'phoneNo',
							title : '联系电话',
							align : 'center',
							width : 120
						}, {
							field : 'payFee',
							width : 80,
							title : '金额',
							align : 'center'
						}, {
							field : 'payTime',
							width : 180,
							title : '支付时间',
							align : 'center'
						}, {
							field : 'createTime',
							width : 180,
							title : '创建时间',
							align : 'center'
						}, {
							field : 'cooperateName',
							width : 180,
							title : '合作方',
							align : 'center'
						}
					]
				],
				id : 'testReload',
				page : true,
				height : tbHeight,
				limit : 10
			});
		});
	}
</script>

<%@ include file="../master/systemFooter.jsp"%>