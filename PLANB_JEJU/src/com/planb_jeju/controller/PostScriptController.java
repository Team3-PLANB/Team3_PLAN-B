package com.planb_jeju.controller;

import java.io.BufferedOutputStream;
import java.io.File;

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
import java.io.OutputStream;
import java.security.Principal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

import org.apache.ibatis.session.SqlSession;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
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
import com.planb_jeju.dto.SitePostscriptPhoto;
import com.planb_jeju.dto.SitePostscriptTag;
import com.planb_jeju.service.HistoryService;
import com.planb_jeju.service.MemberService;
import com.planb_jeju.service.RouteDetailService;
import com.planb_jeju.service.RoutePostscriptService;
import com.planb_jeju.service.RouteService;
import com.planb_jeju.service.SitePostscriptService;
import com.planb_jeju.utils.PersonalParse;


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
		System.out.println("루트 후기 리스트");
		List<RoutePostscriptTag> routePostscriptTagList = null;
		String username = null;
		if(principal != null){
			username = principal.getName();
			System.out.println("로그인된 아이디 : " + username);
		}
		System.out.println("searchWord : " + searchWord);
		List<RoutePostscript> routePostscriptList = routePostscriptservice.listRoutePostscript(username, searchWord);
		
		for(RoutePostscript post : routePostscriptList){
			routePostscriptTagList = routePostscriptservice.getRoutePostTagList(post.getRoute_postscript_rownum());
			post.setRoutePostscriptTag(routePostscriptTagList);
		}
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
		RoutePostscript routePostscript = routePostscriptservice.detailRoutePostscript(route_postscript_rownum, username);
		List<RoutePostscriptTag> routePostscriptTagList = routePostscriptservice.getRoutePostTagList(routePostscript.getRoute_postscript_rownum());
		routePostscript.setRoutePostscriptTag(routePostscriptTagList);
		
		System.out.println("routePostscript : " + routePostscript);
		model.addAttribute("routePostscript", routePostscript);
		return "PostScript.Route.detail";	

	}
	
	/*
	* @date : 2017. 6. 21
	* @description : 루트 후기 찜콩 설정/해제
	* @parameter : request url에 함께 들어온 request 파라메터를  받기위해 사용, principal 로그인한 회원 정보
	* @return : String 상태
	*/
	@RequestMapping(value="Route/Like.do", method=RequestMethod.GET)
	public @ResponseBody String changLikeRoutePostscript(@RequestParam int route_postscript_rownum, @RequestParam String route_like, Principal principal) throws ClassNotFoundException, SQLException {
		RoutePostscriptLike routePostscriptLike = new RoutePostscriptLike(0, route_postscript_rownum, principal.getName());
		
		String change = "";
		
		if(route_like.equals("true")){
			System.out.println("찜콩 설정되어 있음");
			routePostscriptservice.deleteLike(routePostscriptLike);
			routePostscriptservice.downLikeNum(routePostscriptLike);
			System.out.println("찜콩 해제 완료");
			change = "tTf"; //true to false
		}else{
			System.out.println("찜콩 해제되어 있음");
			routePostscriptservice.insertLike(routePostscriptLike);
			routePostscriptservice.upLikeNum(routePostscriptLike);
			System.out.println("찜콩 설정 완료");
			change = "fTt"; //false to true
		}
		
		return change;
	}
	
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
		
		for(RouteDetail routeDetail : routeDetailList){
			routeDetail.setCategory(PersonalParse.code2string(routeDetail.getCategory()));
		}
		
		System.out.println("route : " + route);
		System.out.println("routeDetailList : " + routeDetailList);
		model.addAttribute("route_code", route_code);
		model.addAttribute("route", route);
		model.addAttribute("routeDetailList", routeDetailList);
		return "PostScript.Route.writeForm";	
	}

	
	/*
	* @date : 2017. 6. 22
	* @description : 루트 후기 작성 OK
	* @parameter : principal 로그인한 회원 정보, model 루트 후기 리스트를 저장해 넘겨주기 위한 모델 객체
	* @return : String(View 페이지) 
	*/
	@RequestMapping(value="Route/WriteOk.do", method=RequestMethod.POST)
	public String writeRoutePostscriptOk(@RequestParam int route_code, Principal principal, RoutePostscript routePostscript, Model model) throws Exception {
		System.out.println("루트 후기 작성 ok");
		System.out.println("로그인된 아이디 : " + principal.getName());
		System.out.println("넘어온 객체 : " + routePostscript);
		routePostscript.setUsername(principal.getName());
		
		RoutePostscript lastRoutePostscript = routePostscriptservice.writeRoutePostscript(routePostscript);
		
		routePostscriptservice.insertRoutePostTag(lastRoutePostscript);
		
		model.addAttribute("routePostscript", lastRoutePostscript);
		
		return "MyPage.PostScript.Route.detail";	
	}

	
	/*
	* @date : 2017. 6. 29
	* @description : 여행지 후기 작성 OK
	* @parameter : principal 로그인한 회원 정보, model 여행지 후기 리스트를 저장해 넘겨주기 위한 모델 객체
	* @return : String(View 페이지) 
	*/
	@RequestMapping(value="Site/WriteOk.do", method=RequestMethod.POST)
	public String writeSitePostscriptOk(MultipartHttpServletRequest mhsq, Principal principal, SitePostscript sitePostscript, Model model) throws Exception {
		System.out.println("로그인된 아이디 : " + principal.getName());
		sitePostscript.setUsername(principal.getName());
		System.out.println("넘어온 객체 : " + sitePostscript);
		
		// 사이트 후기 등록 
		SitePostscript lastSitePostscript = sitePostscriptservice.writeSitePostscript(sitePostscript);
		
		// 사진 등록
		List<SitePostscriptPhoto> photoList = sitePostscriptservice.insertSitePostPhoto(mhsq, lastSitePostscript.getSite_postscript_rownum());
		
		// 태그 등록 
		List<SitePostscriptTag> tagList = sitePostscriptservice.insertSitePostTag(lastSitePostscript);
		
		// 방금 올렸던 후기 넘겨주기
		model.addAttribute("sitePostscript", lastSitePostscript);
		
		// 방금 올렸던 후기 사진 넘겨주기
		model.addAttribute("sitePostscriptPhotoList", photoList);
		
		// 방금 올렸던 후기 태그 넘겨주기
		model.addAttribute("sitePostscriptTagList", tagList);

		return "MyPage.PostScript.Site.detail";
	}
		
	/*
	* @date : 2017.06.22
	* @description : 여행지 후기 리스트
	* @parameter : principal 로그인한 회원 정보, principal 로그인한 회원 정보, model 루트 루기 리스트를 저장해 넘겨주기 위한 모델 객체
	* @return : String(View 페이지) 
	*/
	@RequestMapping(value="Site/List.do", method=RequestMethod.GET)
	public String listSitePostscript(Principal principal, Model model, @RequestParam(value="searchWord", required=false) String searchWord) throws Exception {
		System.out.println("여행지 후기 게시판 들어옴");
		List<SitePostscriptTag> sitePostscriptTagList = null;
		String username = null;
		if(principal != null){
			username = principal.getName();
			System.out.println("로그인된 아이디 : " + username);
		}
		System.out.println("searchWord : " + searchWord);
		List<SitePostscript> sitePostscriptList = sitePostscriptservice.listSitePostscript(username, searchWord);
		
		for(SitePostscript post : sitePostscriptList){
			sitePostscriptTagList = sitePostscriptservice.getSitePostTagList(post);
			post.setSitePostscriptTag(sitePostscriptTagList);
		}
		
		System.out.println("sitePostscriptList : " + sitePostscriptList);
		model.addAttribute("sitePostscriptList", sitePostscriptList);
		model.addAttribute("searchWord", searchWord);
		
		return "PostScript.Site.listBoard";	
	}
		
	/*
	* @date : 2017.06.22
	* @description : 여행지 후기 상세보기
	* @parameter : request url에 함께 들어온 request 파라메터를  받기위해 사용, model 루트 루기 리스트를 저장해 넘겨주기 위한 모델 객체
	* @return : String(View 페이지) 
	*/
	@RequestMapping("Site/Detail.do")
	public String detailSitePostscript(@RequestParam int site_postscript_rownum, Principal principal, Model model) throws ClassNotFoundException, SQLException {
		System.out.println("사이트 후기 게시판 상세보기");
		System.out.println("로그인된 아이디 : " + principal.getName());
		
		
		SitePostscript sitePostscript = sitePostscriptservice.detailSitePostscript(site_postscript_rownum, principal.getName());
		List<SitePostscriptTag> sitePostscriptTagList = sitePostscriptservice.getSitePostTagList(sitePostscript);
		sitePostscript.setSitePostscriptTag(sitePostscriptTagList);
		
		System.out.println("sitePostscript : " + sitePostscript);
		model.addAttribute("sitePostscript", sitePostscript);
		model.addAttribute("sitePostscriptTagList", sitePostscriptTagList);
		return "PostScript.Site.detail";		
	}
	
	
	/*
	* @date : 2017.06.22
	* @description : 여행지 후기 찜콩 설정/해제
	* @parameter : request url에 함께 들어온 request 파라메터를  받기위해 사용, principal 로그인한 회원 정보
	* @return : String(View 페이지) 
	*/
	@RequestMapping(value="Site/Like.do", method=RequestMethod.GET)
	public @ResponseBody String changLikeSitePostscript(@RequestParam int site_postscript_rownum, @RequestParam String site_like, Principal principal) throws ClassNotFoundException, SQLException {
		SitePostscriptLike sitePostscriptLike = new SitePostscriptLike(0, site_postscript_rownum, principal.getName());
		
		String change = "";
		
		if(site_like.equals("true")){
			System.out.println("찜콩 설정되어 있음");
			sitePostscriptservice.deleteLike(sitePostscriptLike);
			sitePostscriptservice.downLikeNum(sitePostscriptLike);
			System.out.println("찜콩 해제 완료");
			change = "tTf"; //true to false
		}else{
			System.out.println("찜콩 해제되어 있음");
			sitePostscriptservice.insertLike(sitePostscriptLike);
			sitePostscriptservice.upLikeNum(sitePostscriptLike);
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
	@RequestMapping(value="History/history.do", method=RequestMethod.GET)
	public String detailHistory(@RequestParam int route_code, Principal principal, Model model) throws ClassNotFoundException, SQLException {
		System.out.println("히스토리 상세보기");
		System.out.println("로그인된 아이디 : " + principal.getName());

		List<RouteHistory> myroutehistory = historyservice.getRouteDetail(route_code, principal.getName());
		Route routename = routeservice.getRouteInfo(route_code, principal.getName());
		
		System.out.println(myroutehistory);
		System.out.println(routename.getRoutename());

		model.addAttribute("myroutehistory", myroutehistory);
		model.addAttribute("routename", routename);
		return "MyPage.History.myHistory";	
	}
	
	/*
	* @date : 2017. 6. 24
	* @description : 사진 파일 불러오기
	* @parameter : request url에 함께 들어온 request 파라메터를  받기위해 사용, principal 로그인한 회원 정보
	* @return : String(View 페이지)
	*/
	/*

	@RequestMapping(value = "Site/Photo/{num}.do", method = RequestMethod.GET)
	public void showPhoto(@PathVariable("num") String num, HttpServletResponse response) throws IOException, SQLException {
	

	UploadImageVO board = iuploadImageService.uploadView(num);

	response.setHeader("Content-Disposition", "inline;filename=\"" + board.getContentName() + "\"");
	OutputStream outputStream = response.getOutputStream();
	response.setContentType(board.getContentType());

	SerialBlob blob = new SerialBlob(board.getContent());

	IOUtils.copy(blob.getBinaryStream(), outputStream);

	outputStream.flush();
	outputStream.close();
	}*/

}
