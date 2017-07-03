package com.planb_jeju.controller;
//주석 추가
import java.security.Principal;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

/*
* @FileName : MyPageController.java
* @Class : MyPageController
* @Project : PLANB_JEJU
* @Date : 2017.06.16
* @LastEditDate : 2017.06.30
* @Author : 홍단비 & 정다혜 
* @Desc : Mypage 컨트롤러
*/


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.planb_jeju.dao.MemberDao;
import com.planb_jeju.dao.RoutePostScriptDao;
import com.planb_jeju.dao.SitePostScriptDao;
import com.planb_jeju.dto.Member;
import com.planb_jeju.dto.Message;
import com.planb_jeju.dto.Route;
import com.planb_jeju.dto.RoutePostscript;
import com.planb_jeju.dto.RoutePostscriptLike;
import com.planb_jeju.dto.RoutePostscriptTag;
import com.planb_jeju.dto.SitePostscript;
import com.planb_jeju.dto.SitePostscriptLike;
import com.planb_jeju.dto.SitePostscriptPhoto;
import com.planb_jeju.dto.SitePostscriptTag;
import com.planb_jeju.service.MemberService;
import com.planb_jeju.service.MessageService;
import com.planb_jeju.service.RoutePostscriptService;
import com.planb_jeju.service.RouteService;
import com.planb_jeju.service.SitePostscriptService;


@Controller
@RequestMapping("/MyPage/")
public class MyPageController {
   
   private static MemberDao memberDao;
   private static Member member;
   
   @Autowired
   private SqlSession sqlsession;
   
   @Autowired
   private MemberService memberservice;
   
	@Autowired
	private MessageService messageService;
   
   @Autowired
	private RouteService routeservice;
   
   @Autowired
   private RoutePostscriptService routePostscriptservice;
   @Autowired
   private SitePostscriptService sitePostscriptservice;
   
   /*
   * @date : 2017. 6. 16
   * @description : Mypage 일정관리 view
   * @return : String(view) 
   */
   @RequestMapping("Schedule/schedule.do")
   public String schedule(Principal principal, Model model) throws ClassNotFoundException, SQLException{
		List<Route> mytRouteList = routeservice.getMyRouteList(principal.getName());
		model.addAttribute("mytRouteList", mytRouteList);
		return "MyPage.Schedule.scheduleMain";
	}
   

   /*
   * @date : 2017. 6. 16
   * @description : Mypage 히스토리 list
   * @parameter : principal 로그인한 회원 정보, model 히스토리 리스트를 저장해 넘겨주기 위한 모델 객체
   * @return : String(view) 
   */
   @RequestMapping(value = "History/history.do", method=RequestMethod.GET)
   public String history(Principal principal, Model model) throws Exception {
	   List<Route> myroutelist = routeservice.getMyRouteList(principal.getName());
	   model.addAttribute("myroutelist", myroutelist);
	   return "MyPage.History.historyMain";
   }
   
   /*
   * @date : 2017. 6. 16
   * @description : Mypage 나의 후기 main view
   * @return : String(view) 
   */
   @RequestMapping("PostScript/postscriptMain.do")
   public String myPostMain(){
      return "MyPage.PostScript.postScriptMain";
   }
   
   /*
   * @date : 2017. 6. 23
   * @description : Mypage 나의 루트 후기 리스트
   * @return : String (view page) 
   */
   @RequestMapping("PostScript/Route/List.do")
   public String listMyRoutePost(Principal principal, Model model, @RequestParam(value="searchWord", required=false) String searchWord) throws ClassNotFoundException, SQLException{
	   List<RoutePostscriptTag> routePostscriptTagList = null;
	   List<RoutePostscript> routePostscriptList = routePostscriptservice.listMyRoutePostscript(principal.getName(), searchWord);
	   
	   for(RoutePostscript post : routePostscriptList){
			routePostscriptTagList = routePostscriptservice.getRoutePostTagList(post.getRoute_postscript_rownum());
			post.setRoutePostscriptTag(routePostscriptTagList);
	   }
	   
	   model.addAttribute("routePostscriptList", routePostscriptList); 
	   
	   return "MyPage.PostScript.Route.listBoard";
   }
   
   /*
    * @date : 2017. 6. 23
    * @description : Mypage 나의 루트 후기 상세보기
    * @return : String (view page) 
    */
    @RequestMapping("PostScript/Route/Detail.do")
    public String detailMyRoutePost(@RequestParam("route_postscript_rownum") int route_postscript_rownum, Principal principal, Model model) throws ClassNotFoundException, SQLException{
		String username = null;
		if(principal != null){
			username = principal.getName();
		}
		RoutePostscript routePostscript = routePostscriptservice.detailRoutePostscript(route_postscript_rownum, username);
		List<RoutePostscriptTag> routePostscriptTagList = routePostscriptservice.getRoutePostTagList(routePostscript.getRoute_postscript_rownum());
		routePostscript.setRoutePostscriptTag(routePostscriptTagList);

		model.addAttribute("routePostscript", routePostscript);
		
		return "MyPage.PostScript.Route.detail";
    }

    /*
     * @date : 2017. 6. 23
     * @description : Mypage 나의 여행지 후기 리스트
     * @return : String (view page) 
     */
    @RequestMapping("PostScript/Site/List.do")
    public String listMySitePost(Principal principal, Model model, @RequestParam(value="searchWord", required=false) String searchWord) throws ClassNotFoundException, SQLException{
 		List<SitePostscriptTag> sitePostscriptTagList = null;
		String username = null;
		
		if (principal != null) {
			username = principal.getName();
		}
		
		List<SitePostscript> sitePostscriptList = sitePostscriptservice.listMyRoutePost(username, searchWord);

		for (SitePostscript post : sitePostscriptList) {
			sitePostscriptTagList = sitePostscriptservice.getSitePostTagList(post);
			post.setSitePostscriptTag(sitePostscriptTagList);
		}
		
 		model.addAttribute("sitePostscriptList", sitePostscriptList);
 		model.addAttribute("searchWord", searchWord);		
 	   
		return "MyPage.PostScript.Site.listBoard";
    }
    
    /*
     * @date : 2017. 6. 23
     * @description : Mypage 나의 여행지 후기 상세보기
     * @return : String (view page) 
     */
     @RequestMapping("PostScript/Site/Detail.do")
     public String detailMySitePost(@RequestParam("site_postscript_rownum") int site_postscript_rownum, Principal principal, Model model) throws ClassNotFoundException, SQLException{
		SitePostscript sitePostscript = sitePostscriptservice.detailSitePostscript(site_postscript_rownum, principal.getName());
		List<SitePostscriptTag> sitePostscriptTagList = sitePostscriptservice.getSitePostTagList(sitePostscript);
		List<SitePostscriptPhoto> sitePostscriptPhotoList = sitePostscriptservice.getSitePostPhotoList(site_postscript_rownum);
		
		sitePostscript.setSitePostscriptTag(sitePostscriptTagList);
		
		System.out.println("sitePostscript" + sitePostscript);
		System.out.println("sitePostscriptTagList" + sitePostscriptTagList);
		System.out.println("sitePostscriptPhotoList" + sitePostscriptPhotoList);

		model.addAttribute("sitePostscript", sitePostscript);
		model.addAttribute("sitePostscriptTagList", sitePostscriptTagList);
		model.addAttribute("sitePostscriptPhotoList", sitePostscriptPhotoList);
		
		return "MyPage.PostScript.Site.detail";
     }

     /*
      * @date : 2017. 6. 30
      * @description : Mypage 나의 루트 후기 삭제하기
      * @return : String (view page) 
      */
      @RequestMapping("PostScript/Site/deleteMyRoute.do")
      public @ResponseBody int deleteMyRoutePost(Principal principal, @RequestParam int route_rouwnum) throws ClassNotFoundException, SQLException{
      	RoutePostScriptDao routepostscriptdao = sqlsession.getMapper(RoutePostScriptDao.class);
           //return routepostscriptdao.delete(route_rouwnum);
      	return 0;
      }
      
      /*
       * @date : 2017. 6. 30
       * @description : Mypage 나의 루트 후기 수정하기
       * @return : String (view page) 
       */
      @RequestMapping("PostScript/Site/updateMyRoute.do")
      public String editMyRoutePost(Principal principal, Model model) throws ClassNotFoundException, SQLException{
         return "MyPage.PostScript.Site.detail";
      }
     
     /*
      * @date : 2017. 6. 30
      * @description : Mypage 나의 여행지 후기 삭제하기
      * @return : String (view page) 
      */
      @RequestMapping("PostScript/Site/deleteMySite.do")
      public @ResponseBody int deleteMySitePost(Principal principal, @RequestParam int site_rouwnum) throws ClassNotFoundException, SQLException{
      	SitePostScriptDao sitepostscriptdao = sqlsession.getMapper(SitePostScriptDao.class);
           return sitepostscriptdao.delete(site_rouwnum);
      }
      
      /*
       * @date : 2017. 6. 30
       * @description : Mypage 나의 여행지 후기 수정하기
       * @return : String (view page) 
       */
       @RequestMapping("PostScript/Site/update.do")
       public String editMySitePost(Principal principal, Model model) throws ClassNotFoundException, SQLException{      	
          return "MyPage.PostScript.Site.detail";
       }
     
       /*
        * @date : 2017. 6. 16
        * @description : Mypage 찜한후기 main view
        * @return : String(view) 
        */
        @RequestMapping("Like/likeMain.do")
        public String like(){
           return "MyPage.Like.likeMain";
        }

        /*
        * @date : 2017.06.30
        * @description : Mypage 찜한 루트 후기 리스트
        * @return : String(view) 
        */
        @RequestMapping("Like/Route/List.do")
        public String listLikeRoutePost(Principal principal, Model model, @RequestParam(value="searchWord", required=false) String searchWord) throws ClassNotFoundException, SQLException{
     		List<RoutePostscriptTag> routePostscriptTagList = null;
     		String username = null;
     		if(principal != null){
     			username = principal.getName();
     		}
     		
     		List<RoutePostscript> routePostscriptList = routePostscriptservice.listLikeRoutePost(username, searchWord);
     		
     		for(RoutePostscript post : routePostscriptList){
     			routePostscriptTagList = routePostscriptservice.getRoutePostTagList(post.getRoute_postscript_rownum());
     			post.setRoutePostscriptTag(routePostscriptTagList);
     		}
     		
     		model.addAttribute("routePostscriptList", routePostscriptList);
     		model.addAttribute("searchWord", searchWord);
     	   
     	   return "MyPage.Like.Route.listBoard";
        }
        
        /*
    	* @date : 2017.07.01
    	* @description : Mypage 찜한 루트 후기 상세보기
    	* @parameter : request url에 함께 들어온 request 파라메터를  받기위해 사용, principal 로그인한 회원 정보, model 루트 루기 리스트를 저장해 넘겨주기 위한 모델 객체
    	* @return : String(View 페이지) 
    	*/
    	@RequestMapping(value="Like/Route/Detail.do", method=RequestMethod.GET)
    	public String detailLikeRoutePost(@RequestParam("route_postscript_rownum") int route_postscript_rownum, Principal principal, Model model) throws ClassNotFoundException, SQLException {
    		String username = null;
    		if(principal != null){
    			username = principal.getName();
    		}
    		RoutePostscript routePostscript = routePostscriptservice.detailRoutePostscript(route_postscript_rownum, username);
    		List<RoutePostscriptTag> routePostscriptTagList = routePostscriptservice.getRoutePostTagList(routePostscript.getRoute_postscript_rownum());
    		routePostscript.setRoutePostscriptTag(routePostscriptTagList);
    		
    		model.addAttribute("routePostscript", routePostscript);
    		
    		return "MyPage.Like.Route.detail";
    	}
    	
    	/*
    	* @date : 2017.07.01
    	* @description : Maypage 찜한 루트 후기 찜콩 설정/해제
    	* @parameter : request url에 함께 들어온 request 파라메터를  받기위해 사용, principal 로그인한 회원 정보
    	* @return : String 상태
    	*/
    	@RequestMapping(value="Like/Route/Like.do", method=RequestMethod.GET)
    	public @ResponseBody String changLikeRoutePost(@RequestParam int route_postscript_rownum, @RequestParam String route_like, Principal principal) throws ClassNotFoundException, SQLException {
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
    	* @date : 2017.07.01
    	* @description : Mypage 찜한 여행지 후기 리스트
    	* @parameter : principal 로그인한 회원 정보, principal 로그인한 회원 정보, model 루트 루기 리스트를 저장해 넘겨주기 위한 모델 객체
    	* @return : String(View 페이지) 
    	*/
    	@RequestMapping(value="Like/Site/List.do", method=RequestMethod.GET)
    	public String listLikeSitePost(Principal principal, Model model, @RequestParam(value="searchWord", required=false) String searchWord) throws Exception {
    		List<SitePostscriptTag> sitePostscriptTagList = null;
    		String username = null;
    		if(principal != null){
    			username = principal.getName();
    		}
    		
    		List<SitePostscript> sitePostscriptList = sitePostscriptservice.listLikeRoutePost(username, searchWord);
    		
    		for(SitePostscript post : sitePostscriptList){
    			sitePostscriptTagList = sitePostscriptservice.getSitePostTagList(post);
    			post.setSitePostscriptTag(sitePostscriptTagList);
    		}
    		
    		model.addAttribute("sitePostscriptList", sitePostscriptList);
    		model.addAttribute("searchWord", searchWord);
    		
    		return "MyPage.Like.Site.listBoard";	
    	}
    		
    	/*
    	* @date : 2017.07.01
    	* @description : Mypage 찜한 여행지 후기 상세보기
    	* @parameter : request url에 함께 들어온 request 파라메터를  받기위해 사용, model 루트 루기 리스트를 저장해 넘겨주기 위한 모델 객체
    	* @return : String(View 페이지) 
    	*/
    	@RequestMapping("Like/Site/Detail.do")
    	public String listLikeSitePost(@RequestParam int site_postscript_rownum, Principal principal, Model model) throws ClassNotFoundException, SQLException {
    		SitePostscript sitePostscript = sitePostscriptservice.detailSitePostscript(site_postscript_rownum, principal.getName());
    		List<SitePostscriptTag> sitePostscriptTagList = sitePostscriptservice.getSitePostTagList(sitePostscript);
    		sitePostscript.setSitePostscriptTag(sitePostscriptTagList);
    		    		
    		model.addAttribute("sitePostscript", sitePostscript);
    		model.addAttribute("sitePostscriptTagList", sitePostscriptTagList);
    		
    		return "MyPage.Like.Site.detail";		
    	}
    	
    	
    	/*
    	* @date : 2017.07.01
    	* @description : Mypage 찜한 여행지 후기 찜콩 설정/해제
    	* @parameter : request url에 함께 들어온 request 파라메터를  받기위해 사용, principal 로그인한 회원 정보
    	* @return : String(View 페이지) 
    	*/
    	@RequestMapping(value="Like/Site/Like.do", method=RequestMethod.GET)
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
   * @date : 2017. 6. 16
   * @description : Mypage 쪽지함 view
   * @return : String(view) 
   */
   @RequestMapping("Message/msgMain.do")
   public String msg(Model model, 
		 @RequestParam(value="cp", defaultValue="1") String cp,
		 @RequestParam(value="ps", defaultValue="5") String ps,
		 @RequestParam(value="category", defaultValue="receive") String category) throws Exception{
	  
	  model = messageService.messageList(model, cp, ps, category);
      
	  return "MyPage.Message.msgMain";
   }
 
   /**
    * 
    */
   @RequestMapping("Message/msgdelete.do")
   public @ResponseBody int delete(Principal principal, @RequestParam int message_rownum) throws Exception{
      return messageService.delete(message_rownum);
   }
   
   /*
   * @date : 2017. 6. 16
   * @description : 회원정보수정 닉네임 체크 (비동기)
   * @return : String(t/f) 
   */
   @RequestMapping("Info/duplicationNCheck.do")
   public @ResponseBody String duplicationNickCheck(String nickname) throws Exception {
      memberDao = sqlsession.getMapper(MemberDao.class);
      String result = memberservice.duplicationNickCheck(nickname, sqlsession);
      
      return result;
   }

   /*
   * @date : 2017. 6. 22
   * @description : 회원정보 get
   * @return : String(View) 
   */
   @RequestMapping(value = "Info/updateInfo.do", method=RequestMethod.GET)
   public String getUserInfo(HttpServletRequest request, Principal principal) throws Exception {
      member = memberservice.getMemberInfo(principal.getName(), sqlsession);
      request.setAttribute("nickname", member.getNickname());
      request.setAttribute("originpwd", member.getPassword());

      return "MyPage.Info.infoMain";
   }

   /*
   * @date : 2017. 6. 22
   * @description : 회원정보수정 
   * @return : String(View) 
   */
   @RequestMapping(value = "Info/updateInfo.do", method=RequestMethod.POST)
   public String updateInfo(Member member, Principal principal) throws Exception {
      
      Member updatemember = memberservice.getMemberInfo(principal.getName(), sqlsession);

      updatemember.setNickname(member.getNickname());
      updatemember.setPassword(member.getPassword());
      memberservice.update(updatemember, sqlsession);

      return "Main.mainpage";
   }
}
