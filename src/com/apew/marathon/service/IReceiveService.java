package com.apew.marathon.service;

import com.apew.marathon.model.ReceiveModel;

public interface IReceiveService {
	/**
	 * 创建
	 * 
	 * @return
	 */
	public int createModel(ReceiveModel rm);

	/**
	 * 获取
	 * 
	 * @return
	 */
	public ReceiveModel getModel(String tradeno);

	/**
	 * 修改
	 * 
	 * @param rm
	 * @return
	 */
	public int updateModel(ReceiveModel rm);

	/**
	 * 是否已经为重领支付过
	 * 
	 * @param tradeno
	 * @return
	 */
	public boolean isPaid(String tradeno);

	/**
	 * 获取交易状态
	 * @param id
	 * @return
	 */
	public int getTradeStatus(String id);
	
	
	public int insertLog(String log);
}
