package com.apew.marathon.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Objects;

import org.springframework.stereotype.Service;

import com.apew.marathon.model.ReceiveModel;
import com.apew.marathon.service.BaseService;
import com.apew.marathon.service.ISystemService;

@Service("systemService")
public class SystemServiceImpl extends BaseService<ReceiveModel> implements ISystemService {

	@Override
	public String getNewsType() {
		String sql = "SELECT * FROM newstype WHERE Status!=2 ORDER BY Sort";
		return queryForJSON(sql, null);
	}

	@Override
	public String getNewsSecondType(int pid) {
		String sql = "SELECT * FROM newssecondtype WHERE Status!=2 AND PARENTTYPE=? ORDER BY SORT";
		return queryForJSON(sql, new Object[] { pid });
	}

	@Override
	public int createNewsType(String user, String name, int sort) {
		String sql = "INSERT INTO newstype(name,sort,createtime,createuser,status) values(?,?,?,?,1)";
		return create(sql, new Object[] { name, sort, getCurTimeStr(), user });
	}

	@Override
	public int updateNewsType(String user, String name, int sort, int status, String id) {
		String sql = "update newstype set name=?,sort=?,updatetime=?,updateuser=?,status=? where id=?";
		return update(sql, new Object[] { name, sort, getCurTimeStr(), user, status, id });
	}

	@Override
	public int createSecondNewsType(String user, String name, int sort, String pid) {
		String sql = "INSERT INTO newssecondtype(name,sort,createtime,createuser,status,parenttype) values(?,?,?,?,1,?)";
		return create(sql, new Object[] { name, sort, getCurTimeStr(), user, pid });
	}

	@Override
	public int updateNewsSType(String user, String name, int sort, int status, String id, String pid) {
		String sql = "update newssecondtype set name=?,sort=?,updatetime=?,updateuser=?,parenttype=?,status=? where id=?";
		return update(sql, new Object[] { name, sort, getCurTimeStr(), user, pid, status, id });
	}

	@Override
	public int createNews(String user, String Title, String Cover, String Content, int access, int status, int topNum,
			int NewsType, String Source, String SourceLink, String newsDate, String Author, String label,String Synopsis) {
		String sql = "INSERT INTO newsrelease(title,cover,content,Access_E,Access_R,createTime,CreateUser,status,TopNum,newstype,source,SourceLink,NewsDate,author,Label,Synopsis) "
				+ "VALUES(?,?,?,?,0,?,?,?,?,?,?,?,?,?,?,?)  ";
		return create(sql, new Object[] { Title, Cover, Content, access, getCurTimeStr(), user, status, topNum,
				NewsType, Source, SourceLink, newsDate, Author, label,Synopsis });
	}

	@Override
	public String getNewsSimpleList() {
		String sql = "SELECT a.ID,TITLE,CONCAT(b.Name,' / ',c.Name) as NEWSTYPEINFO,CONCAT(a.CreateUser,' / ',a.CreateTime) as CREATEINFO,a.status FROM newsrelease a left join newssecondtype b on a.NewsType=b.ID left join NewsType c on b.ParentType=c.ID where a.status<>2";
		return queryForJSON(sql, null);
	}

	@Override
	public int getNewsSimpleList_Count() {
		String sql = "SELECT count(1) FROM newsrelease where status<>2";
		Integer totalCount = queryForInt(sql, new Object[] {});
		totalCount = totalCount == null ? 0 : totalCount;
		return totalCount;
	}

	@Override
	public String getNewsDetail(String id) {
		String sql = "SELECT *,(SELECT ParentType FROM newssecondtype WHERE ID=NewsType) AS newsptype,(SELECT name FROM newssecondtype WHERE ID=NewsType) AS typename FROM newsrelease WHERE ID=?";
		return queryForJSON(sql, new Object[] { id });
	}

	@Override
	public int updateNewsStatus(String user, String id, int status) {
		String sql = "update newsrelease set Status=?,UpdateUser=?,UpdateTime=? where id=?";
		return update(sql, new Object[] { status, user, getCurTimeStr(), id });
	}

	private String getCurTimeStr() {
		return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
	}

	@Override
	public int updateNewsInfo(String user, String title, String cover, String author, String newdate, String content,
			String label, int topnum, int access, String source, String sourcelink, int newstype,String Synopsis, String id) {
		String sql = "UPDATE newsrelease SET Title=?,Cover=?,Author=?,NewsDate=?,Content=?,Label=?,TopNum=?,Access_E=?,Source=?,SourceLink=?,NewsType=?,UpdateUser=?,UpdateTime=?,Synopsis=? WHERE ID=?";
		return update(sql, new Object[] { title, cover, author, newdate, content, label, topnum, access, source,
				sourcelink, newstype, user, getCurTimeStr(), Synopsis,id });
	}

	@Override
	public String getNewsList(int ntype, int spos, int epos) {
		String typeStr = " and typeStr=" + ntype;
		String sql = "SELECT ID,TITLE,COVER,NewsDate,AUTHOR,(SELECT NAME FROM newssecondtype WHERE NewsType=ID) AS TNAME,Synopsis FROM newsrelease WHERE STATUS=1 "
				+ (ntype == -1 ? "" : typeStr) + " ORDER BY TopNum DESC,NewsDate DESC LIMIT ?,?";
		return queryForJSON(sql, new Object[] { spos, epos });
	}
}
