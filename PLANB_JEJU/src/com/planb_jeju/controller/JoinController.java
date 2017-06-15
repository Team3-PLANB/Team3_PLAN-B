
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
	
	private MemberService memberservice = new MemberService();

	/* 회원가입 화면 이동 */
	@RequestMapping("Join/NJoin.do")
	public String nJoin(){
		System.out.println(">>>>>>>nJoin_controller<<<<<<<");
		return "LoginJoin.Join.NJoin.joinForm";		
	}
	
	// 준성오빠 일정만들기 UI 작업 중 > 나중에 경로 옮겨야 함
	@RequestMapping("Join/SJoin.do")
	public String detail_JS(){
		System.out.println("준성 일정만들기 UI 작업 중");
		return "LoginJoin.Login.SLogin.detail_JS";
	}
	
	/* 회원가입시 아이디 체크 (비동기) */
	@RequestMapping("Join/duplicationCheck.do")
	public @ResponseBody String duplicationCheck(String username) throws Exception {
		memberDao = sqlsession.getMapper(MemberDao.class);
		return memberservice.duplicationCheck(username);
	}
	
	/* 페이스북 가입 */
	@RequestMapping("Join/fbjoin.do")
	public @ResponseBody void fbjoin(String username, String fbaccesstoken, String userid) throws Exception {
		memberDao = sqlsession.getMapper(MemberDao.class);
		memberDao.fbjoin(username,fbaccesstoken.substring(0, 10), userid);
	}
	
	/* 로그인 >> 이메일, 비밀번호 체크 */

	
	/* 페이스북 로그인 중복체크 > 중복-로그인 > 비중복-가입mapper */
	@RequestMapping("Login/fblogin")
	public @ResponseBody String fblogin(String username) throws Exception {
/*		sqlsession.getMapper(MemberDAO.class).fblogin(email);
		return sqlsession.getMapper(MemberDAO.class).getfbpassword(email);*/
		return null;
	}	

	/* 회원가입 시 메일 인증 */
	@RequestMapping("Join/emailAuth.do")
	public Model emailAuth(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
	System.out.println(">>>>>>>Email_controller<<<<<<<");
		
		String username = request.getParameter("username");
		System.out.println("username : " + username);
		String authNum = "";
		System.out.println("랜덤 시작");
		authNum = memberservice.RandomNum();
		System.out.println("랜덤 끝");
		memberservice.sendEmail(username.toString(), authNum);
		
		model.addAttribute("username", username);
		model.addAttribute("authNum", authNum);
		
		return model;
	}
	
}
