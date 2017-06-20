package com.planb_jeju.dao;

import java.sql.SQLException;
import java.util.List;

import com.planb_jeju.dto.Member;
import com.planb_jeju.dto.RoutePostscript;
import com.planb_jeju.dto.RoutePostscriptLike;
import com.planb_jeju.dto.SitePostscript;
import com.planb_jeju.dto.SitePostscriptLike;

public interface SitePostScriptDao {
	
	/*	
	 * @description : 여행지 후기 전체 수
	 * @return : int 전체 여행지 후기 개수
	 * @param spec : x
	 */
	public int getCount() throws ClassNotFoundException, SQLException;
	
	/*	
	 * @description : 여행지 후기 등록
	 * @return : int 성공 여부 ( > 0 : 성공)
	 * @param spec : SitePostscript 등록할 여행지 후기 정보
	 */
	public int insert(SitePostscript sitePostscript) throws ClassNotFoundException, SQLException;
			
	/*	
	 * @description : 여행지 후기 수정
	 * @return : int 성공 여부 ( > 0 : 성공)
	 * @param spec : SitePostscript 수정할 여행지 후기 정보
	 */
	public int update(SitePostscript sitePostscript) throws ClassNotFoundException, SQLException;
		
	/*	
	 * @description : 여행지 후기 삭제
	 * @return : int 성공 여부 ( > 0 : 성공)
	 * @param spec : int site_postscript_rownum 삭제할 여행지 후기 고유 번호
	 */
	public int delete(int site_postscript_rownum) throws ClassNotFoundException, SQLException;
	
	
	/*	
	 * @description : 여행지 후기 리스트
	 * @return : List<SitePostscript> 여행지 후기 리스트
	 * @param spec : String username 로그인한 회원 아이디 (찜콩 현황때문에 보내줌)
	 */
	public List<SitePostscript> getList(String username) throws ClassNotFoundException, SQLException;
	
	/*	
	 * @description : 여행지 후기 상세보기
	 * @return : SitePostscript 여행지 후기
	 * @param spec : int 상세보기할 여행지 후기 고유 번호
	 */
	public SitePostscript getSitePost(int site_postscript_rownum) throws ClassNotFoundException, SQLException;
	
	/*	
	 * @description : 찜콩하기
	 * @return : int 성공 여부 ( > 0 : 성공)
	 * @param spec : SitePostscriptLike 찜콩할 후기
	 */
	public int insertLike(SitePostscriptLike sitePostscriptLike) throws ClassNotFoundException, SQLException;
	
	/*	
	 * @description : 찜콩 해제
	 * @return : int 성공 여부 ( > 0 : 성공)
	 * @param spec : SitePostscriptLike 해제할 찜콩 후기
	 */
	public int deleteLike(SitePostscriptLike sitePostscriptLike) throws ClassNotFoundException, SQLException;
	
	/*	
	 * @description : 태그 등록
	 * @return : int 업데이트된 라인 수
	 * @param spec : SitePostscript 여행지 후기 정보 중 태그 정보
	 */
	public int insertTag(SitePostscript sitePostscript) throws ClassNotFoundException, SQLException;
	
	/*	
	 * @description : 태그 삭제
	 * @return : int 업데이트된 라인 수
	 * @param spec : int site_postscript_rownum 여행지 후기 고유 번호
	 */
	public int deleteTag(int site_postscript_rownum) throws ClassNotFoundException, SQLException;
	
	/*	
	 * @description : 조회수 증가
	 * @return : int 업데이트된 라인 수
	 * @param spec : int site_postscript_rownum 여행지 후기 고유 번호
	 */
	public int updateHitNum(int site_postscript_rownum) throws ClassNotFoundException, SQLException;
	
	/*	
	 * @description : 좋아요(찜콩수) 증가
	 * @return : int 업데이트된 라인 수
	 * @param spec : int site_postscript_rownum 여행지 후기 고유 번호
	 */
	public int updateLikeNum(int site_postscript_rownum) throws ClassNotFoundException, SQLException;
	
}
