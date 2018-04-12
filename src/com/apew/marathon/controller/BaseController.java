package com.apew.marathon.controller;

import net.sf.json.JSONObject;

import common.Logger;

public class BaseController {
	
	protected Logger logger = Logger.getLogger(this.getClass());
	
	//参数不完整
	public static String returnapiParError(String message){
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("status", "fail");
		jsonObj.put("message", message);
		
		return jsonObj.toString();
	}
	
	//参数不完整
	public static String returnapiSuccess(String message,String reurnData){
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("status", "ok");
		jsonObj.put("message", message);
		jsonObj.put("data", reurnData);
		
		return jsonObj.toString();
	}
	
	//参数不完整
	public static String returnapiFail(String message){
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("status", "fail");
		jsonObj.put("message", message);
		return jsonObj.toString();
	}
	

}
