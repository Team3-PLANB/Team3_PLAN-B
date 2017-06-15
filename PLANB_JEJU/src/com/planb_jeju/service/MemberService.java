package com.planb_jeju.service;

import java.util.Random;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class MemberService {
	@Autowired
	private SqlSession sqlsession;
	
	// 7자리 영문+숫자 랜덤코드 만들기
	public String RandomNum(){
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
	
	// 메일 보내기
	public void sendEmail(String email, String authNum){
		
	}
}
