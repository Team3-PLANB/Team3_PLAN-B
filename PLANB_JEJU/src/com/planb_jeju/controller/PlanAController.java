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

import javax.swing.text.Document;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

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
		
	/*
	* @date : 2017. 6. 16
	* @description : 루트 만들기 요청 -> 여행지 추천 정보 리턴 
	* @return : String(View 페이지) 
	*/
	@RequestMapping(value="PLANA.make.do",  method=RequestMethod.POST)
	public String makeSelfRoute(Route route, String personal) throws ClassNotFoundException, SQLException, SAXException, IOException, ParserConfigurationException {
		
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
		
		String searchurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=sINbtYMpCw1C2%2BFZOiN%2FbJjqUn42vfFvg0%2BkN1NbFHjDt3JfU4U7gLkSOf16L07YIBDBLElP%2FLCJYIiqNBH5dQ%3D%3D&contentTypeid=12&areaCode=39&cat2=A0101&MobileOS=ETC&MobileApp=AppTesting";
		
		
		InputStreamReader isr;
		try {
			URL url = new URL(searchurl); 
			    
			BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream()));
		          String line;
		          while ((line = in.readLine()) != null) {
		        	  System.out.println("????????");
		                System.out.println(line);
		          }
		          
		          InputSource   is = new InputSource(new StringReader(line)); 

		          Document document = (Document) DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(is);
		          
		          System.out.println("안돼");
		          System.out.println(document);
		          
		          in.close(); 			
			
			isr = new InputStreamReader(url.openConnection().getInputStream(), "UTF-8");
			// JSON을 Parsing 한다. 문법오류가 날 경우 Exception 발생, without Exception -> parse 메소드
			JSONObject object = (JSONObject)JSONValue.parseWithException(isr);
			//System.out.println(object);
			// 객체
			JSONObject channel = (JSONObject)(object.get("item"));
			JSONArray items = (JSONArray)channel.get("content");
			//System.out.println(items);
			// item 배열
			//JSONArray items = (JSONArray)channel.get("item");
			
			for(int i = 0 ; i < items.size(); i++) {
				JSONObject obj1 = (JSONObject)items.get(i);			
				//System.out.println(obj1.get("STN_NM").toString()+"//"+obj1.get("SAWS_TA_AVG").toString());
								
			}
			
			
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		
			/*System.out.println(items.toString());*/
		
		
		
		return "PlanA.tmapMakeRoute";
	
	}
	
	
	/*
	* @date : 2017. 6. 16
	* @description : 루트 추천 받기 요청 -> 여행경로 추천 정보 리턴 
	* @return : String(View 페이지) 
	*/
	@RequestMapping(value="PLANA.recommend.do",  method=RequestMethod.POST)
	public String makeRecommendRoute(Route route, String personal) throws ClassNotFoundException, SQLException {
		
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
