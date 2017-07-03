package com.planb_jeju.controller;

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


/*
* @FileName : ErrorPageController.java
* @Project : PLANB_JEJU
* @Date : 2017.07.02
* @LastEditDate : 2017.07.02
* @Author : 정다혜
* @Desc : 에러 페이지 컨트롤러
*/

@Controller
@RequestMapping("/Error/")
public class ErrorPageController {

	/*
	* @method Name : error404Page
	* @date : 2017.07.02
	* @author. : 정다혜
	* @description : 404 에러 시 페이지 연결
	* @param spec : -
	* @return : View Page
	*/
	@RequestMapping("404.do")
	public String error404Page() throws ClassNotFoundException, SQLException {
		return "Error.error500";
	}
	
	/*
	* @method Name : error500Page
	* @date : 2017.07.02
	* @author. : 정다혜
	* @description : 500 에러 시 페이지 연결
	* @param spec : -
	* @return : View Page 
	*/
	@RequestMapping("500.do")
	public String error500Page() throws ClassNotFoundException, SQLException {
		return "Error.error500";
	}

}
