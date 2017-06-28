<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../myPageMain.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/sweetalert.css">
<script src="${pageContext.request.contextPath}/js/sweetalert.min.js" ></script>
<script src="${pageContext.request.contextPath}/js/mypage/updateInfo.js" ></script>
<%-- <%
	String nickname = (String)request.getAttribute("nickname");
	String originpwd = (String)request.getAttribute("originpwd");
%>
<c:set var="nickname" value="<%=nickname%>" />
<c:set var="originpwd" value="<%=originpwd %>" /> --%>
<div class="box-testimony animate-box">
	<div class="container" style="margin-left:37%">
		<div class="row">
			<form id="editMemForm" method="post">
				<div class="col-xxs-12 col-xs-4 mt" style="clear: both">
					<div class="input-field">
						<security:authentication property="name" var="loginUser"/>
						<label for="email">이메일</label> 
						<input type="text" class="form-control" id="username" name="username" value="${loginUser}" readonly>
					</div>
				</div>
				<div class="col-xxs-12 col-xs-4 mt" style="clear: both">
					<div class="input-field">
						<label for="password">비밀번호</label>
						<input type="password"	class="form-control" id="password" name="password" placeholder="비밀번호를 입력해주세요" autocomplete="off">
						<div class = "pwd" id="pwd"></div>
					</div>
				</div>
				<div class="col-xxs-12 col-xs-4 mt" style="clear: both">
					<div class="input-field">
						<label for="passwordck">비밀번호 확인</label> 
						<input type="password"	class="form-control" id="passwordck" name="passwordck" placeholder="비밀번호를 다시 입력해주세요" onkeyup="passwordCheck()" autocomplete="off">
						<div class = "pwdck" id="pwdck"></div>
					</div>
				</div>
				<div class="col-xxs-12 col-xs-4 mt" style="clear: both">
					<div class="input-field">
						<label for="nickname">닉네임</label> 
						<input type="text" class="form-control" id="nickname" name="nickname" placeholder="${nickname}" onkeyup="nickCheck()" autocomplete="off">
						<div class = "nickck" id="nickck"></div>
					</div>
				</div>
				<div class="col-xxs-12 col-xs-4 mt" style="clear: both; position: relative; right: 90px;">
					<div class="input-field">
						<input type="button" class="btn btn-primary btn-block" onclick = "editMemForm()" style="width: 150px; margin: auto" value="수정">
					</div>
				</div>
				<div class="col-xxs-12 col-xs-4 mt" style="clear: both; position: relative; left: 90px; bottom:65px;">
					<div class="input-field">
						<input type="button" class="btn btn-primary btn-block" onclick = "javascript :history.back()" style="width: 150px; margin: auto" value="돌아가기">
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