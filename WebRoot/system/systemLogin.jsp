<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>跑友科技管理平台</title>
    <base href="<%=basePath%>" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />

    <link href="system/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="system/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />
    <link href="system/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="system/css/style-metro.css" rel="stylesheet" type="text/css" />
    <link href="system/css/style.css" rel="stylesheet" type="text/css" />
    <link href="system/css/style-responsive.css" rel="stylesheet" type="text/css" />
    <link href="system/css/default.css" rel="stylesheet" type="text/css" id="style_color" />
    <link href="system/css/uniform.default.css" rel="stylesheet" type="text/css" />
    <link href="system/css/login.css" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" href="system/image/favicon.ico" />
    <link rel="stylesheet" type="text/css" href="css/jquery.toastmessage.css">
</head>

<body class="login">
    <div class="logo">
        <img src="system/image/logo_withtext4.png" alt="" />
    </div>
    <div class="content">
        <form class="form-vertical login-form" method="post" onsubmit="return false;">
            <h3 class="form-title">用户登录</h3>
            <div class="alert alert-error hide">
                <button class="close" data-dismiss="alert"></button>
                <span>请输入用户和密码。</span>
            </div>
            <div class="control-group">
                <label class="control-label visible-ie8 visible-ie9">账　户</label>
                <div class="controls">
                    <div class="input-icon left">
                        <i class="icon-user"></i>
                        <input class="m-wrap placeholder-no-fix" type="text" placeholder="账户" name="username" id="username" />
                    </div>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label visible-ie8 visible-ie9">密　码</label>
                <div class="controls">
                    <div class="input-icon left">
                        <i class="icon-lock"></i>
                        <input class="m-wrap placeholder-no-fix" type="password" placeholder="密码" name="passport" id="password" />
                    </div>
                </div>
            </div>
            <div class="form-actions">
     <!--            <label class="checkbox">
                    <input type="checkbox" name="remember" value="1" /> 记住我
                </label> -->  
                <button type="submit" class="btn green pull-right"  onclick="loginFn()">
                    登陆 <i class="m-icon-swapright m-icon-white"></i>
                </button>
            </div>
        </form>
    </div>
    <div class="copyright">
        2017 &copy;  上海跑友科技有限公司
    </div>
<%@ include file="static/systemScript.html" %>
	<script type="text/javascript" src="js/jquery.toastmessage.js"></script>
	<script type="text/javascript" src="js/ajax.js"></script>
	<script type="text/javascript" src="js/login.js"></script>
</body>
</html>