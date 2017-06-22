<%--
@Project : PLANB_JEJU
@File name : infoMain.jsp 
@Author : 임정연
 @Data : 2017.06.22
@Desc : 회원정보수정
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	$(document).ready(function() {
		$('#join').click(function() {
			$.ajax({
			/* function(){
				$('#').
					console.log(data);
					$('#menuView').empty();
					var opr="";
					$.each(data.menu,function(index,value){
						console.log(index + "/" + value);
						opr += index + "." + value + "<br>";
					});
					$('#menuView').append(opr);
			} */
			})
		});
	});
</script>
<jsp:include page="../myPageMain.jsp"></jsp:include>

<div class="box-testimony animate-box">
	<div class="container" style="margin-left:37%">
		<div class="row">
			<form id="editMemForm" method="post">
				<div class="col-xxs-12 col-xs-4 mt" style="clear: both">
					<div class="input-field">
						<label for="email">이메일</label> 
						<input type="text" class="form-control" id="email" value="${username}" readonly>
					</div>
				</div>
				<div class="col-xxs-12 col-xs-4 mt" style="clear: both">
					<div class="input-field">
						<label for="password">비밀번호</label> 
						<input type="password"	class="form-control" id="password" placeholder="변경할 비밀번호를 입력해주세요">
					</div>
				</div>
				<div class="col-xxs-12 col-xs-4 mt" style="clear: both">
					<div class="input-field">
						<label for="passwordck">비밀번호 확인</label> 
						<input type="password"	class="form-control" id="passwordck" placeholder="비밀번호를 다시 입력해주세요">
					</div>
				</div>
				<div class="col-xxs-12 col-xs-4 mt" style="clear: both">
					<div class="input-field">
						<label for="nickname">닉네임</label> 
						<input type="text" class="form-control" id="nickname" placeholder="변경할 닉네임을 입력해주세요" value="${nickname}">
					</div>
				</div>
				<div class="col-xxs-12 col-xs-4 mt" style="clear: both">
					<div class="input-field">
						<input type="submit" class="btn btn-primary btn-block" style="width: 150px; margin: auto" value="수정">
					</div>
				</div>
			</form>
		</div>
	</div>
</div><br><br><br>




<style>
a:active {
	color: black;
	text-size: 20px;
}
</style>



