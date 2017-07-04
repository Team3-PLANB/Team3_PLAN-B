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
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.planb_jeju.dao.RoutePostScriptDao;
import com.planb_jeju.dao.SitePostScriptDao;
import com.planb_jeju.dto.RoutePostscript;
import com.planb_jeju.dto.RoutePostscriptLike;
import com.planb_jeju.dto.RoutePostscriptTag;

@Service
public class RoutePostscriptService {
	
	private static RoutePostScriptDao routePostscriptDao;
	
	@Autowired
	SqlSession sqlsession; 
	
	
	public RoutePostscriptService(){
		
		
	}
	
	/*
	* @date : 2017. 6. 20
	* @description : 루트 후기 리스트
	* @parameter : 
	* @return : 
	*/
	public List<RoutePostscript> listRoutePostscript(String username, String searchWord) throws ClassNotFoundException, SQLException {
		routePostscriptDao = sqlsession.getMapper(RoutePostScriptDao.class);
		List<RoutePostscript> routePostscriptList = routePostscriptDao.getList(username, searchWord);
		
		return routePostscriptList;
	}
	
	/*
	* @date : 2017. 6. 23
	* @description : 내 루트 후기 리스트
	* @parameter : 
	* @return : 
	*/
	public List<RoutePostscript> listMyRoutePostscript(String username, String searchWord) throws ClassNotFoundException, SQLException {
		routePostscriptDao = sqlsession.getMapper(RoutePostScriptDao.class);
		List<RoutePostscript> routePostscriptList = routePostscriptDao.getMyList(username, searchWord);
		
		return routePostscriptList;
	}
	
	/*
	* @date : 2017.06.30
	* @description : 찜한 루트 후기 리스트
	* @parameter : 
	* @return : 
	*/
	public List<RoutePostscript> listLikeRoutePost(String username, String searchWord) throws ClassNotFoundException, SQLException {
		routePostscriptDao = sqlsession.getMapper(RoutePostScriptDao.class);
		List<RoutePostscript> routePostscriptList = routePostscriptDao.getLikeList(username, searchWord);
		
		return routePostscriptList;
	}
	
	
	/*
	* @date : 2017. 6. 21
	* @description : 루트 후기 게시판 상세보기
	* @parameter : 
	* @return :  
	*/
	public RoutePostscript detailRoutePostscript(int route_postscript_rownum, String username) throws ClassNotFoundException, SQLException {
		routePostscriptDao = sqlsession.getMapper(RoutePostScriptDao.class);
		RoutePostscript routePostscript = routePostscriptDao.getRoutePost(route_postscript_rownum, username);
		
		return routePostscript;

	}
	
	/*
	* @date : 2017. 6. 21
	* @description : 루트 후기 찜콩 설정
	* @parameter : 
	* @return :  
	*/
	public void insertLike(RoutePostscriptLike routePostscriptLike) throws ClassNotFoundException, SQLException{
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
	public void deleteLike(RoutePostscriptLike routePostscriptLike) throws ClassNotFoundException, SQLException{
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
	public void upLikeNum(RoutePostscriptLike routePostscriptLike) throws ClassNotFoundException, SQLException{
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
	public void downLikeNum(RoutePostscriptLike routePostscriptLike) throws ClassNotFoundException, SQLException{
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
	* @date : 2017. 6. 22
	* @description : 루트 후기  작성
	* @parameter : 
	* @return :  
	*/
	public RoutePostscript writeRoutePostscript(RoutePostscript routePostscript) throws ClassNotFoundException, SQLException{
		System.out.println("루트 후기 작성");
		routePostscriptDao = sqlsession.getMapper(RoutePostScriptDao.class);
		RoutePostscript routePostscript2 = null;
		int check = routePostscriptDao.insert(routePostscript);
		
		if(check>0){
			System.out.println("루트 후기 작성 성공");
		}else{
			System.out.println("루트 후기 작성 실패");
		}
		
		routePostscript2 = routePostscriptDao.getLastRoutePost();
		System.out.println("방금 쓴 후기 : " + routePostscript2);
		
		return routePostscript2;
	}
	
	/*
	* @date : 2017. 6. 21
	* @description : 루트 후기 태그 가져오기
	* @parameter : 
	* @return :  
	*/
	public List<RoutePostscriptTag> getRoutePostTagList(int route_postscript_rownum) throws ClassNotFoundException, SQLException{
		System.out.println("루트 후기 태그 가져오기");
		routePostscriptDao = sqlsession.getMapper(RoutePostScriptDao.class);
		List<RoutePostscriptTag> routePostscriptTagList = routePostscriptDao.getRoutePostTagList(route_postscript_rownum);
		System.out.println("routePostscriptTagList : " + routePostscriptTagList);
		return routePostscriptTagList;
	}
	
	/*
	* @date : 2017. 6. 22
	* @description : 루트 후기  태그 만들기
	* @parameter : 
	* @return :  
	*/
	public void insertRoutePostTag(RoutePostscript routePostscript) throws ClassNotFoundException, SQLException{
		System.out.println("루트 후기 태그 만들기");
		routePostscriptDao = sqlsession.getMapper(RoutePostScriptDao.class);
		
		String comment = routePostscript.getComment();
		System.out.println("comment : " + comment);
		
		RoutePostscriptTag routePostscriptTag = new RoutePostscriptTag();
		routePostscriptTag.setRoute_postscript_rownum(routePostscript.getRoute_postscript_rownum());
		
		// 해시 태그 추출
		Pattern p = Pattern.compile("\\#([0-9a-zA-Z가-힣]*)");
		Matcher m = p.matcher(comment);
		String extracHashTag = null;
		
		while(m.find()){
			extracHashTag = StringUtils.replace(m.group(), "-_+=!@#$%^&*()[]{}|\\;:'\"<>,.?/~) ", "");
			
			if(extracHashTag != null){
				System.out.println("추출 해시태그 : " + extracHashTag);
				routePostscriptTag.setTag(extracHashTag.substring(1));
				System.out.println("routePostscriptTag : " + routePostscriptTag);
				routePostscriptDao.insertTag(routePostscriptTag);
			}
		}
	}
	
	
	/*
	* @date : 2017. 6. 24
	* @description : 루트 후기 태그 검색
	* @parameter : 
	* @return :  
	*/
	/*public List<RoutePostscript> getRoutePostListByTag(String searchWord) throws ClassNotFoundException, SQLException{
		System.out.println("루트 후기 태그로 찾기");
		routePostscriptDao = sqlsession.getMapper(RoutePostScriptDao.class);
		List<RoutePostscript> routePostscriptList = routePostscriptDao.getRoutePostListByTag(searchWord);
		System.out.println("routePostscriptList : " + routePostscriptList);
		return routePostscriptList;
	}*/
	
	/*
	* @date : 2017. 6. 24
	* @description : 검색된 루트 후기 개수
	* @parameter : 
	* @return :  
	*/
	/*public int getCountRoutePostByTag(String searchWord) throws ClassNotFoundException, SQLException{
		System.out.println("검색된 루트 후기 개수");
		routePostscriptDao = sqlsession.getMapper(RoutePostScriptDao.class);
		int countSearchedPost = routePostscriptDao.getCountRoutePostByTag(searchWord);
		System.out.println("검색된 루트 후기 개수 : " + countSearchedPost);
		return countSearchedPost;
	}*/
	
}
