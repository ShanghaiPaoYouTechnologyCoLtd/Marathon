package com.apew.marathon.controller;

import java.io.File;

public class FileReader {
	
	//获取所有大banner图
	public static String[] GetAllBigBanner(String basePath) {
		try {
			File file = new File(basePath + "\\upload\\images\\bigBanner\\");
			// 获得该文件夹内的所有文件
			File[] array = file.listFiles();
			String[] filePath = new String[array.length];
			for (int i = 0; i < array.length; i++) {
				filePath[i] = array[i].getName();
			}
			return filePath;
		} catch (Exception e) {
			return null;
		}
	}
}
