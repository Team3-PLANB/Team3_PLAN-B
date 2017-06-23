package com.planb_jeju.service;

/*
* @FileName : PostScriptService.java
* @Class : PostScriptService
* @Project : PLANB_JEJU
* @Date : 2017.06.19
* @LastEditDate : 2017.06.22
* @Author : 정다혜
* @Desc : 후기 게시판 서비스
*/

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.planb_jeju.dao.RoutePostScriptDao;
import com.planb_jeju.dao.SitePostScriptDao;
import com.planb_jeju.dto.RoutePostscript;
import com.planb_jeju.dto.RoutePostscriptLike;
import com.planb_jeju.dto.RoutePostscriptTag;
import com.planb_jeju.dto.SitePostscript;
import com.planb_jeju.dto.SitePostscriptLike;
import com.planb_jeju.dto.SitePostscriptTag;

@Service
public class SitePostscriptService {
	
	private static SitePostScriptDao sitePostscriptDao;
	
	
	public SitePostscriptService(){	}
	
	/*
	* @date : 2017. 6. 22
	* @description : 사이트 후기 게시판 리스트
	* @parameter : 
	* @return : 
	*/
	public List<SitePostscript> listSitePostscript(String username, SqlSession sqlsession) throws ClassNotFoundException, SQLException {
		System.out.println("사이트 후기게시판 리스트 서비스 들어옴");
		sitePostscriptDao = sqlsession.getMapper(SitePostScriptDao.class);
		System.out.println("username : " + username);
		List<SitePostscript> sitePostscriptList = sitePostscriptDao.getList(username);
		
		return sitePostscriptList;

	}
	
	/*
	* @date : 2017. 6. 21
	* @description : 루트 후기 찜콩 설정
	* @parameter : 
	* @return : 
	*/
	public void insertLike(SitePostscriptLike sitePostscriptLike, SqlSession sqlsession) throws ClassNotFoundException, SQLException{
		System.out.println("사이트 후기 찜콩 설정");
		sitePostscriptDao = sqlsession.getMapper(SitePostScriptDao.class);
		int check = sitePostscriptDao.insertLike(sitePostscriptLike);
		
		if(check > 0){
			System.out.println("사이트 후기 찜콩 설정 완료!");
		}else{
			System.out.println("사이트 후기 찜콩 설정 오류남");
		}
	}
	
	/*
	* @date : 2017. 6. 21
	* @description : 루트 후기 찜콩 해제
	* @parameter : 
	* @return :  
	*/
	public void deleteLike(SitePostscriptLike sitePostscriptLike, SqlSession sqlsession) throws ClassNotFoundException, SQLException{
		System.out.println("사이트 후기 찜콩 해제");
		sitePostscriptDao = sqlsession.getMapper(SitePostScriptDao.class);
		int check = sitePostscriptDao.deleteLike(sitePostscriptLike);
		
		if(check > 0){
			System.out.println("사이트 후기 찜콩 해제 완료!");
		}else{
			System.out.println("사이트 후기 찜콩 해제 오류남");
		}
	}
	
	/*
	* @date : 2017. 6. 21
	* @description : 루트 후기 찜콩(좋아요)수 증가
	* @parameter : 
	* @return :  
	*/
	public void upLikeNum(SitePostscriptLike sitePostscriptLike, SqlSession sqlsession) throws ClassNotFoundException, SQLException{
		System.out.println("사이트 후기 찜콩수 증가");
		sitePostscriptDao = sqlsession.getMapper(SitePostScriptDao.class);
		int check = sitePostscriptDao.upLikeNum(sitePostscriptLike);
		
		if(check > 0){
			System.out.println("사이트 후기 찜콩수 증가");
		}else{
			System.out.println("사이트 후기 찜콩 찜콩수 증가 오류남");
		}
	}
	
	/*
	* @date : 2017. 6. 21
	* @description : 루트 후기 찜콩(좋아요)수 감소
	* @parameter : 
	* @return :  
	*/
	public void downLikeNum(SitePostscriptLike sitePostscriptLike, SqlSession sqlsession) throws ClassNotFoundException, SQLException{
		System.out.println("사이트 후기 찜콩수 감소");
		sitePostscriptDao = sqlsession.getMapper(SitePostScriptDao.class);
		int check = sitePostscriptDao.downLikeNum(sitePostscriptLike);
		
		if(check > 0){
			System.out.println("사이트 후기 좋아요수 감소");
		}else{
			System.out.println("사이트 후기 찜콩 좋아요수 감소 오류남");
		}
	}
	
	/*
	* @date : 2017. 6. 21
	* @description : 루트 후기 게시판 상세보기
	* @parameter : 
	* @return :
	* */	
	public SitePostscript detailSitePostscript(int site_postscript_rownum, String username, SqlSession sqlsession) throws ClassNotFoundException, SQLException {
		System.out.println("사이트 후기게시판 상세보기 서비스 들어옴");
		sitePostscriptDao = sqlsession.getMapper(SitePostScriptDao.class);
		System.out.println("username : " + username);
		SitePostscript sitePostscript = sitePostscriptDao.getSitePost(site_postscript_rownum, username);
		
		return sitePostscript;

	}
	
	/*
	* @date : 2017. 6. 22
	* @description : 사이트 후기 태그 가져오기
	* @parameter : 
	* @return :  
	*/
	public List<SitePostscriptTag> getSitePostTagList(SitePostscript sitePostscript, SqlSession sqlsession) throws ClassNotFoundException, SQLException{
		System.out.println("루트 후기 태그 가져오기");
		sitePostscriptDao = sqlsession.getMapper(SitePostScriptDao.class);
		List<SitePostscriptTag> sitePostscriptTagList = sitePostscriptDao.getSitePostTagList(sitePostscript);
		System.out.println("sitePostscriptTagList : " + sitePostscriptTagList);
		return sitePostscriptTagList;
	}
}
