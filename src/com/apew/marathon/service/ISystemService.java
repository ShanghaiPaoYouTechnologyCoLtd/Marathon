package com.apew.marathon.service;

public interface ISystemService {
	/**
	 * 获取新闻类型
	 * @return
	 */
	public String getNewsType();
	
	/**
	 * 获取二级新闻类型
	 * @param pid
	 * @return
	 */
	public String getNewsSecondType(int pid);
	
	public int createNewsType(String user,String name,int sort);

	int updateNewsType(String user, String name, int sort, int status, String id);

	int createSecondNewsType(String user, String name, int sort, String pid);

	int updateNewsSType(String user, String name, int sort, int status, String id, String pid);
	
	/**
	 * 创建新闻
	 * @param 创建人
	 * @param 标题
	 * @param 封面链接
	 * @param 新闻内容
	 * @param 访问量
	 * @param 状态
	 * @param 置顶等级
	 * @param 新闻类型
	 * @param 原文出处
	 * @param 原文链接
	 * @param 新闻日期
	 * @param 作者
	 * @return
	 */
	int createNews(String user,String Title,String Cover,String Content,int access,int status,int topNum,int NewsType,String Source,String SourceLink,String newsDate,String Author,String label,String Synopsis);
	
	/**
	 * 获取简化版新闻列表，仅返回主要字段
	 * @return
	 */
	String getNewsSimpleList();
	
	/**
	 * 获取简化版新闻列表总统计
	 * @return
	 */
	int getNewsSimpleList_Count();
	
	/**
	 * 获取单条新闻详情
	 * @param id
	 * @return
	 */
	String getNewsDetail(String id);
	
	/**
	 * 更新新闻状态
	 */
	int updateNewsStatus(String user,String id,int status);
	
	/**
	 * 修改新闻
	 * @param user
	 * @param title
	 * @param cover
	 * @param author
	 * @param newdate
	 * @param content
	 * @param label
	 * @param topnum
	 * @param access
	 * @param source
	 * @param sourcelink
	 * @param newstype
	 * @return
	 */
	int updateNewsInfo(String user,String title,String cover,String author,String newdate,String content,String label,int topnum,int access,String source,String sourcelink,int newstype,String Synopsis,String id);
	
	String getNewsList(int ntype,int spos,int epos);
}
