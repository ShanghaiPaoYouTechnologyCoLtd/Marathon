<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%@ include file="../master/systemHeader.jsp"%>

<link rel="stylesheet" href="css/layui.css" media="all">
<style>
.layui-table a {
	color: blue !important;
	margin-right: 10px;
}
</style>
<div style="margin: 20px;">
	<div class="orderTable"></div>
	<table class="layui-hide" id="LAY_table_user" lay-filter="user"
		style="height: 550px;"></table>
</div>

<script src="js/layui.js" charset="utf-8"></script>
<script>
	window.onload = function() {
		var tbHeight = $(".page-content").height() - 100;

		layui.use('table', function() {
			var table = layui.table;

			//方法级渲染
			table.render({
				elem : '#LAY_table_user',
				url : 'sys/getNewsSimpleList.do',
				height : 'full-550',
				method : 'post',
				cols : [
					[ {
						field : 'ID',
						width : '10%',
						title : '编号',
						align : 'center'
					}, {
						field : 'TITLE',
						width : '30%',
						title : '标题',
						align : 'center',
						templet : function(d) {
							var html = '<a target="_blank" href="NewSite/news/newRudiment.jsp?nid=' + d.ID + '" >'+d.TITLE+'</a>';

							return html;
						}
					}, {
						field : 'NEWSTYPEINFO',
						width : '15%',
						title : '类型',
						align : 'center'
					}, {
						field : 'CREATEINFO',
						width : '15%',
						title : '创建信息',
						align : 'center'
					}, {
						field : 'status',
						width : '10%',
						title : '状态',
						align : 'center',
						templet : function(d) {
							switch (d.status) {
							case 0:
								return "未发布";
							case 1:
								return "已发布";
							}
						}
					}, {
						field : '',
						title : '操作',
						align : 'center',
						width : '22%',
						templet : function(d) {
							var html = '<a href="system/News/newsRelease.jsp?nid=' + d.ID + '" >编辑</a>';
							if (d.status == 0) {
								html += '<a href="sys/updateStatus.do?nid=' + d.ID + '&status=1">发布</a>';
							} else {
								html += '<a href="sys/updateStatus.do?nid=' + d.ID + '&status=0">下架</a>';
							}
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
								startTime : $("#startdate").val(),
								endTime : $("#enddate").val(),
								phoneno : $("#phoneno").val(),
								feeamount : $("#feeamount").val(),
								coname : $("#coname").val(),
								name : $("#name").val(),
								card : $("#card").val()
							}
						});
					}
				};

			$('.orderTable .layui-btn').on('click', function() {
				var type = $(this).data('type');
				active[type] ? active[type].call(this) : '';
			});
		});
	}
</script>

<%@ include file="../master/systemFooter.jsp"%>