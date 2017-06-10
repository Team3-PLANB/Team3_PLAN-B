
package com.planb_jeju.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	//index.htm 요청 View(index.jsp)
	
	@RequestMapping("LoginJoin/Join/NJoin.do")
	public String index(){
		System.out.println("LoginJoin/Join/NJoin.do 컨트롤러 들어옴");
		//Tiles 이전
		//return "index.jsp";
		return "LoginJoin.Join.NJoin.joinForm";	
		
	}
	@RequestMapping("LoginJoin/Join/SJoin.do")
	public String test(){
		System.out.println("LoginJoin/Join/SJoin.do 컨트롤러 들어옴");
		//Tiles 이전
		//return "index.jsp";
		return "LoginJoin.Join.SJoin.index";	
		
	}
}
