package com.planb_jeju.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.planb_jeju.dto.Member;
import com.planb_jeju.dto.Route;
import com.planb_jeju.dto.RoutePersonal;

//CRUD
public interface RoutePersonalDao {
	
	
	/*	
	 * @description : 취향 입력
	 * @return : int
	 * @param spec : x
	 */
	public int insert(Map<String, Object> map) throws ClassNotFoundException, SQLException;
	
	
	
}	