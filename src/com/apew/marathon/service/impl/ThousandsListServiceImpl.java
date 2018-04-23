package com.apew.marathon.service.impl;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.apew.marathon.service.BaseService;
import com.apew.marathon.service.IThousandsListService;

import net.sf.json.JSONObject;

@Service("tsService")
public class ThousandsListServiceImpl extends BaseService<String> implements IThousandsListService {

	private final int freeQuotasCount = 100; // 免费名额
	private final int paidQuotasCount = 500; // 付费名额

	@Override
	public String TList(int page, int pageSize, String qType, int gtype) {
		String sql = "SELECT ranking,name,sex,sourceSeconds,gameName,groupType FROM thousandslist WHERE status=1 and sex=?";
		if (gtype > 0) {
			sql += " and groupType=" + gtype;
		}
		sql += " limit ?,?";
		return queryForJSON(sql, new Object[] { qType, page, pageSize });
	}

	@Override
	public Integer TListCount(String qType, int gtype) {
		String sql = "SELECT COUNT(1) FROM thousandslist WHERE status=1 and sex=? ";
		if (gtype > 0) {
			sql += " and groupType=" + gtype;
		}
		return queryForInt(sql, new Object[] { qType });
	}

	@Override
	public String queryOnesRanking(String name, String cardno) {
		String sql = "SELECT * FROM thousandslist WHERE status=1 and name=? and idCard=? ";

		Map<String, Object> map = queryForMap(sql, new Object[] { name, cardno });
		JSONObject json = JSONObject.fromObject(map);
		return json.toString();
	}

	@Override
	public int getPlayerStatusInList(String cardno) {
		String sql = "select groupType from thousandslist where idCard=? and status=1 limit 1";
		Map<String, Object> map = queryForMap(sql, new Object[] { cardno });
		return 0;
	}

	@Override
	public boolean raceExists(String raceID) {
		String sql = "SELECT COUNT(1) FROM races where ID=?";
		int count = queryForInt(sql, new Object[] { raceID });
		return count > 0;
	}

	@Override
	public int getRemainFreeQuotas(String raceID) {
		String sql = "select count(*) from thousandslist_discount where RaceId=? and DiscountType=0";
		int count = queryForInt(sql, new Object[] { raceID });
		return freeQuotasCount >= count ? freeQuotasCount - count : 0;
	}

	@Override
	public int getRemainPaidQuotas(String raceID) {
		String sql = "select count(*) from thousandslist_discount where RaceId=? and DiscountType=1";
		int count = queryForInt(sql, new Object[] { raceID });
		return paidQuotasCount >= count ? paidQuotasCount - count : 0;
	}
}
