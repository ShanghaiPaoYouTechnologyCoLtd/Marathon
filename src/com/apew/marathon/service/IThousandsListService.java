package com.apew.marathon.service;

import java.util.List;

import com.apew.marathon.model.OrderModel;

public interface IThousandsListService {
	
	/**
	 * 查找万人名单列表
	 * @param topNum 查找数，小于等于0则全部查找
	 * @return
	 */
	public String TList(int page,int pageSize,String qType,int gtype);

	/**
	 * 返回行數
	 */
	public Integer TListCount(String qType,int gtype);
	
	public String queryOnesRanking(String name,String cardno);
	
	/**
	 * 获取用户在选手名单中的状态
	 * 0在万人名单中 1在千人名单中 2不在名单中
	 * @return
	 */
	public int getPlayerStatusInList(String cardno);
	
	public boolean raceExists(String raceID);
	
	/**
	 * 获取免费名额剩余数
	 * @param raceID
	 * @return
	 */
	public int getRemainFreeQuotas(String raceID);
	
	/**
	 * 获取付费名额剩余数
	 * @param raceID
	 * @return
	 */
	public int getRemainPaidQuotas(String raceID);
	
	/**
	 * 检查选手是否已在赛事下获得名额
	 * @param cardNo
	 * @param raceID
	 * @return
	 */
	public boolean playerInRace(String cardNo,String raceID);
}
