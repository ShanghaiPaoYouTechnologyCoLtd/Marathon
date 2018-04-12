package com.apew.marathon.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Map;
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
import com.alipay.config.WechatPayConfig;
import com.alipay.util.HttpUtil;
import com.alipay.util.PayCommonUtil;
import com.alipay.util.RandomOrder;
import com.alipay.util.StringHelper;
import com.alipay.util.XMLUtil;
import com.apew.marathon.model.OrderModel;
import com.apew.marathon.service.IOrderService;

@Controller
public class OrderController extends BaseController {

	@Resource(name = "orderService")
	private IOrderService orderService;

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

		if (payType == "2") {
			return returnapiParError("微信支付方式暂未开通！");
		}

		String purcahseType = request.getParameter("purcahseType"); // 支付方式
		if (!AlipayConfig.payCashType.containsKey(purcahseType)) {
			return returnapiFail("支付类型错误！");
		}
		float payFee = AlipayConfig.payCashType.get(purcahseType); // 支付金额

		String coName = request.getParameter("coName"); // 合作方名称,可空

		String serialNum = RandomOrder.generateNum().toUpperCase();
		boolean isReadToPay = false;
		int isExist = orderService.IsExist(userName, cardNo);
		if (isExist == 2) {
			return returnapiFail("您已报名,请勿重复提交!");
		} else if (isExist == 1) { // 未付款的订单
			isReadToPay = true;
			serialNum = orderService.getOrderNum(userName, cardNo);
			if (serialNum == null) {
				return returnapiFail("订单提交失败!");
			}
		} else { // 全新的订单
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
			int addCount = orderService.createOrder(orderDetail);
			isReadToPay = addCount > 0;
		}

		if (isReadToPay) {
			JSONObject json = new JSONObject();
			json.put("payType", payType);
			json.put("serialNum", serialNum);
			json.put("payFee", String.valueOf(payFee));

			if (Integer.parseInt(payType.trim()) == 2) { // 微信支付时，同时返回二维码地址
				String wechatPrice = String.valueOf(payFee * 100);
				json.put("QRUrl", weixin_pay(serialNum, wechatPrice));
			}

			return returnapiSuccess("下单成功!", json.toString());
		}

		return returnapiFail("订单提交失败!");

	}

	public String weixin_pay(String tradeNo, String price) throws Exception {
		// 账号信息
		String appid = WechatPayConfig.APP_ID; // appid
		// String appsecret = PayConfigUtil.APP_SECRET; // appsecret
		String mch_id = WechatPayConfig.MCH_ID; // 商业号
		String key = WechatPayConfig.API_KEY; // key

		String currTime = PayCommonUtil.getCurrTime();
		String strTime = currTime.substring(8, currTime.length());
		String strRandom = PayCommonUtil.buildRandom(4) + "";
		String nonce_str = strTime + strRandom;

		String order_price = price.replace(".0", ""); // 价格 注意：价格的单位是分
		String body = "中国马拉松护照"; // 商品名称
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
			String urlCode = getUrlCodeFormXML(resXml);
			String QRCode = QRfromGoogle(urlCode);
			return QRCode;
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
	public String payCheckStatus(String tradeNo) {
		int model = orderService.getOrderTradeStatus(tradeNo);

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
		int status=0;
		try {
			status = orderService.getPassportStatus(cardNo);
		} catch (Exception e) {
			status = -1;
		} finally{
			JSONObject json = new JSONObject();
			json.put("passportStatus", status);
			return json.toString();
		}
	}

}
