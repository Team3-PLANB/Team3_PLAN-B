package com.planb_jeju.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.planb_jeju.dto.RouteHistory;

public interface RouteHistoryDao {
	
	//route_personal 입력
	public int insert(Map<String, Object> map) throws ClassNotFoundException, SQLException;
		
	public List<RouteHistory> getMyHistory(int route_code, String username) throws ClassNotFoundException, SQLException;
}
