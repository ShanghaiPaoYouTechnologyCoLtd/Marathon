package com.apew.marathon.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alipay.util.ProUtil;
import com.alipay.util.StringHelper;


@Controller
@RequestMapping(value = "/back")
public class AdminLoginController extends BaseController {
	
	/**
	 * 获取订单列表
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/tologin")
	public String toLogin(HttpServletRequest request,
			HttpServletResponse response){
		
		return "login";
	}
	
	/**
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/login",produces = "application/json; charset=utf-8")
	@ResponseBody
	public String login(HttpServletRequest request,
			HttpServletResponse response){
		
		String username = request.getParameter("username");
		if(StringHelper.isEmptyStr(username))
			return returnapiParError("请输入用户名!");
		
		String password = request.getParameter("password");
		if(StringHelper.isEmptyStr(password))
			return returnapiParError("请输入密码!");
		
		String dbUsername = ProUtil.getPro("username");
		String dbPassword = ProUtil.getPro("password");
		
		if(!username.equals(dbUsername) || !password.equals(dbPassword)){
			return returnapiParError("用户名或密码错误!");
		}
		
		request.getSession().setAttribute("user","1");
		
		return returnapiSuccess("登陆成功!", "");
	}
	

}
