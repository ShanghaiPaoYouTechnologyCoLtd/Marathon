package com.apew.marathon.service;

import java.util.List;

import com.apew.marathon.model.OrderModel;

public interface IOrderService {
	
	/**
	 * 创建订单
	 * @param order
	 * @return
	 */
	public int createOrder(OrderModel order);
	
	/**
	 * 支付成功回调处理
	 * @param order
	 * @return
	 */
	public int updateOrderStatus(OrderModel order);
	
	public OrderModel checkOrderByUNAndMobile(String userName,String mobile);
	
	/**
	 * 获取比赛名
	 * @return
	 */
	public String GetKeyValuePair(String key);
	/**
	 * 是否存在一个用户信息
	 * @return  0不存在  1存在于订单表但是未付款，需要前往付款  2已付款或者存在于护照表，无需继续
	 */
	public int IsExist(String name,String cardNo);
	
	/**
	 * 获取订单号
	 * @param name
	 * @param cardNo
	 * @return
	 */
	public String getOrderNum(String name,String cardNo);
	
	/**
	 * 获取订单详情
	 * @param serialNum
	 * @return
	 */
	public OrderModel getOrderDetail(String serialNum);
	
	/**
	 * 获取订单支付状态
	 * @param serialNum
	 * @return
	 */
	public int getOrderTradeStatus(String serialNum);

	
	/**
	 * 后台获取订单列表
	 * @param startTime
	 * @param endTime
	 * @param status
	 * @return
	 */
	public List<OrderModel> getOrderList(String startTime,String endTime,int status,String phoneno,String feeAmount,String coname,int pageNo,int pageSize);
	public int getOrderCount(String startTime,String endTime,int status,String phoneno,String feeAmount,String coname);
	
	/**
	 * 查询合作商列表
	 * @return
	 */
	public List<String> getCooperaterName();
	
	/**
	 * 订单导出
	 * @param startTime
	 * @param endTime
	 * @param status
	 * @return
	 */
	public List<OrderModel> exportOrders(String startTime,String endTime,int status,String phoneno,String feeAmount);
	
	/**
	 * 根据证件号获取护照状态 0未拥有 1已拥有 会查询tb_order与passport两张表
	 * 
	 * @param serialNum
	 * @return
	 */
	public int getPassportStatus(String cardNo);
	
	/**
	 * 获取所有正在进行护照购买的赛事
	 * 
	 * @param currentID 用户传入的赛事ID，为了保证用户体验度，必须将用户传入的赛事展示出来，无论是否已经结束购买，避免用户误解
	 * @return
	 */
	public String getAllRaces(String currentID);

}
