package com.apew.marathon.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.apew.marathon.service.IOrderService;
import com.apew.marathon.service.IThousandsListService;

@Controller
@RequestMapping(value = "/passportApi")
public class PassportAPI {
	@Resource(name = "orderService")
	private IOrderService orderService;
	@Resource(name = "tsService")
	private IThousandsListService tsService;

	@ResponseBody
	@RequestMapping(value = "/queryPassport", produces = "application/json; charset=utf-8")
	public String queryPassport(HttpServletRequest request, HttpServletResponse response) {
		String cardno = request.getParameter("cardno");
		String testVal = request.getParameter("testSwitch");
		if (cardno == null || cardno.trim().length() == 0) {
			return "{\"status\":\"-1\",\"msg\":\"证件号为空\"}";
		}
		if (testVal == null || testVal.trim().length() == 0) {
			testVal = "1";
		}
		boolean istest = testVal != null && testVal.trim().equals("1");
		return "{\"status\":\"" + orderService.queryPassport_API(cardno, istest) + "\",\"msg\":\"\"}";
	}

	@ResponseBody
	@RequestMapping(value = "/genePassport", produces = "application/json; charset=utf-8", method = RequestMethod.POST)
	public String genePassport(HttpServletRequest request, HttpServletResponse response) {
		String cardno = request.getParameter("cardno");
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String phone = request.getParameter("phone");
		String raceno = request.getParameter("raceno");
		String token = request.getParameter("token");
		String testVal = request.getParameter("testSwitch");
		if (cardno == null || cardno.trim().length() == 0) {
			return "{\"status\":\"-1\",\"msg\":\"证件号为空\"}";
		}
		if (name == null || name.trim().length() == 0) {
			return "{\"status\":\"-1\",\"msg\":\"姓名为空\"}";
		}
		if (phone == null || phone.trim().length() == 0) {
			return "{\"status\":\"-1\",\"msg\":\"联系方式为空\"}";
		}
		if (raceno == null || raceno.trim().length() == 0) {
			return "{\"status\":\"-1\",\"msg\":\"赛事编号为空\"}";
		}
		if (token == null || token.trim().length() == 0) {
			return "{\"status\":\"-1\",\"msg\":\"赛事密钥为空\"}";
		}
		if (!tsService.raceExists(raceno)) {
			return "{\"status\":\"-1\",\"msg\":\"未找到的赛事编号：" + raceno + "\"}";
		}
		if (!tsService.tokenCheck(token, raceno)) {
			return "{\"status\":\"-1\",\"msg\":\"赛事签名不匹配\"}";
		}
		if (sex == null || sex.trim().length() == 0) {
			sex = "1";
		}
		if (testVal == null || testVal.trim().length() == 0) {
			testVal = "1";
		}
		boolean istest = testVal != null && !testVal.trim().equals("0");
		int r = orderService.genPassport(name, sex, phone, cardno, istest);
		if (r == 1) { // 生成订单信息
			String payfee = tsService.queryRacePrice(raceno);
			orderService.createOrder(name, sex, phone, cardno, raceno, payfee, istest);
		}
		String msg = "生成成功";
		if (r == 0) {
			msg = "系统错误生成失败";
		} else if (r == 2) {
			msg = "用户已经拥有护照";
		}
		return "{\"status\":\"" + r + "\",\"msg\":\"" + msg + "\"}";
	}

	@ResponseBody
	@RequestMapping(value = "/queryPassportInfo", produces = "application/json; charset=utf-8")
	public String queryPassportInfo(HttpServletRequest request, HttpServletResponse response) {
		String cardno = request.getParameter("cardno");
		String testVal = request.getParameter("testSwitch");
		if (cardno == null || cardno.trim().length() == 0) {
			return "{\"status\":\"-1\",\"msg\":\"证件号为空\"}";
		}
		if (testVal == null || testVal.trim().length() == 0) {
			testVal = "1";
		}
		boolean istest = testVal != null && testVal.trim().equals("1");
		return orderService.queryPassportInfo_API(cardno, istest);
	}
}
