package com.planb_jeju.service;

import com.planb_jeju.dao.RoleDAO;
import com.planb_jeju.dto.MemberRole;
import com.planb_jeju.dto.SessionUser;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.ArrayList;
import java.util.List;

public class SecurityUserDetailsService implements UserDetailsService {

    @Autowired
    SqlSession sqlSession;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        SessionUser user = null;

        // 유저정보
        RoleDAO roleDAO = sqlSession.getMapper(RoleDAO.class);
        List<MemberRole> memberRoles = roleDAO.getMemberRoles(username);

        if(memberRoles.size() > 0) {

            // 권한정보
            List<GrantedAuthority> authorities = getAuthorization(memberRoles);

            MemberRole member = memberRoles.get(0);

            // add
            String nickname = member.getNickname();

            // default
            String password = member.getPassword();
            boolean enabled = true;
            boolean accountNonExpired = true;
            boolean credentialsNonExpired = true;
            boolean accountNonLocked = true;

            user = new SessionUser(username, password, enabled, accountNonExpired, credentialsNonExpired,
                    accountNonLocked, authorities, nickname);
        }

        return user;
    }

    /**
     * 권한부여
     * @param memberRoles
     * @return List<GrantedAuthority> casting
     */
    private List<GrantedAuthority> getAuthorization(List<MemberRole> memberRoles) {
        List<GrantedAuthority> aurhorities = new ArrayList<GrantedAuthority>();

        for (MemberRole memberRole : memberRoles) {
            aurhorities.add(new SimpleGrantedAuthority(memberRole.getRoleCode()));
        }

        return aurhorities;
    }
}
