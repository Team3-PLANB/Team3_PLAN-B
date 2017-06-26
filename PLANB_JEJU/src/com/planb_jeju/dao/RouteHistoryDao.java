package com.planb_jeju.dao;

import java.sql.SQLException;

import com.planb_jeju.dto.RouteHistory;

public interface RouteHistoryDao {
	public RouteHistory getMyHistory(int route_code, String username) throws ClassNotFoundException, SQLException;
}
