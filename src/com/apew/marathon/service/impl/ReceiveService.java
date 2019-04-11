package com.apew.marathon.service.impl;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.apew.marathon.model.ReceiveModel;
import com.apew.marathon.service.BaseService;
import com.apew.marathon.service.IReceiveService;

@Service("receiveService")
public class ReceiveService extends BaseService<ReceiveModel> implements IReceiveService {

	@Override
	public ReceiveModel getModel(String tradeno) {
		String sql = "SELECT * FROM newlyreceivepassport where tradeno=?";
		return queryForObject(sql, new Object[] { tradeno }, ReceiveModel.class);
	}

	@Override
	public int updateModel(ReceiveModel rm) {
		// 只有支付时间 状态 快递单号 快递公司允许修改，其余信息创建后不可修改
		String sql = "update `newlyReceivePassport` set `PayTime`=?,`Status`=?,`ExpressNo`=?,`ExpressCo`=?,`OutTradeNo`=? where `ID`=?";
		return update(sql, new Object[] { rm.getPayTime(), rm.getStatus(), rm.getExpressNo(), rm.getExpressCo(),
				rm.getOutTradeNo(), rm.getID() });
	}

	@Override
	public int createModel(ReceiveModel rm) {
		String sql = "INSERT INTO newlyReceivePassport (OrderID,PayType,PayTime,Phone,province,city,district,address,Status,ExpressCo,ExpressNo,PayFee,TradeNo,OutTradeNo)"
				+ "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		int count = create(sql,
				new Object[] { rm.getOrderID(), rm.getPayType(), rm.getPayTime(), rm.getPhone(), rm.getProvince(),
						rm.getCity(), rm.getDistrict(), rm.getAddress(), rm.getStatus(), rm.getExpressCo(),
						rm.getExpressNo(), rm.getPayFee(), rm.getTradeNo(), rm.getOutTradeNo() });
		return count;
	}

	@Override
	public boolean isPaid(String orderid) {
		String sql = "SELECT COUNT(1) FROM newlyReceivePassport WHERE orderid=? AND  STATUS IN (1,2)";
		return queryForInt(sql, new Object[] { orderid }) > 0;
	}

	@Override
	public int getTradeStatus(String id) {
		String sql = "select Status from newlyReceivePassport where tradeno=?";
		Map<String, Object> r = queryForMap(sql, new Object[] { id });
		if (r == null || r.size() == 0 || r.get("Status") == null) // 不存在于订单表
			return 0;

		int tradeState = Integer.parseInt(String.valueOf(r.get("Status")));
		return tradeState;
	}

	@Override
	public int insertLog(String log) {
		String sql="INSERT INTO systemlogs(Loginfo) values(?)";
		return create(sql,new Object[]{log});
	}

}
