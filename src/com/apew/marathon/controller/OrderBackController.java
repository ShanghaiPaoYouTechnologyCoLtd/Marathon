package com.apew.marathon.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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
import com.alipay.util.SimpleExcelWrites;
import com.alipay.util.StringHelper;
import com.apew.marathon.model.OrderModel;
import com.apew.marathon.service.IOrderService;

/**
 * 后台获取订单列表
 * @author 37911
 *
 */

@Controller
@RequestMapping(value = "/back")
public class OrderBackController extends BaseController {
	
	@Resource(name="orderService")
	private IOrderService orderService;
	
	@RequestMapping(value="/order")
	public String toLogin(HttpServletRequest request,
			HttpServletResponse response){
		
		Object sessionUser = request.getSession().getAttribute("user");
		if(null == sessionUser || !"1".equals(sessionUser)){
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
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/olist",produces = "application/json; charset=utf-8")
	@ResponseBody
	public String olist(HttpServletRequest request,
			HttpServletResponse response){
		
		String startTime = request.getParameter("startTime");
		String endTime = request.getParameter("endTime");
		String status = request.getParameter("status");
		String phoneno = request.getParameter("phoneno");
		String coName = request.getParameter("coname");
		String feeAmount = request.getParameter("feeamount");
		
		if(StringHelper.isEmptyStr(status))
			status = "0";
		
		String pageNo = request.getParameter("page");
		if(StringHelper.isEmptyStr(pageNo))
			pageNo = "1";
		
		String pageSize = request.getParameter("limit");
		if(StringHelper.isEmptyStr(pageSize) || "0".equals(pageSize))
			pageSize = "100";
		
		int totalCount = orderService.getOrderCount(startTime, endTime, Integer.valueOf(status),phoneno,feeAmount,coName);
		
		List<OrderModel> orderList = orderService.getOrderList(startTime, endTime, Integer.valueOf(status), phoneno,feeAmount,coName,Integer.valueOf(pageNo), Integer.valueOf(pageSize));
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("data", JSONArray.fromObject(orderList).toString());
		jsonObj.put("count", totalCount);
		jsonObj.put("code", 0);
		
		response.setCharacterEncoding("UTF-8");
		
		return jsonObj.toString();
	}
	
	/**
	 * 导出订单列表
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/exportorders")
	@ResponseBody
	public void exportOrders(HttpServletRequest request,
			HttpServletResponse response){
		
		String startTime = request.getParameter("startTime");
		String endTime = request.getParameter("endTime");
		String phoneno = request.getParameter("phoneno");
		String status = request.getParameter("status");
		
		String feeAmount = request.getParameter("feeamount");
		
		if(StringHelper.isEmptyStr(status))
			status = "0";
		
		List<OrderModel> listOrders = orderService.exportOrders(startTime, endTime, Integer.valueOf(status),phoneno,feeAmount);
		if(null == listOrders || listOrders.size() == 0)
			return;
		
		
		String[][] rsList1 =null;
		rsList1 = new String[listOrders.size()][];
		
		int count = 0;
		String sex = "";
		for(OrderModel order : listOrders){
			//1：男  2：女'
			if(order.getSex() == 1)
				sex = "男";
			if(order.getSex() == 2)
				sex = "女";
			
			String data[] = { (count+1)+"",order.getUserName(),order.getPayFee()+"",sex,order.getCardNo(),order.getPhoneNo()};
			rsList1[count] = data;
			count ++;
		}
		
		 //输出流
        OutputStream os = null;
        try {
            os = response.getOutputStream();
        } catch (IOException e1) {
            e1.printStackTrace();
        }finally{
            response.reset();// 清空输出流
        }
        
        // 下面是对中文文件名的处理
        response.setCharacterEncoding("UTF-8");// 设置相应内容的编码格式
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
        String filename ="报名信息导出" + df.format(new Date()).replaceAll("-| |:", "") + ".xls";
        try
        {
        	if(request.getHeader("User-Agent").toLowerCase().indexOf("firefox")>0){
        		 filename = "=?UTF-8?B?" + (new String(Base64.encode(filename.getBytes("UTF-8")))) + "?=";
        		 response.setHeader("Content-Disposition", "attachment;filename="+URLEncoder.encode(filename, "UTF-8"));
        	}else{
                response.setHeader("Content-Disposition", "attachment;filename="+URLEncoder.encode(filename, "UTF-8"));
        	}

        }
        catch (Exception e1)
        {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }// 指定下载的文件名
        
        
        response.setContentType("application/msexcel");// 定义输出类型
        SimpleExcelWrites sw = new SimpleExcelWrites();
        String header1[] = {"序号","跑者姓名","付款金额","性别","证件号","联系电话"};
        try {
            sw.createExcel1(os, header1, rsList1);
    } catch (WriteException e) {
        e.printStackTrace();
    } catch (IOException e) {
        e.printStackTrace();
    }
	}

}
