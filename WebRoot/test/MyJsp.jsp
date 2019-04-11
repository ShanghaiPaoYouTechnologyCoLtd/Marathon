<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<title>MyHtml.html</title>

<meta name="keywords" content="keyword1,keyword2,keyword3">
<meta name="description" content="this is my page">
<meta name="content-type" content="text/html; charset=UTF-8">

<!--<link rel="stylesheet" type="text/css" href="./styles.css">-->

</head>

<body>

</body>
<script src="../js/md5.js"></script>
<script src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/ajax.js"></script>
<script>
	var params = {
		"testSwitch" : 0,
		"cardno" : "340104197004301059",
		"name":"马利忠23",
		"sex":"1",
		"phone":"18040573142",
		"raceno":"1",
		"token":hex_md5("8b8802d1-a809-41a3-a235-d1670078135e")
	};

	var url = '../passportApi/genePassport.do';
	$.ajax(url, {
		type : 'POST',
		data : params,
		dataType : 'JSON',
		crossDomain : true,
		success : function(data) {
			if (data) {
				$("body").html(JSON.stringify(data));
			}
		}
	});
</script>
</html>
