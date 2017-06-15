package com.planb_jeju.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.planb_jeju.dto.Message;

//CRUD
public interface MessageDao {
	
	//한 사람과 주고받은 쪽지 수
	public int getCount(int first_message_rownum) throws ClassNotFoundException, SQLException;
	
	//쪽지 방 개수 (유저당)
	public int getRoomCount(String username) throws ClassNotFoundException, SQLException;
	
	//쪽지 정보 가져오기 (삭제여부)
	public Message getMessage(int message_rownum) throws ClassNotFoundException, SQLException;
	
	//쪽지 추가 (보내기)
	public int insert(Message message) throws ClassNotFoundException, SQLException;
	
	//쪽지 방 상세보기 (메시지 형식)
	public List<Message> getMessageList(Map<String, Object> messageMap) throws ClassNotFoundException, SQLException;
		
	//쪽지 정보 업데이트 (읽음확인)
	public int updateReadStatus(Message message) throws ClassNotFoundException, SQLException;
	
	//쪽지 정보 업데이트 (삭제여부)
	public int updateDeleteOrNot(Message message) throws ClassNotFoundException, SQLException;
			
	//쪽지 삭제
	public int delete(int message_rownum) throws ClassNotFoundException, SQLException;
	
}	