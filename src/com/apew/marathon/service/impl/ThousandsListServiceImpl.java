package com.apew.marathon.service.impl;

import java.security.MessageDigest;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.stereotype.Service;

import com.apew.marathon.service.BaseService;
import com.apew.marathon.service.IThousandsListService;

import net.sf.json.JSONObject;

@Service("tsService")
public class ThousandsListServiceImpl extends BaseService<String> implements IThousandsListService {

	private final int[] quotasCounts = new int[] { 100, 500 };
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
		String sql = "SELECT * FROM thousandslist WHERE status=1 and idCard=? order by batchNum desc limit 1";

		Map<String, Object> map = queryForMap(sql, new Object[] { cardno });
		JSONObject json = JSONObject.fromObject(map);
		return json.toString();
	}

	@Override
	public int getPlayerStatusInList(String cardno) {
		String sql = "select groupType from thousandslist where idCard=? and status=1 limit 1";
		String map = queryFristString(sql, new Object[] { cardno });
		if (map == null) {
			return 2;
		} else if (map.equals("0")) {
			return 0; // 普通万人名单
		} else if (map.equals("1") || map.equals("2") || map.equals("3")) {
			return 1; // 十人/百人/千人跑团
		} else {
			return 2;
		}
	}

	@Override
	public boolean raceExists(String raceID) {
		String sql = "SELECT COUNT(1) FROM races where ID=?";
		int count = queryForInt(sql, new Object[] { raceID });
		return count > 0;
	}

	@Override
	public int getRemainFreeQuotas(String raceID, String tbname) {
		String sql = "select count(*) from  " + tbname + " where RaceId=? and DiscountType=0";
		int count = queryForInt(sql, new Object[] { raceID });
		int fCount = freeQuotasCount;
		if (raceID.equals("8")) {
			fCount = 2000;
		}
		return freeQuotasCount >= count ? freeQuotasCount - count : 0;
	}

	@Override
	public int getRemainPaidQuotas(String raceID, String tbname) {
		String sql = "select count(*) from  " + tbname + " where RaceId=? and DiscountType=1";
		int count = queryForInt(sql, new Object[] { raceID });
		return paidQuotasCount >= count ? paidQuotasCount - count : 0;
	}

	@Override
	public boolean playerInRace(String cardNo, String raceID, String tbname) {
		String sql = "SELECT count(1) FROM  " + tbname + " where RaceId=? and cardNo=?";
		int count = queryForInt(sql, new Object[] { cardNo, raceID });
		return count > 0;
	}

	public int uploadPlayerInDiscount(String raceID, String cardNo, int disType, String tbname) {
		String sql = "insert into " + tbname + "(RaceID,CardNo,DiscountType,CreateTime) values(?,?,?,NOW())";
		int i = 0;
		try {
			i = create(sql, new Object[] { raceID, cardNo, disType });
		} catch (Exception ex) { // 此处异常往往是因为违反了MYSQL唯一约束
			return 1;
		}
		if (i > 0) { // 溢出检查
			sql = "delete from  " + tbname
					+ " where DiscountType=? and RaceID=? AND ID NOT IN (select x.id from (select id from " + tbname
					+ " where DiscountType=? and RaceID=? order by id limit ?) x)";
			int count = delete(sql, new Object[] { disType, raceID, disType, raceID, quotasCounts[disType] }); // 直接删除所有溢出数据
			sql = "SELECT count(1) FROM  " + tbname + " where RaceID=? and cardNo=?";
			count = queryForInt(sql, new Object[] { raceID, cardNo });
			if (count > 0) { // 没有被删除，此数据没有溢出
				return 0;
			} else { // 此数据溢出且被删除
				return 2;
			}
		} else
			return 1;
	}

	private String MD5(String s) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] bytes = md.digest(s.getBytes("utf-8"));
			return toHex(bytes);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	private static String toHex(byte[] bytes) {

		final char[] HEX_DIGITS = "0123456789ABCDEF".toCharArray();
		StringBuilder ret = new StringBuilder(bytes.length * 2);
		for (int i = 0; i < bytes.length; i++) {
			ret.append(HEX_DIGITS[(bytes[i] >> 4) & 0x0f]);
			ret.append(HEX_DIGITS[bytes[i] & 0x0f]);
		}
		return ret.toString();
	}

	@Override
	public boolean tokenCheck(String token, String raccID) {
		String sql = "select token from races where id=?";
		String map = queryFristString(sql, new Object[] { raccID });
		if (map == null || map.length() == 0)
			return false;
		String mToken = MD5(map.toString());
		if (mToken.trim().toLowerCase().equals(token.trim().toLowerCase()))
			return true;
		return false;
	}

	@Override
	public int queryPlayersQuota(String cardno, String raceno, String tbname) {
		String sql = "select DiscountType from " + tbname + " where RaceID=? and CardNo=?";
		String dtype = queryFristString(sql, new Object[] { raceno, cardno });
		if (dtype == null) {
			return 2;
		}
		try {
			int r = Integer.parseInt(dtype);
			return r;
		} catch (NumberFormatException e) {
			e.printStackTrace();
			return 2;
		}
	}

	@Override
	public String queryRacePrice(String raceno) {
		String sql = "select price from races where id=? limit 1";
		String payfee = queryFristString(sql, new Object[] { raceno });
		if (payfee == null || payfee.length() == 0) {
			return "0";
		}
		return payfee;
	}

	@Override
	public String getBatchsJSON() {
		String sql = "select name,number from thousandslist_names order by ID DESC";
		return queryForJSON(sql, null);
	}

	@Override
	public String getSqlJSON(String sql, Object[] par) {
		return queryForJSON(sql, par);
	}

	@Override
	public int getPlayersRank(String cardno) {
		String sql = "select ranking from thousandslist where Status=1 and idcard=? limit 1";

		String map = queryFristString(sql, new Object[] { cardno });
		if (map == null || map.length() == 0)
			return -1;

		return Integer.parseInt(map.toString());
	}
}
