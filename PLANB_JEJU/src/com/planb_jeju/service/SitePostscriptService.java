package com.planb_jeju.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;

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
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	* @description : 여행지 후기 리스트
	* @parameter : 
	* @return : 
	*/
	public List<SitePostscript> listSitePostscript(String username, String searchWord) throws ClassNotFoundException, SQLException {
		sitePostscriptDao = sqlsession.getMapper(SitePostScriptDao.class);
		List<SitePostscript> sitePostscriptList = sitePostscriptDao.getList(username, searchWord);
		
		return sitePostscriptList;
	}
	
	/*
	* @date : 2017.07.01
	* @description : 찜한 여행지 후기 리스트
	* @parameter : String username 로그인한 유저 아이디, String searchWord 검색 태그
	* @return : List<SitePostscript> 찜한 여행지 후기 리스트
	*/
	public List<SitePostscript> listLikeRoutePost(String username, String searchWord) throws ClassNotFoundException, SQLException {
		sitePostscriptDao = sqlsession.getMapper(SitePostScriptDao.class);
		List<SitePostscript> sitePostscriptList = sitePostscriptDao.getLikeList(username, searchWord);
		
		return sitePostscriptList;
	}
	
	/*
	* @date : 2017.07.02
	* @description : 나의 여행지 후기 리스트
	* @parameter : String username 로그인한 유저 아이디, String searchWord 검색 태그
	* @return : List<SitePostscript> 나의 여행지 후기 리스트
	*/
	public List<SitePostscript> listMySitePost(String username, String searchWord) throws ClassNotFoundException, SQLException {
		sitePostscriptDao = sqlsession.getMapper(SitePostScriptDao.class);
		List<SitePostscript> sitePostscriptList = sitePostscriptDao.getMyList(username, searchWord);
		
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
		sitePostscriptDao = sqlsession.getMapper(SitePostScriptDao.class);
		List<SitePostscriptTag> sitePostscriptTagList = sitePostscriptDao.getSitePostTagList(sitePostscript);
		
		return sitePostscriptTagList;
	}
	
	/*
	* @date : 2017.07.01
	* @description : 여행지 후기 사진 가져오기
	* @parameter : 
	* @return :  
	*/
	public List<SitePostscriptPhoto> getSitePostPhotoList(int site_postscript_rownum) throws ClassNotFoundException, SQLException{
		System.out.println("여행지 후기 사진 가져오기");
		sitePostscriptDao = sqlsession.getMapper(SitePostScriptDao.class);
		List<SitePostscriptPhoto> sitePostscriptPhotoList = sitePostscriptDao.getPhoto(site_postscript_rownum);
		System.out.println("sitePostscriptPhotoList : " + sitePostscriptPhotoList);
		return sitePostscriptPhotoList;
	}
	
	/*
	* @date : 2017. 6. 28
	* @description : 여행지 후기 등록
	* @parameter : 
	* @return : SitePostscript 방금 쓴 여행지 후기
	*/
	public SitePostscript writeSitePostscript(SitePostscript sitePostscript) throws ClassNotFoundException, SQLException{
		System.out.println("여행지 후기 작성 서비스");
		sitePostscriptDao = sqlsession.getMapper(SitePostScriptDao.class);
		SitePostscript sitePostscript2 = null;
		int check = sitePostscriptDao.insert(sitePostscript);
		
		if(check>0){
			System.out.println("여행지 후기 작성 성공");
		}else{
			System.out.println("여행지 후기 작성 실패");
		}
		
		sitePostscript2 = sitePostscriptDao.getLastSitePost();
		System.out.println("방금 쓴 후기 : " + sitePostscript2);
		
		return sitePostscript2;
	}
	
	/*
	* @date : 2017. 6. 28
	* @description : 여행지 후기 태그 등록
	* @parameter : 
	* @return :  
	*/
	public List<SitePostscriptTag> insertSitePostTag(SitePostscript sitePostscript) throws ClassNotFoundException, SQLException{
		sitePostscriptDao = sqlsession.getMapper(SitePostScriptDao.class);
		
		String comment = sitePostscript.getComment();
		SitePostscriptTag sitePostscriptTag = new SitePostscriptTag();
		sitePostscriptTag.setSite_postscript_rownum(sitePostscript.getSite_postscript_rownum());
		
		// 해시 태그 추출
		Pattern p = Pattern.compile("\\#([0-9a-zA-Z가-힣]*)");
		Matcher m = p.matcher(comment);
		String extracHashTag = null;
		
		while(m.find()){
			System.out.println(m.group());
			extracHashTag = StringUtils.replace(m.group(), "-_+=!@#$%^&*()[]{}|\\;:'\"<>,.?/~) ", "");
			System.out.println(extracHashTag);
			
			if(extracHashTag != null){
				sitePostscriptTag.setTag(extracHashTag.substring(1));
				sitePostscriptDao.insertTag(sitePostscriptTag);
			}
		}
		List<SitePostscriptTag> tagList = sitePostscriptDao.getSitePostTagList(sitePostscript);
		return tagList;
	}
	
	/*
	* @date : 2017. 6. 28
	* @description : 여행지 후기 사진 등록
	* @parameter : 
	* @return :  
	*/
	public List<SitePostscriptPhoto> insertSitePostPhoto(MultipartHttpServletRequest mhsq, int site_postscript_rownum) throws ClassNotFoundException, SQLException, IllegalStateException, IOException{
		sitePostscriptDao = sqlsession.getMapper(SitePostScriptDao.class);
		SitePostscriptPhoto sitePostscriptPhoto = new SitePostscriptPhoto();
		sitePostscriptPhoto.setSite_postscript_rownum(site_postscript_rownum);
		
		List<SitePostscriptPhoto> photoList = null;
				
		FileOutputStream fos = null;
		
		String realFolder = "C:/Users/dahye/git/Team3_PLAN-B/PLANB_JEJU/WebContent/upload/";
		String rootPath = mhsq.getSession().getServletContext().getRealPath("/");
        
        // 넘어온 파일을 리스트로 저장
        List<MultipartFile> multi = mhsq.getFiles("file");
        System.out.println(multi);
        if(multi.size() == 1 && multi.get(0).getOriginalFilename().equals("")) {
        	System.out.println("파일 없음");
        }else{
        	for(int i = 0; i < multi.size(); i++) {
        		try{        			
        			// 파일 중복명 처리
                    String genId = UUID.randomUUID().toString();
                    System.out.println("파일명 중복 방지 코드 : " + genId);
                    
                    // 본래 파일명
                    String originalfileName = multi.get(i).getOriginalFilename();
                    System.out.println("원래 파일 이름 : " + originalfileName);
                    
                    // 저장되는 파일 이름
                    String saveFileName = genId + "_" + originalfileName; 
                    System.out.println("저장되는 파일 이름 : " + saveFileName);
     
                    String savePath = realFolder + saveFileName; // 저장 될 파일 경로
     
                    long fileSize = multi.get(i).getSize(); // 파일 사이즈
                    

                    if(originalfileName.contains(".")){
                    	// 파일 저장
                        multi.get(i).transferTo(new File(savePath)); 
                        
                        sitePostscriptPhoto.setPhoto_src(saveFileName);
                        
                        sitePostscriptDao.insertPhoto(sitePostscriptPhoto);        			
            			
            			byte fileData[] = multi.get(i).getBytes();
                         
                        fos = new FileOutputStream(realFolder + saveFileName);
                         
                        fos.write(fileData);
                    }
                }catch(Exception e){
                    e.printStackTrace();    
                }finally{
                    if(fos != null){ try{ fos.close(); }catch(Exception e){ System.out.println(e.getMessage()); }}
                }
            }

    		photoList = sitePostscriptDao.getPhoto(site_postscript_rownum);
    		System.out.println(photoList);
        }
        return photoList;
	}
}
