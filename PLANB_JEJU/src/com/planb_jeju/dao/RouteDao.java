package com.planb_jeju.dao;
//이거 할것 *****************************************************
import java.sql.SQLException;
import java.util.List;

import com.planb_jeju.dto.Member;
import com.planb_jeju.dto.Route;

//CRUD
public interface RouteDao {
	
	//전체 수
	public int getCount() throws ClassNotFoundException, SQLException;
	
	//게시물 입력
	public int insert(Member member) throws ClassNotFoundException, SQLException;
	
	//게시물 상세
	public Member getRoute(int route_code, String username) throws ClassNotFoundException, SQLException;
		
	//게시물 수정
	public int update(Route route) throws ClassNotFoundException, SQLException;
	
	//게시물 삭제
	public int delete(int route_code, String username) throws ClassNotFoundException, SQLException;
	
	
}	