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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.planb_jeju.dao.ExDao;
import com.planb_jeju.dao.MemberDao;
import com.planb_jeju.dto.Member;
import com.planb_jeju.dto.RoutePostscript;
import com.planb_jeju.dto.RoutePostscriptLike;
import com.planb_jeju.dto.RoutePostscriptTag;
import com.planb_jeju.service.MemberService;
import com.planb_jeju.service.PostscriptService;


@Controller
@RequestMapping("/PostScript/")
public class PostScriptController {

//  private static MemberDao memberDao; 

	@Autowired
	private SqlSession sqlsession;
	
	PostscriptService postscriptservice = new PostscriptService();
	
	/*
	* @date : 2017. 6. 20
	* @description : 루트 후기 게시판 리스트
	* @parameter : session 세션, model 루트 루기 리스트를 저장해 넘겨주기 위한 모델 객체
	* @return : String(View 페이지) 
	*/
	@RequestMapping(value="Route/List.do", method=RequestMethod.GET)
	public String listRoutePostscript(HttpSession session, Model model) throws ClassNotFoundException, SQLException {
		System.out.println("후기 게시판 들어옴");
		Member member = (Member)session.getAttribute("member");
		System.out.println("로그인된 아이디 : " + member.getUsername());
		List<RoutePostscript> routePostscriptList = postscriptservice.listRoutePostscript(member.getUsername(), sqlsession);
		System.out.println("routePostscriptList : " + routePostscriptList);
		model.addAttribute("routePostscriptList", routePostscriptList);
		return "PostScript.Route.listBoard";	
	}
	
	/*
	* @date : 2017. 6. 21
	* @description : 루트 후기 게시판 상세보기
	* @parameter : request url에 함께 들어온 request 파라메터를  받기위해 사용, session 세션, model 루트 루기 리스트를 저장해 넘겨주기 위한 모델 객체
	* @return : String(View 페이지) 
	*/
	@RequestMapping(value="Route/Detail.do", method=RequestMethod.GET)
	public String detailRoutePostscript(HttpServletRequest request, HttpSession session, Model model) throws ClassNotFoundException, SQLException {
		System.out.println("후기 게시판 상세보기");
		Member member = (Member)session.getAttribute("member");
		System.out.println("로그인된 아이디 : " + member.getUsername());
		
		int route_postscript_rownum = Integer.parseInt(request.getParameter("route_postscript_rownum"));
		
		RoutePostscript routePostscript = postscriptservice.detailRoutePostscript(route_postscript_rownum, member.getUsername(), sqlsession);
	//	List<RoutePostscriptTag> routePostscriptTagList = postscriptservice.getRoutePostTagList(routePostscript, sqlsession);
		System.out.println("routePostscript : " + routePostscript);
		model.addAttribute("routePostscript", routePostscript);
	//	model.addAttribute("routePostscriptTagList", routePostscriptTagList);
		return "PostScript.Route.detail";	

	}
	
	/*
	* @date : 2017. 6. 21
	* @description : 루트 후기 찜콩 설정/해제
	* @parameter : request url에 함께 들어온 request 파라메터를  받기위해 사용, session 세션, model 루트 루기 리스트를 저장해 넘겨주기 위한 모델 객체
	* @return : String(View 페이지) 
	*/
	@RequestMapping(value="Route/Like.do", method=RequestMethod.GET)
	public @ResponseBody String postscriptRoot_detail(HttpServletRequest request, HttpSession session) throws ClassNotFoundException, SQLException {
		Member member = (Member)session.getAttribute("member");
		int route_postscript_rownum = Integer.parseInt(request.getParameter("route_postscript_rownum"));
		String route_like = request.getParameter("route_like").trim();
		RoutePostscriptLike routePostscriptLike = new RoutePostscriptLike(0, route_postscript_rownum, member.getUsername());
		
		String change = "";
		
		if(route_like.equals("true")){
			System.out.println("찜콩 설정되어 있음");
			postscriptservice.deleteLike(routePostscriptLike, sqlsession);
			postscriptservice.downLikeNum(routePostscriptLike, sqlsession);
			System.out.println("찜콩 해제 완료");
			change = "tTf"; //true to false
		}else{
			System.out.println("찜콩 해제되어 있음");
			postscriptservice.insertLike(routePostscriptLike, sqlsession);
			postscriptservice.upLikeNum(routePostscriptLike, sqlsession);
			System.out.println("찜콩 설정 완료");
			change = "fTt"; //false to true
		}
		
		return change;
	}
	
	
	
	
	@RequestMapping("/Site/List.do")
	public String postscriptSite_list() throws ClassNotFoundException, SQLException {
		
		return "PostScript.Site.listBoard";	

	}
	
	
	
	@RequestMapping("Site/Detail.do")
	public String postscriptSite_detail() throws ClassNotFoundException, SQLException {
		
		return "PostScript.Site.detail";	

	}



}
