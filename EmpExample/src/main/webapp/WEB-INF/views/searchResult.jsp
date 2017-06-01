<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<title>Bootstrap Case</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
		<table class="table table-hover">
			<tr>
				<th />
				<th>EmpNo</th>
				<th>Ename</th>
				<th>JOB</th>
				<th>MGR</th>
				<th>HireDate</th>
				<th>SAL</th>
				<th>Comm</th>
				<th>DEPTNO</th>
			</tr>
			<c:forEach var="emplist" items="${list}">
				<tr>
					<td><input type="checkbox" class='input_check' name="chkbox"></td>
					<td><a href="Detail.do?no=${emplist.empno}">${emplist.empno}</a></td>
					<td>${emplist.ename}</td>
					<td>${emplist.job}</td>
					<td>${emplist.mgr}</td>
					<c:choose>
						<c:when test="${emplist.hiredate != null}">
							<td>${emplist.hiredate}</td>
						</c:when>
						<c:otherwise>
							<td>알수없음</td>
						</c:otherwise>
					</c:choose>
					<td>${emplist.sal}</td>
					<td>${emplist.comm}</td>
					<td>${emplist.deptno}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	</article>
	</div>
	</div>
	</section>





</body>
</html>