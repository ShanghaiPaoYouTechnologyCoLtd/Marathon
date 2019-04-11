<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>中国马拉松护照</title>
<script>
	var para = getPar();

	if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
		window.location = "mobile/passport/passportOrder.jsp" + para;
	} else {
		if (para != null && para.indexOf("rid")) {
			window.location = "passport/marathonPassport_third.jsp" + para;
		} else {
			window.location = "passport/marathonPassport.jsp" + para;
		}
	}

	function getPar() {
		try {
			var local_url = document.location.href;
			//获取要取得的get参数位置
			var get = local_url.indexOf("?");
			if (get == -1) {
				return "";
			}

			var get_par = local_url.slice(get);
			return get_par;
		} catch (ex) {
			return "";
		}
	}
</script>
</head>

<body>
	<br>
</body>
</html>
