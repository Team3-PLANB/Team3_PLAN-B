package com.planb_jeju.utils;

import java.util.ArrayList;
import java.util.List;

import com.planb_jeju.dto.Route;

/*
* @FileName : StringParse.java
* @Class : StringParse
* @Project : PLANB_JEJU
* @Date : 2017.06.16
* @LastEditDate : 2017.06.16
* @Author : 강나영
* @Desc : 스트링 나누기
*/

public class CheckBoxParse {

	CheckBoxParse stringparse;

	private CheckBoxParse() {
		if (stringparse == null) {
			CheckBoxParse stringparse = new CheckBoxParse();
		}
	}

	public static String[] parseString(String originString) {

		

		String[] personalList = originString.split(",");

		

		return personalList;
	}
}
