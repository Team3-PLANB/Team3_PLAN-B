
package com.planb_jeju.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/LoginJoin/")
public class IndexController {
	//index.htm 요청 View(index.jsp)
	
	@RequestMapping("Join/NJoin.do")
	public String nJoin(){
		System.out.println("LoginJoin/Join/NJoin.do 컨트롤러 들어옴");
		//Tiles 이전
		//return "index.jsp";
		return "LoginJoin.Join.NJoin.joinForm";		
	}
	
	@RequestMapping("Join/SJoin.do")
	public String sJoim(){
		System.out.println("LoginJoin/Join/SJoin.do 컨트롤러 들어옴");
		//Tiles 이전
		//return "index.jsp";
		return "LoginJoin.Join.SJoin.index";	
	}
	
	@RequestMapping("Login/NLogin.do")
	public String nLogin(){
		System.out.println("LoginJoin/Login/NJoin.do 컨트롤러 들어옴");
		//Tiles 이전
		//return "index.jsp";
		return "LoginJoin.Join.NJoin.joinForm";		
	}
}
