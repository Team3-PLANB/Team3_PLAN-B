package com.planb_jeju.controller;

/*
* @FileName : PostScriptController.java
* @Class : PostScriptController
* @Project : PLANB_JEJU
* @Date : 2017.06.16
* @LastEditDate : 2017.07.01
* @Author : 정다혜, 홍단비
* @Desc : 후기 게시판 컨트롤러 
*/

import java.security.Principal;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
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
import com.planb_jeju.service.RouteDetailService;
import com.planb_jeju.service.RoutePostscriptService;
import com.planb_jeju.service.RouteService;
import com.planb_jeju.service.SitePostscriptService;
import com.planb_jeju.utils.PersonalParse;


@Controller
@RequestMapping("/PostScript/")
public class PostScriptController {

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
		List<RoutePostscriptTag> routePostscriptTagList = null;
		String username = null;
		if(principal != null){
			username = principal.getName();
		}
		List<RoutePostscript> routePostscriptList = routePostscriptservice.listRoutePostscript(username, searchWord);
		
		for(RoutePostscript post : routePostscriptList){
			routePostscriptTagList = routePostscriptservice.getRoutePostTagList(post.getRoute_postscript_rownum());
			post.setRoutePostscriptTag(routePostscriptTagList);
		}
		model.addAttribute("routePostscriptList", routePostscriptList);
		System.out.println(routePostscriptList);
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
		String username = null;
		if(principal != null){
			username = principal.getName();
		}
		RoutePostscript routePostscript = routePostscriptservice.detailRoutePostscript(route_postscript_rownum, username);
		List<RoutePostscriptTag> routePostscriptTagList = routePostscriptservice.getRoutePostTagList(routePostscript.getRoute_postscript_rownum());
		routePostscript.setRoutePostscriptTag(routePostscriptTagList);
		
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
			routePostscriptservice.deleteLike(routePostscriptLike);
			routePostscriptservice.downLikeNum(routePostscriptLike);
			change = "tTf"; //true to false
		}else{
			routePostscriptservice.insertLike(routePostscriptLike);
			routePostscriptservice.upLikeNum(routePostscriptLike);
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
		String username = null;
		if(principal != null){
			username = principal.getName().trim();
		}
		Route route = routeservice.getRouteInfo(route_code, username);
		List<RouteDetail> routeDetailList = routeDetailservice.getRouteDetailListForPost(route_code, username);
		
		for(RouteDetail routeDetail : routeDetailList){
			System.out.println(routeDetail.getSite() + " : " + routeDetail.getCategory());
			routeDetail.setCategory(PersonalParse.code2shortcode(routeDetail.getCategory()));
			routeDetail.setCategory_name(PersonalParse.code2string(routeDetail.getCategory()));
		}
		
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
		sitePostscript.setUsername(principal.getName());
		
		// 사진 절대 경로
		String path = "/kosta151/Spring/Spring_Labs_STS/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/PLANB_JEJU";
		
		// 사이트 후기 등록 
		SitePostscript lastSitePostscript = sitePostscriptservice.writeSitePostscript(sitePostscript);
		
		// 사진 등록
		List<SitePostscriptPhoto> photoList = sitePostscriptservice.insertSitePostPhoto(mhsq, lastSitePostscript.getSite_postscript_rownum());
		
		// 태그 등록 
		List<SitePostscriptTag> tagList = sitePostscriptservice.insertSitePostTag(lastSitePostscript);
		
		lastSitePostscript.setSitePostscriptTag(tagList);
		
		// 방금 올렸던 후기 넘겨주기
		model.addAttribute("sitePostscript", lastSitePostscript);
		
		// 방금 올렸던 후기 사진 넘겨주기
		model.addAttribute("sitePostscriptPhotoList", photoList);
		
		// 방금 올렸던 후기 태그 넘겨주기
		model.addAttribute("sitePostscriptTagList", tagList);
		
		model.addAttribute("path", path);

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
		List<SitePostscriptTag> sitePostscriptTagList = null;
		SitePostscriptPhoto sitePostscriptPhoto = null;
		String username = null;
		if(principal != null){
			username = principal.getName();
		}
		List<SitePostscript> sitePostscriptList = sitePostscriptservice.listSitePostscript(username, searchWord);
		
		for(SitePostscript post : sitePostscriptList){
			sitePostscriptTagList = sitePostscriptservice.getSitePostTagList(post);
			post.setSitePostscriptTag(sitePostscriptTagList);
			
			sitePostscriptPhoto = sitePostscriptservice.getSitePostOnePhoto(post.getSite_postscript_rownum());
			post.setSitePostPhoto_src(sitePostscriptPhoto.getPhoto_src());
		}
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
		// 사진 절대 경로
		String path = "/kosta151/Spring/Spring_Labs_STS/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/PLANB_JEJU";
		
		SitePostscript sitePostscript = sitePostscriptservice.detailSitePostscript(site_postscript_rownum, principal.getName());
		List<SitePostscriptTag> sitePostscriptTagList = sitePostscriptservice.getSitePostTagList(sitePostscript);
		sitePostscript.setSitePostscriptTag(sitePostscriptTagList);
		
		List<SitePostscriptPhoto> photoList = sitePostscriptservice.getSitePostPhotoList(site_postscript_rownum);
		
		model.addAttribute("sitePostscript", sitePostscript);
		model.addAttribute("sitePostscriptTagList", sitePostscriptTagList);
		model.addAttribute("photoList", photoList);
		model.addAttribute("path", path);
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
			sitePostscriptservice.deleteLike(sitePostscriptLike);
			sitePostscriptservice.downLikeNum(sitePostscriptLike);
			change = "tTf"; //true to false
		}else{
			sitePostscriptservice.insertLike(sitePostscriptLike);
			sitePostscriptservice.upLikeNum(sitePostscriptLike);
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
		List<RouteHistory> myroutehistory = historyservice.getRouteDetail(route_code, principal.getName());
		Route routename = routeservice.getRouteInfo(route_code, principal.getName());
		
		model.addAttribute("myroutehistory", myroutehistory);
		model.addAttribute("routename", routename);
		return "MyPage.History.myHistory";	
	}
	
}
