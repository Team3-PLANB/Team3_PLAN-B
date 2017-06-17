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
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.planb_jeju.dao.ExDao;
import com.planb_jeju.dao.RouteDao;
import com.planb_jeju.dao.RoutePersonalDao;
import com.planb_jeju.dto.Route;
import com.planb_jeju.dto.RoutePersonal;

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
		
	@RequestMapping(value="PLANA.make.do",  method=RequestMethod.POST)
	public String makeSelfRoute(Route route, String personal) throws ClassNotFoundException, SQLException {
		
		//값이 없을 경우 처리 필요
		//@RequestParam(value="p", defaultValue="1") int pageNumber
		//Date date = new Date();
		System.out.println("직접 루트!!!!!!!!!!!!");
		System.out.println("sdate: "+ route.getSday());
		System.out.println("eday);"+ route.getEday());
		System.out.println("파트너:"+ route.getPartner_code());
		System.out.println("루트 이름 : "+route.getRoutename());
		route.setUsername("a@naver.com");
		
		// Mybatis 적용
		RouteDao routeDao = sqlsession.getMapper(RouteDao.class);
		routeDao.insert(route);
		
		//현재 루트 코드 가져오기
		int routecode = routeDao.getRouteCode("a@naver.com");
		
		System.out.println("취향 체크박스 :"+personal);
		java.util.List<RoutePersonal> routepersonal = new ArrayList();
		
		String[] personalList = personal.split(",");
		
		for (String personalcode : personalList) {
			System.out.println(">"+personalcode+"<");
			
			
			RoutePersonal rp = new RoutePersonal();
			rp.setUsername("a@naver.com");
			rp.setRoute_code(routecode);
			rp.setPersonal_code(personalcode);
			
			routepersonal.add(rp);
		}		
		
		Map<String, Object> map = new HashMap();
		map.put("list", routepersonal);
		
		RoutePersonalDao routepersonalDao = sqlsession.getMapper(RoutePersonalDao.class);
		routepersonalDao.insert(map);
		
		//여행지 뽑아서 보낼 것
		return "PlanA.tmapMakeRoute";
	
	}
	
	@RequestMapping(value="PLANA.recommend.do",  method=RequestMethod.POST)
	public String makeRecommendRoute(Route route, String personal) throws ClassNotFoundException, SQLException {
		
		//값이 없을 경우 처리 필요
		//@RequestParam(value="p", defaultValue="1") int pageNumber
		//Date date = new Date();
		System.out.println("추천경로!!!!!!!!!!!!!!!!!!!!!!!");
		System.out.println("sdate: "+ route.getSday());
		System.out.println("eday);"+ route.getEday());
		System.out.println("파트너:"+ route.getPartner_code());
		System.out.println("루트 이름 : "+route.getRoutename());
		route.setUsername("a@naver.com");
		
		// Mybatis 적용
		RouteDao routeDao = sqlsession.getMapper(RouteDao.class);
		routeDao.insert(route);
		
		//현재 루트 코드 가져오기
		int routecode = routeDao.getRouteCode("a@naver.com");
		
		System.out.println("취향 체크박스 :"+personal);
		java.util.List<RoutePersonal> routepersonal = new ArrayList();
		
		String[] personalList = personal.split(",");
		
		for (String personalcode : personalList) {
			System.out.println(">"+personalcode+"<");
			
			
			RoutePersonal rp = new RoutePersonal();
			rp.setUsername("a@naver.com");
			rp.setRoute_code(routecode);
			rp.setPersonal_code(personalcode);
			
			routepersonal.add(rp);
		}		
		
		Map<String, Object> map = new HashMap();
		map.put("list", routepersonal);
		
		RoutePersonalDao routepersonalDao = sqlsession.getMapper(RoutePersonalDao.class);
		routepersonalDao.insert(map);
		
		//여행루트 추천 뽑아서 보낼 것
		return "PlanA.tmapMakeRoute";
	
	}
}
