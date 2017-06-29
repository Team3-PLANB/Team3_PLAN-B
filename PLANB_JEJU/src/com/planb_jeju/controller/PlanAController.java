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
//주석 추가
import java.awt.List;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.URL;
import java.security.Principal;
import java.sql.SQLException;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.text.Document;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
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
import com.planb_jeju.utils.DateParse;
import com.planb_jeju.utils.PersonalParse;

@Controller
@SessionAttributes("sessionPersonal")
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

	/*
	 * @return : String(View 페이지) : step.jsp
	 */
	@RequestMapping(value ="PLANA.make.do", method = RequestMethod.GET)
	public String routeInsert() {
		return "PlanA.step";
		
	}

	/*
	 * @date : 2017. 6. 25
	 * 
	 * @description : 경로 만들기 페이지에서 여행지 검색 -> 여행지 추천 정보 리턴
	 * 
	 * @return : 비동기
	 */
	@RequestMapping(value = "PLANA.make.do", method = RequestMethod.POST)
	public @ResponseBody java.util.List<RouteDetail> makeSelfRoute(@RequestParam("searchWord") String searchWord, HttpSession session, HttpServletRequest request, Principal principal, Route route)
			throws ClassNotFoundException, SQLException, SAXException, IOException, ParserConfigurationException {

		//세션에 담긴 취향 정보 배열 가져오기
		 session = request.getSession();
		 String[] personalList = (String[]) session.getAttribute("sessionPersonal");
		
		 
		// Tmap API 에 취향에 맞는 여행지 데이터 요청
		StringBuilder baseUrl = new StringBuilder("");

		// 받은 데이터 저장할 ArrayList
		java.util.List<RouteDetail> siteLists = new ArrayList<RouteDetail>();

		
		java.util.List<RouteDetail> siteList = TourApiService.getListOfSite(baseUrl, new StringBuilder(searchWord));
		siteLists.addAll(siteList);
		
		// 취향 마다 요청 따로 보내야 함 -> 취향 하나에 요청 한번, 각 요청에 응답 데이터 저장
		/*for (String personalcode : personalList) {
			java.util.List<RouteDetail> siteList = TourApiService.getListOfSite(baseUrl,
					new StringBuilder(personalcode));

			siteLists.addAll(siteList);
		}*/
		
		//request.setAttribute("siteList", siteLists);
	
		System.out.println("return하는 리스트:"+siteLists.toString());

		return siteLists;

	}

	/*
	 * @date : 2017. 6. 16
	 * 
	 * @description : 루트 추천 받기 요청 -> 여행경로 추천 정보 리턴
	 * 
	 * @return : String(View 페이지)
	 */
	@RequestMapping(value = "PLANA.recommend.do", method = RequestMethod.POST)
	public String makeRecommendRoute(Principal principal, HttpServletRequest request, Route route, String personal, Model model)
			throws ClassNotFoundException, SQLException, IOException, SAXException, ParserConfigurationException {
		
		
		// Route, Personal DB insert 함수 호출
		insertRouteAndPersonal(route, personal, principal.getName());
		
		
		// 현재 루트 코드 가져오기 route_code(Max) 값 -> id principal 
		int routecode = routeService.getRoutecode(principal.getName());
		// View단으로 return 해줄 Route 객체에 필요한정보 set
		route.setRoute_code(routecode);
		route.setUsername(principal.getName());
		
		// 여행 일자 시작 날짜 부터 마침 날짜 까지 String 타입 리스트로 정리
		java.util.List<String> datesList =  DateParse.DateToList(route.getSday(), route.getEday());
		
		System.out.println(datesList.toString());
		// 여행루트 추천 DB 가져오기
		// RouteDao mapper 사용해서 루트 코드리스트 가져온 다음 코드 리스트에 부합하는 routeDetail list 또 가져오기  -> mapper 2개
		//route.getPartner_code();
		String[] personalList = CheckBoxParse.parseString(personal);
		
		// session객체에 personalList담기
		model.addAttribute("sessionPersonal", personalList);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		System.out.println("확인");
		System.out.println(route.getPartner_code());
		System.out.println(personalList[0].toString());
		System.out.println(principal.getName());
		
		map.put("partner_code", route.getPartner_code());
		map.put("personal_code", personalList);
		map.put("username", principal.getName());
		map.put("personal_code_len", personalList.length);
		
		
		// 조건에 맞는 RouteDto를 List로 받기 (조건 : 파트너 코드, 취향 코드를 map에 저장, 파라메터로 전달)
		java.util.List<Route> routeList = routeService.getRouteList(map);
		System.out.println("여행지 경로 결과");
		System.out.println(routeList);
		// view에 보낼 정보 저장할 Map생성
		Map<String, Object> routeDetailMap = new HashMap<>();
		
		if(routeList.size()>0){			
			// routeDetailMap의 Key값은 각 경로의 이름, Value는 경로의 Site List
			routeDetailMap = routeDetailService.getRouteDetailList(routeList);
		}
		
		System.out.println("여행지 경로 상세 결과");
		System.out.println(routeDetailMap.toString());
		
		request.setAttribute("pageCase", "routeRecommendPage");
		request.setAttribute("routeMap", routeDetailMap);
		request.setAttribute("myRouteInfo", route);
		request.setAttribute("datesList", datesList);
		
		return "PlanA.tmapMakeRoute";

	}

	/*
	 * @date : 2017. 6. 19
	 * 
	 * @description : PLANA RouteDetail 저장
	 * 
	 *           
	 * @return : ?
	 */
	@RequestMapping(value = "PLANA.detail.insert.do", method = RequestMethod.POST)
	public String makeRouteDetail(Principal principal, @ModelAttribute RouteDetail routeDetail, Model model)
			throws ClassNotFoundException, SQLException, IOException, SAXException, ParserConfigurationException {

		// 화면 단에서 RouteDetail List 타입으로 정보 다 담아서 넣어서 전달 되어짐
		// routedetail.routeDetailList 에 담긴 정보 가져와서 hashMap에 담아서 insert 호출

		//Integer[] route_order, String[] username, Integer[] route_code, Date[] route_date, String[] site, String[] lon, String[] lat, String[] category, Time[] stime, Time[] etime
		// route_detail DB insert
		// routeDetailService.insert(route);


		System.out.println(routeDetail.toString());
		
		Map<String, Object> map = new HashMap();
		
		ArrayList<RouteDetail> routeList = (ArrayList<RouteDetail>) routeDetail.getRouteDetailList();
		
		// 취향 한국말 설명 -> 코드성 변경
		for(RouteDetail routeDetail2 : routeList){
			routeDetail2.setCategory(PersonalParse.string2code(routeDetail2.getCategory()));
		}
		
		
		map.put("list", routeList);
		
		int result = routeDetailService.insertRouteDetail(map);

		if(result>0){
			System.out.println("루트 상세 저장 완료");
		}
		
		java.util.List<Route> mytRouteList = routeService.getMyRouteList(principal.getName());
		model.addAttribute("mytRouteList", mytRouteList);

		return "MyPage.Schedule.scheduleMain";

	}
	
	
		
	
	
	/*
	 * @date : 2017. 6. 19
	 * 
	 * @description : makeSelfRoute함수와, makeRecommendRoute함수에서 반복되는 작업 함수로 정리
	 * 
	 */
	public void insertRouteAndPersonal(Route route, String personal, String username) throws ClassNotFoundException, SQLException {
		// principal 가져오기
		route.setUsername(username);

		// route DB insert
		routeService.insertRoute(route);
		

		// 현재 루트 코드 가져오기
		int routecode = routeService.getRoutecode(username);

		// CheckBox 값 배열로 정리
		String[] personalList = CheckBoxParse.parseString(personal);

		// 취향 체크 박스 선택 된 만큼 취향 테이블에 insert할 수 있게 ArrayList로 만듬
		java.util.List<Route> arrayList = new ArrayList();

		for (String personalcode : personalList) {
			Route rp = new Route();
			rp.setUsername(username);
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
