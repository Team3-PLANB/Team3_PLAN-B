package com.planb_jeju.service;

/*
* @FileName : MemberService.java
* @Class : MemberService
* @Project : PLANB_JEJU
* @Date : 2017.06.16
* @LastEditDate : 2017.06.22
* @Author : 홍단비, 정다혜
* @Desc : Mypage 컨트롤러
*/

import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.planb_jeju.dao.MemberDao;
import com.planb_jeju.dto.Member;


@Service
public class MemberService {
	
	private static MemberDao memberDao;
	@Autowired
	private SqlSession sqlsession;
	
	/*
	* @date : 2017. 6. 20
	* @description : 이메일 인증코드를 위한 7자리 영문+숫자 랜덤코드 생성
	* @return : stringbuffer
	*/
	public String RandomNum() {
		Random rnd = new Random();
		StringBuffer buf = new StringBuffer();
		for (int i = 0; i < 7; i++) {
			if (rnd.nextBoolean()) {
				buf.append((char) ((int) (rnd.nextInt(26)) + 97));
			} else {
				buf.append((rnd.nextInt(10)));
			}
		}
		return buf.toString();
	}

	/*
	* @date : 2017. 6. 20
	* @description : 이메일 보내기
	*/
	public void sendEmail(String username, String authNum) {
		String host = "smtp.gmail.com"; // smtp 서버
		String title = "PLAN'B JEJU 이메일 인증 서비스";
		String fromName = "플랜비 제주";
		String from = "dahye9666@gmail.com"; // 보내는 메일
		String to = username;

		String content = "인증번호 [ " + authNum + " ] 를 정확하게 입력해주세요.";

		try {
			Properties props = new Properties();
			// gmail SMTP 사용 시
			props.put("mail.smtp.user", from); // 구글 계정
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protoclol", "smtp");
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.debug", "true");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.socketFactory.fallback", "false");

			Session mailSession = Session.getInstance(props, new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("dahye9666", "mphntnmsefesoafw");
				}
			});

			mailSession.setDebug(true); // 메일을 전송할 때 상세한 상황을 콘솔에 출력한다.
			Message msg = new MimeMessage(mailSession);
			msg.setSubject(title); // 제목 설정
			msg.setFrom(new InternetAddress(from,fromName)); // 보내는 사람 메일 주소
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to)); // 받는 사람 설정
			msg.setSentDate(new java.util.Date()); // 보내는 날짜 설정
			msg.setContent(content, "text/html;charset=utf-8"); // 내용 설정(HTML 형식)
			Transport.send(msg); // 메일 보내기

		} catch (Exception e) {
			System.out.println("exception 발생");
			e.printStackTrace();
		}
	}
	
	/*
	* @date : 2017. 6. 20
	* @description : 회원가입시 아이디 중복체크
	* @return : String
	*/
	public String duplicationEmailCheck(String username, SqlSession sqlsession) throws Exception {
		String result = "";
		memberDao = sqlsession.getMapper(MemberDao.class);
		if(memberDao.checkEmail(username) > 0) {
			result = "false"; // 아이디 중복 O
		} else {
			result = "true"; // 아이디 중복 X
		}
		return result;
	}
	
	/*
	* @date : 2017. 6. 20
	* @description : 회원가입 시 닉네임 중복체크
	* @return : string
	*/
	public String duplicationNickCheck(String nickname, SqlSession sqlsession) throws Exception {
		String result;
		memberDao = sqlsession.getMapper(MemberDao.class);
		if(memberDao.checkNickname(nickname) > 0) {
			result = "false"; // 닉네임 중복 O
		} else {
			result = "true"; // 닉네임 중복 X
		}
		return result;
	}
	
	/*
	* @date : 2017. 6. 20
	* @description : 로그인 시 id, password 검사
	* @return : string
	*/
	public String loginCheck(String username, String password) throws Exception {
		String result = "";
		memberDao = sqlsession.getMapper(MemberDao.class);
		if(memberDao.checkEmail(username) < 1) {
			result = "efalse";	// 해당 email 존재 x
		} else {
			if(password.equals(memberDao.loginCheck(username).trim())) {
				result = "true";
			} else {
				result = "false";	// email 존재 + pwd 틀림
			}
		}
		return result;
	}
	
	/*
	* @date : 2017. 6. 20
	* @description : mypage > info > 회원정보수정 위한 member정보 가져오기
	* @return : member
	*/
	public Member getMemberInfo(String username, SqlSession sqlsession) throws Exception {
		memberDao = sqlsession.getMapper(MemberDao.class);
		Member member = memberDao.getMember(username);
		return member;
	}

	/*
	* @date : 2017. 6. 20
	* @description : mypage > info > 회원정보 수정
	* @return : member
	*/
	public Member update(Member member, SqlSession sqlsession) throws Exception {
		memberDao = sqlsession.getMapper(MemberDao.class);
		memberDao.update(member);
		return member;
	}
}