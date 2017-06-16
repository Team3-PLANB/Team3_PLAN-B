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
public class LoginJoinController {

	private static MemberDao memberDao;

	@Autowired
	private SqlSession sqlsession;
	
	private MemberService memberservice = new MemberService();

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
	public @ResponseBody String duplicationCheck(String username) throws Exception {
		memberDao = sqlsession.getMapper(MemberDao.class);
		return memberservice.duplicationCheck(username);
	}
	
	/*
	* @date : 2017. 6. 16
	* @description : 페이스북 가입
	* @return : String(ResponseBody) 
	*/
	@RequestMapping("Join/fbjoin.do")
	public @ResponseBody void fbjoin(String username, String fbaccesstoken, String userid) throws Exception {
		memberDao = sqlsession.getMapper(MemberDao.class);
		memberDao.fbjoin(username,fbaccesstoken.substring(0, 10), userid);
	}
	
	/* 로그인 >> 이메일, 비밀번호 체크 */

	/*
	* @date : 2017. 6. 16
	* @description : 페이스북 로그인 중복체크 > 중복-로그인 > 비중복-가입mapper
	* @return : String(ResponseBody) 
	*/
	@RequestMapping("Login/fblogin")
	public @ResponseBody String fblogin(String username) throws Exception {
/*		sqlsession.getMapper(MemberDAO.class).fblogin(email);
		return sqlsession.getMapper(MemberDAO.class).getfbpassword(email);*/
		return null;
	}	

	/*
	* @date : 2017. 6. 16
	* @description : 회원가입 시 메일 인증
	* @return : Model(Ajax 처리)
	* @param spec : HttpServletRequest request, HttpServletResponse response, Model model
	*/
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
