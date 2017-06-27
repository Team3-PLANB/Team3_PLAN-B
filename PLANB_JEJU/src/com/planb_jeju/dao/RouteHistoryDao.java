package com.planb_jeju.dao;

import java.sql.SQLException;
import java.util.List;

import com.planb_jeju.dto.RouteHistory;

public interface RouteHistoryDao {
	public List<RouteHistory> getMyHistory(int route_code, String username) throws ClassNotFoundException, SQLException;
}
