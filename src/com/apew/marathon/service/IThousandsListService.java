package com.apew.marathon.service;

import java.util.List;

import com.apew.marathon.model.OrderModel;

public interface IThousandsListService {
	
	/**
	 * 查找万人名单列表
	 * @param topNum 查找数，小于等于0则全部查找
	 * @return
	 */
	public String TList(int page,int pageSize,String qType);

	/**
	 * 返回行數
	 */
	public Integer TListCount(String qType);
	
	public String queryOnesRanking(String name,String cardno);
}
