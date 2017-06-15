package com.planb_jeju.dao;

import java.sql.SQLException;
import java.util.List;

import com.planb_jeju.dto.Member;

//CRUD
public interface MemberDao {
	
	//전체 수
	public int getCount() throws ClassNotFoundException, SQLException;
	
	//게시물 입력
	public int insert(Member member) throws ClassNotFoundException, SQLException;
	
	//게시물 상세
	public Member getMember(String username) throws ClassNotFoundException, SQLException;
		
	//게시물 수정
	public int update(Member member) throws ClassNotFoundException, SQLException;
	
	//게시물 삭제
	public int delete(String username) throws ClassNotFoundException, SQLException;
	
	
}	