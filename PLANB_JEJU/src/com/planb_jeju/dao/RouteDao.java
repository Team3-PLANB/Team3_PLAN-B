package com.planb_jeju.dao;
//이거 할것 *****************************************************
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.planb_jeju.dto.Route;

//CRUD
public interface RouteDao {
	
	/*	
	 * @description : 전체 수
	 * @return : int
	 * @param spec : x
	 */
	public int getCount() throws ClassNotFoundException, SQLException;
	
	/*	
	 * @description : 전체 수
	 * @return : int
	 * @param spec : x
	 */
	//회원 현재 경로 번호 가져오기
	public int getRouteCode(String username) throws ClassNotFoundException, SQLException;
	
	//route 입력
	public int insert(Route route) throws ClassNotFoundException, SQLException;
	
	//route_personal 입력
	public int insertPersonal(Map<String, Object> map) throws ClassNotFoundException, SQLException;
	
	// 루트한개 가져오기
	public Route getRoute(int route_code, String username) throws ClassNotFoundException, SQLException;
		
	// 추천 대상 루트 여러개 가져오기 where에 personal 조건 여러개 or 로 걸려야 함
	public List<Route> getRouteList(Map<String, Object> map) throws ClassNotFoundException, SQLException;
	
	// 내 루트 리스트 가져오기
	public List<Route> getMyRouteList(String username) throws ClassNotFoundException, SQLException;
	
	//게시물 수정
	public int update(Route route) throws ClassNotFoundException, SQLException;
	
	//게시물 삭제
	public int delete(int route_code, String username) throws ClassNotFoundException, SQLException;
	
	
	
}	