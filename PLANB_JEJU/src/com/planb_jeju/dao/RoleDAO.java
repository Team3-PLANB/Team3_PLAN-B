package com.planb_jeju.dao;

import java.sql.SQLException;
import java.util.List;

import com.planb_jeju.dto.MemberRole;
import com.planb_jeju.dto.Role;

public interface RoleDAO {
	public int insertRole(String username) throws ClassNotFoundException, SQLException;
	
	public Role getFbRole(String username) throws ClassNotFoundException, SQLException;

	public List<MemberRole> getMemberRoles (String username);
}
