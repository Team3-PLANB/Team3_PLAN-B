package com.planb_jeju.dao;

import java.sql.SQLException;
import java.util.List;

import com.planb_jeju.dto.Member;

//CRUD
public interface MemberDao {
	
	//회원 전체 수
	public int getCount() throws ClassNotFoundException, SQLException;
	
	// 일반 회원가입
	public int insert(Member member) throws ClassNotFoundException, SQLException;
	
	// 페이스북 회원가입
	public void fbjoin(String username, String password, String nickname) throws ClassNotFoundException, SQLException;
	
	//회원가입 시 이메일 중복확인
	public int checkEmail(String username) throws ClassNotFoundException, SQLException;
	
	// 일반 로그인
	public Member loginCheck(String username, String password) throws ClassNotFoundException, SQLException;
	
	// 페이스북 로그인
	public void fblogin(String email) throws ClassNotFoundException, SQLException;
	
	// 페이스북 비밀번호(for security)
	public String getFBpassword(String email) throws ClassNotFoundException, SQLException;
	
	//회원 정보
	public Member getMember(String username) throws ClassNotFoundException, SQLException;
		
	//회원정보 수정
	public int update(Member member) throws ClassNotFoundException, SQLException;
	
	//회원 삭제
	public int delete(String username) throws ClassNotFoundException, SQLException;
	
}	