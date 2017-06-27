package com.planb_jeju.controller;

/*
* @FileName : PostScriptController.java
* @Class : PostScriptController
* @Project : PLANB_JEJU
* @Date : 2017.06.16
* @LastEditDate : 2017.06.19
* @Author : 정다혜
* @Desc : 후기 게시판 컨트롤러 
*/

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.planb_jeju.dao.ExDao;
import com.planb_jeju.dao.MemberDao;
import com.planb_jeju.dto.Member;
import com.planb_jeju.dto.Route;
import com.planb_jeju.dto.RouteDetail;
import com.planb_jeju.dto.RouteHistory;
import com.planb_jeju.dto.RoutePostscript;
import com.planb_jeju.dto.RoutePostscriptLike;
import com.planb_jeju.dto.RoutePostscriptTag;
import com.planb_jeju.dto.SitePostscript;
import com.planb_jeju.dto.SitePostscriptLike;
import com.planb_jeju.dto.SitePostscriptTag;
import com.planb_jeju.service.HistoryService;
import com.planb_jeju.service.MemberService;
import com.planb_jeju.service.RouteDetailService;
import com.planb_jeju.service.RoutePostscriptService;
import com.planb_jeju.service.RouteService;
import com.planb_jeju.service.SitePostscriptService;


@Controller
@RequestMapping("/PostScript/")
public class PostScriptController {

//  private static MemberDao memberDao; 

	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	RoutePostscriptService routePostscriptservice;
	
	@Autowired
	SitePostscriptService sitePostscriptservice;
	
	@Autowired
	RouteService routeservice;
	
	@Autowired
	RouteDetailService routeDetailservice;
	
	@Autowired
	HistoryService historyservice;
	
	/*
	* @date : 2017. 6. 20
	* @description : 루트 후기 게시판 리스트
	* @parameter : principal 로그인한 회원 정보, model 루트 루기 리스트를 저장해 넘겨주기 위한 모델 객체
	* @return : String(View 페이지) 
	*/
	@RequestMapping(value="Route/List.do")
	public String listRoutePostscript(Principal principal, Model model, @RequestParam(value="searchWord", required=false) String searchWord) throws Exception {
		System.out.println("루트 후기 게시판 리스트");
		String username = null;
		if(principal != null){
			username = principal.getName();
			System.out.println("로그인된 아이디 : " + username);
		}
		System.out.println("searchWord : " + searchWord);
		List<RoutePostscript> routePostscriptList = routePostscriptservice.listRoutePostscript(username, searchWord);
		System.out.println("routePostscriptList : " + routePostscriptList);
		model.addAttribute("routePostscriptList", routePostscriptList);
		model.addAttribute("searchWord", searchWord);
		return "PostScript.Route.listBoard";	
	}
	
	/*
	* @date : 2017. 6. 21
	* @description : 루트 후기 게시판 상세보기
	* @parameter : request url에 함께 들어온 request 파라메터를  받기위해 사용, principal 로그인한 회원 정보, model 루트 루기 리스트를 저장해 넘겨주기 위한 모델 객체
	* @return : String(View 페이지) 
	*/
	@RequestMapping(value="Route/Detail.do", method=RequestMethod.GET)
	public String detailRoutePostscript(@RequestParam("route_postscript_rownum") int route_postscript_rownum, Principal principal, Model model) throws ClassNotFoundException, SQLException {
		System.out.println("루트 후기 게시판 상세보기");
		String username = null;
		if(principal != null){
			username = principal.getName();
			System.out.println("로그인된 아이디 : " + username);
		}
		RoutePostscript routePostscript = routePostscriptservice.detailRoutePostscript(route_postscript_rownum, username, sqlsession);
	//	List<RoutePostscriptTag> routePostscriptTagList = postscriptservice.getRoutePostTagList(routePostscript, sqlsession);
		System.out.println("routePostscript : " + routePostscript);
		model.addAttribute("routePostscript", routePostscript);
	//	model.addAttribute("routePostscriptTagList", routePostscriptTagList);
		return "PostScript.Route.detail";	

	}
	
	/*
	* @date : 2017. 6. 21
	* @description : 루트 후기 찜콩 설정/해제
	* @parameter : request url에 함께 들어온 request 파라메터를  받기위해 사용, principal 로그인한 회원 정보
	* @return : String(View 페이지) 
	*/
	@RequestMapping(value="Route/Like.do", method=RequestMethod.GET)
	public @ResponseBody String changLikeRoutePostscript(@RequestParam int route_postscript_rownum, @RequestParam String route_like, Principal principal) throws ClassNotFoundException, SQLException {
		RoutePostscriptLike routePostscriptLike = new RoutePostscriptLike(0, route_postscript_rownum, principal.getName());
		
		String change = "";
		
		if(route_like.equals("true")){
			System.out.println("찜콩 설정되어 있음");
			routePostscriptservice.deleteLike(routePostscriptLike, sqlsession);
			routePostscriptservice.downLikeNum(routePostscriptLike, sqlsession);
			System.out.println("찜콩 해제 완료");
			change = "tTf"; //true to false
		}else{
			System.out.println("찜콩 해제되어 있음");
			routePostscriptservice.insertLike(routePostscriptLike, sqlsession);
			routePostscriptservice.upLikeNum(routePostscriptLike, sqlsession);
			System.out.println("찜콩 설정 완료");
			change = "fTt"; //false to true
		}
		
		return change;
	}
	
	/*
	* @date : 2017. 6. 24
	* @description : 루트 후기 태그 검색
	* @parameter : request url에 함께 들어온 request 파라메터를  받기위해 사용, principal 로그인한 회원 정보
	* @return : String(View 페이지) 
	*/
	/*@RequestMapping(value="Route/Search.do", method=RequestMethod.POST)
	public String searchRoutePostscriptByTag(String searchWord, Model model) throws ClassNotFoundException, SQLException {
		System.out.println("검색어 : " + searchWord);
		int searchCount = routePostscriptservice.getCountRoutePostByTag(searchWord);
		List<RoutePostscript> routePostscriptList = routePostscriptservice.getRoutePostListByTag(searchWord);
		
		model.addAttribute("searchCount", searchCount);
		model.addAttribute("routePostscriptList", routePostscriptList);
		
		return "PostScript.Route.listBoard";
	}*/
	
	/*
	* @date : 2017. 6. 23
	* @description : 후기 작성
	* @parameter : 
	* @return : String(View 페이지) 
	*/
	@RequestMapping(value="Route/Write.do", method=RequestMethod.GET)
	public String writeRoutePostscript(@RequestParam int route_code, Principal principal, Model model) throws Exception {
		System.out.println("후기 작성");
		String username = null;
		if(principal != null){
			username = principal.getName();
			System.out.println("로그인된 아이디 : " + username);
		}
		Route route = routeservice.getRouteInfo(route_code, principal.getName());
		List<RouteDetail> routeDetailList = routeDetailservice.getRouteDetailListForPost(route_code, username);
		
		System.out.println("route : " + route);
		System.out.println("routeDetailList : " + routeDetailList);
		model.addAttribute("route", route);
		model.addAttribute("routeDetailList", routeDetailList);
		return "PostScript.Route.writeForm";	
	}

	
	/*
	* @date : 2017. 6. 22
	* @description : 루트 후기 작성 OK
	* @parameter : principal 로그인한 회원 정보, model 루트 루기 리스트를 저장해 넘겨주기 위한 모델 객체
	* @return : String(View 페이지) 
	*/
	@RequestMapping(value="Route/WriteOk.do", method=RequestMethod.POST)
	public String writeRoutePostscriptOk(@RequestParam int route_code, Principal principal, RoutePostscript routePostscript, Model model) throws Exception {
		System.out.println("루트 후기 작성 ok");
		System.out.println("로그인된 아이디 : " + principal.getName());
		System.out.println("넘어온 객체 : " + routePostscript);
		routePostscript.setUsername(principal.getName());
		
		RoutePostscript myRoutePostscript = routePostscriptservice.writeRoutePostscript(routePostscript, sqlsession);
		
		routePostscriptservice.insertTag(myRoutePostscript, sqlsession);
		
		model.addAttribute("routePostscript", myRoutePostscript);
		
		return "PostScript.Route.detail";	
	}
	
	
	/*
	* @date : 2017. 6. 23
	* @description : 루트 후기 작성
	* @parameter : 
	* @return : String(View 페이지) 
	*/
	@RequestMapping(value="Site/Write.do", method=RequestMethod.GET)
	public String writeSitePostscript(@RequestParam int route_code, Principal principal, Model model) throws Exception {
		System.out.println("후기 작성");
		
		Route route = routeservice.getRouteInfo(route_code, principal.getName());
		
		System.out.println("route : " + route);
		model.addAttribute("route", route);
		return "PostScript.Route.writeForm";	
	}

	
	/*
	* @date : 2017. 6. 22
	* @description : 루트 후기 작성 OK
	* @parameter : principal 로그인한 회원 정보, model 루트 루기 리스트를 저장해 넘겨주기 위한 모델 객체
	* @return : String(View 페이지) 
	*/
	@RequestMapping(value="Site/WriteOk.do", method=RequestMethod.POST)
	public String writeSitePostscriptOk(@RequestParam int route_code, Principal principal, RoutePostscript routePostscript, Model model) throws Exception {
		System.out.println("후기 작성 ok");
		System.out.println("로그인된 아이디 : " + principal.getName());
		System.out.println("넘어온 객체 : " + routePostscript);
		routePostscript.setUsername(principal.getName());
		
		RoutePostscript myRoutePostscript = routePostscriptservice.writeRoutePostscript(routePostscript, sqlsession);
		
		routePostscriptservice.insertTag(myRoutePostscript, sqlsession);
		
		model.addAttribute("routePostscript", myRoutePostscript);
		
		return "PostScript.Route.detail";	
	}
	
		
	/*
	* @date : 2017. 6. 22
	* @description : 사이트 후기 게시판 리스트
	* @parameter : principal 로그인한 회원 정보, principal 로그인한 회원 정보, model 루트 루기 리스트를 저장해 넘겨주기 위한 모델 객체
	* @return : String(View 페이지) 
	*/
	@RequestMapping(value="Site/List.do", method=RequestMethod.GET)
	public String listSitePostscript(Principal principal, Model model) throws Exception {
		System.out.println("사이트 후기 게시판 들어옴");
		System.out.println("로그인된 아이디 : " + principal.getName());
		List<SitePostscript> sitePostscriptList = sitePostscriptservice.listSitePostscript(principal.getName(), sqlsession);
		
		System.out.println("sitePostscriptList : " + sitePostscriptList);
		model.addAttribute("sitePostscriptList", sitePostscriptList);
		return "PostScript.Site.listBoard";	
	}
	
	
	/*
	* @date : 2017. 6. 22
	* @description : 사이트 후기 게시판 상세보기
	* @parameter : request url에 함께 들어온 request 파라메터를  받기위해 사용, model 루트 루기 리스트를 저장해 넘겨주기 위한 모델 객체
	* @return : String(View 페이지) 
	*/
	@RequestMapping("Site/Detail.do")
	public String detailSitePostscript(@RequestParam int site_postscript_rownum, Principal principal, Model model) throws ClassNotFoundException, SQLException {
		System.out.println("사이트 후기 게시판 상세보기");
		System.out.println("로그인된 아이디 : " + principal.getName());
		
		
		SitePostscript sitePostscript = sitePostscriptservice.detailSitePostscript(site_postscript_rownum, principal.getName(), sqlsession);
		List<SitePostscriptTag> sitePostscriptTagList = sitePostscriptservice.getSitePostTagList(sitePostscript, sqlsession);
		
		System.out.println("sitePostscript : " + sitePostscript);
		model.addAttribute("sitePostscript", sitePostscript);
		model.addAttribute("sitePostscriptTagList", sitePostscriptTagList);
		return "PostScript.Site.detail";		
	}
	
	
	/*
	* @date : 2017. 6. 22
	* @description : 사이트 후기 찜콩 설정/해제
	* @parameter : request url에 함께 들어온 request 파라메터를  받기위해 사용, principal 로그인한 회원 정보
	* @return : String(View 페이지) 
	*/
	@RequestMapping(value="Site/Like.do", method=RequestMethod.GET)
	public @ResponseBody String changLikeSitePostscript(@RequestParam int site_postscript_rownum, @RequestParam String site_like, Principal principal) throws ClassNotFoundException, SQLException {
		SitePostscriptLike sitePostscriptLike = new SitePostscriptLike(0, site_postscript_rownum, principal.getName());
		
		String change = "";
		
		if(site_like.equals("true")){
			System.out.println("찜콩 설정되어 있음");
			sitePostscriptservice.deleteLike(sitePostscriptLike, sqlsession);
			sitePostscriptservice.downLikeNum(sitePostscriptLike, sqlsession);
			System.out.println("찜콩 해제 완료");
			change = "tTf"; //true to false
		}else{
			System.out.println("찜콩 해제되어 있음");
			sitePostscriptservice.insertLike(sitePostscriptLike, sqlsession);
			sitePostscriptservice.upLikeNum(sitePostscriptLike, sqlsession);
			System.out.println("찜콩 설정 완료");
			change = "fTt"; //false to true
		}
		
		return change;
	}
	
	
	/*
	* @date : 2017. 6. 24
	* @description : 히스토리 상세보기
	* @parameter : request url에 함께 들어온 request 파라메터를  받기위해 사용, principal 로그인한 회원 정보
	* @return : String(View 페이지)
	*/
	@RequestMapping(value="/History/history.do", method=RequestMethod.GET)
	public String detailHistory(HttpServletRequest request, Principal principal, Model model) throws ClassNotFoundException, SQLException {
		System.out.println("히스토리 상세보기");
		System.out.println("로그인된 아이디 : " + principal.getName());

		int route_code = Integer.parseInt(request.getParameter("route_code"));
		RouteHistory myroutehistory = historyservice.getRouteDetail(route_code, principal.getName());
		System.out.println(myroutehistory);
		model.addAttribute("myroutehistory", myroutehistory);
		return "MyPage.History.myHistory";	

	}

}
