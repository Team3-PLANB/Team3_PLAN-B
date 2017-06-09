package com.planb_jeju.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {
	
	@RequestMapping("MyPage/Message/msg.do")
	public String index(){
		System.out.println("MyPage/Message/msg.do 컨트롤러 들어옴");
		//Tiles 이전
		//return "index.jsp";
		return "MyPage.Message.msgMain";
	}
}
