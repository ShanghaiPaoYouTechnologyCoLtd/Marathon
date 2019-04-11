package com.alipay.util;

import java.io.*;
import java.net.*;
import java.util.*;

import org.apache.commons.httpclient.*;
import org.apache.commons.httpclient.URI;
import org.apache.commons.logging.Log;

public class HttpUtil {
	    private final static int CONNECT_TIMEOUT = 5000; // in milliseconds  
	    private final static String DEFAULT_ENCODING = "UTF-8";  
	      
	    public static String postData(String urlStr, String data){  
	        return postData(urlStr, data, null);  
	    }  
	      
	    public static String postData(String urlStr, String data, String contentType){  
	        BufferedReader reader = null;  
	        try {  
	            URL url = new URL(urlStr);  
	            URLConnection conn = url.openConnection();  
	            conn.setDoOutput(true);  
	            conn.setConnectTimeout(CONNECT_TIMEOUT);  
	            conn.setReadTimeout(CONNECT_TIMEOUT);  
	            if(contentType != null)  
	                conn.setRequestProperty("content-type", contentType);  
	            OutputStreamWriter writer = new OutputStreamWriter(conn.getOutputStream(), DEFAULT_ENCODING);  
	            if(data == null)  
	                data = "";  
	            writer.write(data);   
	            writer.flush();  
	            writer.close();    
	  
	            reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), DEFAULT_ENCODING));  
	            StringBuilder sb = new StringBuilder();  
	            String line = null;  
	            while ((line = reader.readLine()) != null) {  
	                sb.append(line);  
	                sb.append("\r\n");  
	            }  
	            return sb.toString();  
	        } catch (IOException e) {  
	         
	        } finally {  
	            try {  
	                if (reader != null)  
	                    reader.close();  
	            } catch (IOException e) {  
	            }  
	        }  
	        return null;  
	    }  
	    
	    public static String sendGetRequest(String url){
	        BufferedReader in = null;  
	        try {  
	            URL realUrl = new URL(url);  
	            // 打开和URL之间的连接  
	            URLConnection connection = realUrl.openConnection();  
	            // 设置通用的请求属性  
	            connection.setRequestProperty("accept", "*/*");  
	            connection.setRequestProperty("connection", "Keep-Alive");  
	            connection.setRequestProperty("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");  
	            connection.setConnectTimeout(5000);  
	            connection.setReadTimeout(5000);  
	            // 建立实际的连接  
	            connection.connect();  
	            // 定义 BufferedReader输入流来读取URL的响应  
	            in = new BufferedReader(new InputStreamReader(connection.getInputStream()));  
	            StringBuffer sb = new StringBuffer();  
	            String line;  
	            while ((line = in.readLine()) != null) {  
	                sb.append(line);  
	            }  
	            return sb.toString();  
	        } catch (Exception e) {  
	        }  
	        // 使用finally块来关闭输入流  
	        finally {  
	            try {  
	                if (in != null) {  
	                    in.close();  
	                }  
	            } catch (Exception e2) {  
	                e2.printStackTrace();  
	            }  
	        }  
	        return null;  
	    }
}
