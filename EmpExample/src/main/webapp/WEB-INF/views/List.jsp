<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	<div class="row">
		<div class="col-sm-offset-8 col-sm-2">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="button"
				class="btn btn-default" data-toggle="modal" data-target="#myModal"
				value="사원등록">
		</div>
		<div class="col-sm-2">
			<input type="button" class="btn btn-default" value="삭제하기"
				id="deleteBtn">
		</div>

	</div>

</div>
</article>

</div>
</div>
</section>

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title text-center">사원 등록</h4>
			</div>
			<div class="modal-body text-center">
				<form class="form-horizontal" action="addMember.do" method="post">
					<div class="form-group">
						<label class="control-label col-sm-offset-2 col-sm-2" for="email">EMPNO</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="email" name="empno"
								placeholder="001">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-offset-2 col-sm-2" for="pwd">ENAME</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="pwd" name="ename"
								placeholder="홍길동">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-offset-2 col-sm-2" for="pwd">JOB</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="pwd" name="job"
								placeholder="Manager">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-offset-2 col-sm-2" for="pwd">MGR</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="pwd" name="mgr"
								placeholder="1122">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-offset-2 col-sm-2" for="pwd">SAL</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="pwd" name="sal"
								placeholder="1600">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-offset-2 col-sm-2" for="pwd">COMM</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="pwd" name="comm"
								placeholder="100">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-offset-2 col-sm-2" for="pwd">DEPTNO</label>
						<div class="col-sm-4">
							<select class="form-control" name="deptno">
								<option value="10">10</option>
								<option value="20">20</option>
								<option value="30">30</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-4 col-sm-4">
							<button type="submit" class="btn btn-default">사원등록</button>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>

	</div>
</div>

<script>
		$(function(){
			$('#deleteBtn').click(function(){
				
				var chklength = $("input:checkbox[name=chkbox]").length;
				var chk;
				for(var i = 0; i < chklength; i++){
					if($("input:checkbox[name=chkbox]:checked")){
						chk = $("input:checkbox[name=chkbox]:checked");
						break;
					}	
				}
				
				//사번
				var empno = chk.parent().next().text();
				
				location.href="Delete.do?empno="+empno;
			});
		});
	</script>
</body>
</html>