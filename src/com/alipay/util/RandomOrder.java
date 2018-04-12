package com.alipay.util;

import java.util.Calendar;
import java.util.UUID;

/**
 * 随机生成订单号
 * @author CPL
 *
 */
public class RandomOrder {
	
	public static String key = "E";
	
	
	public static String generateNum() {
		return UUID.randomUUID().toString().replace("-", "");
	}
	
	
	
	public static String getCurrentTime(){
		
		Calendar   c   =   Calendar.getInstance();//可以用set()对每个时间域单独修改      
		  int   year   =   c.get(Calendar.YEAR);      
		//一般month都需要+1才表示当前月份    
		  int   month   =   c.get(Calendar.MONTH);      
		  int   date   =   c.get(Calendar.DATE);      
		  int   hour   =   c.get(Calendar.HOUR_OF_DAY);      
		  int   minute   =   c.get(Calendar.MINUTE);      
		  int   second   =   c.get(Calendar.SECOND);      
		  String nowTime = year + "/" + month + "/" + date + "   " +hour + ":" + minute + ":" + second; 
		  return nowTime;
		
	}

}
