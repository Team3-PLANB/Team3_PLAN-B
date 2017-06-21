package com.planb_jeju.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

/*
* @FileName : PostscriptService.java
* @Class : PostscriptService
* @Project : PLANB_JEJU
* @Date : 2017.06.12
* @LastEditDate : 2017.06.20
* @Author : 정다혜
* @Desc : 루트 후기 게시판 서비스
*/

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.planb_jeju.dao.RoutePostScriptDao;
import com.planb_jeju.dao.SitePostScriptDao;
import com.planb_jeju.dto.RoutePostscript;

@Service
public class PostscriptService {
	
	private static RoutePostScriptDao routePostscriptDao;
	
	SitePostScriptDao sitePostscriptDao;
	
	public PostscriptService(){
		
		
	}
	
	
	public List<RoutePostscript> listRoutePostscript(String username, SqlSession sqlsession) throws ClassNotFoundException, SQLException {
		System.out.println("루트 후기게시판 서비스 들어옴");
		routePostscriptDao = sqlsession.getMapper(RoutePostScriptDao.class);
		System.out.println("username : " + username);
		List<RoutePostscript> routePostscriptList = routePostscriptDao.getList(username);
		
		return routePostscriptList;

	}
}
