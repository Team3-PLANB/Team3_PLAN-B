package com.planb_jeju.dao;

import java.sql.SQLException;
import java.util.List;

import com.planb_jeju.dto.Member;

//CRUD
public interface MemberDao {
	
	/*	
	 * @description : 회원 전체 수
	 * @return : int
	 * @param spec : x
	 */
	public int getCount() throws ClassNotFoundException, SQLException;
	
	/*	
	 * @description : 일반 회원가입
	 * @return : int
	 * @param spec : x
	 */
	public int insert(Member member) throws ClassNotFoundException, SQLException;
	public int insertRole(String username) throws ClassNotFoundException, SQLException;
	/*	
	 * @description : 페이스북 회원가입
	 * @return : int
	 * @param spec : x
	 */
	public void fbjoin(String username, String password, String nickname) throws ClassNotFoundException, SQLException;
	
	/*	
	 * @description : 회원가입 시 이메일 중복확인
	 * @return : int
	 * @param spec : x
	 */
	public int checkEmail(String username) throws ClassNotFoundException, SQLException;
	
	/*	
	 * @description : 회원가입 시 닉네임 중복확인
	 * @return : int
	 * @param spec : x
	 */
	public int checkNickname(String nickname) throws ClassNotFoundException, SQLException;
	
	/*	
	 * @description : 일반 로그인
	 * @return : int
	 * @param spec : x
	 */
	public String loginCheck(String username) throws ClassNotFoundException, SQLException;
	
	/*	
	 * @description : 페이스북 로그인
	 * @return : int
	 * @param spec : x
	 */
	public void fblogin(String username) throws ClassNotFoundException, SQLException;
	
	/*	
	 * @description : 페이스북 비밀번호(for security)
	 * @return : int
	 * @param spec : x
	 */
	public String getFBpassword(String username) throws ClassNotFoundException, SQLException;
	
	/*	
	 * @description : 회원 정보
	 * @return : int
	 * @param spec : x
	 */
	public Member getMember(String username) throws ClassNotFoundException, SQLException;
		
	/*	
	 * @description : 회원정보 수정
	 * @return : int
	 * @param spec : x
	 */
	public int update(Member member) throws ClassNotFoundException, SQLException;
	
	/*	
	 * @description : 회원 삭제
	 * @return : int
	 * @param spec : x
	 */
	public int delete(String username) throws ClassNotFoundException, SQLException;
	
}	