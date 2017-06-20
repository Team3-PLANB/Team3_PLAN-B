package com.planb_jeju.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.ParserConfigurationException;

/*
* @FileName : PlanAController.java
* @Class : PlanAController
* @Project : PLANB_JEJU
* @Date : 2017.06.12
* @LastEditDate : 2017.06.16
* @Author : 강나영 
* @Desc : 일정 만들기 / 제주도 API 정보   컨트롤러
*/

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xml.sax.SAXException;

import com.planb_jeju.dao.RoutePostScriptDao;
import com.planb_jeju.dao.SitePostScriptDao;
import com.planb_jeju.dto.RoutePostscript;

@Service
public class PostscriptService {

	@Autowired
	private SqlSession sqlsession;
	
	RoutePostScriptDao routePostscriptDao;
	SitePostScriptDao sitePostscriptDao;
	
	/*public PostscriptService(){
		RoutePostscriptDao routePostscriptDao = sqlsession.getMapper(RoutePostscriptDao.class);
		SitePostscriptDao sitePostscriptDao = sqlsession.getMapper(SitePostscriptDao.class);
	}*/
	
	public int insertRoute(RoutePostscript routePostscript) throws ClassNotFoundException, SQLException {
		
		routePostscriptDao = sqlsession.getMapper(RoutePostScriptDao.class);
		/*int result = routePostscriptDao.insert(route);*/
		
		// 고쳐야 함

		return 0;

	}
}
