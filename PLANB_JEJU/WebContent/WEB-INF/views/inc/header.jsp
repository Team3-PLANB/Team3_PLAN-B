<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<header>
<nav class="navbar navbar-default">
    <div class="nav-header">
					<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle dark"><i></i></a>
					<h1 id="fh5co-logo"><a href="index.html"><i class="icon-airplane"></i>헤더</a></h1>
					<!-- START #fh5co-menu-wrap -->
					<nav id="fh5co-menu-wrap" role="navigation">
						<ul class="sf-menu sf-js-enabled sf-arrows" id="fh5co-primary-menu" style="touch-action: pan-y;">
							<li class="active"><a href="index.html">PLAN'B JEJU</a></li>
							<li class="">
								<a href="vacation.html" class="fh5co-sub-ddown sf-with-ul">Vacations</a>
								<ul class="fh5co-sub-menu" style="display: none;">
									<li><a href="#">Family</a></li>
									<li><a href="#">CSS3 &amp; HTML5</a></li>
									<li><a href="#">Angular JS</a></li>
									<li><a href="#">Node JS</a></li>
									<li><a href="#">Django &amp; Python</a></li>
								</ul>
							</li>
							<li><a href="flight.html">Flights</a></li>
							<li><a href="hotel.html">Hotel</a></li>
							<li><a href="car.html">Car</a></li>
							<li><a href="blog.html">Blog</a></li>
							<li><a href="contact.html">Contact</a></li>
						</ul>
					</nav>
				</div>
	</nav>
</header>
<%-- 
    <div class="wrap">
      <a href="<%=request.getContextPath()%>/index.jsp" class="logo">캠거루 - 대학생 SNS</a>
      <nav>
        <a href="<%=request.getContextPath()%>/Community/comlist.kam">커뮤니티</a>
        <a href="<%=request.getContextPath()%>/GroupBoard/GroupBoardList.kam">동아리</a>
        <a href="<%=request.getContextPath()%>/ActivityBoard/activityboardlist.kam">대외활동</a>
        <a href="<%=request.getContextPath()%>/Common/ContestListAction.kam">공모전</a> 
      </nav>
      <div class="account">
		<%
			if(session.getAttribute("memcode")!=null){
				if(session.getAttribute("memcode").equals("1")){
					out.print("<a href='"+ request.getContextPath() + "/Common/AdminListAction.kam' class='white'>관리자화면</a>");
					out.print("<a href='"+ request.getContextPath() + "/Login/Logout.jsp' class='blue'>로그아웃</a>");
				}else{
					out.print("<a href='"+ request.getContextPath() + "/Login/Mypage.jsp' class='white'>마이페이지</a>");
					out.print("<a href='"+ request.getContextPath() + "/Login/Logout.jsp' class='blue'>로그아웃</a>");
				}
			}else{
				out.print("<a href='"+ request.getContextPath() + "/Login/Login.jsp' class='white'>로그인</a>");
				out.print("<a href='"+ request.getContextPath() + "/Login/Join.jsp' class='blue'>회원가입</a>");
			}
			String memberid=(String)session.getAttribute("memcode");		 
		%>
      </div>
    </div>
 --%>