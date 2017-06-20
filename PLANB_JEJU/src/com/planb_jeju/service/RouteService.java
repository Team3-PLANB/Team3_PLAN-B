package com.planb_jeju.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.ParserConfigurationException;

/*
* @FileName : PlanAController.java
* @Class : PlanAController
* @Project : PLANB_JEJU
* @Date : 2017.06.12
* @LastEditDate : 2017.06.16
* @Author : 강나영 
* @Desc : 일정 만들기 / 제주도 API 정보   컨트롤러
*/

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xml.sax.SAXException;

import com.planb_jeju.dao.RouteDao;
import com.planb_jeju.dto.Route;

@Service
public class RouteService {

	@Autowired
	private SqlSession sqlsession;
	
	RouteDao routeDao;
	
	/*public RouteService(){
		RouteDao routeDao = sqlsession.getMapper(RouteDao.class);
	}*/

	public int insertRoute(Route route) throws ClassNotFoundException, SQLException {
		
		RouteDao routeDao = sqlsession.getMapper(RouteDao.class);
		int result = routeDao.insert(route);

		return result;

	}

	public int getRoutecode(String username) throws ClassNotFoundException, SQLException {

		// Mybatis 적용
		RouteDao routeDao = sqlsession.getMapper(RouteDao.class);
		int routecode = routeDao.getRouteCode(username);

		return routecode;

	}

	// insertPersonal

	public int insertPersonal(Map<String, Object> map) throws ClassNotFoundException, SQLException {

		// Mybatis 적용
		RouteDao routeDao = sqlsession.getMapper(RouteDao.class);
		int result = routeDao.insertPersonal(map);

		return result;

	}
	
	public List<Route> getRouteList(Map<String, Object> map) throws ClassNotFoundException, SQLException {

		// Mybatis 적용
		RouteDao routeDao = sqlsession.getMapper(RouteDao.class);
		List<Route> routeList = routeDao.getRouteList(map);

		return routeList;

	}
	
}
