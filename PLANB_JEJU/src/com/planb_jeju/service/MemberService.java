package com.planb_jeju.service;

/*
* @FileName : MemberService.java
* @Class : MemberService
* @Project : PLANB_JEJU
* @Date : 2017.06.22
* @LastEditDate : 2017.06.16
* @Author : 홍단비 
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
	
	// 7자리 영문+숫자 랜덤코드 만들기
	public String RandomNum() {
		System.out.println("랜덤 만들기1");
		Random rnd = new Random();
		StringBuffer buf = new StringBuffer();
		System.out.println("랜덤 만들기2");
		for (int i = 0; i < 7; i++) {
			if (rnd.nextBoolean()) {
				buf.append((char) ((int) (rnd.nextInt(26)) + 97));
			} else {
				buf.append((rnd.nextInt(10)));
			}
		}
		System.out.println("랜덤 만들기:" + buf.toString());
		return buf.toString();
	}

	// 메일 보내기
	public void sendEmail(String username, String authNum) {
		String host = "smtp.gmail.com"; // smtp 서버
		String title = "PLAN'B JEJU 이메일 인증 서비스";
		String fromName = "플랜비 제주";
		String from = "dahye9666@gmail.com"; // 보내는 메일
		String to = username;

		String content = "<p style='text-align:center;' align='center'>"
							+ "<b>"
								+ "<span style='font-family:Arial; font-size: 18pt;'>"
									+ "<span style='font-family:Arial;'>안녕하세요, </span>"
									+ "<span style='font-family:Arial;'>"
										+ "<span style='font-family:Arial; color:rgb(255, 108, 0);'>PLAN'B JEJU</span> 입니다!"
									+ "</span>"
								+ "</span>"
								+ "<span style='font-size:18pt; font-family:Arial;'>&nbsp;</span>"
							+ "</b>"
						+ "</p>"
						+ "<p style='text-align:center;' align='center'>"
							+ "<b>"
								+ "<span style='font-size:18pt; font-family:Arial;'>"
									+ "<img src='http://blogfiles.naver.net/MjAxNzA3MDNfMjQ3/MDAxNDk5MDQwODUxNDA2.F7XIkS4Ry_nk-FAko6PlgXKoETd9LBXXb3FnNA-lne8g.JoXRW4CZMfSg5UyYSpZAh9S3coz2Ma0AYphiMMsms_sg.PNG.ekgp840/planb_jeju.png' s_type='attachment' s_subtype='photo' width='500' height='310' rwidth='500' rheight='310' imgqe='true' title='planb_jeju.png' jsonvalue='%7B%7D' style='width:500px; height:310px; border-color:rgb(0, 0, 0); rwidth:500px; rheight:310px;' >"
								+ "</span>"
							+ "</b>"
						+ "</p>"
						+ "<p style='text-align:center;' align='center'>"
							+ "<b style='font-family:Arial; font-size:18pt;'>아래의 인증번호를 정확하게 입력해주세요.</b>"
						+ "</p>"
						+ "<p style='text-align:center;' align='center'>"
							+ "<span style='font-family:Arial; background-color:rgb(255, 255, 255); font-size:18pt;'>"
								+ "<b>[ &nbsp; &nbsp;<span style='font-size:18pt; font-family:Arial; color:rgb(255, 108, 0);'>" + authNum + "&nbsp; &nbsp;</span>]</b>"
							+ "</span>"
						+ "</p>"
						+ "<p style='text-align:center;' align='center'>"
							+ "<span style='font-family:Arial; font-size:18pt; color:rgb(0, 0, 0);'>"
								+ "<b>환영합니다 :-&gt;</b>"
							+ "</span>"
						+ "</p>";

		try {
			System.out.println("sendEmail() 들어옴 : " + to);
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

			System.out.println("프로퍼티 설정됨");

			Session mailSession = Session.getInstance(props, new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("dahye9666", "mphntnmsefesoafw");
				}
			});

			System.out.println("[ 상세상황 출력 ]");
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
	
	// 회원가입 시 아이디체크
	public String duplicationEmailCheck(String username, SqlSession sqlsession) throws Exception {
		String result;
		memberDao = sqlsession.getMapper(MemberDao.class);
		if(memberDao.checkEmail(username) > 0) {
			result = "false"; // 아이디 중복 O
		} else {
			result = "true"; // 아이디 중복 X
		}
		return result;
	}
	
	// 회원가입 시 닉네임체크
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
	
	// 로그인 시 
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
	
	// 회원 정보 가져오기
	public Member getMemberInfo(String username, SqlSession sqlsession) throws Exception {
		memberDao = sqlsession.getMapper(MemberDao.class);
		Member member = memberDao.getMember(username);
		return member;
	}

	// 회원 정보 수정
	public Member update(Member member, SqlSession sqlsession) throws Exception {
		memberDao = sqlsession.getMapper(MemberDao.class);
		System.out.println(member.getPassword());
		memberDao.update(member);
		return member;
	}
	
}
