package com.planb_jeju.dao;
//이거 할것 *****************************************************
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.planb_jeju.dto.Member;
import com.planb_jeju.dto.Route;
import com.planb_jeju.dto.RoutePersonal;

//CRUD
public interface RoutePersonalDao {
	
	
	//취향 입력
	public int insert(Map<String, Object> map) throws ClassNotFoundException, SQLException;
	
	
	
}	