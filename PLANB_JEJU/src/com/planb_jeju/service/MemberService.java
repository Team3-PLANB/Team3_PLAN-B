package com.planb_jeju.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class MemberService {
	@Autowired
	private SqlSession sqlsession;
}
