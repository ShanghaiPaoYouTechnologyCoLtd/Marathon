package com.apew.marathon.service;

import java.util.List;
import java.util.Map;

import com.apew.marathon.model.OrderModel;
import com.apew.marathon.model.RaceModel;

public interface IOrderService {

	/**
	 * 创建订单
	 * 
	 * @param order
	 * @return
	 */
	public int createOrder(OrderModel order);

	/**
	 * 创建订单
	 * 
	 * @param order
	 * @return
	 */
	public int createOrder(String name, String sex, String phone, String cardno,String coop,String payfee,boolean istest);

	/**
	 * 支付成功回调处理
	 * 
	 * @param order
	 * @return
	 */
	public int updateOrderStatus(OrderModel order);

	public OrderModel checkOrderByUNAndMobile(String userName, String mobile);

	/**
	 * 获取比赛名
	 * 
	 * @return
	 */
	public String GetKeyValuePair(String key);

	/**
	 * 获取完整比赛信息
	 * 
	 * @param raceid
	 * @return
	 */
	public RaceModel getRace(Long raceid);

	/**
	 * 是否存在一个用户信息
	 * 
	 * @return 0不存在 1存在于订单表但是未付款，需要前往付款 2已付款或者存在于护照表，无需继续
	 */
	public int IsExist(String name, String cardNo);

	/**
	 * 获取订单号
	 * 
	 * @param name
	 * @param cardNo
	 * @return
	 */
	public String getOrderNum(String name, String cardNo);

	/**
	 * 获取订单详情
	 * 
	 * @param serialNum
	 * @return
	 */
	public OrderModel getOrderDetail(String serialNum);

	/**
	 * 获取订单支付状态
	 * 
	 * @param serialNum
	 * @return
	 */
	public int getOrderTradeStatus(String serialNum);

	/**
	 * 后台获取订单列表
	 * 
	 * @param startTime
	 * @param endTime
	 * @param status
	 * @return
	 */
	public List<OrderModel> getOrderList(String startTime, String endTime, int status, String phoneno, String feeAmount,
			String coname, String name, String card, int pageNo, int pageSize);

	public int getOrderCount(String startTime, String endTime, int status, String phoneno, String feeAmount,
			String coname, String name, String card);

	/**
	 * 查询合作商列表
	 * 
	 * @return
	 */
	public List<String> getCooperaterName();

	/**
	 * 订单导出
	 * 
	 * @param startTime
	 * @param endTime
	 * @param status
	 * @return
	 */
	public List<OrderModel> exportOrders(String startTime, String endTime, int status, String phoneno, String feeAmount,
			String coname, String name, String card);

	/**
	 * 根据证件号获取护照状态 0未拥有 1已拥有 会查询tb_order与passport两张表
	 * 
	 * @param serialNum
	 * @return
	 */
	public int getPassportStatus(String cardNo);

	/**
	 * 获取所有正在进行护照购买的赛事。
	 * 
	 * @param currentID
	 *            用户传入的赛事ID，为了保证用户体验度，必须将用户传入的赛事展示出来，无论是否已经结束购买，避免用户误解
	 * @return
	 */
	public String getAllRaces(boolean isAll, String currentID);

	/**
	 * 根据订单生成护照
	 * 
	 * @param model
	 * @return
	 */
	public boolean genPassport(OrderModel model);

	/**
	 * 根据信息生成护照
	 * 
	 * @param name
	 * @param sex
	 * @param phone
	 * @param cardno
	 * @return
	 */
	public int genPassport(String name, String sex, String phone, String cardno, boolean istest);

	/**
	 * 获取未领取护照信息JSON字符串
	 * 
	 * @param
	 * @return
	 */
	public String getUnreceiveJSON(String cardno);

	/**
	 * 上传未领取护照
	 * 
	 * @param oid
	 * @return
	 */
	public int uploadUnreceive(String oid);

	/**
	 * 获取未领取列表JSON
	 * 
	 * @return
	 */
	public String getUnreceiveListJSON(String name, String phone, String card, String status, String coid, String page,
			String limit);

	/**
	 * 获取未领取列表集合数量
	 */
	public int getUnreceiveListCount(String name, String phone, String card, String status, String coid, String page,
			String limit);

	/**
	 * 修改未领取护照的标记
	 */
	public int tagUnreceive(String id, int tag);

	/**
	 * 添加未领取护照的短信发送次数
	 * 
	 * @return
	 */
	public int addUnreceiveMessageSend(String id);

	/**
	 * 获取未领取护照的单条订单信息
	 */
	public List<Map<String, Object>> getUnreceiveOrder(String oid);

	/**
	 * 标记未领取的护照领取状态，使用订单号作为标识
	 * 
	 * @param oid
	 * @param tag
	 * @return
	 */
	public int tagUnreceiveByOrderID(String oid, int tag);

	/**
	 * 护照查询API
	 * 
	 * @param 证件号
	 * @param 是否启用测试
	 * @return 0没有，1有的
	 */
	public int queryPassport_API(String cardNO, boolean istest);
	
	/**
	 * 护照查询完整完整信息API
	 * 
	 * @param 证件号
	 * @param 是否启用测试
	 * @return 0没有，1有的
	 */
	public String queryPassportInfo_API(String cardNO, boolean istest);
	
	/**
	 * 获取已补领列表数据
	 */
	public String getReceiveListJSON(String name, String phone, String card, String status, String coid, String page,
			String limit);
	
	/**
	 * 获取已补领列表集合数量
	 */
	public int getReceiveListCount(String name, String phone, String card, String status, String coid, String page,
			String limit);
	
	/**
	 * 获取补领快递信息
	 * @param 补领ID
	 * @return
	 */
	public String getReceiveExpress(String rid);
	
	/**
	 * 获取快递信息
	 * @param co
	 * @param no
	 * @return
	 */
	public String getExpressInfo(String co,String no);
	
	/**
	 * 保存快递信息
	 * @param id
	 * @param co
	 * @param no
	 * @return
	 */
	public String saveExpress(String id,String co,String no);
	
	/**
	 * 保存新的护照编号
	 * @param cardno
	 * @param pno
	 * @return
	 */
	public String saveNewPassportNo(String cardno,String pno);
}
