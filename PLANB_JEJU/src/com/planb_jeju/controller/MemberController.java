package com.planb_jeju.controller;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.planb_jeju.dao.ExDao;
import com.planb_jeju.dao.MemberDao;
import com.planb_jeju.dto.Member;
import com.planb_jeju.service.MemberService;


//폴더 경로가 긴 경우
///customer/notice.htm => notice.htm (함수 mapping)
///customer/noticeDetail.html  =>noticeDetail.html
@Controller
public class MemberController {

	private static MemberDao memberDao;
	private MemberService memberservice;
	
	@Autowired
	private SqlSession sqlsession;
	
	/*public MemberController(){
		if(memberDao == null){
			// Mybatis 적용
			memberDao = sqlsession.getMapper(MemberDao.class);
		}
	}*/

	//글 상세 보기
	@RequestMapping("Member/insert.do")
	public void memberDetail() throws ClassNotFoundException, SQLException {

		//Notice notice = noticeDao.getNotice(seq);
		//model.addAttribute("notice",notice );

		// Mybatis 적용
		memberDao = sqlsession.getMapper(MemberDao.class);

		Member member = memberDao.getMember("a@naver.com");
		System.out.println("확인 : "+member.toString());
	}

	//회원가입시 아이디 체크 (비동기)
	@RequestMapping("/duplicationCheck.nn")
	public @ResponseBody String duplicationCheck(String email) throws Exception {
		memberDao = sqlsession.getMapper(MemberDao.class);
		return memberservice.duplicationCheck(email);
	}
	
	/*
	 * //글삭제하기
	 * 
	 * @RequestMapping("noticeDel.htm") public String noticeDel(String seq)
	 * throws ClassNotFoundException, SQLException{
	 * 
	 * //noticeDao.delete(seq); //Mybatis 적용 NoticeDao noticeDao =
	 * sqlsession.getMapper(NoticeDao.class); noticeDao.delete(seq); return
	 * "redirect:notice.htm"; //location.href 동일 }
	 */

}
