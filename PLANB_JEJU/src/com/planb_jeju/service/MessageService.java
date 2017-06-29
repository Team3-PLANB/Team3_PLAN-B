package com.planb_jeju.service;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.planb_jeju.dao.MemberDao;
import com.planb_jeju.dao.MessageDao;
import com.planb_jeju.dto.Message;

@Service
public class MessageService {
	
	@Autowired
	private SqlSession sqlsession;
	
	private static MessageDao messageDao;
	
	public List<Message> messageList (String username) throws Exception {
		
		messageDao = sqlsession.getMapper(MessageDao.class);
		
		return (List<Message>)messageDao.getMessageList(username);
	}
	
	public int delete(int message_rownum) throws Exception{
		
		messageDao = sqlsession.getMapper(MessageDao.class);
		
		return messageDao.delete(message_rownum);
	}
	
	
}
