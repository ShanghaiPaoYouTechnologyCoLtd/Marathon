package com.apew.marathon.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.MediaType;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.apew.marathon.service.IOrderService;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.filter.HTTPBasicAuthFilter;
import com.sun.jersey.core.util.MultivaluedMapImpl;

import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "/msg")
public class MessageSendController {
	@Resource(name = "orderService")
	private IOrderService orderService;
	public static String messageSign = "【中国马拉松赛事联盟】";
	public static String endStr="欲了解更多中国马拉松护照相关信息，请关注“中国马拉松赛事联盟”微信公众号。";

	/**
	 * 发送重领提醒
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/sendUnreceiveMsg", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String sendUnreceiveMsg(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("oid");
		String uid = request.getParameter("uid");
		List<Map<String, Object>> info = orderService.getUnreceiveOrder(id);
		String msg = "尊敬的跑者" + info.get(0).get("USER_NAME") + "您好，您在" + info.get(0).get("RACENAME")
				+ "赛事购买的中国马拉松护照未在现场领取，您可进入中国马拉松赛事联盟官网http://www.chinesemarathonleague.com/passport/passportUnreceive.jsp 进行重新申领，如有问题请咨询021-50897802-615。"+endStr;
		msg += messageSign;
		String r = messageSend(info.get(0).get("PHONE_NO").toString(), msg);
		if (r.equals("ok") && uid != null && !uid.equals("-1")) {
			orderService.addUnreceiveMessageSend(uid);
		}
		return "{\"result\":\"" + r + "\"}";
	}

	/**
	 * 发送重领提醒
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/sendUnreceiveMsg_byid", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String sendUnreceiveMsg_byid(String id, String uid) {
		List<Map<String, Object>> info = orderService.getUnreceiveOrder(id);
		String msg = "尊敬的跑者" + info.get(0).get("USER_NAME") + "您好，您在" + info.get(0).get("RACENAME")
				+ "赛事购买的中国马拉松护照未在现场领取，您可进入中国马拉松赛事联盟官网http://www.chinesemarathonleague.com/passport/passportUnreceive.jsp 进行重新申领，如有问题请咨询021-50897802-615。"+endStr;
		msg += messageSign;
		String r = messageSend(info.get(0).get("PHONE_NO").toString(), msg);
		if (r.equals("ok") && uid != null && uid.length() > 0 && !uid.equals("-1")) {
			orderService.addUnreceiveMessageSend(uid);
		}
		return "{\"result\":\"" + r + "\"}";
	}
	/**
	 * 发送重领提醒
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/sendUnreceiveMsg_byname", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String sendUnreceiveMsg_byname(String name, String racename,String phone) {
		String msg = "尊敬的跑者" + name + "您好，您在" +racename
				+ "赛事购买的中国马拉松护照未在现场领取，您可进入中国马拉松赛事联盟官网http://www.chinesemarathonleague.com/passport/passportUnreceive.jsp 进行重新申领，如有问题请咨询021-50897802-615。"+endStr;
		msg += messageSign;
		String r = messageSend(phone, msg);
		return "{\"result\":\"" + r + "\"}";
	}

	/**
	 * 购买成功提醒
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/sendPassportBuyMsg_id", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String sendPassportBuyMsg(String id) {
		List<Map<String, Object>> info = orderService.getUnreceiveOrder(id);
		String msg = "尊敬的跑者" + info.get(0).get("USER_NAME")
				+ "您好，您已成功购买《中国马拉松护照》,如有问题请咨询021-50897802-615。"+endStr;
		msg += messageSign;
		String r = messageSend(info.get(0).get("PHONE_NO").toString(), msg);
		return "{\"result\":\"" + r + "\"}";
	}

	/**
	 * 购买成功提醒
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/sendPassportBuyMsg_para", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String sendPassportBuyMsg(String name, String phone) {
		String msg = "尊敬的跑者" + name
				+ "您好，您已成功购买《中国马拉松护照》,如有问题请咨询021-50897802-615。"+endStr;
		msg += messageSign;
		String r = messageSend(phone, msg);
		return "{\"result\":\"" + r + "\"}";
	}

	/**
	 * 购买成功提醒--赛事合作
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/sendPassportBuyMsg_coop_id", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String sendPassportBuyMsg_COOP(String id, String racename) {
		List<Map<String, Object>> info = orderService.getUnreceiveOrder(id);
		String msg = "尊敬的跑者" + info.get(0).get("USER_NAME") + "您好，《中国马拉松赛事联盟》提醒您，您在" + racename
				+ "赛事购买的中国马拉松护照已购买成功。如有问题请咨询021-50897802-615。"+endStr;
		msg += messageSign;
		String r = messageSend(info.get(0).get("PHONE_NO").toString(), msg);
		return "{\"result\":\"" + r + "\"}";
	}

	/**
	 * 购买成功提醒--赛事合作
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/sendPassportBuyMsg_coop_para", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String sendPassportBuyMsg_COOP(String name, String phone, String racename) {
		String msg = "尊敬的跑者" + name + "您好，《中国马拉松赛事联盟》提醒您，您在" + racename
				+ "赛事购买的中国马拉松护照已购买成功。如有问题请咨询021-50897802-615。"+endStr;
		msg += messageSign;
		String r = messageSend(phone, msg);
		return "{\"result\":\"" + r + "\"}";
	}

	private String messageSend(String mobile, String msg) {
		Client client = Client.create();
		client.addFilter(new HTTPBasicAuthFilter("api", "key-5fe5072b855755dcd808ebe32323db73"));
		WebResource webResource = client.resource("http://sms-api.luosimao.com/v1/send.json");
		MultivaluedMapImpl formData = new MultivaluedMapImpl();
		formData.add("mobile", mobile);
		formData.add("message", msg);
		ClientResponse response = webResource.type(MediaType.APPLICATION_FORM_URLENCODED).post(ClientResponse.class,
				formData);
		String textEntity = response.getEntity(String.class);
		return getSendResult(textEntity);
	}

	private String getSendResult(String text) {
		JSONObject j = JSONObject.fromObject(text);
		if (j.get("error").equals("0")) {
			return "ok";
		} else {
			return j.get("msg").toString();
		}
	}
}
