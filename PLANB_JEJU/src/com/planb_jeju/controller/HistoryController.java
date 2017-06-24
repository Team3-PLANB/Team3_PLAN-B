package com.planb_jeju.controller;

import java.security.Principal;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.planb_jeju.dto.RoutePostscript;

public class HistoryController {

	@Autowired
	private SqlSession sqlsession;

	/*
	 * @date : 2017. 6. 23
	 * @description : Mypage 히스토리 Detail view
	 * @return : String(view)
	 */
	@RequestMapping("History/historyDetial.do")
	public String historyDetailView() {
		return "MyPage.History.historyDetail";
	}
}
