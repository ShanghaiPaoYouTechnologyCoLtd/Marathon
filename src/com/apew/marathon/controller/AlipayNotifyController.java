package com.apew.marathon.controller;

import java.io.*;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.config.AlipayConfig;
import com.alipay.config.WechatPayConfig;
import com.alipay.util.PayCommonUtil;
import com.alipay.util.StringHelper;
import com.alipay.util.XMLUtil;
import com.apew.marathon.model.OrderModel;
import com.apew.marathon.service.IOrderService;

@Controller
public class AlipayNotifyController extends BaseController {

	@Resource(name = "orderService")
	private IOrderService orderService;

	public void wechat_notify(){
		
	}
	
	@RequestMapping(value = "/alipay_notify", method = RequestMethod.POST)
	public void alipay_notify(HttpServletRequest request, HttpServletResponse response) throws Exception {// 获取支付宝POST过来反馈信息

		System.out.println("支付宝回调**********************************");
		Map<String, String> params = new HashMap<String, String>();
		Map<String, String[]> requestParams = request.getParameterMap();
		for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
			}
			// 乱码解决，这段代码在出现乱码时使用
			valueStr = new String(valueStr);
			params.put(name, valueStr);

		}

		String status = "";

		boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset,
				AlipayConfig.sign_type); // 调用SDK验证签名

		// ——请在这里编写您的程序（以下代码仅作参考）——

		/*
		 * 实际验证过程建议商户务必添加以下校验： 1、需要验证该通知数据中的out_trade_no是否为商户系统中创建的订单号，
		 * 2、判断total_amount是否确实为该订单的实际金额（即商户订单创建时的金额），
		 * 3、校验通知中的seller_id（或者seller_email)
		 * 是否为out_trade_no这笔单据的对应的操作方（有的时候，一个商户可能有多个seller_id/seller_email）
		 * 4、验证app_id是否为该商户本身。
		 */

		System.out.println("支付宝回调*******签名验证***************************" + signVerified);
		if (signVerified) {// 验证成功
			// 商户订单号
			String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "UTF-8");

			// 支付宝交易号
			String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "UTF-8");

			// 交易状态
			String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"), "UTF-8");

			String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"), "UTF-8");

			if (StringHelper.floatValue(total_amount) <=0) {
				status = "fail";
				BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
				out.write(status.getBytes());
				out.flush();
				out.close();
				System.out.println("支付宝回调*******验证金额********不正确*******************");
				return;
			}

			if (trade_status.equals("TRADE_FINISHED") || trade_status.equals("TRADE_SUCCESS")) {
				// 判断该笔订单是否在商户网站中已经做过处理
				// 如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
				// 如果有做过处理，不执行商户的业务程序

				// 注意：
				// 退款日期超过可退款期限后（如三个月可退款），支付宝系统发送该交易状态通知

				OrderModel existOrder = orderService.getOrderDetail(out_trade_no);
				if (null != existOrder && 1 == existOrder.getTradeState()) {
					status = "success";
				} else {
					OrderModel orderDetail = new OrderModel();
					orderDetail.setSerialNum(out_trade_no);
					orderDetail.setOutTradeNo(trade_no);
					orderDetail.setPayType(1);
					orderDetail.setTradeState(1);

					int flag = orderService.updateOrderStatus(orderDetail);

					System.out.println("支付宝回调*******修改订单状态*******************" + flag + "----" + out_trade_no);

					if (flag == 1)
						status = "success";
					else
						status = "fail";
				}

			}

		} else {// 验证失败
			status = "fail";

			// 调试用，写文本函数记录程序运行情况是否正常
			// String sWord = AlipaySignature.getSignCheckContentV1(params);
			// AlipayConfig.logResult(sWord);
		}

		// ——请在这里编写您的程序（以上代码仅作参考）——}

		BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
		out.write(status.getBytes());
		out.flush();
		out.close();

	}
	
	@RequestMapping(value = "/wechat_notify", method = RequestMethod.POST)
	public void weixin_notify(HttpServletRequest request,HttpServletResponse response) throws Exception{  
        //读取参数  
        InputStream inputStream ;  
        StringBuffer sb = new StringBuffer();  
        inputStream = request.getInputStream();  
        String s ;  
        BufferedReader in = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));  
        while ((s = in.readLine()) != null){  
            sb.append(s);  
        }  
        in.close();  
        inputStream.close();  

        //解析xml成map  
        Map<String, String> m = new HashMap<String, String>();  
        m = XMLUtil.doXMLParse(sb.toString());  

        //过滤空 设置 TreeMap  
        SortedMap<Object,Object> packageParams = new TreeMap<Object,Object>();        
        Iterator it = m.keySet().iterator();  
        while (it.hasNext()) {  
            String parameter = (String) it.next();  
            String parameterValue = m.get(parameter);  
              
            String v = "";  
            if(null != parameterValue) {  
                v = parameterValue.trim();  
            }  
            packageParams.put(parameter, v);  
        }  
          
        // 账号信息  
        String key = WechatPayConfig.API_KEY; // key  
  
        //判断签名是否正确  
        if(PayCommonUtil.isTenpaySign("UTF-8", packageParams,key)) {  
            //------------------------------  
            //处理业务开始  
            //------------------------------  
            String resXml = "";  
            if("SUCCESS".equals((String)packageParams.get("result_code"))){  
                // 这里是支付成功  
                //////////执行自己的业务逻辑////////////////  
                String mch_id = (String)packageParams.get("mch_id");  
                String openid = (String)packageParams.get("openid");  
                String is_subscribe = (String)packageParams.get("is_subscribe");  
                String out_trade_no = (String)packageParams.get("out_trade_no");  
                  
                String total_fee = (String)packageParams.get("total_fee");  
                String transaction_id=(String)packageParams.get("transaction_id");  
             //   String nonce_str=(String)packageParams.get("nonce_str");  
                

				OrderModel existOrder = orderService.getOrderDetail(out_trade_no);
				if(existOrder==null){
					existOrder = new OrderModel();
					existOrder.setSerialNum(out_trade_no);
				}
				existOrder.setOutTradeNo(transaction_id);
				existOrder.setTradeState(1);
				existOrder.setPayType(2);
				
				int flag = 0;
				for(int i=0;i<=10;i++){
					flag = orderService.updateOrderStatus(existOrder);
					if(flag==1)
						break;
				}
				if(flag==0)  //没有成功修改状态
					logger.info("订单号"+out_trade_no+";状态修改失败！");
                
                //通知微信.异步确认成功.必写.不然会一直通知后台.八次之后就认为交易失败了.  
                resXml = "<xml>" + "<return_code><![CDATA[SUCCESS]]></return_code>"  
                        + "<return_msg><![CDATA[OK]]></return_msg>" + "</xml> ";  
                  
            } else {  
                logger.info("支付失败,错误信息：" + packageParams.get("err_code"));  
                resXml = "<xml>" + "<return_code><![CDATA[FAIL]]></return_code>"  
                        + "<return_msg><![CDATA[报文为空]]></return_msg>" + "</xml> ";  
            }  
            //------------------------------  
            //处理业务完毕  
            //------------------------------  
            BufferedOutputStream out = new BufferedOutputStream(  
                    response.getOutputStream());  
            out.write(resXml.getBytes());  
            out.flush();  
            out.close();  
        } else{  
            logger.info("通知签名验证失败");  
        }   
    }  
}
