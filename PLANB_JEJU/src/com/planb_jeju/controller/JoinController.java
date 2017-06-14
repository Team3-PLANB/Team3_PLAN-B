
package com.planb_jeju.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/LoginJoin/")
public class JoinController {
	//index.htm 요청 View(index.jsp)
	
	/* 회원가입 화면 이동 */
	@RequestMapping("Join/NJoin.do")
	public String nJoin(){
		System.out.println(">>>>>>>nJoin_controller<<<<<<<");
		return "LoginJoin.Join.NJoin.joinForm";		
	}
	
	@RequestMapping("Login/NLogin.do")
	public String nLogin(){
		System.out.println("LoginJoin/Login/NJoin.do 컨트롤러 들어옴");
		return "LoginJoin.Join.NJoin.joinForm";	
	}
	
	// 준성오빠 일정만들기 UI 작업 중 > 나중에 경로 옮겨야 함
	@RequestMapping("Join/SJoin.do")
	public String detail_JS(){
		System.out.println("준성 일정만들기 UI 작업 중");
		return "LoginJoin.Login.SLogin.detail_JS";
	}
	
	//회원가입시 아이디 체크 (비동기)
	@RequestMapping("Login/duplicationCheck.do")
	public @ResponseBody String duplicationCheck(String email) throws Exception {
		return email;
/*		MemberDAO memberDao = sqlsession.getMapper(MemberDAO.class);
		return memberservice.duplicationCheck(email);*/
	}
	
	/* 페이스북 로그인 중복체크 > 중복-로그인 > 비중복-가입mapper */
	@RequestMapping("Login/fblogin")
	public @ResponseBody String fblogin(String email) throws Exception {
/*		sqlsession.getMapper(MemberDAO.class).fblogin(email);
		return sqlsession.getMapper(MemberDAO.class).getfbpassword(email);*/
		return null;
	}	
	
	/* 페이스북 가입 */
	@RequestMapping("Login/fbsignup.do")
	public @ResponseBody void fbsignup(String email, String fbaccesstoken) throws Exception {
/*		MemberDAO  memberdao = sqlsession.getMapper(MemberDAO.class);
		memberdao.fbsignup(email,fbaccesstoken.substring(0, 10));*/
	}
	
	/* 회원가입 시 메일 인증 */
}
