package com.planb_jeju.dao;

import java.sql.SQLException;
import java.util.List;

import com.planb_jeju.dto.Member;
import com.planb_jeju.dto.RoutePostscript;
import com.planb_jeju.dto.RoutePostscriptLike;

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
	 * @description : 찜콩하기
	 * @return : int 업데이트된 라인 수
	 * @param spec : RoutePostscriptLike 추가할 루트 찜콩
	 */
	public int insertLike(RoutePostscriptLike routepostscriptlike) throws ClassNotFoundException, SQLException;
	
	/*	
	 * @description : 찜콩 해제
	 * @return : int 업데이트된 라인 수
	 * @param spec : RoutePostscriptLike 삭제할 루트 찜콩
	 */
	public int deleteLike(RoutePostscriptLike routepostscriptlike) throws ClassNotFoundException, SQLException;
	
	/*	
	 * @description : 루트 후기 상세보기
	 * @return : RoutePostscript 루트 후기
	 * @param spec : int 상세보기할 루트 후기 고유 번호
	 */
	public RoutePostscript getRoutePost(int route_postscript_rownum) throws ClassNotFoundException, SQLException;
	
	

}
