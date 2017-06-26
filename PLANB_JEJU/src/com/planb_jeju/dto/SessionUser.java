package com.planb_jeju.dto;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;

public class SessionUser extends User {

    private String nickname;

    public SessionUser(String username, String password, boolean enabled,
                       boolean accountNonExpired, boolean credentialsNonExpired,
                       boolean accountNonLocked,
                       Collection<? extends GrantedAuthority> authorities,
                       String nickname) {
        super(username, password, enabled, accountNonExpired, credentialsNonExpired,
                accountNonLocked, authorities);

        this.nickname = nickname;
    }

    public String getNickname() {
        return nickname;
    }
}
