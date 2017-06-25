package com.planb_jeju.service;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.planb_jeju.dao.RouteDao;
import com.planb_jeju.dao.RouteDetailDao;
import com.planb_jeju.dto.Route;

@Service
public class HistoryService {

	@Autowired
	private SqlSession sqlsession;
	
	public Route getRouteDetail(int route_code, String username) throws ClassNotFoundException, SQLException {
		RouteDetailDao routeDetailDao = sqlsession.getMapper(RouteDetailDao.class);
		System.out.println(routeDetailDao);
		routeDetailDao.getMyHistory(route_code, username);
		return null;
		
	}
	
}
