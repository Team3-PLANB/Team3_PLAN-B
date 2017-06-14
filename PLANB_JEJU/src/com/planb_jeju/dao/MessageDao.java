package com.planb_jeju.dao;

import java.sql.SQLException;
import java.util.List;

import com.planb_jeju.dto.member;

//CRUD
public interface MessageDao {
	
	//전체 수
	public int getCount() throws ClassNotFoundException, SQLException;
	
	//쪽지 추가 (보내기)
	public int insert(member member) throws ClassNotFoundException, SQLException;
	
	//쪽지 상세보기 (메시지 형식)
	public member getMember(String username) throws ClassNotFoundException, SQLException;
		
	//읽음여부 업데이트
	public int update(member member) throws ClassNotFoundException, SQLException;
	
	//쪽지 삭제
	public int delete(String username) throws ClassNotFoundException, SQLException;
	
	
}	