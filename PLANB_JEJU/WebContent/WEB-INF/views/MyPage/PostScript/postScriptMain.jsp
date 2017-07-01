<%--
@Project : PLANB_JEJU
@File name : postscriptMain.jsp 
@Author : 임정연
 @Data : 2017.06.22
@Desc : 마이페이지의 나의 후기
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../myPageMain.jsp"></jsp:include>

<div id="fh5co-tours">
	<div class="container">
		<div class="row">
			<div
				class="col-md-6 col-sm-6 fh5co-tours animate-box fadeInUp animated"
				data-animate-effect="fadeIn">
				<div href="#">
					<img src="${pageContext.request.contextPath}/images/MyPage/mypostscript1.jpg"
						alt="MyRoutePostscript"
						class="img-responsive">
					<div class="desc">
						<span class="price">나의 루트 후기</span>
						<a class="btn btn-primary btn-outline" href="${pageContext.request.contextPath}/MyPage/PostScript/Route/List.do">나의 루트 후기 보기
							<i class="icon-arrow-right22"></i>
						</a>
					</div>
				</div>
			</div>
			<div
				class="col-md-6 col-sm-6 fh5co-tours animate-box fadeInUp animated"
				data-animate-effect="fadeIn">
				<div href="#">
					<img src="${pageContext.request.contextPath}/images/MyPage/mypostscript2.jpg"
						alt="MySitePostScript"
						class="img-responsive">
					<div class="desc">
						<span class="price">나의 여행지 후기</span> 
						<a class="btn btn-primary btn-outline" href="${pageContext.request.contextPath}/MyPage/PostScript/Site/List.do">나의 여행지 후기 보기
							<i class="icon-arrow-right22"></i>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>