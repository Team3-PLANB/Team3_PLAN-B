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
import java.security.Principal;
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
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import com.planb_jeju.dao.ExDao;
import com.planb_jeju.dao.RouteDao;
import com.planb_jeju.dto.Route;
import com.planb_jeju.dto.RouteDetail;
import com.planb_jeju.service.RouteDetailService;
import com.planb_jeju.service.RouteService;
import com.planb_jeju.service.TourApiService;
import com.planb_jeju.utils.CheckBoxParse;

@Controller
public class PlanAController {

	@Autowired
	private SqlSession sqlsession;

	@Autowired
	private RouteService routeService;
	
	@Autowired
	private RouteDetailService routeDetailService;

	/*
	 * @date : 2017. 6. 16
	 * 
	 * @description : 회원가입 화면 이동
	 * 
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
	 * 
	 * @description : 루트 만들기 요청 -> 여행지 추천 정보 리턴
	 * 
	 * @return : String(View 페이지)
	 */
	@RequestMapping(value = "PLANA.make.do", method = RequestMethod.POST)
	public String makeSelfRoute(HttpServletRequest request, Route route, String personal)
			throws ClassNotFoundException, SQLException, SAXException, IOException, ParserConfigurationException {

		/*System.out.println("principal"+principal);
		Object principal2 = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println("prin2"+principal2);
		System.out.println("아이디 : "+principal.getName());*/
		// Route, Personal DB insert 함수 호출
		insertRouteAndPersonal(route, personal);
		
		// Tmap API 에 취향에 맞는 여행지 데이터 요청
		StringBuilder baseUrl = new StringBuilder("");

		// 받은 데이터 저장할 ArrayList
		java.util.List<RouteDetail> siteLists = new ArrayList<RouteDetail>();

		String[] personalList = CheckBoxParse.parseString(personal);
		// 취향 마다 요청 따로 보내야 함 -> 취향 하나에 요청 한번, 각 요청에 응답 데이터 저장
		for (String personalcode : personalList) {
			java.util.List<RouteDetail> siteList = TourApiService.getListOfSite(baseUrl,
					new StringBuilder(personalcode));

			siteLists.addAll(siteList);
		}
		request.setAttribute("pageCase", "routeRecommendPage");
		request.setAttribute("siteList", siteLists);
		
		// 현재 루트 코드 가져오기 -> id principal
		int routecode = routeService.getRoutecode("a@naver.com");
		request.setAttribute("route_code", routecode); // route_detail 저장을 위해 값 넘기기

		return "PlanA.tmapMakeRoute";

	}

	/*
	 * @date : 2017. 6. 16
	 * 
	 * @description : 루트 추천 받기 요청 -> 여행경로 추천 정보 리턴
	 * 
	 * @return : String(View 페이지)
	 */
	@RequestMapping(value = "PLANA.recommend.do", method = RequestMethod.POST)
	public String makeRecommendRoute(HttpServletRequest request,Route route, String personal)
			throws ClassNotFoundException, SQLException, IOException, SAXException, ParserConfigurationException {

		// Route, Personal DB insert 함수 호출
		insertRouteAndPersonal(route, personal);

		// 여행루트 추천 DB 가져오기
		// RouteDao mapper 사용해서 루트 코드리스트 가져온 다음 코드 리스트에 부합하는 routeDetail list 또 가져오기  -> mapper 2개
		//route.getPartner_code();
		String[] personalList = CheckBoxParse.parseString(personal);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("partner_code", route.getPartner_code());
		map.put("personal_code", personalList);
		map.put("personal_code_len", personalList.length);
		map.put("username", "a@naver.com");//session값으로 바꾸기
		
		java.util.List<Route> routeList = routeService.getRouteList(map);
		
		System.out.println("여행지 추천 결과"+routeList.toString());
		if(routeList.size()>0){
			System.out.println("여행지 추천 결과"+routeList.toString());
			
			Map<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("list", routeList);
			java.util.List<RouteDetail> routeDetailList = routeDetailService.getRouteDetailList(resultMap);
			
			System.out.println("여행지 경로 상세 결과");
			System.out.println(routeDetailList.toString());
			request.setAttribute("routeList", routeDetailList);
		}
		
		return "PlanA.tmapMakeRoute";

	}

	/*
	 * @date : 2017. 6. 19
	 * 
	 * @description : PLANA RouteDetail 저장
	 * 
	 *           비동기 처리 
	 * @return : ?
	 */
	@RequestMapping(value = "PLANA.detail.insert.do", method = RequestMethod.POST)
	public String makeRouteDetail(@RequestBody RouteDetail routedetail, Principal principal)
			throws ClassNotFoundException, SQLException, IOException, SAXException, ParserConfigurationException {

		// 화면 단에서 RouteDetail List 타입으로 정보 다 담아서 넣어서 전달 되어짐
		// routedetail.routeDetailList 에 담긴 정보 가져와서 hashMap에 담아서 insert 호출

		// route_detail DB insert
		// routeDetailService.insert(route);
			

		// 일단  마이 페이지 일정 확인 페이지로 이동 /비동기라면 처리 바꿔야..
		return "PlanA.tmapMakeRoute";

	}
	
	
	/*
	 * @date : 2017. 6. 19
	 * 
	 * @description : makeSelfRoute함수와, makeRecommendRoute함수에서 반복되는 작업 함수로 정리
	 * 
	 */
	public void insertRouteAndPersonal(Route route, String personal) throws ClassNotFoundException, SQLException {
		// principal 가져오기
		route.setUsername("a@naver.com");

		// route DB insert
		routeService.insertRoute(route);

		// 현재 루트 코드 가져오기
		int routecode = routeService.getRoutecode("a@naver.com");

		// CheckBox 값 배열로 정리
		String[] personalList = CheckBoxParse.parseString(personal);

		// 취향 체크 박스 선택 된 만큼 취향 테이블에 insert할 수 있게 ArrayList로 만듬
		java.util.List<Route> arrayList = new ArrayList();

		for (String personalcode : personalList) {
			Route rp = new Route();
			rp.setUsername("a@naver.com");
			rp.setRoute_code(routecode);
			rp.setPersonal_code(personalcode);

			arrayList.add(rp);
		}

		Map<String, Object> map = new HashMap();
		map.put("list", arrayList);

		// route-personal DB insert
		routeService.insertPersonal(map);

	}
}
