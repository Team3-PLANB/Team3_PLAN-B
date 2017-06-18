package com.planb_jeju.dao;

import java.sql.SQLException;
import java.util.List;

import com.planb_jeju.dto.Message;

//CRUD
public interface MessageDao {
	
	/*	
	 * @description : 한사람과 받은 쪽지 수
	 * @return : int
	 * @param spec : String username 사용자 아이디
	 */
	public int getCount(String username) throws ClassNotFoundException, SQLException;
	
	/*	
	 * @description : 쪽지 방 개수 (유저당)
	 * @return : int
	 * @param spec : String username 사용자 아이디
	 */
	public int getRoomCount(String username) throws ClassNotFoundException, SQLException;
	
	/*	
	 * @description : 메시지 가져오기 (삭제여부)
	 * @return : Message
	 * @param spec : int message_rownum 메시지 고유번호
	 */
	public Message getReadStatus(int message_rownum) throws ClassNotFoundException, SQLException;
	
	/*	
	 * @description : 쪽지 추가 (보내기)
	 * @return : int
	 * @param spec : Message message 메시지 DTO
	 */
	public int insert(Message message) throws ClassNotFoundException, SQLException;
	
	/*	
	 * @description : 쪽지 상세보기 (메시지 형식)
	 * @return : List<Message>
	 * @param spec : String username 사용자 아이디
	 */
	public List<Message> getMember(String username) throws ClassNotFoundException, SQLException;
	
	/*	
	 * @description : 쪽지 정보 업데이트 (읽음확인/삭제여부)
	 * @return : int
	 * @param spec : Message message 메시지 DTO
	 */
	public int update(Message message) throws ClassNotFoundException, SQLException;
	
	/*	
	 * @description : 쪽지 삭제
	 * @return : int
	 * @param spec : int message_rownum 메시지 고유번호
	 */
	public int delete(int message_rownum) throws ClassNotFoundException, SQLException;
	
}	