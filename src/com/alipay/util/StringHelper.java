package com.alipay.util;

import java.io.UnsupportedEncodingException;
import java.util.Map;

public class StringHelper {
	
	public static boolean isEmptyStr(String str) {
		return str == null || str.length() == 0 || "null".equals(str);
	}
	
	public static boolean isMobile(String str) {
		if(isEmptyStr(str))
			return false;		
		return str.matches("^[1][3-8]+\\d{9}");
	}
	
	public static float floatValue(String str) {
		try{
			return Float.valueOf(str);
		}catch(Exception ex){
			return 0;
		}
	}
	
	public static long longValue(String str) {
		try{
			return Long.parseLong(str);
		}catch(Exception ex){
			return 0;
		}
	}
	
	public static double doubleValue(String str) {
		try{
			return Double.parseDouble(str);
		}catch(Exception ex){
			return 0;
		}
	}
	
	public static int intValue(String str) {
		try{
			return Integer.parseInt(str);
		}catch(Exception ex){
			return 0;
		}
	}
	
	public static int intValue(String str,int defaultV) {
        try{
            return Integer.parseInt(str);
        }catch(Exception ex){
            return defaultV;
        }
    }
	
	public static String toUtf8String(String str) {
		String result;
		
		try {
			result = str != null ? new String(str.getBytes("ISO-8859-1"), "UTF-8") : str;
		} catch (UnsupportedEncodingException e) {
			result = str;
		}
		
		return result;
	}
	
	/**
	 * isNumber
	 * @param str
	 * @return
	 */
	public static Boolean isNumber(String str){
		try {
			Integer.valueOf(str);
		} catch (Exception e) {
			return false;
		}
		return true;	
	}
	public static Boolean isFloat(String num){
		try {
			Float.valueOf(num);
			//System.out.println(f);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	
	public static  Boolean isTruckNumber(String number){
		String regExWithLicencePlateNumb = "([\u4E00-\u9FA5][A-Z]{1}[A-Z0-9]{5}$)";
		if(number.matches(regExWithLicencePlateNumb)){
			return true;
		}else{
			return false;
		}
	}
	
	public static boolean isArray(Object obj) {
        return (obj != null && obj.getClass().isArray());
    } 
	
	public static String stringFromMap(Map<String,Object> map,String key,String defaultstr){
		if(map==null||!map.containsKey(key))
			return defaultstr;
		String rs= map.get(key)==null?defaultstr:map.get(key).toString();
		return StringHelper.isEmptyStr(rs)?defaultstr:rs;
	}
	
	public static int intFromMap(Map<String,Object> map,String key,int dft){ 
		return StringHelper.intValue(stringFromMap(map,key,dft+""));
	}
	

	public static long longFromMap(Map<String,Object> map,String key,long dft){ 
		return StringHelper.longValue(stringFromMap(map,key,dft+""));
	}
	
	public static float floatFromMap(Map<String,Object> map,String key,float dft){ 
		return StringHelper.floatValue(stringFromMap(map,key,dft+""));
	}
	
}