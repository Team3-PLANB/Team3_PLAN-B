package com.planb_jeju.service;
//주석 추가
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Random;

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
	
	public List<Route> getMyRouteList(String username) throws ClassNotFoundException, SQLException {
		RouteDao routeDao = sqlsession.getMapper(RouteDao.class);
		List<Route> routeList = routeDao.getMyRouteList(username);

		return routeList;

	}
	
	
	/*
	* @date : 2017.06.23
	* @Author : 정다혜
	* @description : 루트 정보 가져오기
	* @parameter : int route_code 루트 코드, String username 접속자 아이디
	* @return : Route route 루트 정보
	*/
	public Route getRouteInfo(int route_code, String username) throws ClassNotFoundException, SQLException {
		RouteDao routeDao = sqlsession.getMapper(RouteDao.class);
		Route route = routeDao.getRoute(route_code, username);
		return route;
	}
	
	/*
	* @date : 2017.07.03
	* @Author : 정다혜
	* @description : 랜덤 루트 대표 이미지 뽑기
	* @parameter : 
	* @return : String 랜덤으로 뽑힌 이미지 이름
	*/
	public String getRandomImg() throws ClassNotFoundException, SQLException {
		Random generator = new Random();
        int randnum = generator.nextInt(7) + 1;
        System.out.println("travel" + randnum + ".jpg");
        
		return "travel" + randnum + ".jpg" ;
	}
	
}
