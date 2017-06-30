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
* @LastEditDate : 2017.06.22
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
import com.planb_jeju.dao.MessageDao;
import com.planb_jeju.dto.Member;
import com.planb_jeju.dto.Message;
import com.planb_jeju.dto.Route;
import com.planb_jeju.dto.RoutePostscript;
import com.planb_jeju.service.MemberService;
import com.planb_jeju.service.MessageService;
import com.planb_jeju.service.RoutePostscriptService;
import com.planb_jeju.service.RouteService;


@Controller
@RequestMapping("/MyPage/")
public class MyPageController {
   
   private static MemberDao memberDao;
   private static MessageDao messageDao;
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
   
   // 페이지 구현끝나면 삭제!!
   @RequestMapping(value="History/historyDetial.do")
   public String historyDetail() throws Exception {
	   return "MyPage.History.historyDetail";
   }
   
   /*
   * @date : 2017. 6. 16
   * @description : Mypage 나의후기 main view
   * @return : String(view) 
   */
   @RequestMapping("PostScript/postScriptMain.do")
   public String postMain(){
      return "MyPage.PostScript.postScriptMain";
   }
   
   /*
   * @date : 2017. 6. 23
   * @description : Mypage 나의 후기 리스트
   * @return : String (view page) 
   */
   @RequestMapping("PostScript/Route/List.do")
   public String routeList(Principal principal, Model model) throws ClassNotFoundException, SQLException{
	   
	   System.out.println("내 루트 후기 리스트");
	   System.out.println("로그인된 아이디 : " + principal.getName());
	   List<RoutePostscript> routePostscriptList = routePostscriptservice.listMyRoutePostscript(principal.getName());
	   
	   System.out.println("routePostscriptList : " + routePostscriptList);
	   model.addAttribute("routePostscriptList", routePostscriptList); 
	   
	   return "MyPage.PostScript.Route.listBoard";
   }
   
   /*
    * @date : 2017. 6. 23
    * @description : Mypage 나의 후기 상세보기
    * @return : String (view page) 
    */
    @RequestMapping("PostScript/Route/Detail.do")
    public String root(){
 	   
       return "MyPage.PostScript.Route.detail";
    }
   
   /*
   * @date : 2017. 6. 16
   * @description : Mypage 나의후기 site view
   * @return : String(view) 
   */
   @RequestMapping("PostScript/Site/site.do")
   public String site(){
      return "MyPage.PostScript.Site.siteMain";
   }   

   /*
   * @date : 2017. 6. 16
   * @description : Mypage 찜한후기 site view
   * @return : String(view) 
   */
   @RequestMapping("Like/likeMain.do")
   public String like(){
      return "MyPage.Like.likeMain";
   }

   /*
   * @date : 2017. 6. 16
   * @description : Mypage 찜한후기 root view
   * @return : String(view) 
   */
   @RequestMapping("Like/Route/route.do")
   public String likeRoot(){
      return "MyPage.Like.Route.routeMain";
   }

   /*
   * @date : 2017. 6. 16
   * @description : Mypage 찜한후기 site view
   * @return : String(view) 
   */
   @RequestMapping("Like/Site/site.do")
   public String likeSite(){
      return "MyPage.Like.Site.siteMain";
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
