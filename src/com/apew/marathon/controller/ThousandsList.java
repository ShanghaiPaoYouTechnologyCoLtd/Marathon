package com.apew.marathon.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.apew.marathon.service.IThousandsListService;

import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "/tlist")
public class ThousandsList extends BaseController {

	@Resource(name = "tsService")
	private IThousandsListService tsService;

	/**
	 * 查询列表
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getList", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getTList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String pagesize = request.getParameter("pageSize");
		String pageNumber = request.getParameter("pageNumber");
		String qType = request.getParameter("qType");
		String gType = request.getParameter("gType");

		String result = tsService.TList(Integer.parseInt(pageNumber), Integer.parseInt(pagesize), qType,
				Integer.parseInt(gType));
		if (result != null) {
			Integer count = tsService.TListCount(qType, Integer.parseInt(gType));
			return "{\"rows\":" + result + ",\"total\":" + count.toString() + "}";
		}

		return "{\"rows\":[],\"total\":0}";
	}

	/**
	 * 查询单人排名
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/onesRanking", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getOnesRanking(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String uname = request.getParameter("uname");
		String cardno = request.getParameter("cardNo");

		String result = tsService.queryOnesRanking(uname, cardno);
		return result;
	}

	/**
	 * 查询单人排名
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/PlayerCheck", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String playerCheck(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String raceno = request.getParameter("raceno");
		String cardno = request.getParameter("cardno");

		if (!tsService.raceExists(raceno)) {
			return returnPlayerCheckJson(-1, "未找到的赛事ID：" + raceno, 0);
		}
		int listStatus = tsService.getPlayerStatusInList(cardno);
		if (listStatus == 2) {
			return returnPlayerCheckJson(3, "选手不在万人名单中", 0);
		}
		int quotas = 0;
		if (listStatus == 1) {
			quotas = tsService.getRemainFreeQuotas(raceno);// 首先查找100位免费直通车是否有空间,

			if (quotas > 0) // 100位有空间
				return returnPlayerCheckJson(0, "可以获取免费直通车名额", quotas);

			quotas = tsService.getRemainPaidQuotas(raceno);// 没有100位位置，查找500的有没有位置
			if (quotas > 0) // 500有空间
				return returnPlayerCheckJson(1, "可以获取付费直通车名额", quotas);

			return returnPlayerCheckJson(2, "直通车名额用完", 0); // 全部没有空间
		} else {
			quotas = tsService.getRemainPaidQuotas(raceno);// 查找500位收费直通车是否有空间
			if (quotas > 0)
				return returnPlayerCheckJson(1, "可以获取付费直通车名额", quotas);
			
			return returnPlayerCheckJson(2, "直通车名额用完", 0);
		}
	}

	private String returnPlayerCheckJson(int status, String msg, int quotas) {
		JSONObject json = new JSONObject();
		json.put("status", status);
		json.put("msg", msg);
		json.put("quotas", quotas);
		return json.toString();
	}
}
