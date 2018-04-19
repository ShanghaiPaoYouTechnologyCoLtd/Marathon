package com.apew.marathon.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.alipay.util.StringHelper;
import com.apew.marathon.model.OrderModel;
import com.apew.marathon.service.BaseService;
import com.apew.marathon.service.IOrderService;

@Service("orderService")
public class OrderServiceImpl extends BaseService<OrderModel> implements IOrderService {

	public int createOrder(OrderModel order) {
		String sql = "INSERT INTO `tb_order` (`SERIAL_NUM`,`USER_NAME`,`SEX`,`CARD_TYPE`,`CARD_NO`,`PHONE_NO`,`PAY_TYPE`,`PAY_FEE`,`ORDER_TIME`,`CREATE_TIME`,`COOPERATER_NAME`,`PROVINCE`,`CITY`,`DISTRICT`,`ADDRESS`) VALUES "
				+ "(?,?,?,?,?,?,?,?,NOW(),NOW(),?,?,?,?,?)";

		int count = create(sql,
				new Object[] { order.getSerialNum(), order.getUserName(), order.getSex(), order.getCardType(),
						order.getCardNo(), order.getPhoneNo(), order.getPayType(), order.getPayFee(),
						order.getCooperateName(), order.getProvince(), order.getCity(), order.getDistrict(),
						order.getAddress() });
		return count;
	}

	public String GetKeyValuePair(String key) {
		try
		{
		String sql = "SELECT * FROM KeyValuePair Where id=? limit 1";
		Map<String, Object> map = queryForMap(sql, new Object[] { key });
		if(map==null || map.size()==0)
			return "";
		return map.get("value").toString();
		}catch(Exception e){
			return "";
		}finally{}
	}

	@Override
	public int updateOrderStatus(OrderModel order) {
		String sql = "UPDATE `tb_order` SET `TRADE_STATE`=?,`OUT_TRADE_NO`=?,`PAY_TIME`=NOW() WHERE `SERIAL_NUM`=?";

		return update(sql, new Object[] { order.getTradeState(), order.getOutTradeNo(), order.getSerialNum() });
	}

	public int getOrderTradeStatus(String serialNum) {
		String sql = "select TRADE_STATE from tb_order where SERIAL_NUM=? ";
		Map<String, Object> r = queryForMap(sql, new Object[] { serialNum });
		if (r == null || r.size() == 0 || r.get("TRADE_STATE") == null) // 不存在于订单表
			return 0;

		int tradeState = Integer.parseInt(String.valueOf(r.get("TRADE_STATE")));
		return tradeState;
	}

	public int IsExist(String name, String cardNo) {
		String sql = "select COUNT(1) from passport where name=? and id_card=? and enable=1"; // 首先验证护照表是否已存在
		int r2 = queryForInt(sql, new Object[] { name, cardNo });
		if (r2 > 0) // 已存在于护照表
			return 2;

		sql = "select TRADE_STATE from tb_order where  USER_NAME=? and CARD_NO=? order by ID DESC LIMIT 1";
		Map<String, Object> r = queryForMap(sql, new Object[] { name, cardNo });
		if (r == null || r.size() == 0 || r.get("TRADE_STATE") == null) // 不存在于订单表
			return 0;

		int tradeState = Integer.parseInt(String.valueOf(r.get("TRADE_STATE")));

		if (tradeState == 0) {
			return 1;
		} else if (tradeState == 1) {
			return 2;
		}

		return 2;
	}

	public String getOrderNum(String name, String cardNo) {
		String sql = "select SERIAL_NUM from tb_order where  USER_NAME=? and CARD_NO=?";
		Map<String, Object> r = queryForMap(sql, new Object[] { name, cardNo });

		if (r == null || r.size() == 0 || r.get("SERIAL_NUM") == null) // 不存在于订单表
			return null;

		return r.get("SERIAL_NUM").toString();
	}

	public OrderModel checkOrderByUNAndMobile(String userName, String mobile) {
		String sql = "SELECT `ID`,`SERIAL_NUM`,`USER_NAME`,`SEX`,`CARD_TYPE`,`CARD_NO`,`PHONE_NO`,"
				+ "`PAY_TYPE`,`OUT_TRADE_NO`,`TRADE_STATE`,`PAY_FEE`,"
				+ "`ORDER_TIME`,`PAY_TIME`,`CREATE_TIME`,`COOPERATER_NAME` FROM `tb_order` WHERE `USER_NAME`=? AND `PHONE_NO`=? AND `TRADE_STATE`=1 LIMIT 1";
		return queryForObject(sql, new Object[] { userName, mobile }, OrderModel.class);
	}

	public OrderModel getOrderDetail(String serialNum) {
		String sql = "SELECT `ID`,`SERIAL_NUM`,`USER_NAME`,`SEX`,`CARD_TYPE`,`CARD_NO`,`PHONE_NO`,"
				+ "`PAY_TYPE`,`OUT_TRADE_NO`,`TRADE_STATE`,`PAY_FEE`,"
				+ "`ORDER_TIME`,`PAY_TIME`,`CREATE_TIME`,`COOPERATER_NAME` FROM `tb_order` WHERE `SERIAL_NUM`=?";
		return queryForObject(sql, new Object[] { serialNum }, OrderModel.class);
	}

	@Override
	public List<OrderModel> getOrderList(String startTime, String endTime, int status, String phoneno, String feeAmount,
			String coname, int pageNo, int pageSize) {

		pageNo = (pageNo - 1) * pageSize;

		String sql = "SELECT `ID`,`SERIAL_NUM`,`USER_NAME`,`SEX`,`CARD_TYPE`,`CARD_NO`,`PHONE_NO`,"
				+ "`PAY_TYPE`,`OUT_TRADE_NO`,`TRADE_STATE`,`PAY_FEE`,"
				+ "`ORDER_TIME`,`PAY_TIME`,`CREATE_TIME`,`COOPERATER_NAME` FROM `tb_order` WHERE `TRADE_STATE`=1 ";

		if (!StringHelper.isEmptyStr(phoneno)) {
			sql += " and PHONE_NO LIKE '%" + phoneno + "%' ";
		}
		if (!StringHelper.isEmptyStr(feeAmount))
			sql += " and `PAY_FEE`=" + feeAmount;
		if (!StringHelper.isEmptyStr(coname))
			sql += " and `COOPERATER_NAME`='" + coname + "'";

		if (!StringHelper.isEmptyStr(startTime) && !StringHelper.isEmptyStr(endTime)) {
			sql += " and DATE_FORMAT(`PAY_TIME`,'%Y-%m-%d') between  DATE_FORMAT('" + startTime
					+ "','%Y-%m-%d') and DATE_FORMAT('" + endTime + "','%Y-%m-%d') ";
		}

		sql += " order by `CREATE_TIME` desc limit ?,? ";

		return queryForList(sql, new Object[] { pageNo, pageSize }, OrderModel.class);
	}

	@Override
	public int getOrderCount(String startTime, String endTime, int status, String phoneno, String feeAmount,
			String coname) {
		String sql = "SELECT COUNT(1) FROM `tb_order` WHERE `TRADE_STATE`=1 ";
		if (!StringHelper.isEmptyStr(phoneno)) {
			sql += " and PHONE_NO LIKE '%" + phoneno + "%' ";
		}
		if (!StringHelper.isEmptyStr(feeAmount))
			sql += " and `PAY_FEE`=" + feeAmount;
		if (!StringHelper.isEmptyStr(coname))
			sql += " and `COOPERATER_NAME`='" + coname + "'";

		if (!StringHelper.isEmptyStr(startTime) && !StringHelper.isEmptyStr(endTime)) {
			sql += " and DATE_FORMAT(`PAY_TIME`,'%Y-%m-%d') between  DATE_FORMAT('" + startTime
					+ "','%Y-%m-%d') and DATE_FORMAT('" + endTime + "','%Y-%m-%d') ";
		}

		Integer totalCount = queryForInt(sql, new Object[] {});
		totalCount = totalCount == null ? 0 : totalCount;
		return totalCount;
	}

	public List getCooperaterName() {
		String sql = "SELECT distinct COOPERATER_NAME FROM tb_order WHERE COOPERATER_NAME IS NOT NULL  AND LENGTH(COOPERATER_NAME)>0  ";
		return queryForObjectList(sql, new Object[] {}, String.class);
	}

	@Override
	public List<OrderModel> exportOrders(String startTime, String endTime, int status, String phoneno,
			String feeAmount) {
		String sql = "SELECT `ID`,`SERIAL_NUM`,`USER_NAME`,`SEX`,`CARD_TYPE`,`CARD_NO`,`PHONE_NO`,"
				+ "`PAY_TYPE`,`OUT_TRADE_NO`,`TRADE_STATE`,`PAY_FEE`,"
				+ "`ORDER_TIME`,`PAY_TIME`,`CREATE_TIME`,`COOPERATER_NAME` FROM `tb_order` WHERE `TRADE_STATE`=1 ";
		if (!StringHelper.isEmptyStr(phoneno)) {
			sql += " and PHONE_NO LIKE '%" + phoneno + "%' ";
		}
		if (!StringHelper.isEmptyStr(feeAmount))
			sql += " and `PAY_FEE`=" + feeAmount;

		if (!StringHelper.isEmptyStr(startTime) && !StringHelper.isEmptyStr(endTime)) {
			sql += " and DATE_FORMAT(`PAY_TIME`,'%Y-%m-%d') between  DATE_FORMAT('" + startTime
					+ "','%Y-%m-%d') and DATE_FORMAT('" + endTime + "','%Y-%m-%d') ";
		}

		sql += " order by `CREATE_TIME` desc ";

		return queryForList(sql, new Object[] {}, OrderModel.class);
	}

	public int getPassportStatus(String cardNo) {

		String sql = "SELECT COUNT(1) FROM tb_order WHERE CARD_NO=? AND TRADE_STATE=1";
		Integer totalCount = queryForInt(sql, new Object[] { cardNo });
		if (totalCount > 0) // 已创建订单，代表已有护照
			return 1;

		sql = "SELECT COUNT(1) FROM passport WHERE enable=1 and id_card=?";
		totalCount = queryForInt(sql, new Object[] { cardNo });
		if (totalCount > 0) // passport表已有信息
			return 1;

		return 0;
	}

}
