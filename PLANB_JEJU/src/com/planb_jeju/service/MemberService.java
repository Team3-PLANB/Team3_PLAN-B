package com.planb_jeju.service;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.planb_jeju.dao.MemberDao;

@Service
public class MemberService {
	@Autowired
	private SqlSession sqlsession;
	
	// 7자리 영문+숫자 랜덤코드 만들기
	public String RandomNum(){
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
		System.out.println("랜덤 만들기:"+buf.toString());
		return buf.toString();
	}
	
	// 메일 보내기
	public void sendEmail(String username, String authNum){
		String host = "smtp.gmail.com"; // smtp 서버
		String subject = "PLAN'B JEJU 이메일 인증 서비스";
		String fromName = "플랜비 제주 관리자";
		String from = "dahye9666@gmail.com"; // 보내는 메일
		String to1 = username;
		
		String content = "인증번호[" + authNum + "]";
		
		try{
			Properties props = new Properties();
			// gmail SMTP 사용 시
			props.put("mail.smtp.user", "dahye9666@gmail.com"); //구글 계정
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protoclol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.user", from);
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.debug", "true");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.fallback", "false");

			
			Session mailSession = Session.getInstance(props, new javax.mail.Authenticator(){
				protected PasswordAuthentication getPasswordAuthentication(){
					return new PasswordAuthentication("dahye9666","coolcoolzz96");
				}
			});
			mailSession.setDebug(true); // 메일을 전송할 때 상세한 상황을 콘솔에 출력한다.
			Message msg = new MimeMessage(mailSession);
			msg.setSubject(subject);
			
			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName,"UTF-8","B"))); //보내는 사람 설정

			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(username)); // 받는 사람 설정
			msg.setSubject(subject); // 제목 설정
			msg.setSentDate(new java.util.Date()); // 보내는 날짜 설정
			msg.setContent(content, "text/html;charset=utf-8"); // 내용 설정(HTML 형식)
			Transport.send(msg); //메일 보내기
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	// 회원가입 시 아이디체크
	public String duplicationCheck(String username) throws Exception {
		String result;
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		if(memberdao.checkEmail(username) > 0) {
			result = "false";
			// 아이디 중복 O
		} else {
			result = "true";
			// 아이디 중복 X
		}
		return result;
	}
}
