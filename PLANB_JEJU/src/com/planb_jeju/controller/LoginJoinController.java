package com.planb_jeju.controller;

import java.security.Principal;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Set;

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

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.planb_jeju.dao.MemberDao;
import com.planb_jeju.dao.RoleDAO;
import com.planb_jeju.dto.Member;
import com.planb_jeju.dto.Role;
import com.planb_jeju.service.MemberService;

/*
* @FileName : 
* @Class : LoginJoinController
* @Project : PLANB_JEJU
* @Date : 2017.06.16
* @LastEditDate : 2017.06.21
* @Author : 홍단비 
* @Desc : LoginJoin 컨트롤러
*/

@Controller
@RequestMapping("/LoginJoin/")
public class LoginJoinController {

	private static MemberDao memberDao;
	private static RoleDAO roledao;
	
	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	private MemberService memberservice;

	
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
	public String nLoginOK(Principal principal) throws ClassNotFoundException, SQLException{
		return "Main.mainpage";
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
	public @ResponseBody String fbjoin(String username, String password, String nickname) throws Exception {
		int result = 0;
		int roleResult = 0;
		memberDao = sqlsession.getMapper(MemberDao.class);
		roledao = sqlsession.getMapper(RoleDAO.class);
		result = memberDao.fbjoin(username,password.substring(0, 10), nickname);
		roleResult = roledao.insertRole(username);

		System.out.println("insert : " + result);
		System.out.println("roleresult: " + roleResult);
		
		return "true";
	}

	/*
	* @date : 2017. 6. 17
	* @description : 로그인 시 이메일, 비밀번호 체크
	* @return : String(ResponseBody) 
	*/
	@RequestMapping("Join/loginCheck.do")
	public @ResponseBody String loginCheck(String username, String password) throws Exception {
		memberDao = sqlsession.getMapper(MemberDao.class);
		String result = memberservice.loginCheck(username, password);

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
		roledao = sqlsession.getMapper(RoleDAO.class);
		Role role = roledao.getFbRole(username);
//		String result = memberDao.getFBpassword(username);
		Set<GrantedAuthority> authorities = new HashSet<GrantedAuthority>();
		authorities.add(new SimpleGrantedAuthority(role.getROLE_NAME()));

		UsernamePasswordAuthenticationToken authRequest = new UsernamePasswordAuthenticationToken(role.getUsername(), role.getPassword(), authorities);
			
		SecurityContext context = SecurityContextHolder.getContext();
		context.setAuthentication(authRequest);
		System.out.println("authRequest" +authRequest);
		Authentication auth = context.getAuthentication();
//		UserDetails userinfo = (UserDetails)auth.getPrincipal();
//		System.out.println(userinfo);
		return "true";
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
	* @return : String
	* @param spec : String
	*/
	@RequestMapping(value="Join/joinok.do", method=RequestMethod.POST)
	public String insert(Member member) throws ClassNotFoundException, SQLException{
		int result = 0;
		String viewpage = "";
		
		memberDao = sqlsession.getMapper(MemberDao.class);
		roledao = sqlsession.getMapper(RoleDAO.class);
		result = memberDao.insert(member);
		
		int roleResult = roledao.insertRole(member.getUsername());
		if (result > 0 && roleResult > 0) {  
			viewpage = "LoginJoin.Join.NJoin.joinForm";
		} else {
			viewpage = "LoginJoin.Join.NJoin.joinForm";
		}
		return viewpage;
	}	
}
