
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<h3 style="text-align: center">MY PAGE</h3>
<h4 style="text-align: center">
	<a href="${pageContext.request.contextPath}/MyPage/Schedule/schedule.do">일정관리&nbsp;&nbsp;&nbsp;&nbsp;</a>
	<a href="${pageContext.request.contextPath}/MyPage/History/history.do">히스토리&nbsp;&nbsp;&nbsp;&nbsp;</a>
	<a href="${pageContext.request.contextPath}/MyPage/PostScript/postScriptMain.do">나의후기&nbsp;&nbsp;&nbsp;&nbsp;</a>
	<a href="${pageContext.request.contextPath}/MyPage/Like/like.do">찜한 후기&nbsp;&nbsp;&nbsp;&nbsp;</a>
	<a href="${pageContext.request.contextPath}/MyPage/Message/msg.do">쪽지함&nbsp;&nbsp;&nbsp;&nbsp;</a>
	<a href="${pageContext.request.contextPath}/MyPage/Info/info.do">회원정보수정</a>
</h4>
<br style = "color:#f8ae45 ">
<div class="box-testimony animate-box">
	<div class="tab-content">
		<div role="tabpanel" class="tab-pane active" id="join">
			<div class="row" style = "margin-left: 450px;">
				<div class="col-xxs-12 col-xs-6 mt" style="clear: both">
					<div class="input-field">
						<label for="password">비밀번호</label> <input type="password"
							class="form-control" id="password" placeholder="변경할 비밀번호를 입력해주세요">
					</div>
				</div>
				<div class="col-xxs-12 col-xs-6 mt" style="clear: both">
					<div class="input-field">
						<label for="passwordck">비밀번호 확인</label> <input type="password"
							class="form-control" id="passwordck" placeholder="비밀번호를 다시 입력해주세요">
					</div>
				</div>
				<div class="col-xxs-12 col-xs-6 mt" style="clear: both">
					<div class="input-field">
						<label for="nickname">닉네임</label> <input type="text"
							class="form-control" id="nickname" placeholder="변경할 닉네임을 입력해주세요">
					</div>
				</div>
				<div class="col-xs-12">
					<input type="submit" class="btn btn-primary btn-block" style = "width: 150px; margin: auto"value="수정">
				</div>
			</div>
		</div>
	</div>
</div>





