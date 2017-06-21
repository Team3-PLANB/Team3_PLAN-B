package com.planb_jeju.controller;

import java.security.Principal;
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
import javax.servlet.http.HttpSession;
import javax.swing.text.View;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonView;
import com.planb_jeju.dao.MemberDao;
import com.planb_jeju.dao.RollDAO;
import com.planb_jeju.dto.Member;
import com.planb_jeju.service.MemberService;

@Controller
@RequestMapping("/LoginJoin/")
public class LoginJoinController {

	private static MemberDao memberDao;
	private static RollDAO rolldao;
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
		return "LoginJoin.Join.NJoin.joinForm";
	}

	@RequestMapping("Login/NLogin.do")
	public String loginView(){
		return "LoginJoin.Login.NLogin.loginForm";		
	}
	
	/*
	 * @date : 2017. 6. 21
	 * @description : 로그아웃
	 * @return : 
	 */
	@RequestMapping("Join/Logout.do")
	public String logout() {
		return "Main.mainpage";
	}
	
	/*
	* @date : 2017. 6. 18
	* @description : 로그인 ok > 화면 이동 
	* @return : String(View 페이지) 
	*/
	@RequestMapping("Login/loginok.do")
	public String nLoginOK(HttpSession session,Principal principal) throws ClassNotFoundException, SQLException{
		System.out.println("loginok");
		User principal2 = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println("prin2 : "+principal2);
		
		SecurityContext context = SecurityContextHolder.getContext();
		Authentication auth = context.getAuthentication();
		UserDetails userinfo = (UserDetails)auth.getPrincipal();
		
		System.out.println(userinfo.getUsername());
		System.out.println(auth.getAuthorities());
		System.out.println(auth.isAuthenticated());
	
		return "Main.mainpage";
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
		memberDao = sqlsession.getMapper(MemberDao.class);
		String result = memberservice.loginCheck(username, password, sqlsession);

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
		String result = memberDao.getFBpassword(username);
		
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
		String username = request.getParameter("username");
		String authNum = "";
		
		authNum = memberservice.RandomNum();
		memberservice.sendEmail(username.toString(), authNum);
		
		return authNum;
		
	}
	
	/*
	* @date : 2017. 6. 17
	* @description : 회원가입 완료
	* @return : Model(Ajax 처리)
	* @param spec : String
	*/
	@RequestMapping(value="Join/joinok.do", method=RequestMethod.POST)
	public String insert(Member member) throws ClassNotFoundException, SQLException{
		int result = 0;
		String viewpage = "";
		
		memberDao = sqlsession.getMapper(MemberDao.class);
		rolldao = sqlsession.getMapper(RollDAO.class);
		result = memberDao.insert(member);
		
		int rollResult = rolldao.insertRoll(member.getUsername());
		System.out.println("insert : " + result);
		if (result > 0 && rollResult > 0) {  
			viewpage = "LoginJoin.Join.NJoin.joinForm";
		} else {
			viewpage = "LoginJoin.Join.NJoin.joinForm";
		}
		return viewpage;
	}	
}
