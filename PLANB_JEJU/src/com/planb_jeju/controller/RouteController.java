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

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.planb_jeju.dao.ExDao;
import com.planb_jeju.dao.MemberDao;
import com.planb_jeju.dto.Member;
import com.planb_jeju.dto.RouteDetail;
import com.planb_jeju.service.RouteDetailService;


//폴더 경로가 긴 경우
///customer/notice.htm => notice.htm (함수 mapping)
///customer/noticeDetail.html  =>noticeDetail.html
@Controller
@RequestMapping("/RouteDetail/")
public class RouteController {

	@Autowired
	private RouteDetailService routeDetailservice;

	@Autowired
	private SqlSession sqlsession;

	/*
	* @date : 2017. 6. 27
	* @description : 여행지 이름으로 여행지 정보 가져오기
	* @parameter : route_code 루트 코드, username 작성자 이름, site 여행지 이름
	* @return : void
	*/	
	@RequestMapping("routeDetail.do")
	public @ResponseBody RouteDetail getRouteDetail(@RequestParam int route_code, Principal principal, @RequestParam String site, Model model) throws ClassNotFoundException, SQLException{
		System.out.println("사이트 정보 가져오기");
		String username = principal.getName();
		RouteDetail routeDetailInfo = routeDetailservice.getRouteDetail(route_code, username, site);
		
		System.out.println("routeDetailInfo : " + routeDetailInfo);
		
		return routeDetailInfo;
	}
	
}
