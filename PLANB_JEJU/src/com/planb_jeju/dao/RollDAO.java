package com.planb_jeju.dao;

import java.sql.SQLException;

public interface RollDAO {
	public int insertRoll(String username) throws ClassNotFoundException, SQLException;
}
