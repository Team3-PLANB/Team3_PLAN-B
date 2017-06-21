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

@Service
public class RouteDetailService {
	@Autowired
	private SqlSession sqlsession;

	public HashMap<Integer, Object> getRouteDetailList(java.util.List<Route> routeList) throws ClassNotFoundException, SQLException {

		HashMap<Integer,Object> routeDetailMap = new HashMap<>();
		
		
		for(int i  = 0; i<routeList.size(); i++){
			// Mybatis 적용
			RouteDetailDao routeDetailDao = sqlsession.getMapper(RouteDetailDao.class);
			java.util.List<RouteDetail> routeDetailList = routeDetailDao.getRouteDetailList(routeList.get(i));
			
			routeDetailMap.put(i, routeDetailList);
		}
		
		return routeDetailMap;

	}
}
