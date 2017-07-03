package com.planb_jeju.controller;

import com.planb_jeju.dto.Message;
import com.planb_jeju.service.SocketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.annotation.SendToUser;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;

@RestController 
public class SocketController { //socket에 접속 되어 있는 모든 클라이언트에게 전송하는 타입

    private SocketService socketService;

    @Autowired
    public SocketController(SocketService socketService) {
        this.socketService = socketService;
    }

    /**
     * (소켓) 전체 메세지 전송
     * @param message
     * @return Message
     * @throws Exception
     */
    @MessageMapping("/sendTo") 
    @SendTo("/topic/all") //받아서 다시 보내주는 설정
    public ModelMap broadcastToAll(Message message) {
        return socketService.broadcastToAll(message);
    }

    /**
     * (소켓) 개인 메세지 전송
     * @param message
     * @return Message
     * @throws Exception
     */
    @MessageMapping("/sendToUser")
    @SendTo("/topic/user") //받아서 다시 보내주는 설정 , 보낸사람에 대한 받는 리턴 주소
    //@SendToUser("/topic/user")
    public ModelMap broadcastToUser(Message message) {
        return socketService.broadcastToUser(message);
    }
}
