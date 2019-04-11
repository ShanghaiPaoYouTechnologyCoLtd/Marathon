package com.apew.marathon.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.alipay.util.RandomOrder;
import com.alipay.util.StringHelper;
import com.alipay.util.HttpUtil;
import com.apew.marathon.model.OrderModel;
import com.apew.marathon.model.RaceModel;
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

	@Override
	public int createOrder(String name, String sex, String phone, String cardno, String coop, String payfee,
			boolean istest) {
		String sql = "INSERT INTO `" + (istest ? "tb_order_test" : "tb_order")
				+ "` (`SERIAL_NUM`,`USER_NAME`,`SEX`,`CARD_TYPE`,`CARD_NO`,`PHONE_NO`,`PAY_TYPE`,`PAY_FEE`,`ORDER_TIME`,`CREATE_TIME`,`COOPERATER_NAME`,`PROVINCE`,`CITY`,`DISTRICT`,`ADDRESS`) VALUES "
				+ "(?,?,?,?,?,?,?,?,NOW(),NOW(),?,?,?,?,?)";

		String serialNum = RandomOrder.generateNum("").toUpperCase();
		int count = create(sql,
				new Object[] { serialNum, name, sex, "1", cardno, phone, "3", payfee, coop, "", "", "", "" });
		return count;
	}

	public String GetKeyValuePair(String key) {
		try {
			String sql = "SELECT * FROM KeyValuePair Where id=? limit 1";
			Map<String, Object> map = queryForMap(sql, new Object[] { key });
			if (map == null || map.size() == 0)
				return "";
			return map.get("value").toString();
		} catch (Exception e) {
			return "";
		} finally {
		}
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
			String coname, String name, String card, int pageNo, int pageSize) {

		pageNo = (pageNo - 1) * pageSize;

		String sql = "SELECT `ID`,`OUT_TRADE_NO`,`USER_NAME`,`SEX`,`CARD_TYPE`,`CARD_NO`,`PHONE_NO`,"
				+ "`PAY_TYPE`,`OUT_TRADE_NO`,`TRADE_STATE`,`PAY_FEE`,"
				+ "`ORDER_TIME`,`PAY_TIME`,`CREATE_TIME`,(SELECT racename FROM RACES WHERE id=COOPERATER_NAME) as COOPERATER_NAME FROM `tb_order`  WHERE `TRADE_STATE`=1 ";

		if (!StringHelper.isEmptyStr(phoneno)) {
			sql += " and PHONE_NO LIKE '%" + phoneno + "%' ";
		}
		if (!StringHelper.isEmptyStr(feeAmount))
			sql += " and `PAY_FEE`=" + feeAmount;
		if (!StringHelper.isEmptyStr(coname))
			sql += " and `COOPERATER_NAME`='" + coname + "'";
		if (!StringHelper.isEmptyStr(name))
			sql += " and `USER_NAME`='" + name + "'";
		if (!StringHelper.isEmptyStr(card))
			sql += " and `CARD_NO`='" + card + "'";

		if (!StringHelper.isEmptyStr(startTime) && !StringHelper.isEmptyStr(endTime)) {
			sql += " and DATE_FORMAT(`PAY_TIME`,'%Y-%m-%d') between  DATE_FORMAT('" + startTime
					+ "','%Y-%m-%d') and DATE_FORMAT('" + endTime + "','%Y-%m-%d') ";
		}

		sql += " order by `CREATE_TIME` desc limit ?,? ";

		return queryForList(sql, new Object[] { pageNo, pageSize }, OrderModel.class);
	}

	@Override
	public int getOrderCount(String startTime, String endTime, int status, String phoneno, String feeAmount,
			String coname, String name, String card) {
		String sql = "SELECT COUNT(1) FROM `tb_order` WHERE `TRADE_STATE`=1 ";
		if (!StringHelper.isEmptyStr(phoneno)) {
			sql += " and PHONE_NO LIKE '%" + phoneno + "%' ";
		}
		if (!StringHelper.isEmptyStr(feeAmount))
			sql += " and `PAY_FEE`=" + feeAmount;
		if (!StringHelper.isEmptyStr(coname))
			sql += " and `COOPERATER_NAME`='" + coname + "'";
		if (!StringHelper.isEmptyStr(name))
			sql += " and `USER_NAME`='" + name + "'";
		if (!StringHelper.isEmptyStr(card))
			sql += " and `CARD_NO`='" + card + "'";

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
	public List<OrderModel> exportOrders(String startTime, String endTime, int status, String phoneno, String feeAmount,
			String coname, String name, String card) {
		String sql = "SELECT `ID`,`OUT_TRADE_NO`,`USER_NAME`,`SEX`,`CARD_TYPE`,`CARD_NO`,`PHONE_NO`,"
				+ "`PAY_TYPE`,`OUT_TRADE_NO`,`TRADE_STATE`,`PAY_FEE`,"
				+ "`ORDER_TIME`,`PAY_TIME`,`CREATE_TIME`,(SELECT racename FROM RACES WHERE id=COOPERATER_NAME) as COOPERATER_NAME,`PROVINCE`,`CITY`,`DISTRICT`,`ADDRESS` FROM `tb_order` WHERE `TRADE_STATE`=1 ";
		if (!StringHelper.isEmptyStr(phoneno)) {
			sql += " and PHONE_NO LIKE '%" + phoneno + "%' ";
		}
		if (!StringHelper.isEmptyStr(feeAmount))
			sql += " and `PAY_FEE`=" + feeAmount;
		if (!StringHelper.isEmptyStr(coname))
			sql += " and `COOPERATER_NAME`='" + coname + "'";
		if (!StringHelper.isEmptyStr(name))
			sql += " and `USER_NAME`='" + name + "'";
		if (!StringHelper.isEmptyStr(card))
			sql += " and `CARD_NO`='" + card + "'";

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

	@Override
	public String getAllRaces(boolean isAll, String currentID) {
		String sql = "";
		Object[] params = null;
		if (isAll) {
			sql = "select * from races";
		} else if (currentID == null || currentID.length() == 0 || currentID.equals("-1")) {
			sql = "select * from races WHERE (NOW() BETWEEN StartTime AND EndTime)";
		} else {
			sql = "select * from races WHERE id=?";
			params = new Object[] { currentID };
		}
		String json = queryForJSON(sql, params);
		return json;
	}

	@Override // 获取赛事
	public RaceModel getRace(Long raceid) {
		String sql = "SELECT * FROM Races where ID=? limit 1";
		return queryForRaceObject(sql, new Object[] { raceid }, RaceModel.class);
	}

	@Override
	public boolean genPassport(OrderModel model) {
		// 该逻辑转换为前台生成
		/*
		 * try { // 在新的APP数据库生成护照信息 HttpUtil http = new HttpUtil(); String para
		 * = "name=" + model.getUserName() + "&sex=" + (model.getSex() - 1) +
		 * "&idCardType=" + model.getCardType() + "&idCard=" + model.getCardNo()
		 * + "&mobile=" + model.getPhoneNo() + "&dataFrom=2"; String r =
		 * http.postData(
		 * "http://run.geexek.com/geeRunner/webapi/createPassport", para);
		 * String logsql = "INSERT INTO systemlogs(Loginfo) values(?)";
		 * create(logsql, new Object[] {
		 * model.getUserName()+","+model.getPhoneNo()+","+model.getCardNo()+","+
		 * r }); } catch (Exception ex) { String logsql =
		 * "INSERT INTO systemlogs(Loginfo) values(?)"; create(logsql, new
		 * Object[] {
		 * model.getUserName()+","+model.getPhoneNo()+","+model.getCardNo()+","+
		 * ex.toString()}); }
		 */

		// 已经存在于老APP护照库
		if (queryPassport_API(model.getCardNo(), false) > 0) {
			return true;
		}

		String sql = "INSERT INTO passport (name,sex,mobile,id_card,print_card,create_time,passport_no,num,print_id_card,enable,can_custom) "
				+ "values(?, ?,?, ?, 0, now(), ?, ?, ?, 1, 0)";

		// 获取打印编号
		StringBuilder card = new StringBuilder(model.getCardNo());
		String printCard = card.replace(6, 14, "********").toString();

		// 先查询新APP的护照编号
		String pno = GetNewPassportNo_NewApp(model.getCardNo());

		// 查询最大的护照编号和选手编号
		if (pno == null) {
			String sql2 = "select max(passport_no) as passport_no from passport where can_custom=0 and passport_no like '09%' UNION SELECT max(num) as num from passport";

			List<Map<String, Object>> map = queryForList(sql2);
			pno = GetNewPassportNo(map == null || map.get(0) == null || map.get(0).get("passport_no") == null ? ""
					: map.get(0).get("passport_no").toString());
		}

		String sql3 = "SELECT max(num) as num from passport";
		List<Map<String, Object>> map = queryForList(sql3);
		String nnum = GetNewNum(
				map == null || map.size() < 2 || map.get(1) == null || map.get(1).get("passport_no") == null ? ""
						: map.get(1).get("passport_no").toString());

		return create(sql, new Object[] { model.getUserName(), model.getSex(), model.getPhoneNo(), model.getCardNo(),
				pno, nnum, printCard }) > 0;
	}

	@Override
	public int genPassport(String name, String sex, String phone, String cardno, boolean istest) {
		// 该逻辑转换为前台生成
		/*
		 * try { // 在新的APP数据库生成护照信息 HttpUtil http = new HttpUtil(); String para
		 * = "name=" + name + "&sex=" + (sex.equals("1") ? 0 : 1) +
		 * "&idCardType=" + 1 + "&idCard=" + cardno + "&mobile=" + phone +
		 * "&dataFrom=2"; String r = http.postData(
		 * "http://run.geexek.com/geeRunner/webapi/createPassport", para);
		 * String logsql = "INSERT INTO systemlogs(Loginfo) values(?)";
		 * create(logsql, new Object[] { name + "," + phone + "," + cardno + ","
		 * + r }); } catch (Exception ex) { String logsql =
		 * "INSERT INTO systemlogs(Loginfo) values(?)"; create(logsql, new
		 * Object[] { name + "," + phone + "," + cardno + "," + ex.toString()
		 * }); }
		 */

		try {
			if (queryPassport_API(cardno, istest) > 0) {
				return 2;
			}
			String tbname = (istest ? "passport_test" : "passport");
			String sql = "INSERT INTO " + tbname
					+ " (name,sex,mobile,id_card,print_card,create_time,passport_no,num,print_id_card,enable,can_custom) "
					+ "values(?, ?,?, ?, 0, now(), ?, ?, ?, 1, 0)";

			// 获取打印编号
			StringBuilder card = new StringBuilder(cardno);
			String printCard = card.replace(6, 14, "********").toString();

			// 先查询新APP的护照编号
			String pno = GetNewPassportNo_NewApp(cardno);

			// 查询最大的护照编号和选手编号
			if (pno == null) {
				String sql2 = "select max(passport_no) as passport_no from " + tbname
						+ " where can_custom=0 and passport_no like '09%' UNION " + "SELECT max(num) as num from "
						+ tbname;

				List<Map<String, Object>> map = queryForList(sql2);
				pno = GetNewPassportNo(map == null || map.get(0) == null || map.get(0).get("passport_no") == null ? ""
						: map.get(0).get("passport_no").toString());
			}

			String sql3 = "SELECT max(num) as num from " + tbname;
			List<Map<String, Object>> map = queryForList(sql3);
			String nnum = GetNewNum(
					map == null || map.size() < 2 || map.get(1) == null || map.get(1).get("passport_no") == null ? ""
							: map.get(1).get("passport_no").toString());

			return create(sql, new Object[] { name, sex, phone, cardno, pno, nnum, printCard }) > 0 ? 1 : 0;
		} catch (Exception ex) {
			return 0;
		}
	}

	String passportNoBackBegin = "09";

	private String GetNewPassportNo(String old) {
		String passportNo = null;
		if (old == null || old.length() == 0) {
			passportNo = passportNoBackBegin + "17000101";// 10位数字,从101开始
		} else {
			int pNo = Integer.parseInt(old.substring(passportNoBackBegin.length()));
			passportNo = passportNoBackBegin + "" + (++pNo);
		}
		return passportNo;
	}

	/**
	 * 获取在新APP上的护照编号
	 * 
	 * @param cardno
	 * @return
	 */
	private String GetNewPassportNo_NewApp(String cardno) {
		String sql = "SELECT pno FROM passport_temp where cardno='"+cardno+"'";
		List<Map<String, Object>> map = queryForList(sql);
		if (map != null && map.get(0) != null && map.get(0).get("pno") != null) {
			return map.get(0).get("pno").toString();
		} else {
			return null;
		}
	}

	private String GetNewNum(String old) {
		if (old == null || old.length() == 0) {
			return "100001";
		}
		int newNum = Integer.parseInt(old);
		return String.valueOf(++newNum);
	}

	@Override
	public String getUnreceiveJSON(String cardno) {
		String sql = "select ID,USER_NAME,PAY_TIME,CARD_NO,PHONE_NO,(SELECT RaceName FROM races WHERE ID=COOPERATER_NAME LIMIT 1) AS RACE,(SELECT COUNT(1)  FROM UNRECEIVEPASSPORT A WHERE A.ORDERID=s.ID) AS STATUS,(SELECT MESSAGESENDCOUNT FROM UNRECEIVEPASSPORT A WHERE A.ORDERID=s.ID LIMIT 1) AS MSG,(SELECT ISRECEIVE FROM UNRECEIVEPASSPORT A WHERE A.ORDERID=s.ID LIMIT 1) AS ISRECEIVE from tb_order s where TRADE_STATE=1 and CARD_NO=? limit 1";
		return queryForJSON(sql, new Object[] { cardno });
	}

	@Override
	public int uploadUnreceive(String oid) {
		String sqlQuery = "SELECT COUNT(1) FROM unreceivepassport WHERE ORDERID=?";
		if (queryForInt(sqlQuery, new Object[] { oid }) > 0) {
			return 1;
		}
		String sql = "insert into unreceivepassport(OrderID,MessageSendCount,IsReceive) values(?,1,0)";
		return create(sql, new Object[] { oid });
	}

	@Override
	public String getUnreceiveListJSON(String name, String phone, String card, String status, String coid, String page,
			String limit) {
		String sql = "select a.id as id,b.id as oid,USER_NAME,PHONE_NO,CARD_NO,c.RaceName,PAY_TIME,a.isreceive,a.messagesendcount "
				+ "from unreceivepassport a left join tb_order b on a.orderid=b.id LEFT JOIN races c ON b.COOPERATER_NAME=c.ID where 1=1 ";
		if (name != null && name.length() > 0) {
			sql += "and b.USER_NAME='" + name + "'";
		}
		if (phone != null && phone.length() > 0) {
			sql += "and b.PHONE_NO='" + phone + "'";
		}
		if (card != null && card.length() > 0) {
			sql += "and b.CARD_NO='" + card + "'";
		}
		if (status != null && status.length() > 0 && !status.equals("-1")) {
			sql += "and a.isreceive='" + status + "'";
		}
		if (coid != null && coid.length() > 0 && !coid.equals("-1")) {
			sql += "and c.id='" + coid + "'";
		}
		page = Integer.toString(Integer.parseInt(page) - 1);
		int sIndex = Integer.parseInt(page) * Integer.parseInt(limit);
		sql += "order by a.id desc limit " + sIndex + "," + limit;
		return queryForJSON(sql, null);
	}

	@Override
	public int getUnreceiveListCount(String name, String phone, String card, String status, String coid, String page,
			String limit) {
		String sql = "select COUNT(1) "
				+ "from unreceivepassport a left join tb_order b on a.orderid=b.id LEFT JOIN races c ON b.COOPERATER_NAME=c.ID where 1=? ";
		if (name != null && name.length() > 0) {
			sql += "and b.USER_NAME='" + name + "'";
		}
		if (phone != null && phone.length() > 0) {
			sql += "and b.PHONE_NO='" + phone + "'";
		}
		if (card != null && card.length() > 0) {
			sql += "and b.CARD_NO='" + card + "'";
		}
		if (status != null && status.length() > 0 && !status.equals("-1")) {
			sql += "and a.isreceive='" + status + "'";
		}
		if (coid != null && coid.length() > 0 && !coid.equals("-1")) {
			sql += "and c.id='" + coid + "'";
		}
		return queryForInt(sql, new Object[] { 1 });
	}

	@Override
	public int tagUnreceive(String id, int tag) {
		String sql = "update unreceivepassport set isreceive=? where id=?";
		return update(sql, new Object[] { tag, id });
	}

	public int tagUnreceiveByOrderID(String oid, int tag) {
		String sql = "update unreceivepassport set isreceive=? where ORDERID=?";
		return update(sql, new Object[] { tag, oid });
	}

	@Override
	public int addUnreceiveMessageSend(String id) {
		String sql = "update unreceivepassport set MessageSendCount=(MessageSendCount+1) where id=?";
		return update(sql, new Object[] { id });
	}

	@Override
	public List<Map<String, Object>> getUnreceiveOrder(String id) {
		String sql = "select USER_NAME,PHONE_NO,(SELECT RaceName FROM races where ID=a.COOPERATER_NAME) as RACENAME  from tb_order a where id=?";
		List<Map<String, Object>> r = queryForList(sql, new Object[] { id });
		return r;
	}

	@Override
	public int queryPassport_API(String cardNO, boolean istest) {
		String sql = "select COUNT(1) from " + (istest ? "passport_test" : "passport")
				+ " where id_card=? and enable=1";
		return queryForInt(sql, new Object[] { cardNO }) > 0 ? 1 : 0;
	}

	@Override
	public String queryPassportInfo_API(String cardNO, boolean istest) {
		String sql = "SELECT * FROM " + (istest ? "passport_test" : "passport")
				+ " where id_card=? and enable=1 limit 1";
		return queryForJSON(sql, new Object[] { cardNO });
	}

	@Override
	public String getReceiveListJSON(String name, String phone, String card, String status, String coid, String page,
			String limit) {

		try {
			String sql = "select b.USER_NAME,(case b.sex when 1 then '男' else '女' end) sex,b.Phone_no ,b.CARD_NO ,(SELECT racename FROM RACES WHERE "
					+ " ID=b.COOPERATER_NAME limit 1) rname,b.PAY_TIME ,a.PayTime ,a.phone as phone2,a.province,a.city,a.district,"
					+ "a.address,a.Status,a.ExpressNo,a.id from newlyreceivepassport a join tb_order b on a.OrderID=b.id where 1=1";
			if (status != null && status.length() > 0 && !status.equals("-1")) {
				sql += " and a.Status='" + status + "'";
			} else {
				sql += " and a.Status<>0";
			}
			if (name != null && name.length() > 0) {
				sql += " and b.USER_NAME='" + name + "'";
			}
			if (phone != null && phone.length() > 0) {
				sql += " and (b.PHONE_NO='" + phone + "' OR a.phone='" + phone + "')";
			}
			if (card != null && card.length() > 0) {
				sql += " and b.CARD_NO='" + card + "'";
			}
			if (coid != null && coid.length() > 0 && !coid.equals("-1")) {
				sql += " and b.COOPERATER_NAME='" + coid + "'";
			}
			page = Integer.toString(Integer.parseInt(page) - 1);
			int sIndex = Integer.parseInt(page) * Integer.parseInt(limit);
			sql += " order by a.id desc limit " + sIndex + "," + limit;
			return queryForJSON(sql, null);
		} catch (Exception ex) {
			return "SQL执行异常";
		}
	}

	@Override
	public int getReceiveListCount(String name, String phone, String card, String status, String coid, String page,
			String limit) {
		try {
			String sql = "select COUNT(1) from newlyreceivepassport a join tb_order b on a.OrderID=b.id where 1=?";
			if (status != null && status.length() > 0 && !status.equals("-1")) {
				sql += " and a.Status='" + status + "'";
			} else {
				sql += " and a.Status<>0";
			}
			if (name != null && name.length() > 0) {
				sql += " and b.USER_NAME='" + name + "'";
			}
			if (phone != null && phone.length() > 0) {
				sql += "and (b.PHONE_NO='" + phone + "' OR a.phone='" + phone + "')";
			}
			if (card != null && card.length() > 0) {
				sql += " and b.CARD_NO='" + card + "'";
			}
			if (coid != null && coid.length() > 0 && !coid.equals("-1")) {
				sql += " and b.COOPERATER_NAME='" + coid + "'";
			}
			return queryForInt(sql, new Object[] { 1 });
		} catch (Exception ex) {
			return -1;
		}
	}

	@Override
	public String getReceiveExpress(String rid) {
		String sql = "select ExpressNo,ExpressCo from newlyreceivepassport where id=?";
		return queryForJSON(sql, new Object[] { rid });
	}

	@Override
	public String getExpressInfo(String co, String no) {
		KdniaoTrackQueryAPI api = new KdniaoTrackQueryAPI();
		String result = null;
		try {
			result = api.getOrderTracesByJson(co, no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public String saveExpress(String id, String co, String no) {
		String sql = "update newlyreceivepassport set ExpressNo=?,ExpressCo=? where id=?";
		int r = update(sql, new Object[] { no, co, id });
		return Integer.toString(r);
	}

	@Override
	public String saveNewPassportNo(String cardno, String pno) {
		String sql = "INSERT INTO passport_temp VALUES(?,?)";
		int r = create(sql, new Object[] { cardno, pno });
		return Integer.toString(r);
	}
}
