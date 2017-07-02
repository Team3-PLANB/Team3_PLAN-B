<%--
@Project : PLANB_JEJU
@File name : msgMain.jsp 
@Author : 임정연
 @Data : 2017.06.22
@Desc : 쪽지함 페이지
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/WEB-INF/views/Mypage/msg.css">

<jsp:include page="../myPageMain.jsp"></jsp:include>
<link rel="shortcut icon" href="favicon.ico">

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/animate.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/icomoon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/superfish.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/magnific-popup.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap-datepicker.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/cs-select.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/cs-skin-border.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
 
<script>

		
	var pagesize = "${pagesize}";
	var category = "${category}";
	var backpage = "${backpage}";
	
	if(backpage > 0){
		location.href = "${pageContext.request.contextPath}/MyPage/Message/msgMain.do?cp="+backpage+"&ps="+pagesize+"&category="+category;
	}

	/* 전체 선택   */
	$(document).ready(function() {
		$("#checkall1").click(function() {
			if ($("#checkall1").prop("checked")) {
				$("input[type=checkbox]").prop("checked", true);

			} else {
				$("input[type=checkbox]").each(function() {
					$("input[type=checkbox]").prop("checked", false);
				});
			}
		});

		$("[data-toggle=tooltip]").tooltip();
	});
	
	$(document).ready(function() {
		$("#checkall2").click(function() {
			if ($("#checkall2").prop("checked")) {
				$("input[type=checkbox]").prop("checked", true);

			} else {
				$("input[type=checkbox]").each(function() {
					$("input[type=checkbox]").prop("checked", false);
				});
			}
		});

		$("[data-toggle=tooltip]").tooltip();
	});
	
	
	
	function msgdelete(message_rownum) {
		
	 	if(!confirm("메시지를 삭제 하시겠습니까?")){
	      return;
	      
	   	}
		  
	   $.ajax({
	      url:"msgdelete.do",
	      data:{"message_rownum":message_rownum},
	      success:function(data){
	         console.log(data);
	         alert("삭제되었습니다.");
	         
	         //새로고침
	         location.reload();
	      },
	      error:function(e){
	         alert(e.responseText);
	      }
	   });	
		
	}
	
	
	function fnSearchPage(currentPage){
		var category = $("#category").val();
		location.href="msgMain.do?cp="+currentPage+"&category="+category;
	}

	function fnSearchPagebar(cp,ps){	
		var category = $("#category").val(); 
		location.href="msgMain.do?cp="+cp+"&ps="+ps+"&category="+category;
	}
	function fnSearchGroupPagebar(cp){	
		var category = $("#category").val(); 
		location.href="msgMain.do?cp="+cp+"&category="+category;
	}
</script>
<style>

.page_nb {
    width: 100%;
    margin: 40px auto 20px;
    text-align: center;
    display: inline-block;
}

.page_nb li {
    display: inline-block;
    padding: 5px 10px;
    border: 1px solid #dadada;
    color: #333;
    margin: 0 2px;
    cursor: pointer;
}

.page_nb li span {
    color: #ff5a74;
    font-weight: bold;
}

</style>
<br>
<br>
<div class="container" style="margin-bottom: 100px">
	<div class="row">
	
	<br>
	<br>
	<br>
	<br>
		<div class="tabulation animate-box fadeInUp animated">



			<!-- Nav tabs -->
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#step1"
					aria-controls="flights" role="tab" data-toggle="tab">받은 쪽지함</a></li>
				<li role="presentation"><a href="#step2" aria-controls="hotels"
					role="tab" data-toggle="tab">보낸 쪽지함</a></li>
			</ul>

			<!-- Tab panes -->
	<div class="tab-content">
		<div role="tabpanel" class="tab-pane active" id="step1">
			<div class="table-responsive">
				<table id="mytable" class="table table-bordred table-striped">
					<thead>
						<th><input type="checkbox" id="checkall1" /></th>
						<th>New</th>
						<th>보내는사람</th>
						<th>받는사람</th>
						<th>내용</th>
						<th>날짜</th>
						<th>Delete</th>
					</thead>
					<tbody>
						<c:forEach var="msg" items="${messageList}">
						<tr>
							<td><input type="checkbox" class="checkthis" /></td>
							<td><c:if test="${msg.read_status eq 0}"> N </c:if></td>
							<td>${msg.sender}</td>
							<td>${msg.receiver}</td>
							<td>${msg.comment}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${msg.sendtime}"/></td>
							<td align="center">
								<p data-placement="top" data-toggle="tooltip" title="Delete">
									<button class="btn btn-danger btn-xs" data-title="Delete"
											onclick="msgdelete(${msg.message_rownum})"
											data-toggle="modal" data-target="#delete">
									<span class="glyphicon glyphicon-trash"></span>
									</button>
								</p>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
						<div class="clearfix"></div>
					
			<div class="page_nb" id="list_page">
							<ul>
								<c:if test="${totalMessageCount>0}">
								    <c:set var="startPage" value="${pageGroupSize*(numPageGroup-1)+1}"/>
								    <c:set var="endPage" value="${startPage + pageGroupSize-1}"/>
								
									<c:if test="${endPage > pagecount}" >
								     	<c:set var="endPage" value="${pagecount}" />
								    </c:if>
									
									<c:if test="${numPageGroup > 1 }">
										<li onclick="fnSearchGroupPagebar(${(numPageGroup-2)*pageGroupSize+1})">&lt;&lt;</li>
									</c:if>
									<c:if test="${cpage>1}">
										<li onclick="fnSearchPagebar(${cpage-1},${pagesize})">&lt;</li> 
									</c:if> 
									<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1" varStatus="status">
										<c:choose>
									    	<c:when test="${status.index eq cpage}">
									        	<li><span>${status.index}</span></li>
									    	</c:when>
											<c:otherwise>
												<li onclick="fnSearchPagebar(${status.index},${pagesize});">${status.index}</li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:if test="${cpage<pagecount}">
										<li onclick="fnSearchPagebar(${cpage+1},${pagesize})">&gt;</li>
									</c:if>
									<c:if test="${numPageGroup < pageGroupCount}">
										<li onclick="fnSearchGroupPagebar(${numPageGroup*pageGroupSize+1})">&gt;&gt;</li>
									</c:if>	 
								</c:if>
							</ul>
						</div>   
					</div>
				</div>
				<div role="tabpanel" class="tab-pane" id="step2">
					<div class="table-responsive">
						<table id="mytable" class="table table-bordred table-striped">

							<thead>

								<th><input type="checkbox" id="checkall2" /></th>
								<th>New</th>
								<th>보내는사람</th>
								<th>받는사람</th>
								<th>내용</th>
								<th>날짜</th>
								<th>Delete</th>
							</thead>
							<tbody>
								<c:forEach var="msg" items="${messageList}">
						<tr>
							<td><input type="checkbox" class="checkthis" /></td>
							<td><c:if test="${msg.read_status eq 0}"> N </c:if></td>
							<td>${msg.sender}</td>
							<td>${msg.sender}</td>
							<td>${msg.comment}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${msg.sendtime}"/></td>
							<td align="center">
								<p data-placement="top" data-toggle="tooltip" title="Delete">
									<button class="btn btn-danger btn-xs" data-title="Delete"
											data-toggle="modal" data-target="#delete">
									<span class="glyphicon glyphicon-trash"></span>
									</button>
								</p>
							</td>
						</tr>
						</c:forEach>							
						</tbody>
						</table>

						<div class="page_nb" id="list_page">
							<ul>
								<c:if test="${totalMessageCount>0}">
								    <c:set var="startPage" value="${pageGroupSize*(numPageGroup-1)+1}"/>
								    <c:set var="endPage" value="${startPage + pageGroupSize-1}"/>
								
									<c:if test="${endPage > pagecount}" >
								     	<c:set var="endPage" value="${pagecount}" />
								    </c:if>
									
									<c:if test="${numPageGroup > 1 }">
										<li onclick="fnSearchGroupPagebar(${(numPageGroup-2)*pageGroupSize+1})">&lt;&lt;</li>
									</c:if>
									<c:if test="${cpage>1}">
										<li onclick="fnSearchPagebar(${cpage-1},${pagesize})">&lt;</li> 
									</c:if> 
									<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1" varStatus="status">
										<c:choose>
									    	<c:when test="${status.index eq cpage}">
									        	<li><span>${status.index}</span></li>
									    	</c:when>
											<c:otherwise>
												<li onclick="fnSearchPagebar(${status.index},${pagesize});">${status.index}</li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:if test="${cpage<pagecount}">
										<li onclick="fnSearchPagebar(${cpage+1},${pagesize})">&gt;</li>
									</c:if>
									<c:if test="${numPageGroup < pageGroupCount}">
										<li onclick="fnSearchGroupPagebar(${numPageGroup*pageGroupSize+1})">&gt;&gt;</li>
									</c:if>	 
								</c:if>
							</ul>
						</div>   

					</div>
				</div>
			</div>
		</div>
	</div>
</div>