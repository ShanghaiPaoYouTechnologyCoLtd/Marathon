<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>中国马拉松护照</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="中国马拉松护照">
	<meta http-equiv="description" content="中国马拉松护照">
	<meta name="format-detection" content="telephone=no" />
	<meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="wap-font-scale" content="no"><!-- 防止浏览器字体修改 -->
	<link rel="stylesheet" href="css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="css/jquery.toastmessage.css">
	<link rel="stylesheet" href="css/general.css" />
	<link rel="stylesheet" href="css/login.css" />
	<script type="text/javascript" src="js/jquery-2.1.1.js" ></script>
	<script type="text/javascript" src="js/jquery.toastmessage.js"></script>
	<script type="text/javascript" src="js/ajax.js"></script>
	<script type="text/javascript" src="js/login.js"></script>
  </head>
  <body>
  	<div class="login_container">
			<div class="login_content">
				<div class="login_header text-center">中国马拉松护照登录</div>
				<div class="login_form">
				  <form class="form-horizontal" role="form" onsubmit="return false;">
                   <div class="form-group">
                    <label for="username" class="col-xs-2 control-label">用户名</label>
                    <div class="col-xs-10">
                       <input type="text" class="form-control" id="username" placeholder="请输入您的用户名">
                    </div>
                   </div>
                   <div class="form-group">
                    <label for="username" class="col-xs-2 control-label">密码</label>
                    <div class="col-xs-10">
                       <input type="password" class="form-control" id="password" placeholder="请输入您的密码">
                    </div>
                   </div>
                   <div class="form-group text-center">
                      <button class='btn login_btn' onclick="loginFn()">登录</button>
                   </div>
                  </form>
				</div>
			</div>
		</div>
	</body>
  </body>
</html>
