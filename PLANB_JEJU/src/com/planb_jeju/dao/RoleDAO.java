package com.planb_jeju.dao;

import java.sql.SQLException;
import java.util.List;

import com.planb_jeju.dto.MemberRole;
import com.planb_jeju.dto.Role;

public interface RoleDAO {
	// 권한 INSERT
	public int insertRole(String username) throws ClassNotFoundException, SQLException;
	
	// fb member 권한 가져오기
	public Role getFbRole(String username) throws ClassNotFoundException, SQLException;

	// 일반 member 권한 가져오기
	public List<MemberRole> getMemberRoles (String username);
}
