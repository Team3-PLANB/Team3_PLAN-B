package com.planb_jeju.service;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.planb_jeju.dao.RouteHistoryDao;
import com.planb_jeju.dto.RouteHistory;

@Service
public class HistoryService {

	@Autowired
	private SqlSession sqlsession;
	
	public RouteHistory getRouteDetail(int route_code, String username) throws ClassNotFoundException, SQLException {
		RouteHistoryDao routeHistoryDao = sqlsession.getMapper(RouteHistoryDao.class);
		System.out.println("routecode>>" + route_code +" / username>>"+ username);
		RouteHistory history = routeHistoryDao.getMyHistory(route_code, username);
		System.out.println(history);
		return history;
		
	}
	
}
