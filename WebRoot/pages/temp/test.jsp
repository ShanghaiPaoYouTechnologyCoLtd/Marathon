<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'test.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script src="js/jquery.js"></script>
<script src="js/md5.js"></script>
</head>

<body>
	身份证：
	<textarea id="card" style="width:300px; height:300px"></textarea>
	<br /> 比赛ID：
	<input type='text' id="raceno" value="1" />
	<br /> token:
	<input type='text' id="token"
		value="4e5b4b4b-8490-424a-9341-5b545b66f8bd" />
	<br />
	<input type='button' value="按我" onclick="test(0)"
		style="width:200px; heigth:90px; cursor:pointer" />
	<input type='button' value="还剩几个名额" onclick="test(1)"
		style="width:200px; heigth:90px; cursor:pointer" />
	<input type='button' value="这个人有名额吗？" onclick="test(2)"
		style="width:200px; heigth:90px; cursor:pointer" />
	<input type="checkbox" checked id="testsw" />测试库
	<br /> 结果:
	<p>
		本次共计<span id="count1"></span>条，免费<span id="count2"></span>条，付费<span
			id="count4"></span>条，重复<span id="count3"></span>条，溢出<span id="count5"></span>条，非名单<span
			id="count6"></span>条
	</p>
	<p id="result"></p>
</body>
<script>
	var urls = new Array("quotasAccess.do", "quotasQuery.do", "playersQuotaQuery.do");
	function test(vt) {
		var x = $("#card").val().trim().split("\n");
		$("#result").html("");
		var count = 0;
		var count2 = 0;
		var count3 = 0;
		var count4 = 0;
		var count5 = 0;
		$("#count1").html(x.length);
		var url="tlist/"+urls[vt];
		for (var i = 0; i < x.length; i++) {
			if (x[i].trim().length == 0)
				continue;

			var cno = x[i].trim();
			$.ajax({
				type : "POST",
				url : url,
				data : {
					"raceno" : $("#raceno").val(),
					"cardno" : cno,
					"token" : hex_md5($("#token").val()),
					"testSwitch" : $("#testsw").is(":checked") ? 1 : 0
				},
				success : function(result) {
					$("#result").append("<br/>" + "--" + result);
					var json = JSON.parse(result);
					if (json.code == 0)
						count++;
					else if (json.code == 1)
						count3++;
					else if (json.code == 2)
						count4++;
					else if (json.code == 3)
						count5++;
					else if (json.code == 4)
						count2++;

					$("#count2").html(count);
					$("#count3").html(count2);
					$("#count4").html(count3);
					$("#count5").html(count4);
					$("#count6").html(count5);
				}
			});
		}
	}
</script>
</html>
