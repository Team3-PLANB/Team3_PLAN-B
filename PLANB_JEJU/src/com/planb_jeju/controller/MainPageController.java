package com.planb_jeju.controller;

/*
* @Class : MainPageController
* @Project : PLANB_JEJU
* @Date : 2017.06.19
* @LastEditDate : 2017.06.19
* @Author : 임정연
* @Desc : 메인페이지
*/

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainPageController {

	/* mainpage가기 */
	@RequestMapping("Index/main.do")
	public String mainpage() {
		System.out.println("Index/main.do 컨트롤러 들어옴");
		return "Main.mainpage";

	}
}
