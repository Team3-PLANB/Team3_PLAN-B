package com.planb_jeju.dao;

import java.sql.SQLException;

import com.planb_jeju.dto.RouteDetail;

public interface RouteHistoryDao {
	public RouteDetail getMyHistory(int route_code, String username) throws ClassNotFoundException, SQLException;
}
