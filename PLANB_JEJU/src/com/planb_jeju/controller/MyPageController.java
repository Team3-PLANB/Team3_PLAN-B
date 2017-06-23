package com.planb_jeju.controller;

/*
* @FileName : 수정 필
* @Class : LoginJoinController
* @Project : PLANB_JEJU
* @Date : 2017.06.07
* @LastEditDate : 2017.06.16
* @Author : 정다혜, 홍단비 
* @Desc : 회원가입  / 로그인   컨트롤러
*/

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MyPageController {

	/* 나의 일정 - schedule() */
	@RequestMapping("MyPage/Schedule/schedule.do")
	public String schedule(){
		System.out.println("MyPage/Schedule/schedule.do 컨트롤러 들어옴");
		return "MyPage.Schedule.scheduleMain";
	}

	/* 히스토리 - history() */
	@RequestMapping("MyPage/History/history.do")
	public String history(){
		System.out.println("MyPage/History/history.do 컨트롤러 들어옴");
		return "MyPage.History.historyMain";
	}
	
	/* 히스토리 - historyDetail() */
	@RequestMapping("MyPage/History/historyDetial.do")
	public String historyDetail(){
		System.out.println("MyPage/History/historyDetail.do 컨트롤러 들어옴");
		return "MyPage.History.historyDetail";
	}
	
	/* 나의 후기 메인 - postMain() */
	@RequestMapping("MyPage/PostScript/postScriptMain.do")
	public String postMain(){
		System.out.println("MyPage/PostScript/postScriptMain.do 컨트롤러 들어옴");
		return "MyPage.PostScript.postScriptMain";
	}
	
	/* 나의 후기 - root() */
	@RequestMapping("MyPage/PostScript/Root/root.do")
	public String root(){
		System.out.println("MyPage/PostScript/Site/root.do 컨트롤러 들어옴");
		return "MyPage.PostScript.Root.rootMain";
	}
	
	/* 나의 후기 - site() */
	@RequestMapping("MyPage/PostScript/Site/site.do")
	public String site(){
		System.out.println("MyPage/PostScript/Site/site.do 컨트롤러 들어옴");
		return "MyPage.PostScript.Site.siteMain";
	}	

	/* 찜한 후기 메인 - likeMain() */
	@RequestMapping("MyPage/Like/likeMain.do")
	public String like(){
		System.out.println("MyPage/Like/likeMain.do 컨트롤러 들어옴");
		return "MyPage.Like.likeMain";
	}
	/* 찜한 후기 - likeRoot() */
	@RequestMapping("MyPage/Like/Root/root.do")
	public String likeRoot(){
		System.out.println("MyPage/Like/Root/root.do 컨트롤러 들어옴");
		return "MyPage.Like.Root.rootMain";
	}
	/* 찜한 후기 - likeSite() */
	@RequestMapping("MyPage/Like/Site/site.do")
	public String likeSite(){
		System.out.println("MyPage/Like/Site/site.do 컨트롤러 들어옴");
		return "MyPage.Like.Site.siteMain";
	}
	
	/* 쪽지함 - msg() */
	@RequestMapping("MyPage/Message/msgMain.do")
	public String msg(){
		System.out.println("MyPage/Message/msgMain.do 컨트롤러 들어옴");
		return "MyPage.Message.msgMain";
	}
	
	/* 회원정보수정 - info() */
	@RequestMapping("MyPage/Info/info.do")
	public String info(){
		System.out.println("MyPage/Info/info.do 컨트롤러 들어옴");
		return "MyPage.Info.infoMain";
	}
	
}
