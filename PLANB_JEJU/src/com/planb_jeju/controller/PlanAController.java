package com.planb_jeju.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PlanAController {
	// index.htm 요청 View(index.jsp)

	@RequestMapping("PLANA.do")
	public String index() {
		System.out.println("LoginJoin/Join/NJoin.do 컨트롤러 들어옴");
		// Tiles 이전
		// return "index.jsp";
		return "PLANA.tmap";

	}

	@RequestMapping("PLANA.Marker2.do")
	public String markerAtoB() {
		System.out.println("LoginJoin/Join/NJoin.do 컨트롤러 들어옴");
		// Tiles 이전
		// return "index.jsp";
		return "PLANA.tmap_marker_a_to_b";

	}
	
	
	@RequestMapping("PLANA.datepick.do")
	public String datepick() {
		System.out.println("LoginJoin/Join/NJoin.do 컨트롤러 들어옴");
		// Tiles 이전
		// return "index.jsp";
		return "PLANA.step1_datepicker";

	}
}
