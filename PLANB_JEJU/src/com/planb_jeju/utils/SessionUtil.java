package com.planb_jeju.utils;

import com.planb_jeju.dto.SessionUser;
import org.springframework.security.core.context.SecurityContextHolder;

public class SessionUtil {

    public static SessionUser getUser() {
        SessionUser user = null;

        if(SecurityContextHolder.getContext().getAuthentication() != null) {
            user = (SessionUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        }

        return user;
    }
}
