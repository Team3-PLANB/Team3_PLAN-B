package com.planb_jeju.controller;

/*
* @FileName : LoginJoinController.java
* @Class : LoginJoinController
* @Project : PLANB_JEJU
* @Date : 2017.06.07
* @LastEditDate : 2017.06.16
* @Author : 정다혜, 홍단비 
* @Desc : 회원가입  / 로그인   컨트롤러
*/

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.planb_jeju.service.MemberService2;



@Controller
@RequestMapping("/LoginJoin/")
public class LoginJoinController2 {

	
	private MemberService2 memberservice = new MemberService2();
	
	@RequestMapping("Join/NJoin2.do")
	public String nJoin(){
		System.out.println(">>>>>>>Join_controller2<<<<<<<");
		return "LoginJoin.Join.NJoin.joinForm2";		
	}

	/*
	* @date : 2017. 6. 16
	* @description : 회원가입 시 메일 인증
	* @return : Model(Ajax 처리)
	* @param spec : HttpServletRequest request, HttpServletResponse response, Model model
	*/
	@RequestMapping("Join/emailAuth.do")
	public @ResponseBody String emailAuth(HttpServletRequest request, HttpServletResponse response) throws Exception{
	System.out.println(">>>>>>>Email_controller<<<<<<<");
		
		String username = request.getParameter("username");
		System.out.println("username : " + username);
		String authNum = "";
		System.out.println("랜덤 시작");
		authNum = memberservice.RandomNum();
		System.out.println("랜덤 끝");
		System.out.println("메일 보내기 시작");
		memberservice.sendEmail(username.toString(), authNum);
		System.out.println("메일 보내기 끝");
		
		return authNum;
		
	}
	
}
