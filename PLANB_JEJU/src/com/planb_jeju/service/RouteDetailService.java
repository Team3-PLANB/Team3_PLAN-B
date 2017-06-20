package com.planb_jeju.service;

import java.sql.SQLException;
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

	public List<RouteDetail> getRouteDetailList(Map<String, Object> map) throws ClassNotFoundException, SQLException {

		// Mybatis 적용
		RouteDetailDao routeDetailDao = sqlsession.getMapper(RouteDetailDao.class);
		List<RouteDetail> routeDetailList = routeDetailDao.getRouteDetailList(map);

		return routeDetailList;

	}
}
