package com.planb_jeju.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RouteDetailService {
	@Autowired
	private SqlSession sqlsession;
}
