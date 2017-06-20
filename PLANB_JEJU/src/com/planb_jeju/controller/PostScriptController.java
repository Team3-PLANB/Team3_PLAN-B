package com.planb_jeju.controller;

/*
* @FileName : PostScriptController.java
* @Class : PostScriptController
* @Project : PLANB_JEJU
* @Date : 2017.06.16
* @LastEditDate : 2017.06.19
* @Author : 정다혜
* @Desc : 후기 게시판 컨트롤러 
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
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.planb_jeju.dao.ExDao;
import com.planb_jeju.dao.MemberDao;
import com.planb_jeju.dto.Member;
import com.planb_jeju.dto.RoutePostscript;
import com.planb_jeju.service.MemberService;
import com.planb_jeju.service.PostscriptService;


@Controller
@RequestMapping("/PostScript/")
public class PostScriptController {

/*	
	private static MemberDao memberDao;

	@Autowired
	private SqlSession sqlsession;*/
	
	PostscriptService postscriptservice = new PostscriptService();
	

	@RequestMapping(value="Route/List.do", method=RequestMethod.GET)
	public String postscriptRoot_list(HttpSession session, Model model) throws ClassNotFoundException, SQLException {
		System.out.println("후기 게시판 들어옴");
		Member member = (Member)session.getAttribute("member");
		List<RoutePostscript> routePostscriptList = postscriptservice.listRoutePostscript(member.getUsername());
		System.out.println("routePostscriptList : " + routePostscriptList);
		model.addAttribute("routePostscriptList", routePostscriptList);
		return "PostScript.Root.listBoard";	
	}
	
	@RequestMapping("/Site/List.do")
	public String postscriptSite_list() throws ClassNotFoundException, SQLException {
		
		return "PostScript.Site.listBoard";	

	}
	
	@RequestMapping("Route/Detail.do")
	public String postscriptRoot_detail() throws ClassNotFoundException, SQLException {
		
		return "PostScript.Root.detail";	

	}
	
	@RequestMapping("Site/Detail.do")
	public String postscriptSite_detail() throws ClassNotFoundException, SQLException {
		
		return "PostScript.Site.detail";	

	}



}
