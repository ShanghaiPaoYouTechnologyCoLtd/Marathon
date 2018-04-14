<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%@ include file="../master/systemHeader.jsp" %>

    <link rel="stylesheet" href="css/layui.css"  media="all">
 <div style="margin: 20px;">
	<div class="orderTable" >
	
	 <form class="layui-form layui-form-pane" action="">
	  联系电话：
	  <div class="layui-inline">
	    <input class="layui-input" name="id" id="phoneno" autocomplete="off">
	  </div>
	   开始时间：
	  <div class="layui-input-inline">
        <input type="text" name="date" id="startdate" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
      </div>
      
          结束时间：
      <div class="layui-input-inline">
        <input type="text" name="date" id="enddate" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
      </div>
      
      <div class="layui-inline">
	    <div class="layui-input-block">
		    <select name="feeamount" id="feeamount">
		        <option value="">选择付款金额</option>
		        <option value="23">23</option>
		        <option value="28">28</option>
	        </select>
        </div>
	  </div>
	  
	  <div class="layui-inline">
	    <div class="layui-input-block">
		    <select name="coname" id="coname">
		        <option value="">选择合作方</option>
		        <option value="tongzhou">北京通州马拉松(tongzhou)</option>
		        <option value="jurong">句容国际马拉松(jurong)</option>
	        </select>
        </div>
	  </div>
	  
	   <button class="layui-btn" data-type="reload" type="button">搜索</button>
	   <button class="layui-btn" onclick="exportExcel()" type="button">导出Excel</button>
	  
	  </form>
	</div>
	  <table class="layui-hide" id="LAY_table_user" lay-filter="user" style="height: 550px;"></table> 
   </div>            
          
<script src="js/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
	<script>
	window.onload=function(){
		layui.use('laydate', function(){
	   laydate = layui.laydate;
	   var start = {
			       elem: '#startdate', //id为star的输入框
			       istime: true,
			       istoday: true,
			       max:'2099-01-01',
			       done: function(value){
			    	   end.min=value;
			      }
			    };
		var end = {
			      elem: '#enddate',
			      istime: true,
			      istoday: true,
			      done: function(value){
			        start.max = value;
			      }
			    };
		  
		  laydate.render(start);
		  laydate.render(end);
	  
	});
	
	layui.use('form', function(){
	  //form.render();
	});
	

	var tbHeight=$(".page-content").height()-200;
	
	layui.use('table', function(){
	  var table = layui.table;
	  
	  //方法级渲染
	  table.render({
	    elem: '#LAY_table_user'
	    ,url: 'back/olist.do'
	    ,
	    height: 'full-550',
	    cols: [
			[{
					field: 'id',
					width: 80,
					title: '序号',
					align: 'center',
					templet: function(d){
					  return d.LAY_TABLE_INDEX+1;
					}
				}, {
					field: 'serialNum',
					width: 250,
					title: '订单号',
					align: 'center'
				}, {
					field: 'userName',
					width: 120,
					title: '姓名',
					align: 'center'
				}, {
					field: 'sex',
					width: 70,
					title: '性别',
					align: 'center',
					templet: function(d){
					   if(d.sex == 1)
					     return "男";
					     
					   if(d.sex == 2)
					      return "女";
				        return "";
				      }
				}, {
					field: 'cardType',
					width: 90,
					title: '证件类型',
					align: 'center',
					templet: function(d){
					   if(d.cardType == 1)
					     return "身份证";
					   if(d.cardType == 2)
					      return "台胞证";
					   if(d.cardType == 3)
					      return "护照";
					   if(d.cardType == 4)
					      return "军官证";
				        return "";
				      }
				}, {
					field: 'cardNo',
					title: '证件号码',
					align: 'center',
					width: 180,
					
				} 
				, {
					field: 'phoneNo',
					title: '联系电话',
					align: 'center',
					width: 120
				}, {
					field: 'payFee',
					width: 137,
					title: '支付金额',
					align: 'center'
				}, {
					field: 'payTime',
					width: 180,
					title: '支付时间',
					align: 'center'
				}, {
					field: 'createTime',
					width: 180,
					title: '创建时间',
					align: 'center'
				},{
					field: 'cooperateName',
					width: 180,
					title: '合作方',
					align: 'center'
				}
			]
		]
	    ,id: 'testReload'
	    ,page: true
	    ,height: tbHeight,
	    limit:20
	  });
	  
	  var $ = layui.$, active = {
	    reload: function(){
	      var demoReload = $('#demoReload');
	      
	      //执行重载
	      table.reload('testReload', {
	        page: {
	          curr: 1 //重新从第 1 页开始
	        }
	        ,where: {
	            startTime:$("#startdate").val(),
	            endTime:$("#enddate").val(),
	            phoneno:$("#phoneno").val(),
	            feeamount:$("#feeamount").val(),
	            coname:$("#coname").val()
	        }
	      });
	    }
	  };
	  
	  $('.orderTable .layui-btn').on('click', function(){
	    var type = $(this).data('type');
	    active[type] ? active[type].call(this) : '';
	  });
	});
	}
	</script>
	
	<script type="text/javascript">
	function exportExcel(){
	  window.location.href = "back/exportorders.do?startTime="+$("#startdate").val()+"&endTime="+$("#enddate").val()+"&phoneno="+$("#phoneno").val()+"&feeamount="+$("#feeamount").val();
	}
	
	
	</script>
	
<%@ include file="../master/systemFooter.jsp" %>