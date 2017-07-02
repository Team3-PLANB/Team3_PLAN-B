package com.planb_jeju.service;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.planb_jeju.dao.MemberDao;
import com.planb_jeju.dao.MessageDao;
import com.planb_jeju.dto.Message;
import com.planb_jeju.dto.SessionUser;
import com.planb_jeju.utils.SessionUtil;

@Service
public class MessageService {
	
	@Autowired
	private SqlSession sqlsession;
	
	private static MessageDao messageDao;
	
	public Model messageList (Model model, String cpStr, String psStr, String category) throws Exception {
		
		// 로그인한 자신의 세션정보
		SessionUser user = SessionUtil.getUser();
		
		// get mapper
		messageDao = sqlsession.getMapper(MessageDao.class);
		
		// 조회 총카운트
		int totalMessageCount = messageDao.totalMessageCount(user.getUsername(), category);
		
		/* 페이징 로직시작 */
		int pageGroupSize = 5;

		if (psStr == null || psStr.trim().equals("")) {
			psStr = "5";
		}

		if (cpStr == null || cpStr.trim().equals("")) {
			cpStr = "1";
		}

		int pagesize = Integer.parseInt(psStr);
		int cpage = Integer.parseInt(cpStr);
		int pagecount = 0;
		int number = 0;

		if (totalMessageCount % pagesize == 0) {
			pagecount = totalMessageCount / pagesize;
		} else {
			pagecount = (totalMessageCount / pagesize) + 1;
		}

		number = totalMessageCount - (cpage - 1) * pagesize;

		// 페이지 그룹수 갯수
		int pageGroupCount = totalMessageCount / (pagesize * pageGroupSize)
				+ (totalMessageCount % (pagesize * pageGroupSize) == 0 ? 0 : 1);

		// 페이지 그룹 번호
		int numPageGroup = (int) Math.ceil((double) cpage / pageGroupSize);
		
		// 페이지 안에 시작과 끝 로우
		int start = cpage * pagesize - (pagesize); 
		int end = cpage * pagesize;
		
		/* 로직 끝 */
		
		// 상세 리스트 조회 
		List<Message> messages = (List<Message>)messageDao.getMessageList(user.getUsername(), start, pagesize, category);

		model.addAttribute("cpage", cpage);
		model.addAttribute("pagesize", pagesize);
		model.addAttribute("pagecount", pagecount);
		model.addAttribute("messageList", messages);
		model.addAttribute("totalMessageCount", totalMessageCount);
		model.addAttribute("category", category);
		model.addAttribute("pageGroupCount", pageGroupCount);
		model.addAttribute("numPageGroup", numPageGroup);
		model.addAttribute("pageGroupSize", pageGroupSize);
		model.addAttribute("backpage", (messages.size()==0 && cpage > 1) ? cpage - 1 : 0);
		model.addAttribute("category",category);
		
		return model;	
	}
	
	public int delete(int message_rownum) throws Exception{
		messageDao = sqlsession.getMapper(MessageDao.class);
		return messageDao.delete(message_rownum);
	}
	
	
	
	
	
}
