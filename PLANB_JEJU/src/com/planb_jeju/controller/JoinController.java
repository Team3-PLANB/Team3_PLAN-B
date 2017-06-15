
package com.planb_jeju.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.planb_jeju.dao.MemberDao;
import com.planb_jeju.service.MemberService;


@Controller
@RequestMapping("/LoginJoin/")
public class JoinController {

	private static MemberDao memberDao;

	@Autowired
	private SqlSession sqlsession;
	//index.htm 요청 View(index.jsp)
	
	@Autowired
	MemberService memberService;
	
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
	
	/* 회원가입시 아이디 체크 (비동기) */
	@RequestMapping("Login/duplicationCheck.do")
	public @ResponseBody String duplicationCheck(String email) throws Exception {
		memberDao = sqlsession.getMapper(MemberDao.class);
		return null;
//		return memberservice.duplicationCheck(email);
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
	@RequestMapping("emailAuth.do")
	public String emailAuth(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
		System.out.println(">>>>>>>Email_controller<<<<<<<");
		
		String email = request.getParameter("email");
		String authNum = "";
		
		authNum = memberService.RandomNum();
		
		memberService.sendEmail(email.toString(), authNum);
		
		model.addAttribute("email", email);
		model.addAttribute("authNum", authNum);
		
		return "LoginJoin.Join.emailAuth";
	}
}
