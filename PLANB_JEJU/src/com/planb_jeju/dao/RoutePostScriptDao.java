package com.planb_jeju.dao;

import java.sql.SQLException;
import java.util.List;

import com.planb_jeju.dto.Member;
import com.planb_jeju.dto.RoutePostscript;
import com.planb_jeju.dto.RoutePostscriptLike;

//CRUD
public interface RoutePostScriptDao {
	
	/*	
	 * @description : 루트 후기 전체 수
	 * @return : int 전체 루트 후기 개수
	 * @param spec : x
	 */
	public int getCount() throws ClassNotFoundException, SQLException;
	
	/*	
	 * @description : 루트 후기 등록
	 * @return : int 성공 여부 ( > 0 : 성공)
	 * @param spec : RoutePostscript 등록할 루트 후기 정보
	 */
	public int insert(RoutePostscript routePostscript) throws ClassNotFoundException, SQLException;
			
	/*	
	 * @description : 루트 후기 수정
	 * @return : int 성공 여부 ( > 0 : 성공)
	 * @param spec : RoutePostscript 수정할 루트 후기 정보
	 */
	public int update(RoutePostscript routePostscript) throws ClassNotFoundException, SQLException;
		
	/*	
	 * @description : 루트 후기 삭제
	 * @return : int 성공 여부 ( > 0 : 성공)
	 * @param spec : int route_postscript_rownum 삭제할 루트 후기 고유 번호, String username 삭제할 루트 후기의 작성자
	 */
	public int delete(int route_postscript_rownum, String username) throws ClassNotFoundException, SQLException;
	
	
	/*	
	 * @description : 루트 후기 리스트
	 * @return : List<RoutePostscript> 루트 후기 리스트
	 * @param spec : String username
	 */
	public List<RoutePostscript> getList(String username) throws ClassNotFoundException, SQLException;
	
	/*	
	 * @description : 루트 후기 상세보기
	 * @return : RoutePostscript 루트 후기
	 * @param spec : int 상세보기할 루트 후기 고유 번호
	 */
	public RoutePostscript getRoutePost(int route_postscript_rownum) throws ClassNotFoundException, SQLException;
	
	/*	
	 * @description : 찜콩하기
	 * @return : int 성공 여부 ( > 0 : 성공)
	 * @param spec : RoutePostscriptLike 찜콩할 후기
	 */
	public int insertLike(RoutePostscriptLike routePostscriptLike) throws ClassNotFoundException, SQLException;
	
	/*	
	 * @description : 찜콩 해제
	 * @return : int 성공 여부 ( > 0 : 성공)
	 * @param spec : RoutePostscriptLike 해제할 찜콩 후기
	 */
	public int deleteLike(RoutePostscriptLike routePostscriptLike) throws ClassNotFoundException, SQLException;
	
	/*	
	 * @description : 태그 등록
	 * @return : int 업데이트된 라인 수
	 * @param spec : RoutePostscript 루트 후기 정보 중 태그 정보
	 */
	public int insertTag(RoutePostscript routePostscript) throws ClassNotFoundException, SQLException;
	
	/*	
	 * @description : 태그 삭제
	 * @return : int 업데이트된 라인 수
	 * @param spec : int route_postscript_rownum 루트 후기 고유 번호
	 */
	public int deleteTag(int route_postscript_rownum) throws ClassNotFoundException, SQLException;
	
	/*	
	 * @description : 조회수 증가
	 * @return : int 업데이트된 라인 수
	 * @param spec : int route_postscript_rownum 루트 후기 고유 번호
	 */
	public int updateHitNum(int route_postscript_rownum) throws ClassNotFoundException, SQLException;
	
	/*	
	 * @description : 좋아요(찜콩수) 증가
	 * @return : int 업데이트된 라인 수
	 * @param spec : int route_postscript_rownum 루트 후기 고유 번호
	 */
	public int updateLikeNum(int route_postscript_rownum) throws ClassNotFoundException, SQLException;
	
}
