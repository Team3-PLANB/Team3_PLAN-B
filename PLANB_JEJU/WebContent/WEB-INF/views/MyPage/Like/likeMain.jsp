<%--
@Project : PLANB_JEJU
@File name : likeMain.jsp 
@Author : 임정연 & 정다혜
@Date : 2017.06.22
@Last Edit Date : 2017.06.30
@Desc : 찜한 후기 메인 페이지
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../myPageMain.jsp"></jsp:include>

<div id="fh5co-tours">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-sm-6 fh5co-tours animate-box fadeInUp animated"
				data-animate-effect="fadeIn">
				<div href="#">
					<img src="${pageContext.request.contextPath}/images/MyPage/mypostscript1.jpg"
						alt="Free HTML5 Website Template by FreeHTML5.co"
						class="img-responsive">
					<div class="desc">
						<span class="price">찜한루트 후기</span> 
						<a class="btn btn-primary btn-outline" href="${pageContext.request.contextPath}/MyPage/Like/Route/List.do">
							찜한 루트 후기 보기<i class="icon-arrow-right22"></i>
						</a>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-sm-6 fh5co-tours animate-box fadeInUp animated"
				data-animate-effect="fadeIn">
				<div href="#">
					<img src="${pageContext.request.contextPath}/images/MyPage/mypostscript2.jpg"
						alt="LikeSitePostScript" class="img-responsive">
					<div class="desc">
						<span class="price">찜한 여행지 후기</span> 
						<a class="btn btn-primary btn-outline" href="${pageContext.request.contextPath}/MyPage/Like/Site/List.do">
							찜한 여행지 후기 보기<i class="icon-arrow-right22"></i>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>