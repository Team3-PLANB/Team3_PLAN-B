package com.planb_jeju.service;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.planb_jeju.dao.RouteDao;
import com.planb_jeju.dto.Route;

public class HistoryService {

	@Autowired
	private SqlSession sqlsession;
	
	public Route getRouteDetail(int route_code, String username) throws ClassNotFoundException, SQLException {
		RouteDao routedao = sqlsession.getMapper(RouteDao.class);
		
		routedao.getRoute(route_code, username);
		return null;
		
	}
	
}
