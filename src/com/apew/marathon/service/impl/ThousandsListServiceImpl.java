package com.apew.marathon.service.impl;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.apew.marathon.service.BaseService;
import com.apew.marathon.service.IThousandsListService;

import net.sf.json.JSONObject;

@Service("tsService")
public class ThousandsListServiceImpl extends BaseService<String> implements IThousandsListService {

	@Override
	public String TList(int page, int pageSize, String qType) {
		String sql = "SELECT ranking,name,sex,sourceSeconds FROM thousandslist WHERE status=1 "
				+ (!qType.equals("0") ? "and Sex='" + (qType.equals("1") ? "男" : "女") + "'" : "") + " limit ?,?";
		return queryForJSON(sql, new Object[] { page, pageSize });
	}

	@Override
	public Integer TListCount(String qType) {
		String sql = "SELECT COUNT(1) FROM thousandslist WHERE status=? "+ (!qType.equals("0") ? "and Sex='" + (qType.equals("1") ? "男" : "女") + "'" : "") ;
		return queryForInt(sql, new Object[] { 1 });
	}

	@Override
	public String queryOnesRanking(String name, String cardno) {
		String sql = "SELECT * FROM thousandslist WHERE status=1 and name=? and idCard=? ";

		Map<String, Object> map = queryForMap(sql, new Object[] { name, cardno });
		JSONObject json = JSONObject.fromObject(map);
		return json.toString();
	}
}
