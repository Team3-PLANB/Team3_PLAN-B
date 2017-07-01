package com.planb_jeju.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.planb_jeju.dao.RouteDao;
import com.planb_jeju.dao.RouteDetailDao;
import com.planb_jeju.dto.Route;
import com.planb_jeju.dto.RouteDetail;
import com.planb_jeju.utils.PersonalParse;

@Service
public class RouteDetailService {
	@Autowired
	private SqlSession sqlsession;

	
	public int insertRouteDetail(Map<String, Object> map) throws ClassNotFoundException, SQLException {

		// Mybatis 적용
		RouteDetailDao routeDetailDao = sqlsession.getMapper(RouteDetailDao.class);
		int result = routeDetailDao.insert(map);

		return result;

	}
	
	
	public int updateRouteDetail(RouteDetail routedetail) throws ClassNotFoundException, SQLException {

		// Mybatis 적용
		RouteDetailDao routeDetailDao = sqlsession.getMapper(RouteDetailDao.class);
		int result = routeDetailDao.update(routedetail);

		return result;

	}
	
	
	public HashMap<String, Object> getRouteDetailList(List<Route> routeList) throws ClassNotFoundException, SQLException {

		HashMap<String,Object> routeDetailMap = new HashMap<>();
		
		
		for(int i  = 0; i<routeList.size(); i++){
			// Mybatis 적용
			RouteDetailDao routeDetailDao = sqlsession.getMapper(RouteDetailDao.class);
			// routeDetail key값을 routeList에 넣고 각 경로의 모든 site값 가져오기
			//List<RouteDetail> routeDetailList = routeDetailDao.getRouteDetailList(routeList.get(i));
			
			List<RouteDetail> routeDetailList = routeDetailDao.getRouteDetailList(routeList.get(i).getRoute_code(), routeList.get(i).getUsername());
			for(RouteDetail routeDetail : routeDetailList){
				routeDetail.setCategory(PersonalParse.code2string(routeDetail.getCategory()));
			}
			
			// 경로의 Name값을 key값으로 설정, value는 해당 경로의 각 Site List
			routeDetailMap.put(routeList.get(i).getRoutename(), routeDetailList);
		}
		
		return routeDetailMap;

	}
	
	public List<RouteDetail> getRouteDetailListForPost(int route_code, String username) throws ClassNotFoundException, SQLException {
		RouteDetailDao routeDetailDao = sqlsession.getMapper(RouteDetailDao.class);
		
		Route route = new Route();
		route.setRoute_code(route_code);
		route.setUsername(username);
		List<RouteDetail> routeDetailList = routeDetailDao.getRouteDetailList(route_code, username);
		return routeDetailList;
	}
	
	public RouteDetail getRouteDetail(int route_code, String username, String site) throws ClassNotFoundException, SQLException {
		RouteDetailDao routeDetailDao = sqlsession.getMapper(RouteDetailDao.class);
		RouteDetail routeDetail = routeDetailDao.getRouteDetail(route_code, username, site);
		return routeDetail;
	}
}
