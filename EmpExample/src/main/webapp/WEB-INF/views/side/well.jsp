<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="well"
	style="background-color: black; color: white; opacity: 50;">
	<div class="row">
		<div class="col-sm-4">
			<h3>사원 리스트</h3>
		</div>
		<div class="col-sm-offset-4 col-sm-4" style="margin-top: 20px;">
			<form class="form-inline" action="Find.do" method="post">
				<input type="text" name="empno" class="form-control" placeholder="이름을 입력하세요" required="required">
				<input type="submit" class="btn btn-default" value="검색하기">
			</form>
		</div>

	</div>
</div>