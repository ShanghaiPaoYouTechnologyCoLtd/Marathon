package com.apew.marathon.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.SortedMap;
import java.util.TreeMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alipay.config.AlipayConfig;
import com.alipay.config.StaticConfig;
import com.alipay.config.WechatPayConfig;
import com.alipay.util.HttpUtil;
import com.alipay.util.PayCommonUtil;
import com.alipay.util.RandomOrder;
import com.alipay.util.StringHelper;
import com.alipay.util.XMLUtil;
import com.apew.marathon.model.OrderModel;
import com.apew.marathon.model.RaceModel;
import com.apew.marathon.model.ReceiveModel;
import com.apew.marathon.service.IOrderService;
import com.apew.marathon.service.IReceiveService;

@Controller
public class OrderController extends BaseController {

	@Resource(name = "orderService")
	private IOrderService orderService;

	@Resource(name = "receiveService")
	private IReceiveService receiveService;

	/**
	 * 前台点击购买后
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/order", method = RequestMethod.POST)
	@ResponseBody
	public String submitOrder(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String userName = request.getParameter("userName");
		if (StringHelper.isEmptyStr(userName)) {
			return returnapiParError("请填写姓名!");
		}

		// 性别：1：男 2：女
		String sex = request.getParameter("sex");
		if (StringHelper.isEmptyStr(sex)) {
			return returnapiParError("请选择性别!");
		}

		// 证件类型：1。身份证/2。台胞证/3。护照/4.军官证
		String cardType = request.getParameter("cardType");
		if (StringHelper.isEmptyStr(cardType)) {
			return returnapiParError("请选择证件类型!");
		}

		// 证件号
		String cardNo = request.getParameter("cardNo");
		if (StringHelper.isEmptyStr(cardNo)) {
			return returnapiParError("请填写证件号!");
		}

		// 联系电话
		String phoneNo = request.getParameter("phoneNo");
		if (StringHelper.isEmptyStr(phoneNo)) {
			return returnapiParError("请填写联系电话!");
		}

		// '1:支付宝' '2:微信'
		String payType = request.getParameter("payType");
		if (StringHelper.isEmptyStr(payType)) {
			return returnapiParError("请选择支付方式!");
		}

		float payFee = 0f;
		String title = "中国马拉松护照";
		String coName = request.getParameter("coName"); // 合作方名称,可空
		String province = request.getParameter("province");
		String city = request.getParameter("city");
		String district = request.getParameter("district");
		String address = request.getParameter("address");

		coName = coName != null && coName.length() > 0 ? coName.trim() : "4";

		// 20181026逻辑修改，所有情况都需要填写地址 if (coName.equals("4")) { // 在官网购买，必须填写地址
		if (StringHelper.isEmptyStr(province)) {
			return returnapiParError("请选择省份!");
		}
		if (StringHelper.isEmptyStr(city)) {
			return returnapiParError("请选择城市!");
		}
		/*
		 * if (StringHelper.isEmptyStr(district)) { //非必要 return
		 * returnapiParError("请选择地区!"); }
		 */
		if (StringHelper.isEmptyStr(address)) {
			return returnapiParError("请填写详细地址!");
		}

		payFee = 50f;

		if (!coName.equals("4")) {
			try {
				RaceModel race = orderService.getRace(Long.parseLong(coName));
				if (race == null)
					return returnapiParError("赛事未找到!");

				payFee = race.getPrice(); // 新的支付方式
				title = "中国马拉松护照(" + race.getRaceName() + ")";

				// 20180730新增护照购买可增加包装
				/*
				 * String ispack = request.getParameter("pack"); if (ispack !=
				 * null && ispack.equals("1")) { // 精致包装 payFee = 50f; title =
				 * "中国马拉松护照精装版(" + race.getRaceName() + ")"; }
				 */
			} catch (Exception ex) {
				return returnapiParError("赛事未找到!");
			}
		}
		
		// 20181026新增可同时购买VIP，暂时写死价格49.5
		String isvip = request.getParameter("isvip");
		if (isvip != null && isvip.equals("1")) { // 精致包装
			payFee = 49.5f;
			title = "跑友汇VIP（含马拉松护照一本）";
		}

		String testswitch = request.getParameter("test");
		if (testswitch != null && testswitch.equals("1")) { // 测试模式打开
			payFee = 0.01f;
			title = "中国马拉松护照测试数据，本数据不具备法律效应！";
		}

		String serialNum = RandomOrder.generateNum("").toUpperCase();
		boolean isReadToPay = false;
		int isExist = orderService.IsExist(userName, cardNo);
		if (isExist == 2) {
			return returnapiParError("您已拥有中国马拉松护照，请勿重复购买!");
		}
		/*
		 * else if (isExist == 1) { // 未付款的订单 //将未付款的订单提出来，会导致用户修改数据无效
		 * isReadToPay = true; serialNum = orderService.getOrderNum(userName,
		 * cardNo); if (serialNum == null) { return returnapiFail("订单提交失败!"); }
		 * }
		 */
		else { // 全新的订单
			OrderModel orderDetail = new OrderModel();
			orderDetail.setSerialNum(serialNum);
			orderDetail.setUserName(userName.trim());
			orderDetail.setSex(Integer.valueOf(sex));
			orderDetail.setCardType(Integer.valueOf(cardType));
			orderDetail.setCardNo(cardNo);
			orderDetail.setPhoneNo(phoneNo.trim());
			orderDetail.setPayType(Integer.valueOf(payType));
			orderDetail.setPayFee(payFee);
			orderDetail.setOutTradeNo(RandomOrder.getCurrentTime());
			orderDetail.setCooperaterName(coName);
			orderDetail.setProvince(province);
			orderDetail.setCity(city);
			orderDetail.setDistrict(district);
			orderDetail.setAddress(address);
			int addCount = orderService.createOrder(orderDetail);
			isReadToPay = addCount > 0;
		}

		String isCommonPay = request.getParameter("commonpay");
		if (isCommonPay == null || isCommonPay.length() == 0) {
			isCommonPay = "0";
		}

		if (isReadToPay) {
			JSONObject json = new JSONObject();
			json.put("payType", payType);
			json.put("serialNum", serialNum);
			json.put("payFee", String.valueOf(payFee));
			json.put("title", title);
			if (isCommonPay.equals("1")) { // 微信公众号支付
				// 与支付宝支付返回相同结果,此处暂不做任何操作
				json.put("payFee", String.valueOf(payFee * 100));
			} else if (Integer.parseInt(payType.trim()) == 2) { // 微信二维码支付，同时返回二维码地址
				String wechatPrice = String.valueOf(payFee * 100);
				json.put("QRUrl", weixin_pay(serialNum, wechatPrice, title));
			}

			return returnapiSuccess("下单成功!", json.toString());
		}

		return returnapiFail("订单提交失败!");

	}

	@RequestMapping(value = "/receive", method = RequestMethod.POST)
	@ResponseBody
	public String reReceive(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String userName = request.getParameter("name");
		String phoneno = request.getParameter("phone");
		String province = request.getParameter("province");
		String city = request.getParameter("city");
		String district = request.getParameter("district");
		String address = request.getParameter("address");
		String paytype = request.getParameter("paytype");
		String payfee_str = request.getParameter("payfee");
		String orderid = request.getParameter("orderid");
		String title = "中国马拉松护照补领快递费";
		String serialNum = RandomOrder.generateNum(StaticConfig.Receive_Express_TradeNo_Prev).toUpperCase();

		if (StringHelper.isEmptyStr(userName)) {
			return returnapiParError("请输入姓名!");
		}
		if (StringHelper.isEmptyStr(phoneno)) {
			return returnapiParError("请输入手机号!");
		}
		if (StringHelper.isEmptyStr(province)) {
			return returnapiParError("请选择省份!");
		}
		if (StringHelper.isEmptyStr(city)) {
			return returnapiParError("请选择城市!");
		}
		if (StringHelper.isEmptyStr(address)) {
			return returnapiParError("请填写详细地址!");
		}
		if (StringHelper.isEmptyStr(paytype)) {
			paytype = "1"; // 默认支付宝支付
		}
		if (StringHelper.isEmptyStr(payfee_str)) {
			return returnapiParError("支付价格错误!");
		}
		// 所有验证通过，开始做事了
		float payfee = Float.parseFloat(payfee_str);
		String testswitch = request.getParameter("test");
		if (testswitch != null && testswitch.equals("1")) { // 测试模式打开
			payfee = 0.01f;
			title = "中国马拉松护照快递费测试数据，本数据不具备法律效应！";
		}
		if (receiveService.isPaid(orderid)) {
			return returnapiParError("您已提交重领申请，请等待!");
		}

		ReceiveModel rm = new ReceiveModel();
		rm.Address = address;
		rm.City = city;
		rm.District = district;
		rm.Province = province;
		rm.ExpressCo = "";
		rm.ExpressNo = "";
		rm.OrderID = Integer.parseInt(orderid);
		rm.PayFee = payfee;
		rm.PayTime = null;
		rm.PayType = Integer.parseInt(paytype);
		rm.Phone = phoneno;
		rm.Status = 0;
		rm.TradeNo = serialNum;
		rm.OutTradeNo = "";
		int i = receiveService.createModel(rm);
		if (i == 0) {
			return returnapiParError("网络错误提交失败!");
		}

		JSONObject json = new JSONObject();
		json.put("payType", paytype);
		json.put("serialNum", serialNum);
		json.put("payFee", String.valueOf(payfee));
		json.put("title", title);
		if (Integer.parseInt(paytype.trim()) == 2) { // 微信支付时，同时返回二维码地址
			String wechatPrice = String.valueOf(payfee * 100);
			json.put("QRUrl", weixin_pay(serialNum, wechatPrice, title));
		}

		return returnapiSuccess("下单成功!", json.toString());
	}

	public String weixin_pay(String tradeNo, String price, String title) throws Exception {
		// 账号信息
		String appid = WechatPayConfig.APP_ID; // appid

		String mch_id = WechatPayConfig.MCH_ID; // 商业号
		String key = WechatPayConfig.API_KEY; // key

		String currTime = PayCommonUtil.getCurrTime();
		String strTime = currTime.substring(8, currTime.length());
		String strRandom = PayCommonUtil.buildRandom(4) + "";
		String nonce_str = strTime + strRandom;

		String order_price = price.replace(".0", ""); // 价格 注意：价格的单位是分
		String body = title;// 商品名称
		String out_trade_no = tradeNo; // 订单号

		// 获取发起电脑 ip
		String spbill_create_ip = WechatPayConfig.CREATE_IP;
		// 回调接口
		String notify_url = WechatPayConfig.NOTIFY_URL;
		String trade_type = "NATIVE";

		SortedMap<Object, Object> packageParams = new TreeMap<Object, Object>();
		packageParams.put("appid", appid);
		packageParams.put("mch_id", mch_id);
		packageParams.put("nonce_str", nonce_str);
		packageParams.put("body", body);
		packageParams.put("out_trade_no", out_trade_no);
		packageParams.put("total_fee", order_price);
		packageParams.put("spbill_create_ip", spbill_create_ip);
		packageParams.put("notify_url", notify_url);
		packageParams.put("trade_type", trade_type);

		String sign = PayCommonUtil.createSign("UTF-8", packageParams, key);
		packageParams.put("sign", sign);

		String requestXML = PayCommonUtil.getRequestXml(packageParams);
		System.out.println(requestXML);

		String resXml = HttpUtil.postData(WechatPayConfig.UFDODER_URL, requestXML);

		if (resXml.indexOf(xmlCodeStartSymbol) >= 0 && resXml.indexOf(xmlCodeEndSymbol) >= 0) {
			String QRCode = getUrlCodeFormXML(resXml);
			return QRCode;
			/*
			 * String QRCode = QRfromGoogle(urlCode); //接口不稳定 return QRCode;
			 */
		} else {
			return "QRCODE_ERROR";
		}
	}

	private static String xmlCodeStartSymbol = "<code_url><![CDATA[";
	private static String xmlCodeEndSymbol = "]]></code_url>";

	public static String getUrlCodeFormXML(String xmlStr) {
		try {
			String urlCode = xmlStr.substring(xmlStr.indexOf(xmlCodeStartSymbol) + xmlCodeStartSymbol.length());
			urlCode = urlCode.substring(0, urlCode.lastIndexOf(xmlCodeEndSymbol));
			return urlCode;
		} catch (Exception e) {
			return "QRCODE_ERROR";
		}
	}

	public static String getElementValueFormXML(String xmlStr, String start, String end) {
		try {
			String urlCode = xmlStr.substring(xmlStr.indexOf(start) + start.length());
			urlCode = urlCode.substring(0, urlCode.lastIndexOf(end));
			return urlCode;
		} catch (Exception e) {
			return "-1";
		}
	}

	// 从google生成二维码
	public static String QRfromGoogle(String chl) throws Exception {
		int widhtHeight = 300;
		chl = UrlEncode(chl);

		String QRCode = "http://pan.baidu.com/share/qrcode?w=" + widhtHeight + "&h=" + widhtHeight + "&url=" + chl;

		return QRCode;
	}

	// 特殊字符处理
	public static String UrlEncode(String src) throws UnsupportedEncodingException {
		return URLEncoder.encode(src, "UTF-8").replace("+", "%20");
	}

	@RequestMapping(value = "/payCheck", method = RequestMethod.POST)
	@ResponseBody
	public String payCheckStatus(String tradeNo, String tradeType) {
		int model = 0;
		if (tradeType.equals("2")) {
			model = receiveService.getTradeStatus(tradeNo);
		} else {
			model = orderService.getOrderTradeStatus(tradeNo);
		}

		JSONObject json = new JSONObject();
		if (model == 0) {
			json.put("payStatus", 0);
			return returnapiSuccess("尚未检测到付款信息!", json.toString());
		} else {
			json.put("payStatus", 1);
			return returnapiSuccess("付款成功!", json.toString());
		}
	}

	/**
	 * 查询证件号下的护照状态
	 * 
	 * @return 0未拥有 1已拥有
	 * @throws Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/queryPassport", method = RequestMethod.GET)
	@ResponseBody
	public String queryPassport(String cardNo) throws Exception {
		int status = 0;
		try {
			status = orderService.getPassportStatus(cardNo);
		} catch (Exception e) {
			status = -1;
		} finally {
			JSONObject json = new JSONObject();
			json.put("passportStatus", status);
			return json.toString();
		}
	}

	@RequestMapping(value = "/getAllRaces", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getAllRaces(String currentID, int isAll) throws Exception {
		return orderService.getAllRaces(isAll == 1, currentID);
	}

	private static String xmlPrepayStartSymbol = "<prepay_id><![CDATA[";
	private static String xmlPrepayEndSymbol = "]]></prepay_id>";

	@RequestMapping(value = "/commonPay", method = RequestMethod.GET)
	@ResponseBody
	public void weixinCommonPay(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String code = request.getParameter("code");
		String url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=wxd7036ba1c611afa6&secret=ac6e6a356399ce05d8d05f7469d59a56&code="
				+ code + "&grant_type=authorization_code";

		String openidJsonRes = HttpUtil.sendGetRequest(url);
		JSONObject openidJson = JSONObject.fromObject(openidJsonRes);
		String openid = "";
		try {
			openid = openidJson.get("openid").toString();
		} catch (Exception ex) {
			response.getWriter().print("openid获取失败！" + openidJson);
			return;
		}

		String order_price = request.getParameter("payfee");
		String body = request.getParameter("title");
		String tradeNo = request.getParameter("tradeno");
		if (order_price == null || order_price.length() == 0) {
			response.getWriter().print("价格获取失败");
			return;
		}
		if (body == null || body.length() == 0) {
			response.getWriter().print("商品名称获取失败");
			return;
		}

		String test = request.getParameter("test"); // 开启测试
		if (test != null && test.equals("1")) {
			order_price = "1";
			body = "中国马拉松联盟测试数据，不具备法律效应，请勿下单";
		}

		String prepayid = "";
		String appid = WechatPayConfig.APP_ID;
		String mch_id = WechatPayConfig.MCH_ID;
		String key = WechatPayConfig.API_KEY;

		String currTime = PayCommonUtil.getCurrTime();
		String strTime = currTime.substring(8, currTime.length());
		String strRandom = PayCommonUtil.buildRandom(4) + "";
		String nonce_str = strTime + strRandom;

		// 获取发起电脑 ip
		String spbill_create_ip = WechatPayConfig.CREATE_IP;
		// 回调接口
		String notify_url = WechatPayConfig.NOTIFY_URL;

		SortedMap<Object, Object> packageParams = new TreeMap<Object, Object>();
		packageParams.put("appid", appid);
		packageParams.put("body", body);
		packageParams.put("mch_id", mch_id);
		packageParams.put("device_info", nonce_str);
		packageParams.put("nonce_str", nonce_str);
		packageParams.put("openid", openid);
		packageParams.put("out_trade_no", tradeNo);
		packageParams.put("spbill_create_ip", spbill_create_ip);
		packageParams.put("total_fee", order_price);
		packageParams.put("trade_type", "JSAPI");
		packageParams.put("notify_url", WechatPayConfig.NOTIFY_URL);

		String sign = PayCommonUtil.createSign("UTF-8", packageParams, key);
		packageParams.put("sign", sign);

		String requestXML = PayCommonUtil.getRequestXml(packageParams);
		// System.out.println(requestXML);

		String resXml = HttpUtil.postData(WechatPayConfig.ORDER_URL, requestXML);

		if (resXml.indexOf(xmlPrepayStartSymbol) >= 0 && resXml.indexOf(xmlPrepayEndSymbol) >= 0) {
			prepayid = getElementValueFormXML(resXml, xmlPrepayStartSymbol, xmlPrepayEndSymbol);
		} else {
			response.getWriter().print(resXml);
			return;
		}

		String timeStamp = genTimeStamp();

		SortedMap<Object, Object> payMap = new TreeMap<Object, Object>();
		payMap.put("appId", appid);
		payMap.put("timeStamp", timeStamp);
		payMap.put("nonceStr", nonce_str);
		payMap.put("package", "prepay_id=" + prepayid);
		payMap.put("signType", "MD5");

		String paySign = PayCommonUtil.createSign("UTF-8", payMap, key);

		// 拼接并返回json
		StringBuilder sBuilder = new StringBuilder("[{");
		sBuilder.append("appid:'").append(appid).append("',").append("timeStamp:'").append(timeStamp).append("',")
				.append("nonceStr:'").append(nonce_str).append("',").append("pg:'").append(prepayid).append("',")
				.append("signType:'MD5',").append("paySign:'").append(paySign).append("'");
		sBuilder.append("}]");
		response.getWriter().print(sBuilder.toString());
		response.getWriter().close();
	}

	private String genTimeStamp() {
		return String.valueOf(System.currentTimeMillis() / 1000);
	}

}
