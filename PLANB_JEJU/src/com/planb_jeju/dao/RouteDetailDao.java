package com.planb_jeju.dao;

import java.sql.SQLException;
import java.util.List;

import com.planb_jeju.dto.Member;
import com.planb_jeju.dto.Route;
import com.planb_jeju.dto.RouteDetail;

//CRUD
public interface RouteDetailDao {
	
	//전체 수
	public int getCount() throws ClassNotFoundException, SQLException;
	
	//게시물 입력
	public int insert(RouteDetail routedetail) throws ClassNotFoundException, SQLException;
	
	//게시물 상세
	public RouteDetail getRouteDetail(RouteDetail routedetail) throws ClassNotFoundException, SQLException;
		
	//게시물 수정
	public int update(RouteDetail routedetail) throws ClassNotFoundException, SQLException;
	
	//게시물 삭제
	public int delete(RouteDetail routedetail) throws ClassNotFoundException, SQLException;
	
	
}	