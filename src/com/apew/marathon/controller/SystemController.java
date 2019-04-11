package com.apew.marathon.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.apew.marathon.model.SystemUserModel;
import com.apew.marathon.service.ISystemService;
import com.apew.marathon.service.ISystemUserService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "/sys")
public class SystemController {
	@Resource(name = "systemUserService")
	private ISystemUserService systemUserService;

	@Resource(name = "systemService")
	private ISystemService systemService;

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public String sysLogin(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		SystemUserModel user = systemUserService.Login(name, pwd);

		JSONObject jsonObj = new JSONObject();
		if (user == null || user.getLoginName() == null) {
			jsonObj.put("status", "-1");
		} else {
			jsonObj.put("status", "1");
			request.getSession().setAttribute("user", user);
		}

		return jsonObj.toString();
	}

	@RequestMapping(value = "/getUserType", method = RequestMethod.POST)
	@ResponseBody
	public String getNewsType(HttpServletRequest request, HttpServletResponse response) {
		return systemService.getNewsType();
	}

	@RequestMapping(value = "/getNewsSecondType", method = RequestMethod.POST)
	@ResponseBody
	public String getNewsSecondType(HttpServletRequest request, HttpServletResponse response) {
		String pid = request.getParameter("pid");

		return systemService.getNewsSecondType(Integer.parseInt(pid));
	}

	@RequestMapping(value = "/createNewsType", method = RequestMethod.POST)
	@ResponseBody
	public String createNewsType(HttpServletRequest request, HttpServletResponse response) {
		SystemUserModel user = null;
		if (request.getSession().getAttribute("user") instanceof SystemUserModel) {
			user = (SystemUserModel) request.getSession().getAttribute("user");
		} else {
			return "用户未登录！";
		}

		String uname = user.getLoginName();
		String name = request.getParameter("name");
		int sort = Integer.parseInt(request.getParameter("sort"));
		return systemService.createNewsType(uname, name, sort) > 0 ? "1" : "创建失败！";
	}

	@RequestMapping(value = "/createNewsSType", method = RequestMethod.POST)
	@ResponseBody
	public String createNewsSType(HttpServletRequest request, HttpServletResponse response) {
		SystemUserModel user = null;
		if (request.getSession().getAttribute("user") instanceof SystemUserModel) {
			user = (SystemUserModel) request.getSession().getAttribute("user");
		} else {
			return "用户未登录！";
		}

		String uname = user.getLoginName();
		String name = request.getParameter("name");
		int sort = Integer.parseInt(request.getParameter("sort"));
		String pid = request.getParameter("pid");
		return systemService.createSecondNewsType(uname, name, sort, pid) > 0 ? "1" : "创建失败！";
	}

	@RequestMapping(value = "/updateNewsType", method = RequestMethod.POST)
	@ResponseBody
	public String updateNewsType(HttpServletRequest request, HttpServletResponse response) {
		SystemUserModel user = null;
		if (request.getSession().getAttribute("user") instanceof SystemUserModel) {
			user = (SystemUserModel) request.getSession().getAttribute("user");
		} else {
			return "用户未登录！";
		}

		String uname = user.getLoginName();
		String name = request.getParameter("name");
		int sort = Integer.parseInt(request.getParameter("sort"));
		int status = Integer.parseInt(request.getParameter("status"));
		String id = request.getParameter("id");

		return systemService.updateNewsType(uname, name, sort, status, id) > 0 ? "1" : "修改失败！";
	}

	@RequestMapping(value = "/updateNewsSType", method = RequestMethod.POST)
	@ResponseBody
	public String updateNewsSType(HttpServletRequest request, HttpServletResponse response) {
		SystemUserModel user = null;
		if (request.getSession().getAttribute("user") instanceof SystemUserModel) {
			user = (SystemUserModel) request.getSession().getAttribute("user");
		} else {
			return "用户未登录！";
		}

		String uname = user.getLoginName();
		String name = request.getParameter("name");
		int sort = Integer.parseInt(request.getParameter("sort"));
		String pid = request.getParameter("pid");
		int status = Integer.parseInt(request.getParameter("status"));
		String id = request.getParameter("id");

		return systemService.updateNewsSType(uname, name, sort, status, id, pid) > 0 ? "1" : "修改失败！";
	}

	@RequestMapping(value = "/createNews", method = RequestMethod.POST)
	@ResponseBody
	public String createNews(HttpServletRequest request, HttpServletResponse response) {
		SystemUserModel userM = null;
		if (request.getSession().getAttribute("user") instanceof SystemUserModel) {
			userM = (SystemUserModel) request.getSession().getAttribute("user");
		} else {
			return "用户未登录！";
		}

		String user = userM.getLoginName();
		String Title = request.getParameter("title");
		String Cover = request.getParameter("cover");
		String Content = request.getParameter("content");
		int access = Integer.parseInt(request.getParameter("access"));
		int status = Integer.parseInt(request.getParameter("status"));
		int topNum = Integer.parseInt(request.getParameter("topnum"));
		int NewsType = Integer.parseInt(request.getParameter("newstype"));
		String SourceLink = request.getParameter("sourcelink");
		String newsDate = request.getParameter("newsdate");
		String Source = request.getParameter("source");
		String Author = request.getParameter("author");
		String Label = request.getParameter("label");
		String Synopsis = request.getParameter("synopsis");

		return systemService.createNews(user, Title, Cover, Content, access, status, topNum, NewsType, Source,
				SourceLink, newsDate, Author, Label,Synopsis) > 0 ? "1" : "操作失败！";
	}

	@RequestMapping(value = "/getNewsSimpleList", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getNewsSimpleList(HttpServletRequest request, HttpServletResponse response) {
		if (!(request.getSession().getAttribute("user") instanceof SystemUserModel)) {
			return "用户未登录！";
		}

		int totalCount = systemService.getNewsSimpleList_Count();
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("data", systemService.getNewsSimpleList());
		jsonObj.put("count", totalCount);
		jsonObj.put("code", 0);

		response.setCharacterEncoding("UTF-8");
		return jsonObj.toString();
	}

	@RequestMapping(value = "/getNewsDetails", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getNewsDetails(HttpServletRequest request, HttpServletResponse response) {
		String nid = request.getParameter("nid");

		response.setCharacterEncoding("UTF-8");
		return systemService.getNewsDetail(nid);
	}

	@RequestMapping(value = "/updateStatus", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String updateStatus(HttpServletRequest request, HttpServletResponse response) {
		if (!(request.getSession().getAttribute("user") instanceof SystemUserModel)) {
			return "用户未登录！";
		}

		SystemUserModel userM = (SystemUserModel) request.getSession().getAttribute("user");
		;
		String nid = request.getParameter("nid");
		int status = Integer.parseInt(request.getParameter("status"));

		response.setCharacterEncoding("UTF-8");
		return systemService.updateNewsStatus(userM.getLoginName(), nid, status) > 0 ? "1" : "更新失败";
	}

	@RequestMapping(value = "/updateNews", method = RequestMethod.POST)
	@ResponseBody
	public String updateNews(HttpServletRequest request, HttpServletResponse response) {
		SystemUserModel userM = null;
		if (request.getSession().getAttribute("user") instanceof SystemUserModel) {
			userM = (SystemUserModel) request.getSession().getAttribute("user");
		} else {
			return "用户未登录！";
		}

		String user = userM.getLoginName();
		String Title = request.getParameter("title");
		String Cover = request.getParameter("cover");
		String Content = request.getParameter("content");
		int access = Integer.parseInt(request.getParameter("access"));
		int topNum = Integer.parseInt(request.getParameter("topnum"));
		int NewsType = Integer.parseInt(request.getParameter("newstype"));
		String SourceLink = request.getParameter("sourcelink");
		String newsDate = request.getParameter("newsdate");
		String Source = request.getParameter("source");
		String Author = request.getParameter("author");
		String Label = request.getParameter("label");
		String nid = request.getParameter("nid");
		String synopsis = request.getParameter("synopsis");

		return systemService.updateNewsInfo(user, Title, Cover, Author, newsDate, Content, Label, topNum, access,
				Source, SourceLink, NewsType, synopsis, nid) > 0 ? "1" : "修改失败！";
	}

	@RequestMapping(value = "/getNewsList", method = RequestMethod.POST)
	@ResponseBody
	public String getNewsList(HttpServletRequest request, HttpServletResponse response) {
		int ntype = Integer.parseInt(request.getParameter("ntype"));
		int spos = Integer.parseInt(request.getParameter("spos"));
		int epos = Integer.parseInt(request.getParameter("epos"));

		return systemService.getNewsList(ntype, spos, epos);
	}
}
