package kr.or.model;

import java.util.List;

public interface EmpDAO {

	List<EmpDTO> listmember();
	int addMember(EmpDTO dto);
	EmpDTO detail(int empno);
	
	int ModifyMember(EmpDTO dto);
	int DeleteMember(int empno);
	
	List<EmpDTO> search(String empno);
	
}
