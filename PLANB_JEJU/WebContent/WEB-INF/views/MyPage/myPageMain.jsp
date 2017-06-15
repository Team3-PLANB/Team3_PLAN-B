<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="../../css/postscript.css">
<br>
<br>
<br>
<br>
<br>
<div class="container">
	<div class="row">
		<div
			class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
			<h3>MY PAGE</h3>
			<p>마이페이지입니다.</p>
			<ul class="portfolio-filter" align="center">
				<li><a class="btn btn-default default"
					href="${pageContext.request.contextPath}/MyPage/Schedule/schedule.do"
					data-filter=".a">일정 관리</a></li>
				<li><a class="btn btn-default"
					href="${pageContext.request.contextPath}/MyPage/History/history.do"
					data-filter=".b">히스토리</a></li>
				<li><a class="btn btn-default"
					href="${pageContext.request.contextPath}/MyPage/PostScript/postScriptMain.do"
					data-filter=".c">나의 후기</a></li>
				<li><a class="btn btn-default"
					href="${pageContext.request.contextPath}/MyPage/Like/likeMain.do"
					data-filter=".d">찜한 후기</a></li>
				<li><a class="btn btn-default"
					href="${pageContext.request.contextPath}/MyPage/Message/msgMain.do"
					data-filter=".e">쪽지함</a></li>
				<li><a class="btn btn-default"
					href="${pageContext.request.contextPath}/MyPage/Info/info.do"
					data-filter=".f">회원정보수정</a></li>
			</ul>
		</div>
	</div>
</div>