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
* @FileName : KakaoParsing.java
* @Project : PLANB_JEJU
* @Date : 2017.04.21
* @LastEditDate : 2017.06.16
* @Author : 강나영 
*/

/*
 * @Class : MyPageController
 * @Date : 2017.04.21
 * @Author : 강나영
 * @Board : 2017. 04. 21.
 * @Desc : 마이페이지 컨트롤러
*/

@Controller
public class DBExController {

	
	private ExDao noticeDao;

	@Autowired
	private SqlSession sqlsession;

	/*
	* @method Name : editBoard
	* @date : 2017. 4. 21
	* @author. : 강나영
	* @description : 게시판을 고치기 위해 DB와 연 결하여 해결한다. 
	* @param spec : HttpServletRequest boardata 
	* @return : int 
	*/
	@RequestMapping("DBEx.do")
	public void noticeDetail() throws ClassNotFoundException, SQLException {

		// Notice notice = noticeDao.getNotice(seq);
		// model.addAttribute("notice",notice );

		// Mybatis 적용
		ExDao noticeDao = sqlsession.getMapper(ExDao.class);
		
		System.out.println("확인 : "+noticeDao.getCount());

	}

	/*
	 * //글삭제하기
	 * 
	 * @RequestMapping("noticeDel.htm") public String noticeDel(String seq)
	 * throws ClassNotFoundException, SQLException{
	 * 
	 * //noticeDao.delete(seq); //Mybatis 적용 NoticeDao noticeDao =
	 * sqlsession.getMapper(NoticeDao.class); noticeDao.delete(seq); return
	 * "redirect:notice.htm"; //location.href 동일 }
	 */

}
