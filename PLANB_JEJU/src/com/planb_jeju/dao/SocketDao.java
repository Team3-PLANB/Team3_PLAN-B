package com.planb_jeju.dao;

public interface SocketDao {

    int selectMessageUnreadCount(String username);

    boolean isMember(String username);
}
