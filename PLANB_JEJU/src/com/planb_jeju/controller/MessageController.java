package com.planb_jeju.controller;
/*
* @FileName : 수정 필
* @Class : LoginJoinController
* @Project : PLANB_JEJU
* @Date : 2017.06.07
* @LastEditDate : 2017.06.16
* @Author : 정다혜, 홍단비 
* @Desc : 회원가입  / 로그인   컨트롤러
*/

import com.planb_jeju.dao.SocketDao;
import com.planb_jeju.dto.Message;
import com.planb_jeju.dto.SessionUser;
import com.planb_jeju.utils.SessionUtil;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/message")
public class MessageController { //로그인 , 메세지카운트 초기셋팅 


    @Autowired
    private SqlSession sqlsession;

	@RequestMapping(value = "/unread/count", method=RequestMethod.GET)
    @ResponseBody
	public int unreadCount(){
        SessionUser user = SessionUtil.getUser();
        if (user == null) throw new RuntimeException("로그인 후에 이용하세요.");

        return sqlsession.getMapper(SocketDao.class).selectMessageUnreadCount(user.getUsername());
    }
	
	@RequestMapping(value = "/unread/count/up", method=RequestMethod.POST)
    @ResponseBody
	public int unreadCountUp(@RequestBody Message message){
		
		sqlsession.getMapper(SocketDao.class).updateMessageUnreadCount(message);
		
		return 1;
    }
	
	

}
	
		

