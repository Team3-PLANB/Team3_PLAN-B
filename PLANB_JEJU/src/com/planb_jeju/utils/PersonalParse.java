package com.planb_jeju.utils;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.planb_jeju.dto.Route;

/*
* @FileName : PersonalParse.java
* @Class : PersonalParse
* @Project : PLANB_JEJU
* @Date : 2017.06.27
* @LastEditDate : 2017.06.27
* @Author : 정다혜
* @Desc : 취향 코드 -> 취향
*/

public class PersonalParse {

	PersonalParse personalparse;
	

	private PersonalParse() {
		if (personalparse == null) {
			PersonalParse personalparse = new PersonalParse();
		}
	}		

	public static String code2shortcode(String personal_code) {
		personal_code = personal_code.substring(0, 5);
		System.out.println(personal_code);
		
		return personal_code;
	}
	
	public static String code2string(String personal_code) {
		String personal = null;
		personal_code = personal_code.substring(0, 5);
		switch(personal_code){
			case "A0101" : personal = "자연"; break;
			case "A0201" : personal = "역사관광"; break;
			case "A0202" : personal = "힐링"; break;
			case "A0203" : personal = "체험"; break;
			case "A0204" : personal = "산업관광"; break;
			case "A0205" : personal = "건축/조형"; break;
			case "A0206" : personal = "문화시설"; break;
			case "A0207" : personal = "축제"; break;
			case "A0208" : personal = "공연/행사"; break;
			case "A0301" : personal = "육상 레포츠"; break;
			case "A0302" : personal = "육상 레포츠"; break;
			case "A0303" : personal = "수상 레포츠"; break;
			case "A0304" : personal = "항공 레포츠"; break;
			case "A0305" : personal = "복합 레포츠"; break;
			case "A0401" : personal = "쇼핑"; break;
			case "A0502" : personal = "맛집"; break;
			default : personal = "기타"; break;
		}

		return personal;
	}
	
	public static String string2code(String personal){
		String personal_code = null;
		
		switch(personal){
			case "자연" : personal_code = "A0101"; break;
			case "역사관광" : personal_code = "A0201"; break;
			case "힐링" : personal_code = "A0202"; break;
			case "체험" : personal_code = "A0203"; break;
			case "산업관광" : personal_code = "A0204"; break;
			case "건축/조형" : personal_code = "A0205"; break;
			case "문화시설" : personal_code = "A0206"; break;
			case "축제" : personal_code = "A0207"; break;
			case "공연/행사" : personal_code = "A0208"; break;
			case "육상 레포츠" : personal_code = "A0302"; break;
			case "수상 레포츠" : personal_code = "A0303"; break;
			case "항공 레포츠" : personal_code = "A0304"; break;
			case "복합 레포츠" : personal_code = "A0305"; break;
			case "쇼핑" : personal_code = "A0401"; break;
			case "맛집" : personal_code = "A0502"; break;
			case "기타" : personal_code = "Z0101"; break;
		}
		
		return personal_code;
	}
}
