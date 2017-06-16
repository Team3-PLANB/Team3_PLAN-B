package com.planb_jeju.dao;

import java.sql.SQLException;

import com.planb_jeju.dto.Member;
import com.planb_jeju.dto.SitePostscript;

public interface SitePostScriptDao {
	
	/*	
	 * @description : 전체 수
	 * @return : int
	 * @param spec : x
	 */
	public int getCount() throws ClassNotFoundException, SQLException;
	
	//게시물 입력
	public int insert(Member member) throws ClassNotFoundException, SQLException;
	
	//게시물 상세
	public Member getSitePost(int route_code, String username) throws ClassNotFoundException, SQLException;
		
	//게시물 수정
	public int update(SitePostscript sitepost) throws ClassNotFoundException, SQLException;
	
	//게시물 삭제
	public int delete(int route_code, String username) throws ClassNotFoundException, SQLException;

}