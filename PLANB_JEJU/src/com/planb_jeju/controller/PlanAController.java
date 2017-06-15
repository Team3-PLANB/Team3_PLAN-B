package com.planb_jeju.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PlanAController {
	// index.htm 요청 View(index.jsp)

	@RequestMapping("PLANA.do")
	public String index() {
		System.out.println("PLANA 컨트롤러 들어옴");
		// Tiles 이전
		// return "index.jsp";
		return "PLANA.tmap";

	}

	@RequestMapping("PLANA.Marker2.do")
	public String markerAtoB() {
		return "PLANA.tmap_marker_a_to_b";

	}
	
	
	@RequestMapping("PLANA.datepick.do")
	public String datepick() {
		// Tiles 이전
		// return "index.jsp";
		
		
		return "PLANA.step1_datepicker";

	}
}
