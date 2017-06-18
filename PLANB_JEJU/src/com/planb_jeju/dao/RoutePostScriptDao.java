package com.planb_jeju.dao;

import java.sql.SQLException;
import java.util.List;

import com.planb_jeju.dto.Member;
import com.planb_jeju.dto.RoutePostscript;

//CRUD
public interface RoutePostScriptDao {
	/*	
	 * @description : 전체 수
	 * @return : int
	 * @param spec : x
	 */
	public int getCount() throws ClassNotFoundException, SQLException;
	
	//게시물 입력
	public int insert(Member member) throws ClassNotFoundException, SQLException;
	
	//게시물 상세
	public Member getRoutePost(int route_code, String username) throws ClassNotFoundException, SQLException;
		
	//게시물 수정
	public int update(RoutePostscript route) throws ClassNotFoundException, SQLException;
	
	//게시물 삭제
	public int delete(int route_code, String username) throws ClassNotFoundException, SQLException;
	
	
	/*	
	 * @description : 루트 후기 리스트
	 * @return : List<RoutePostscript> 루트 후기 리스트
	 * @param spec : x
	 */
	public List<RoutePostscript> getList() throws ClassNotFoundException, SQLException;
	
	/*	
	 * @description : 루트 후기 리스트
	 * @return : List<RoutePostscript> 에서 route_postscript_rownum 리스트를 가져옴
	 * @param spec : String userename 로그인한 유저 아이디
	 */
	public List<RoutePostscript> getList(String userename) throws ClassNotFoundException, SQLException;
	
	

}
