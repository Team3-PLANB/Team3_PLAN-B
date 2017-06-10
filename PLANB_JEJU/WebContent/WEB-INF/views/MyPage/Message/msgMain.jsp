<%-- 
   @JSP : msgMain.jsp 
   @Date : 2017-06-09
   @Author : 홍단비
   @Desc : 쪽지함 메인페이지
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

			<h3 style = "text-align: center">MY PAGE</h3>
			<h4 style = "text-align: center">
				<a href="${pageContext.request.contextPath}/MyPage/Schedule/schedule.do">일정관리&nbsp;&nbsp;&nbsp;&nbsp;</a>
				<a href="${pageContext.request.contextPath}/MyPage/History/history.do">히스토리&nbsp;&nbsp;&nbsp;&nbsp;</a>
				<a href="${pageContext.request.contextPath}/MyPage/PostScript/postScriptMain.do">나의 후기&nbsp;&nbsp;&nbsp;&nbsp;</a>
				<a href="${pageContext.request.contextPath}/MyPage/Like/like.do">찜한 후기&nbsp;&nbsp;&nbsp;&nbsp;</a>
				<a href="${pageContext.request.contextPath}/MyPage/Message/msg.do">쪽지함&nbsp;&nbsp;&nbsp;&nbsp;</a>
				<a href="${pageContext.request.contextPath}/MyPage/Info/info.do">회원정보수정</a>
			</h4>

			<div class = "box-testimony animate-box">
		    <form method="post" action="" class="ccform">
			    <div class="ccfield-prepend">

			        <span class="ccform-addon"><i class="fa fa-envelope fa-2x"></i></span>

			        <input class="ccformfield" type="text" placeholder="받는 사람 Email" required>
			    </div>
			    <br>
			    <div class="ccfield-prepend">
			        <span class="ccform-addon"><i class="fa fa-comment fa-2x"></i></span>
			        <textarea class="ccformfield" name="comments" rows="8" placeholder="Message" required></textarea>
			    </div>
			    <div class="ccfield-prepend">
			        <input class="ccbtn" type="submit" value="Submit">
			    </div>
			 </form>
    	</div>
<!-- 	</div>
</div> -->


<style>
@import url(https://fonts.googleapis.com/css?family=Lato:300,400,700);


body {
	background: #FFFFFF;
	color: #fff;
	font-weight: 400;
	font-size: 1em;
	font-family: 'Lato', Arial, sans-serif;
	margin:0;
	padding:0;
	padding-bottom:60px;
}
.ccheader {
	margin: 0 auto;
	padding: 2em;
	text-align: center;
}

.ccheader h1 {
	margin: 0;
	font-weight: 300;
	font-size: 2.5em;
	line-height: 1.3;
}
.ccheader {
	margin: 0 auto;
	padding: 2em;
	text-align: center;
}

.ccheader h1 {
	margin: 0;
	font-weight: 300;
	font-size: 2.5em;
	line-height: 1.3;
}

/* Form CSS*/
.ccform {
   margin: 0 auto;
    width: 800px;
}
.ccfield-prepend{
	margin-bottom:10px;
	width:100%;
}

.ccform-addon{
	color:#f8ae45; 
	float:left;
	padding:8px;
	width:8%;
	background:#FFFFFF;
	text-align:center;	
}

.ccformfield {
	color:#000000; 
	background:rgba(242, 145, 7, 0.25);
	border:none;
	padding:15.5px;
	width:91.9%;
	display:block;
	font-family: 'Lato',Arial,sans-serif;
	font-size:14px;
    border-radius: 4px;
}

.ccformfield {
	font-family: 'Lato',Arial,sans-serif;
}
.ccbtn{
	display:block;
	border:none;
	background:#f8ae45;
	color:#FFFFFF;
	padding:12px 25px;
	text-decoration:none;
	font-weight:bold;
    margin: auto;
}
.ccbtn:hover{
	background:#d8850e;
}

#msgStep1 {
	width: 100px;
padding:12px 25px;
	
}
</style>