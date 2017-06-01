package kr.or.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.model.EmpDAO;
import kr.or.model.EmpDTO;


@Controller
public class HomeController {

	@Autowired
	private SqlSession sqlsession;
	
	@RequestMapping(value="index.do", method=RequestMethod.GET)
	public String index(Model model){
		EmpDAO dao = sqlsession.getMapper(EmpDAO.class);
		List<EmpDTO> list = dao.listmember();	
		System.out.println("조회값 : " +list.size());
		model.addAttribute("list", list);

		return "List";
	}
	
	@RequestMapping(value="/addMember.do",method = RequestMethod.POST)
	public String AddMember(EmpDTO dto){
		
		System.out.println("회원 가입 !!"+dto.toString());
		EmpDAO dao = sqlsession.getMapper(EmpDAO.class);
		
		int result = dao.addMember(dto);
		System.out.println("결과 : "+result);
		return "redirect:index.do";
	}
	
	@RequestMapping("/Detail.do")
	public String AddMember(String no, Model model){
		System.out.println("넘어온 번호 : "+no);
		int empno = Integer.parseInt(no);
		EmpDAO dao = sqlsession.getMapper(EmpDAO.class);
		EmpDTO dto = dao.detail(empno);
		model.addAttribute("dto", dto);
		return "DetailView";
	}
	
	@RequestMapping(value="/modify.do", method=RequestMethod.POST)
	public String modify(int empno, String ename, String job, int mgr, String hiredate, int sal, int comm, int deptno){
		EmpDAO dao = sqlsession.getMapper(EmpDAO.class);
		Date date = Date.valueOf(hiredate);
		System.out.println(date);
		
		EmpDTO dto = new EmpDTO(empno, ename, job, mgr, date, sal, comm, deptno);
		System.out.println("셋팅 끝? " +dto.toString());
		
		int result = dao.ModifyMember(dto);
		System.out.println("result : "+result);
		
		if(result > 0){
			return "redirect:index.do";
		}else{
			return "Fail";
		}
	}
	
	@RequestMapping("/Delete.do")
	public String delete(int empno){
		System.out.println("넘어온 번호 : "+empno);
		
		if(empno == 0){
			return "redirect:index.do";
		}else{
			
			EmpDAO dao = sqlsession.getMapper(EmpDAO.class);
			int result = dao.DeleteMember(empno);
			
			if(result > 0){
				return "redirect:index.do";
			}else{
				return "Fail";
			}
		}
	}
	
	@RequestMapping(value = "/Find.do", method=RequestMethod.POST)
	public String SearchMember(String empno, Model model){
		
		System.out.println("넘어온 번호 : "+empno);
		EmpDAO dao = sqlsession.getMapper(EmpDAO.class);
		
		List<EmpDTO> dtolist = dao.search(empno);
		System.out.println("리스트 사이즈 : " +dtolist.size());
		
		model.addAttribute("list", dtolist);
		return "searchResult";
	}
}