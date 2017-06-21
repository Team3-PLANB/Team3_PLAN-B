package com.planb_jeju.controller;

import java.sql.SQLException;

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
import javax.swing.text.View;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonView;
import com.planb_jeju.dao.MemberDao;
import com.planb_jeju.dto.Member;
import com.planb_jeju.service.MemberService;

@Controller
@RequestMapping("/LoginJoin/")
public class LoginJoinController {

	private static MemberDao memberDao;
	private static Member member;
	
	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	private MemberService memberservice;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	/*
	* @date : 2017. 6. 16
	* @description : 회원가입 화면 이동 
	* @return : String(View 페이지) 
	*/
	@RequestMapping("Join/NJoin.do")
	public String nJoin(){
		System.out.println(">>>>>>>nJoin_controller<<<<<<<");
		return "LoginJoin.Join.NJoin.joinForm";		
	}

	@RequestMapping("Login/NLogin.do")
	public String loginView(){
		System.out.println(">>>>>>>LoginView_controller<<<<<<<");
		return "LoginJoin.Login.NLogin.loginForm";		
	}
	
	/*
	* @date : 2017. 6. 18
	* @description : 로그인 ok > 화면 이동 
	* @return : String(View 페이지) 
	*/
	@RequestMapping("Login/loginok.do")
	public String nLoginOK(){
		System.out.println("loginok");
		return "MyPage.Info.infoMain";
	}
	
	/*
	* @date : 2017. 6. 16
	* @description : 준성오빠 일정만들기 UI 작업 중 > 나중에 경로 옮겨야 함
	* @return : String(View 페이지) 
	*/
	@RequestMapping("Join/SJoin.do")
	public String detail_JS(){
		System.out.println("준성 일정만들기 UI 작업 중");
		return "LoginJoin.Login.SLogin.detail_JS";
	}
	
	/*
	* @date : 2017. 6. 16
	* @description : 회원가입시 아이디 체크 (비동기)
	* @return : String(ResponseBody) 
	*/
	@RequestMapping("Join/duplicationCheck.do")
	public @ResponseBody String duplicationEmailCheck(String username) throws Exception {
		memberDao = sqlsession.getMapper(MemberDao.class);
		String result = memberservice.duplicationEmailCheck(username, sqlsession);
		System.out.println("controller"+username);
		return result;
	}
	
	/*
	* @date : 2017. 6. 16
	* @description : 회원가입시 닉네임 체크 (비동기)
	* @return : String(ResponseBody) 
	*/
	@RequestMapping("Join/duplicationNCheck.do")
	public @ResponseBody String duplicationNickCheck(String nickname) throws Exception {
		memberDao = sqlsession.getMapper(MemberDao.class);
		String result = memberservice.duplicationNickCheck(nickname, sqlsession);
		return result;
	}
	
	/*
	* @date : 2017. 6. 16
	* @description : 페이스북 가입
	* @return : String(ResponseBody) 
	*/
	@RequestMapping("Join/fbjoin.do")
	public @ResponseBody void fbjoin(String username, String fbaccesstoken, String nickname) throws Exception {
		memberDao = sqlsession.getMapper(MemberDao.class);
		memberDao.fbjoin(username,fbaccesstoken.substring(0, 10), nickname);
	}

	/*
	* @date : 2017. 6. 17
	* @description : 로그인 시 이메일, 비밀번호 체크
	* @return : String(ResponseBody) 
	*/
	@RequestMapping("Join/loginCheck.do")
	public @ResponseBody String loginCheck(String username, String password) throws Exception {
		System.out.println(username + "/" + password);
		memberDao = sqlsession.getMapper(MemberDao.class);
		String result = memberservice.loginCheck(username, password, sqlsession);
		System.out.println("logincontroller : " + result);
		return result;
	}
	
	/*
	* @date : 2017. 6. 16
	* @description : 페이스북 로그인 중복체크 > 중복-로그인 > 비중복-가입mapper
	* @return : String(ResponseBody) 
	*/
	@RequestMapping("Join/fblogin.do")
	public @ResponseBody String fblogin(String username) throws Exception {
		memberDao = sqlsession.getMapper(MemberDao.class);
		System.out.println("fblogincontroller" + username);
		String result = memberDao.getFBpassword(username);
		System.out.println("fblogin : rel : "+result);
		return result;
	}	

	/*
	* @date : 2017. 6. 16
	* @description : 회원가입 시 메일 인증
	* @return : Model(Ajax 처리)
	* @param spec : HttpServletRequest request
	*/
	@RequestMapping("Join/emailAuth.do")
	public @ResponseBody String emailAuth(HttpServletRequest request) throws Exception{
	System.out.println(">>>>>>>Email_controller<<<<<<<");
		
		String username = request.getParameter("username");
		System.out.println("username : " + username);
		String authNum = "";
		System.out.println("랜덤 시작");
		authNum = memberservice.RandomNum();
		System.out.println("랜덤 끝 / authNum : " + authNum);
		System.out.println("메일 보내기 시작");
		memberservice.sendEmail(username.toString(), authNum);
		System.out.println("메일 보내기 끝");
		
		return authNum;
		
	}
	
	/*
	* @date : 2017. 6. 17
	* @description : 회원가입 완료
	* @return : Model(Ajax 처리)
	* @param spec : String
	*/
	@RequestMapping(value="Join/joinok.do", method=RequestMethod.POST)
	public String insert(String username, String password, String nickname) throws ClassNotFoundException, SQLException{
		String viewpage = "";
		memberDao = sqlsession.getMapper(MemberDao.class);
		int insertResult = memberDao.insert(username, password, nickname);
		//int rollResult = memberDao.insertRole(username);
		System.out.println("insert : " + insertResult);
		if (insertResult > 0) { // && rollResult > 0
			System.out.println("insert성공");
			viewpage = "LoginJoin.Login.NLogin.loginForm";
		} else {
			System.out.println("insert실패");
			viewpage = "LoginJoin.Join.NJoin.JoinForm";
		}
		return viewpage;
	}	
}
