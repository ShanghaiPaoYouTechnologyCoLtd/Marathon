package com.apew.marathon.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.write.WriteException;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alipay.util.Base64;
import com.alipay.util.HttpUtil;
import com.alipay.util.SimpleExcelWrites;
import com.alipay.util.StringHelper;
import com.apew.marathon.model.OrderModel;
import com.apew.marathon.service.IOrderService;

/**
 * 后台获取订单列表
 * 
 * @author 37911
 *
 */

@Controller
@RequestMapping(value = "/back")
public class OrderBackController extends BaseController {

	@Resource(name = "orderService")
	private IOrderService orderService;

	@RequestMapping(value = "/order")
	public String toLogin(HttpServletRequest request, HttpServletResponse response) {

		Object sessionUser = request.getSession().getAttribute("user");
		if (null == sessionUser || !"1".equals(sessionUser)) {
			try {
				response.sendRedirect("tologin.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return "orderlist";
	}

	/**
	 * 获取订单列表
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/olist", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String olist(HttpServletRequest request, HttpServletResponse response) {

		String startTime = request.getParameter("startTime");
		String endTime = request.getParameter("endTime");
		String status = request.getParameter("status");
		String phoneno = request.getParameter("phoneno");
		String coName = request.getParameter("coname");
		String feeAmount = request.getParameter("feeamount");
		String name = request.getParameter("name");
		String card = request.getParameter("card");

		if (StringHelper.isEmptyStr(status))
			status = "0";

		String pageNo = request.getParameter("page");
		if (StringHelper.isEmptyStr(pageNo))
			pageNo = "1";

		String pageSize = request.getParameter("limit");
		if (StringHelper.isEmptyStr(pageSize) || "0".equals(pageSize))
			pageSize = "100";

		int totalCount = orderService.getOrderCount(startTime, endTime, Integer.valueOf(status), phoneno, feeAmount,
				coName, name, card);

		List<OrderModel> orderList = orderService.getOrderList(startTime, endTime, Integer.valueOf(status), phoneno,
				feeAmount, coName, name, card, Integer.valueOf(pageNo), Integer.valueOf(pageSize));

		JSONObject jsonObj = new JSONObject();
		jsonObj.put("data", JSONArray.fromObject(orderList).toString());
		jsonObj.put("count", totalCount);
		jsonObj.put("code", 0);

		response.setCharacterEncoding("UTF-8");

		return jsonObj.toString();
	}

	/**
	 * 导出订单列表
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/exportorders")
	@ResponseBody
	public void exportOrders(HttpServletRequest request, HttpServletResponse response) {

		String startTime = request.getParameter("startTime");
		String endTime = request.getParameter("endTime");
		String phoneno = request.getParameter("phoneno");
		String status = request.getParameter("status");

		String feeAmount = request.getParameter("feeamount");
		String coname = request.getParameter("coname");
		String name = request.getParameter("name");
		String card = request.getParameter("card");

		if (StringHelper.isEmptyStr(status))
			status = "0";

		List<OrderModel> listOrders = orderService.exportOrders(startTime, endTime, Integer.valueOf(status), phoneno,
				feeAmount, coname, name, card);
		if (null == listOrders || listOrders.size() == 0)
			return;

		String[][] rsList1 = null;
		rsList1 = new String[listOrders.size()][];

		int count = 0;
		String sex = "";
		for (OrderModel order : listOrders) {
			// 1：男 2：女'
			if (order.getSex() == 1)
				sex = "男";
			if (order.getSex() == 2)
				sex = "女";

			String data[] = { (count + 1) + "", order.getUserName(), order.getPayFee() + "", sex, order.getCardNo(),
					order.getPhoneNo(), order.getCooperateName(), order.getProvince(), order.getCity(),
					order.getDistrict(), order.getAddress() };
			rsList1[count] = data;
			count++;
		}

		// 输出流
		OutputStream os = null;
		try {
			os = response.getOutputStream();
		} catch (IOException e1) {
			e1.printStackTrace();
		} finally {
			response.reset();// 清空输出流
		}

		// 下面是对中文文件名的处理
		response.setCharacterEncoding("UTF-8");// 设置相应内容的编码格式
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		String filename = "报名信息导出" + df.format(new Date()).replaceAll("-| |:", "") + ".xls";
		try {
			if (request.getHeader("User-Agent").toLowerCase().indexOf("firefox") > 0) {
				filename = "=?UTF-8?B?" + (new String(Base64.encode(filename.getBytes("UTF-8")))) + "?=";
				response.setHeader("Content-Disposition",
						"attachment;filename=" + URLEncoder.encode(filename, "UTF-8"));
			} else {
				response.setHeader("Content-Disposition",
						"attachment;filename=" + URLEncoder.encode(filename, "UTF-8"));
			}

		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} // 指定下载的文件名

		response.setContentType("application/msexcel");// 定义输出类型
		SimpleExcelWrites sw = new SimpleExcelWrites();
		String header1[] = { "序号", "跑者姓名", "付款金额", "性别", "证件号", "联系电话", "购买途径", "省份", "城市", "地区", "详细地址" };
		try {
			sw.createExcel1(os, header1, rsList1);
		} catch (WriteException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/unreceiveQuery", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String unreceiveQuery(HttpServletRequest request, HttpServletResponse response) {
		String cardno = request.getParameter("cardno");
		return orderService.getUnreceiveJSON(cardno);
	}

	@RequestMapping(value = "/unreceiveUpload", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String unreceiveUpload(HttpServletRequest request, HttpServletResponse response) {
		String oid = request.getParameter("oid");
		int r = orderService.uploadUnreceive(oid);
		if (r > 0) {
			List<Map<String, Object>> info = orderService.getUnreceiveOrder(oid);
			MessageSendController msc = new MessageSendController();
			msc.sendUnreceiveMsg_byname(info.get(0).get("USER_NAME").toString(), info.get(0).get("RACENAME").toString(),
					info.get(0).get("PHONE_NO").toString());
		}
		return "{\"status\":" + Integer.toString(r) + "}";
	}

	@RequestMapping(value = "/unreceivelist", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String unreceiveList(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("name");
		String card = request.getParameter("card");
		String phone = request.getParameter("phone");
		String status = request.getParameter("status");
		String coname = request.getParameter("coname");
		String page = request.getParameter("page");
		String limit = request.getParameter("limit");

		String data = orderService.getUnreceiveListJSON(name, phone, card, status, coname, page, limit);
		int count = orderService.getUnreceiveListCount(name, phone, card, status, coname, page, limit);

		String jsonResult = "{\"data\": ";
		jsonResult = jsonResult + data;
		jsonResult += ",\"count\": " + count + ",";
		jsonResult += "\"code\": 0}";
		return jsonResult;
	}

	@RequestMapping(value = "/tagUnreceive", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String tagUnreceive(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String tag = request.getParameter("tag");
		int tag_i = Integer.parseInt(tag);
		return "{\"status\":" + Integer.toString(orderService.tagUnreceive(id, tag_i)) + "}";
	}

	@RequestMapping(value = "/receiveList", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String receiveList(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("name");
		String card = request.getParameter("card");
		String phone = request.getParameter("phone");
		String status = request.getParameter("status");
		String coname = request.getParameter("coname");
		String page = request.getParameter("page");
		String limit = request.getParameter("limit");

		String data = orderService.getReceiveListJSON(name, phone, card, status, coname, page, limit);
		int count = orderService.getReceiveListCount(name, phone, card, status, coname, page, limit);

		String jsonResult = "{\"data\": ";
		jsonResult = jsonResult + data;
		jsonResult += ",\"count\": " + count + ",";
		jsonResult += "\"code\": 0}";
		return jsonResult;
	}

	@RequestMapping(value = "/getReceiveExpress", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getReceiveExpress(HttpServletRequest request, HttpServletResponse response) {
		String rid = request.getParameter("id");

		String data = orderService.getReceiveExpress(rid);

		return data;
	}

	@RequestMapping(value = "/getExpressInfo", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getExpressInfo(HttpServletRequest request, HttpServletResponse response) {
		String no = request.getParameter("no");
		String co = request.getParameter("co");

		String data = orderService.getExpressInfo(co, no);

		return data;
	}

	@RequestMapping(value = "/saveExpress", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String saveExpress(HttpServletRequest request, HttpServletResponse response) {
		String no = request.getParameter("no");
		String co = request.getParameter("co");
		String rid = request.getParameter("id");

		String r = orderService.saveExpress(rid, co, no);

		return r;
	}

	@RequestMapping(value = "/uploadNPNO", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String uploadNewPassportNo(HttpServletRequest request, HttpServletResponse response) {
		return "";
		/*String co = request.getParameter("cno");
		String po = request.getParameter("pno");

		String r = orderService.saveNewPassportNo(co, po);
		return r;*/
	}
}
