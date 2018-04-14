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
    <%@ include file="static/systemCSS.html" %>
</head>

<body class="login">
    <div class="logo">
        <img src="system/image/logo_withtext4.png" alt="" />
    </div>
    <div class="content">
        <form class="form-vertical login-form" method="post" action="/Home/Login">
            <h3 class="form-title">用户登录</h3>
            <div class="alert alert-error hide">
                <button class="close" data-dismiss="alert"></button>
                <span>请输入域用户和密码。</span>
            </div>
            <div class="control-group">
                <label class="control-label visible-ie8 visible-ie9">账　户</label>
                <div class="controls">
                    <div class="input-icon left">
                        <i class="icon-user"></i>
                        <input class="m-wrap placeholder-no-fix" type="text" placeholder="账户" name="uname" />
                    </div>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label visible-ie8 visible-ie9">密　码</label>
                <div class="controls">
                    <div class="input-icon left">
                        <i class="icon-lock"></i>
                        <input class="m-wrap placeholder-no-fix" type="password" placeholder="密码" name="pwd" />
                    </div>
                </div>
            </div>
            <div class="form-actions">
                <label class="checkbox">
                    <input type="checkbox" name="remember" value="1" /> 记住我
                </label>
                <button type="submit" class="btn green pull-right">
                    登陆 <i class="m-icon-swapright m-icon-white"></i>
                </button>
            </div>
        </form>
    </div>
    <div class="copyright">
        2017 &copy;  上海跑友科技有限公司
    </div>
<%@ include file="static/systemScript.html" %>
</body>
</html>