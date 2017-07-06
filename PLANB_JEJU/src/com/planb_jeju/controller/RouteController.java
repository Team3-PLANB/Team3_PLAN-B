package com.planb_jeju.controller;

/*
* @FileName : RouteController.java
* @Class : RouteController
* @Project : PLANB_JEJU
* @Date : 2017.06.27
* @LastEditDate : 2017.06.27
* @Author : 정다혜
* @Desc : 루트 & 여행지 관련 컨트롤러
*/

import java.security.Principal;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.planb_jeju.dto.RouteDetail;
import com.planb_jeju.service.RouteDetailService;

@Controller
@RequestMapping("/RouteDetail/")
public class RouteController {

	@Autowired
	private RouteDetailService routeDetailservice;

	/*
	* @date : 2017. 6. 27
	* @description : 여행지 이름으로 여행지 정보 가져오기
	* @parameter : route_code 루트 코드, username 작성자 이름, site 여행지 이름
	* @return : void
	*/	
	@RequestMapping("routeDetail.do")
	public @ResponseBody RouteDetail getRouteDetail(@RequestParam int route_code, Principal principal, @RequestParam String site, Model model) throws ClassNotFoundException, SQLException{

		String username = principal.getName();
		RouteDetail routeDetailInfo = routeDetailservice.getRouteDetail(route_code, username, site);

		return routeDetailInfo;
	}
	
}
