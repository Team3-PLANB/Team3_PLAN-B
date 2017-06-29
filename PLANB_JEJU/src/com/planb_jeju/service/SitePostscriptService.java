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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.planb_jeju.dao.RoutePostScriptDao;
import com.planb_jeju.dao.SitePostScriptDao;
import com.planb_jeju.dto.RoutePostscript;
import com.planb_jeju.dto.RoutePostscriptLike;
import com.planb_jeju.dto.RoutePostscriptTag;
import com.planb_jeju.dto.SitePostscript;
import com.planb_jeju.dto.SitePostscriptLike;
import com.planb_jeju.dto.SitePostscriptPhoto;
import com.planb_jeju.dto.SitePostscriptTag;

@Service
public class SitePostscriptService {
	
	@Autowired
	private SitePostScriptDao sitePostscriptDao;
	
	@Autowired
	private SqlSession sqlsession;
	
	
	public SitePostscriptService(){	}
	
	/*
	* @date : 2017. 6. 22
	* @description : 여행지 후기 게시판 리스트
	* @parameter : 
	* @return : 
	*/
	public List<SitePostscript> listSitePostscript(String username) throws ClassNotFoundException, SQLException {
		System.out.println("여행지 후기게시판 리스트 서비스 들어옴");
		sitePostscriptDao = sqlsession.getMapper(SitePostScriptDao.class);
		System.out.println("username : " + username);
		List<SitePostscript> sitePostscriptList = sitePostscriptDao.getList(username);
		
		return sitePostscriptList;

	}
	
	/*
	* @date : 2017. 6. 21
	* @description : 여행지 후기 찜콩 설정
	* @parameter : 
	* @return : 
	*/
	public void insertLike(SitePostscriptLike sitePostscriptLike) throws ClassNotFoundException, SQLException{
		System.out.println("여행지 후기 찜콩 설정");
		sitePostscriptDao = sqlsession.getMapper(SitePostScriptDao.class);
		int check = sitePostscriptDao.insertLike(sitePostscriptLike);
		
		if(check > 0){
			System.out.println("여행지 후기 찜콩 설정 완료!");
		}else{
			System.out.println("여행지 후기 찜콩 설정 오류남");
		}
	}
	
	/*
	* @date : 2017. 6. 21
	* @description : 여행지 후기 찜콩 해제
	* @parameter : 
	* @return :  
	*/
	public void deleteLike(SitePostscriptLike sitePostscriptLike) throws ClassNotFoundException, SQLException{
		System.out.println("여행지 후기 찜콩 해제");
		sitePostscriptDao = sqlsession.getMapper(SitePostScriptDao.class);
		int check = sitePostscriptDao.deleteLike(sitePostscriptLike);
		
		if(check > 0){
			System.out.println("여행지 후기 찜콩 해제 완료!");
		}else{
			System.out.println("여행지 후기 찜콩 해제 오류남");
		}
	}
	
	/*
	* @date : 2017. 6. 21
	* @description : 여행지 후기 찜콩(좋아요)수 증가
	* @parameter : 
	* @return :  
	*/
	public void upLikeNum(SitePostscriptLike sitePostscriptLike) throws ClassNotFoundException, SQLException{
		System.out.println("여행지 후기 찜콩수 증가");
		sitePostscriptDao = sqlsession.getMapper(SitePostScriptDao.class);
		int check = sitePostscriptDao.upLikeNum(sitePostscriptLike);
		
		if(check > 0){
			System.out.println("여행지 후기 찜콩수 증가");
		}else{
			System.out.println("여행지 후기 찜콩 찜콩수 증가 오류남");
		}
	}
	
	/*
	* @date : 2017. 6. 21
	* @description : 여행지 후기 찜콩(좋아요)수 감소
	* @parameter : 
	* @return :  
	*/
	public void downLikeNum(SitePostscriptLike sitePostscriptLike) throws ClassNotFoundException, SQLException{
		System.out.println("여행지 후기 찜콩수 감소");
		sitePostscriptDao = sqlsession.getMapper(SitePostScriptDao.class);
		int check = sitePostscriptDao.downLikeNum(sitePostscriptLike);
		
		if(check > 0){
			System.out.println("여행지 후기 좋아요수 감소");
		}else{
			System.out.println("여행지 후기 찜콩 좋아요수 감소 오류남");
		}
	}
	
	/*
	* @date : 2017. 6. 21
	* @description : 여행지 후기 게시판 상세보기
	* @parameter : 
	* @return :
	*/	
	public SitePostscript detailSitePostscript(int site_postscript_rownum, String username) throws ClassNotFoundException, SQLException {
		System.out.println("여행지 후기게시판 상세보기 서비스 들어옴");
		sitePostscriptDao = sqlsession.getMapper(SitePostScriptDao.class);
		System.out.println("username : " + username);
		SitePostscript sitePostscript = sitePostscriptDao.getSitePost(site_postscript_rownum, username);
		
		return sitePostscript;

	}
	
	/*
	* @date : 2017. 6. 22
	* @description : 여행지 후기 태그 가져오기
	* @parameter : 
	* @return :  
	*/
	public List<SitePostscriptTag> getSitePostTagList(SitePostscript sitePostscript) throws ClassNotFoundException, SQLException{
		System.out.println("여행지 후기 태그 가져오기");
		sitePostscriptDao = sqlsession.getMapper(SitePostScriptDao.class);
		List<SitePostscriptTag> sitePostscriptTagList = sitePostscriptDao.getSitePostTagList(sitePostscript);
		System.out.println("sitePostscriptTagList : " + sitePostscriptTagList);
		return sitePostscriptTagList;
	}
	
	/*
	* @date : 2017. 6. 28
	* @description : 여행지 후기 등록
	* @parameter : 
	* @return :  
	*/
	public SitePostscript writeSitePostscript(SitePostscript sitePostscript) throws ClassNotFoundException, SQLException{
		System.out.println("여행지 후기 작성 서비스");
		sitePostscriptDao = sqlsession.getMapper(SitePostScriptDao.class);
		SitePostscript sitePostscript2 = null;
		int check = sitePostscriptDao.insert(sitePostscript);
		
		if(check > 0){
			System.out.println("여행지 후기 작성 완료");
			
			// 방금 작성한 여행지 후기 가져오기
			/*sitePostscript2 = sitePostscriptDao.getLastRoutePost();*/
			System.out.println("방금 쓴 후기 : " + sitePostscript2);
		}else{
			System.out.println("여행지 후기 작성 오류남");
		}
		return sitePostscript2;
	}
	
	/*
	* @date : 2017. 6. 28
	* @description : 여행지 후기 태그 등록
	* @parameter : 
	* @return :  
	*/
	public List<SitePostscriptTag> insertSitePostTag(SitePostscript sitePostscript) throws ClassNotFoundException, SQLException{
		return null;
	}
	
	/*
	* @date : 2017. 6. 28
	* @description : 여행지 후기 사진 등록
	* @parameter : 
	* @return :  
	*/
	public List<SitePostscriptPhoto> insertSitePostPhoto(SitePostscriptPhoto sitePostscriptPhoto) throws ClassNotFoundException, SQLException{
		sitePostscriptDao = sqlsession.getMapper(SitePostScriptDao.class);
		
		
		
		return null;
	}
	
	
}
