package com.planb_jeju.controller;

/*
* @FileName : PostScriptController.java
* @Class : PostScriptController
* @Project : PLANB_JEJU
* @Date : 2017.06.16
* @LastEditDate : 2017.06.16
* @Author : 강나영
* @Desc : 후기 게시판 ui연결 /
*/

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
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.planb_jeju.dao.ExDao;
import com.planb_jeju.dao.MemberDao;
import com.planb_jeju.dto.Member;


@Controller
@RequestMapping("PostScript/Root")
public class PostScriptController {

/*	
	private static MemberDao memberDao;

	@Autowired
	private SqlSession sqlsession;*/
	

	@RequestMapping("/List.do")
	public String memberDetail() throws ClassNotFoundException, SQLException {
		
		return "PostScript.Root.listBoard";	

	}



}
