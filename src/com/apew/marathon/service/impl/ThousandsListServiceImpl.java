package com.apew.marathon.service.impl;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.apew.marathon.service.BaseService;
import com.apew.marathon.service.IThousandsListService;

import net.sf.json.JSONObject;

@Service("tsService")
public class ThousandsListServiceImpl extends BaseService<String> implements IThousandsListService {

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
	public Integer TListCount(String qType,int gtype) {
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
}
