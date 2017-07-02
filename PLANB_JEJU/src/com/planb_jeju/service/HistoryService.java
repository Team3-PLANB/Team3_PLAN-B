package com.planb_jeju.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.planb_jeju.dao.RouteHistoryDao;
import com.planb_jeju.dto.RouteHistory;

@Service
public class HistoryService {

	@Autowired
	private SqlSession sqlsession;
	
	/*
	* @date : 2017. 6. 30
	* @description : 히스토리 insert
	* @parameter : 
	* @return : int
	*/
	public int insertRouteHistory(Map<String, Object> map) throws ClassNotFoundException, SQLException {

		RouteHistoryDao routeHistoryDao = sqlsession.getMapper(RouteHistoryDao.class);
		int result = routeHistoryDao.insert(map);

		return result;
	}
	
	/*
	* @date : 2017. 6. 30
	* @description : 히스토리 상세보기
	* @parameter : 
	* @return : List(history 목록) 
	*/
	public List<RouteHistory> getRouteDetail(int route_code, String username) throws ClassNotFoundException, SQLException {
		RouteHistoryDao routeHistoryDao = sqlsession.getMapper(RouteHistoryDao.class);
		List<RouteHistory> history = routeHistoryDao.getMyHistory(route_code, username);

		return history;
	}
}
