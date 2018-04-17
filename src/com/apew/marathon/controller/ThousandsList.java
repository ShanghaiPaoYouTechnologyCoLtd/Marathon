package com.apew.marathon.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.apew.marathon.service.IThousandsListService;

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
		String gType=request.getParameter("gType");

		String result = tsService.TList(Integer.parseInt(pageNumber), Integer.parseInt(pagesize),qType,Integer.parseInt(gType));
		if (result != null) {
			Integer count = tsService.TListCount(qType,Integer.parseInt(gType));
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

}
