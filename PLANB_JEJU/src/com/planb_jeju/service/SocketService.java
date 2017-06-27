package com.planb_jeju.service;

import com.planb_jeju.dao.MessageDao;
import com.planb_jeju.dao.SocketDao;
import com.planb_jeju.dto.Message;
import com.planb_jeju.dto.SessionUser;
import com.planb_jeju.utils.DateUtil;
import com.planb_jeju.utils.SessionUtil;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import java.time.LocalDateTime;

@Service
public class SocketService {

    private Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    SqlSession sqlSession;

    @Transactional
    public ModelMap broadcastToAll(Message message) {

        logger.info("> 소켓 메세지를 전체한테 보낼 준비중입니다...");
        logger.info("> message param = "+message);

        // 검증
        if (message.getSender() == null) throw new RuntimeException("로그인 후 사용하세요.");
        if (message.getComment() == null) throw new RuntimeException("내용을 입력하세요.");

        ModelMap response = new ModelMap();
        response.addAttribute("sender", message.getSender());
        response.addAttribute("comment", message.getComment());

        return response;
    }

    @Transactional
    public ModelMap broadcastToUser(Message message) {

        logger.info("> 소켓 메세지를 전체한테 보낼 준비중입니다...");
        logger.info("> message param = "+message);

        // 검증
        if (message.getSender() == null) throw new RuntimeException("로그인 후 사용하세요.");
        if (message.getReceiver() == null) throw new RuntimeException("받는 회원을 입력하세요.");
        if (message.getComment() == null) throw new RuntimeException("내용을 입력하세요.");

        // 쪽지 입력
        logger.info("> 보낼 메세지 데이터를 저장합니다...");
        MessageDao messageDao = sqlSession.getMapper(MessageDao.class);
        messageDao.insert(message);

        logger.info("> 일주일 동안 안읽은 메세지수를 조회합니다...");
        SocketDao socketDao = sqlSession.getMapper(SocketDao.class);
        int unreadCount = socketDao.selectMessageUnreadCount(message.getReceiver());

        logger.info("> 일주일 동안 안읽은 메세지수 = "+unreadCount);

        ModelMap response = new ModelMap();
        response.addAttribute("sender", message.getSender());
        response.addAttribute("receiver", message.getReceiver());
        response.addAttribute("comment", message.getComment());
        response.addAttribute("sendtime", DateUtil.getNow());
        response.addAttribute("unread_count", unreadCount);

        logger.info("> 받는 회원에게 메세지 내용을 보냅니다...");
        logger.info("> body : "+response.toString());

        return response;
    }


}
