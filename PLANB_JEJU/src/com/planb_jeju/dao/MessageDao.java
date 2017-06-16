package com.planb_jeju.dao;

import java.sql.SQLException;
import java.util.List;

import com.planb_jeju.dto.Message;

//CRUD
public interface MessageDao {
	
	/*	
	 * @description : 한사람과 받은 쪽지 수
	 * @return : int
	 * @param spec : x
	 */
	public int getCount(String username) throws ClassNotFoundException, SQLException;
	
	//쪽지 방 개수 (유저당)
	public int getRoomCount(String username) throws ClassNotFoundException, SQLException;
	
	//메시지 가져오기 (삭제여부)
	public Message getReadStatus(int message_rownum) throws ClassNotFoundException, SQLException;
	
	//쪽지 추가 (보내기)
	public int insert(Message message) throws ClassNotFoundException, SQLException;
	
	//쪽지 상세보기 (메시지 형식)
	public List<Message> getMember(String username) throws ClassNotFoundException, SQLException;
		
	//쪽지 정보 업데이트 (읽음확인/삭제여부)
	public int update(Message message) throws ClassNotFoundException, SQLException;
	
	//쪽지 삭제
	public int delete(int message_rownum) throws ClassNotFoundException, SQLException;
	
}	