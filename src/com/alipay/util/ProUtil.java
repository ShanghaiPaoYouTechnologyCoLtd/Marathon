package com.alipay.util;

import java.io.IOException;
import java.util.Properties;

public class ProUtil {

	private static Properties pro;
	public static String getPro(String key){
		pro = new Properties();
		try {
			pro.load(ProUtil.class.getClassLoader().getResourceAsStream("conf.properties"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pro.getProperty(key);
		
	}
	
	public static void main(String args[]){
		System.out.println(getPro("downpath"));
	}
}
