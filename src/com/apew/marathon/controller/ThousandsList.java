package com.apew.marathon.controller;

import java.security.MessageDigest;

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
	 * 名额获取
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/quotasAccess", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String playerCheck(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String raceno = request.getParameter("raceno");
		String cardno = request.getParameter("cardno");
		String token = request.getParameter("token");
		String testSwitch = request.getParameter("testSwitch");

		if (testSwitch == null || testSwitch.length() == 0) {
			testSwitch = "1";
		}
		String tbName = testSwitch.equals("1") ? "thousandslist_discount_test" : "thousandslist_discount";
		if (raceno == null || raceno.length() == 0) {
			return returnPlayerCheckJson(-1, "赛事编号不能为空", cardno);
		}
		if (cardno == null || cardno.length() == 0) {
			return returnPlayerCheckJson(-1, "选手证件号不能为空", cardno);
		}
		if (!tsService.raceExists(raceno)) {
			return returnPlayerCheckJson(-1, "未找到的赛事ID：" + raceno, cardno);
		}
		if (!tsService.tokenCheck(token, raceno)) {
			return returnPlayerCheckJson(-1, "赛事签名不匹配", cardno);
		}
		int listStatus = tsService.getPlayerStatusInList(cardno);
		if (listStatus == 2) {
			return returnPlayerCheckJson(3, "选手不在万人名单中", cardno);
		}
		if (tsService.playerInRace(cardno, raceno, tbName)) {
			return returnPlayerCheckJson(4, "选手已获取直通车名额", cardno);
		}
		int quotas = 0;
		if (listStatus == 1) {
			quotas = tsService.getRemainFreeQuotas(raceno, tbName);// 首先查找100位免费直通车是否有空间,

			if (quotas > 0) { // 100位有空间
				int upResult = tsService.uploadPlayerInDiscount(raceno, cardno, 0, tbName);
				if (upResult == 0) {
					return returnPlayerCheckJson(0, "获取免费直通车名额", cardno);
				} else if (upResult == 1) {
					return returnPlayerCheckJson(4, "选手已获取直通车名额", cardno);
				} // 0成功获取 1已有 2百人免费已满，继续查看500人付费名单
			}

			quotas = tsService.getRemainPaidQuotas(raceno, tbName);// 没有100位位置，查找500的有没有位置
			if (quotas > 0) { // 500有空间
				int upResult = tsService.uploadPlayerInDiscount(raceno, cardno, 1, tbName);
				if (upResult == 0) {
					return returnPlayerCheckJson(1, "获取付费直通车名额", cardno);
				} else if (upResult == 1) {
					return returnPlayerCheckJson(4, "选手已获取直通车名额", cardno);
				} else {
					return returnPlayerCheckJson(2, "直通车名额用完", cardno); // 全部没有空间
				}
			}

			return returnPlayerCheckJson(2, "直通车名额用完", cardno); // 全部没有空间
		} else {
			quotas = tsService.getRemainPaidQuotas(raceno, tbName);// 查找500位收费直通车是否有空间
			if (quotas > 0) {
				int upResult = tsService.uploadPlayerInDiscount(raceno, cardno, 1, tbName);
				if (upResult == 0) {
					return returnPlayerCheckJson(1, "获取付费直通车名额", cardno);
				} else if (upResult == 1) {
					return returnPlayerCheckJson(4, "选手已获取直通车名额", cardno);
				} else {
					return returnPlayerCheckJson(2, "直通车名额用完", cardno); // 全部没有空间
				}
			}
			return returnPlayerCheckJson(2, "直通车名额用完", cardno);
		}
	}

	private String returnPlayerCheckJson(int status, String msg, String idcard) {
		JSONObject json = new JSONObject();
		json.put("code", status);
		json.put("msg", msg);
		json.put("idcard", idcard);
		return json.toString();
	}

	private String returnQuotasQueryJson(int fq, int pq, int code, String msg) {
		JSONObject json = new JSONObject();
		json.put("freeQuotas", fq);
		json.put("paidQuotas", pq);
		json.put("code", code);
		json.put("msg", msg);
		return json.toString();
	}
	private String returnPlayerQuotaQueryJson(int code, String msg) {
		JSONObject json = new JSONObject();
		json.put("code", code);
		json.put("msg", msg);
		return json.toString();
	}

	/**
	 * 名额获取
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/quotasQuery", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String quotasQuery(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String raceno = request.getParameter("raceno");
		if (raceno == null || raceno.length() == 0) {
			return returnQuotasQueryJson(0, 0, -1, "赛事编号不能为空");
		}
		if (!tsService.raceExists(raceno)) {
			return returnQuotasQueryJson(0,0,-1, "未找到的赛事ID：" + raceno);
		}
		String testSwitch = request.getParameter("testSwitch");

		if (testSwitch == null || testSwitch.length() == 0) {
			testSwitch = "1";
		}
		String tbName = testSwitch.equals("1") ? "thousandslist_discount_test" : "thousandslist_discount";
		int fquotas = tsService.getRemainFreeQuotas(raceno, tbName);
		int pquotas= tsService.getRemainPaidQuotas(raceno, tbName);
		return returnQuotasQueryJson(fquotas, pquotas,0, ""); 
	}

	/**
	 * 名额获取
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/playersQuotaQuery", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String playersQuotaQuery(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String raceno = request.getParameter("raceno");
		String cardno = request.getParameter("cardno");
		if (raceno == null || raceno.length() == 0) {
			return returnPlayerQuotaQueryJson(-1, "赛事编号不能为空");
		}
		if (cardno == null || cardno.length() == 0) {
			return returnPlayerQuotaQueryJson(-1, "选手证件号不能为空");
		}
		if (!tsService.raceExists(raceno)) {
			return returnPlayerQuotaQueryJson(-1, "未找到的赛事ID：" + raceno);
		}
		String testSwitch = request.getParameter("testSwitch");

		if (testSwitch == null || testSwitch.length() == 0) {
			testSwitch = "1";
		}
		String tbName = testSwitch.equals("1") ? "thousandslist_discount_test" : "thousandslist_discount";

		int code=tsService.queryPlayersQuota(cardno, raceno, tbName);
		return returnPlayerQuotaQueryJson(code, ""); 
	}
}
