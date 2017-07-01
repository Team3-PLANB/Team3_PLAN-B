package com.planb_jeju.dao;
//이거 할것 *****************************************************
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.planb_jeju.dto.Member;
import com.planb_jeju.dto.Route;
import com.planb_jeju.dto.RouteDetail;

//CRUD
public interface RouteDetailDao {
	
	
	//route_personal 입력
	public int insert(Map<String, Object> map) throws ClassNotFoundException, SQLException;
	
	//route_personal 입력
	public int update(RouteDetail routedetail) throws ClassNotFoundException, SQLException;
		
	
	/*	
	 * @description : 전체 수
	 * @return : int
	 * @param spec : x
	 */
	// 추천 대상 루트 여러개 가져오기 where에 personal 조건 여러개 or 로 걸려야 함
	public List<RouteDetail> getRouteDetailList(Route route) throws ClassNotFoundException, SQLException;
	
	public List<RouteDetail> getMyHistory(int route_code, String username) throws ClassNotFoundException, SQLException;
	
	public RouteDetail getRouteDetail(int route_code, String username, String site) throws ClassNotFoundException, SQLException;
}	