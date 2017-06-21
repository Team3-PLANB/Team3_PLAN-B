package com.planb_jeju.service;

/*
* @FileName : PostScriptService.java
* @Class : PostScriptService
* @Project : PLANB_JEJU
* @Date : 2017.06.19
* @LastEditDate : 2017.06.21
* @Author : 정다혜
* @Desc : 후기 게시판 서비스
*/

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

/*
* @FileName : PostscriptService.java
* @Class : PostscriptService
* @Project : PLANB_JEJU
* @Date : 2017.06.12
* @LastEditDate : 2017.06.20
* @Author : 정다혜
* @Desc : 루트 후기 게시판 서비스
*/

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.planb_jeju.dao.RoutePostScriptDao;
import com.planb_jeju.dao.SitePostScriptDao;
import com.planb_jeju.dto.RoutePostscript;
import com.planb_jeju.dto.RoutePostscriptLike;
import com.planb_jeju.dto.RoutePostscriptTag;

@Service
public class PostscriptService {
	
	private static RoutePostScriptDao routePostscriptDao;
	
	SitePostScriptDao sitePostscriptDao;
	
	public PostscriptService(){
		
		
	}
	
	/*
	* @date : 2017. 6. 20
	* @description : 루트 후기 게시판 리스트
	* @parameter : 
	* @return : 
	*/
	public List<RoutePostscript> listRoutePostscript(String username, SqlSession sqlsession) throws ClassNotFoundException, SQLException {
		System.out.println("루트 후기게시판 리스트 서비스 들어옴");
		routePostscriptDao = sqlsession.getMapper(RoutePostScriptDao.class);
		System.out.println("username : " + username);
		List<RoutePostscript> routePostscriptList = routePostscriptDao.getList(username);
		
		return routePostscriptList;

	}
	
	/*
	* @date : 2017. 6. 21
	* @description : 루트 후기 게시판 상세보기
	* @parameter : 
	* @return :  
	*/
	public RoutePostscript detailRoutePostscript(int route_postscript_rownum, String username, SqlSession sqlsession) throws ClassNotFoundException, SQLException {
		System.out.println("루트 후기게시판 상세보기 서비스 들어옴");
		routePostscriptDao = sqlsession.getMapper(RoutePostScriptDao.class);
		System.out.println("username : " + username);
		RoutePostscript routePostscript = routePostscriptDao.getRoutePost(route_postscript_rownum, username);
		
		return routePostscript;

	}
	
	/*
	* @date : 2017. 6. 21
	* @description : 루트 후기 찜콩 설정
	* @parameter : 
	* @return :  
	*/
	public void insertLike(RoutePostscriptLike routePostscriptLike, SqlSession sqlsession) throws ClassNotFoundException, SQLException{
		System.out.println("루트 후기 찜콩 설정");
		routePostscriptDao = sqlsession.getMapper(RoutePostScriptDao.class);
		int check = routePostscriptDao.insertLike(routePostscriptLike);
		
		if(check > 0){
			System.out.println("루트 후기 찜콩 설정 완료!");
		}else{
			System.out.println("루트 후기 찜콩 설정 오류남");
		}
	}
	
	/*
	* @date : 2017. 6. 21
	* @description : 루트 후기 찜콩 해제
	* @parameter : 
	* @return :  
	*/
	public void deleteLike(RoutePostscriptLike routePostscriptLike, SqlSession sqlsession) throws ClassNotFoundException, SQLException{
		System.out.println("루트 후기 찜콩 해제");
		routePostscriptDao = sqlsession.getMapper(RoutePostScriptDao.class);
		int check = routePostscriptDao.deleteLike(routePostscriptLike);
		
		if(check > 0){
			System.out.println("루트 후기 찜콩 해제 완료!");
		}else{
			System.out.println("루트 후기 찜콩 해제 오류남");
		}
	}
	
	/*
	* @date : 2017. 6. 21
	* @description : 루트 후기 찜콩(좋아요)수 증가
	* @parameter : 
	* @return :  
	*/
	public void upLikeNum(RoutePostscriptLike routePostscriptLike, SqlSession sqlsession) throws ClassNotFoundException, SQLException{
		System.out.println("루트 후기 찜콩수 증가");
		routePostscriptDao = sqlsession.getMapper(RoutePostScriptDao.class);
		int check = routePostscriptDao.upLikeNum(routePostscriptLike);
		
		if(check > 0){
			System.out.println("루트 후기 찜콩수 증가");
		}else{
			System.out.println("루트 후기 찜콩 찜콩수 증가 오류남");
		}
	}
	
	/*
	* @date : 2017. 6. 21
	* @description : 루트 후기 찜콩(좋아요)수 감소
	* @parameter : 
	* @return :  
	*/
	public void downLikeNum(RoutePostscriptLike routePostscriptLike, SqlSession sqlsession) throws ClassNotFoundException, SQLException{
		System.out.println("루트 후기 찜콩수 감소");
		routePostscriptDao = sqlsession.getMapper(RoutePostScriptDao.class);
		int check = routePostscriptDao.downLikeNum(routePostscriptLike);
		
		if(check > 0){
			System.out.println("루트 후기 좋아요수 감소");
		}else{
			System.out.println("루트 후기 찜콩 좋아요수 감소 오류남");
		}
	}
	
	/*
	* @date : 2017. 6. 21
	* @description : 루트 후기 태그 가져오기
	* @parameter : 
	* @return :  
	*/
	/*public List<RoutePostscriptTag> getRoutePostTagList(RoutePostscript routePostscript, SqlSession sqlsession) throws ClassNotFoundException, SQLException{
		System.out.println("루트 후기 태그 가져오기");
		routePostscriptDao = sqlsession.getMapper(RoutePostScriptDao.class);
		List<RoutePostscriptTag> routePostscriptTagList = routePostscriptDao.getRoutePostTagList(routePostscript);
		System.out.println("routePostscriptTagList : " + routePostscriptTagList);
		return routePostscriptTagList;
	}*/
}
