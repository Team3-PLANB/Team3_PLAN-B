package com.planb_jeju.controller;

import java.security.Principal;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

/*
* @FileName : 수정 필
* @Class : LoginJoinController
* @Project : PLANB_JEJU
* @Date : 2017.06.22
* @LastEditDate : 2017.06.16
* @Author : 정다혜, 홍단비 
* @Desc : Mypage 컨트롤러
*/

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.planb_jeju.dao.MemberDao;
import com.planb_jeju.dto.Member;
import com.planb_jeju.service.MemberService;


@Controller
@RequestMapping("/MyPage/")
public class MyPageController {
	
	private static MemberDao memberDao;
	private static Member member;
	
	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	private MemberService memberservice;
	
	/* 나의 일정 - schedule() */
	@RequestMapping("Schedule/schedule.do")
	public String schedule(){
		return "MyPage.Schedule.scheduleMain";
	}

	/* 히스토리 - history() */
	@RequestMapping("History/history.do")
	public String history(){
		return "MyPage.History.historyMain";
	}
	
	/* 나의 후기 메인 - postMain() */
	@RequestMapping("PostScript/postScriptMain.do")
	public String postMain(){
		return "MyPage.PostScript.postScriptMain";
	}
	
	/* 나의 후기 - root() */
	@RequestMapping("PostScript/Root/root.do")
	public String root(){
		return "MyPage.PostScript.Root.rootMain";
	}
	
	/* 나의 후기 - site() */
	@RequestMapping("PostScript/Site/site.do")
	public String site(){
		return "MyPage.PostScript.Site.siteMain";
	}	

	/* 찜한 후기 메인 - likeMain() */
	@RequestMapping("Like/likeMain.do")
	public String like(){
		return "MyPage.Like.likeMain";
	}
	/* 찜한 후기 - likeRoot() */
	@RequestMapping("Like/Root/root.do")
	public String likeRoot(){
		return "MyPage.Like.Root.rootMain";
	}
	/* 찜한 후기 - likeSite() */
	@RequestMapping("Like/Site/site.do")
	public String likeSite(){
		return "MyPage.Like.Site.siteMain";
	}
	
	/* 쪽지함 - msg() */
	@RequestMapping("Message/msgMain.do")
	public String msg(){
		return "MyPage.Message.msgMain";
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
		member = memberservice.getMemberInfo(principal, sqlsession);
		request.setAttribute("nickname", member.getNickname());
		return "MyPage.Info.infoMain";
	}

	/*
	* @date : 2017. 6. 22
	* @description : 회원정보수정 
	* @return : String(View) 
	*/
	@RequestMapping(value = "Info/updateInfo.do", method=RequestMethod.POST)
	public String updateInfo(Member member) throws Exception {
		System.out.println("update 페이지 POST controller");
		System.out.println("member>>>>"+member);
		memberservice.update(member, sqlsession);
		System.out.println(memberDao.update(member));
		return "Main.mainpage";
	}
	

}
