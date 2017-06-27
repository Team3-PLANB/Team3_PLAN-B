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
public class SocketController {

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
    @SendTo("/topic/all")
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
    @SendTo("/topic/user")
    //@SendToUser("/topic/user")
    public ModelMap broadcastToUser(Message message) {
        return socketService.broadcastToUser(message);
    }
}
