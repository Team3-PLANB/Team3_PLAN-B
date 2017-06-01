<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<form class="form-horizontal" action="modify.do" method="POST">
			<div class="form-group">
				<label class="control-label col-sm-offset-2 col-sm-2" for="email">EMPNO</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="email" name="empno"
						placeholder="001" value="${dto.empno}">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-offset-2 col-sm-2" for="pwd">ENAME</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="pwd" name="ename"
						placeholder="홍길동" value="${dto.ename}">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-offset-2 col-sm-2" for="pwd">JOB</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="pwd" name="job"
						placeholder="Manager" value="${dto.job}">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-offset-2 col-sm-2" for="pwd">MGR</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="pwd" name="mgr"
						placeholder="1122" value="${dto.mgr}">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-offset-2 col-sm-2" for="pwd">Hiredate</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="pwd" name="hiredate"
						placeholder="100" value="${dto.hiredate}">
				</div>
			</div>


			<div class="form-group">
				<label class="control-label col-sm-offset-2 col-sm-2" for="pwd">SAL</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="pwd" name="sal"
						placeholder="1600" value="${dto.sal}">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-offset-2 col-sm-2" for="pwd">COMM</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="pwd" name="comm"
						placeholder="100" value="${dto.comm}">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-offset-2 col-sm-2" for="pwd">DEPTNO</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="pwd" name="deptno"
						placeholder="100" value="${dto.deptno}">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-4">
					<button type="submit" class="btn btn-default">정보수정</button>
				</div>
			</div>
		</form>
	</div>


	</div>
	</div>
	</section>

</body>
</html>