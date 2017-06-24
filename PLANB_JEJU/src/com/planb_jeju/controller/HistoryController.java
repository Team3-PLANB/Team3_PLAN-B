package com.planb_jeju.controller;

import java.security.Principal;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.planb_jeju.dto.Route;
import com.planb_jeju.dto.RoutePostscript;
import com.planb_jeju.dto.SitePostscript;
import com.planb_jeju.service.HistoryService;
import com.planb_jeju.service.RouteDetailService;
import com.planb_jeju.service.RouteService;
import com.planb_jeju.service.SitePostscriptService;

public class HistoryController {

	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	HistoryService historyservice;

	@Autowired
	SitePostscriptService sitePostscruotService;

	/*
	* @date : 2017. 6. 24
	* @description : 히스토리 상세보기
	* @parameter : request url에 함께 들어온 request 파라메터를  받기위해 사용, principal 로그인한 회원 정보
	* @return : String(View 페이지)

	@RequestMapping(value="/PostScript/History/history.do", method=RequestMethod.GET)
	public String detailHistory(HttpServletRequest request, Principal principal, Model model) throws ClassNotFoundException, SQLException {
		System.out.println("히스토리 상세보기");
		System.out.println("로그인된 아이디 : " + principal.getName());

		int route_code = Integer.parseInt(request.getParameter("route_code"));
		Route myroutehistory = historyservice.getRouteDetail(route_code, principal.getName());
		System.out.println(myroutehistory);

		return "MyPage.History.myHistory";	

	}
	*/
}
