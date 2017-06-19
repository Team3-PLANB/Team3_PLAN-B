package com.planb_jeju.controller;

/*
* @FileName : PlanAController.java
* @Class : PlanAController
* @Project : PLANB_JEJU
* @Date : 2017.06.12
* @LastEditDate : 2017.06.16
* @Author : 강나영 
* @Desc : 일정 만들기 / 제주도 API 정보   컨트롤러
*/

import java.awt.List;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.URL;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.swing.text.Document;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.catalina.connector.Request;
import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import com.planb_jeju.dao.ExDao;
import com.planb_jeju.dao.RouteDao;
import com.planb_jeju.dto.Route;
import com.planb_jeju.dto.RouteDetail;
import com.planb_jeju.service.TourApiService;

@Controller
public class PlanAController {
	
	@Autowired
	private SqlSession sqlsession;

	/*
	* @date : 2017. 6. 16
	* @description : 회원가입 화면 이동 
	* @return : String(View 페이지) 
	*/
	@RequestMapping("PLANA.do")
	public String index() {		
		return "PLANA.tmap";
	}

	@RequestMapping("PLANA.make.tmap.do")
	public String markerAtoB() {
		return "PlanA.tmap_make_route";
	}
	
	
	@RequestMapping("PLANA.make.do")
	public String routeInsert() {
		return "PlanA.step";
	}
		
	/*
	* @date : 2017. 6. 16
	* @description : 루트 만들기 요청 -> 여행지 추천 정보 리턴 
	* @return : String(View 페이지) 
	*/
	@RequestMapping(value="PLANA.make.do",  method=RequestMethod.POST)
	public String makeSelfRoute(HttpServletRequest request, Route route, String personal) throws ClassNotFoundException, SQLException, SAXException, IOException, ParserConfigurationException {
		
		route.setUsername("a@naver.com");
		
		// Mybatis 적용
		RouteDao routeDao = sqlsession.getMapper(RouteDao.class);
		routeDao.insert(route);
		
		//현재 루트 코드 가져오기
		int routecode = routeDao.getRouteCode("a@naver.com");
		
		System.out.println("취향 체크박스 :"+personal);
		java.util.List<Route> routepersonal = new ArrayList();
		
		String[] personalList = personal.split(",");
		
		for (String personalcode : personalList) {
			System.out.println(">"+personalcode+"<");
			
			
			Route rp = new Route();
			rp.setUsername("a@naver.com");
			rp.setRoute_code(routecode);
			rp.setPersonal_code(personalcode);
			
			routepersonal.add(rp);
		}		
		
		Map<String, Object> map = new HashMap();
		map.put("list", routepersonal);
		
		routeDao.insertPersonal(map);//취향 입력
		
		//여행지 뽑아서 보낼 것
		
		StringBuilder baseUrl = new StringBuilder("");
		StringBuilder urlParam = new StringBuilder("");
				
		java.util.List<RouteDetail> siteLists = new ArrayList<RouteDetail>();
		
		for (String personalcode : personalList) {
			java.util.List<RouteDetail> siteList = TourApiService.getListOfSite(baseUrl, new StringBuilder(personalcode));
			//siteLists.//리스트.add list 필요
		}
		request.setAttribute("pageCase", "routeRecommendPage");
		//request.setAttribute("siteList", siteList);
		
		
		return "PlanA.tmapMakeRoute";
	
	}
	
	
	/*
	* @date : 2017. 6. 16
	* @description : 루트 추천 받기 요청 -> 여행경로 추천 정보 리턴 
	* @return : String(View 페이지) 
	*/
	@RequestMapping(value="PLANA.recommend.do",  method=RequestMethod.POST)
	public String makeRecommendRoute(Route route, String personal) throws ClassNotFoundException, SQLException, IOException, SAXException, ParserConfigurationException {
		
		// Mybatis 적용
		RouteDao routeDao = sqlsession.getMapper(RouteDao.class);
		routeDao.insert(route);
		
		//현재 루트 코드 가져오기
		int routecode = routeDao.getRouteCode("a@naver.com");
		
		System.out.println("취향 체크박스 :"+personal);
		java.util.List<Route> routepersonal = new ArrayList();
		
		String[] personalList = personal.split(",");
		
		for (String personalcode : personalList) {
			System.out.println(">"+personalcode+"<");
			
			
			Route rp = new Route();
			rp.setUsername("a@naver.com");
			rp.setRoute_code(routecode);
			rp.setPersonal_code(personalcode);
			
			routepersonal.add(rp);
		}		
		
		Map<String, Object> map = new HashMap();
		map.put("list", routepersonal);
		
		routeDao.insertPersonal(map);
		
		//여행루트 추천 뽑아서 보낼 것
		
		
		return "PlanA.tmapMakeRoute";
	
	}
}
