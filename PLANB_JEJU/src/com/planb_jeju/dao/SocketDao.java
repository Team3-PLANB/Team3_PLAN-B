package com.planb_jeju.dao;

import com.planb_jeju.dto.Message;

public interface SocketDao {

    int selectMessageUnreadCount(String username);
    
    Integer updateMessageUnreadCount(Message message);

    boolean isMember(String username);
}
