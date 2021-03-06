<%--
@Project : PLANB_JEJU
@File name : postscriptWrite.jsp 
@Author : 임정연 & 정다혜
@Data : 2017.06.17 & 2017.06.22
@ Last Edit : 2017.06.27
@Desc : 후기 작성 페이지
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>PLAN'B &mdash; JEJU</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
<meta name="author" content="FREEHTML5.CO" />

<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>

 
<!-- 여행후기작성  -->
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
 
<!-- 갤러리 등록을 위한 css  -->
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/dist/styles.imageuploader.css" rel="stylesheet" type="text/css">

<script src="${pageContext.request.contextPath}/js/postscript/write.js"></script>
<script src="${pageContext.request.contextPath}/js/postscript/postValidation.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/PostScript/jquery-ui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/demos/style.css">

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300'	rel='stylesheet' type='text/css'>

<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/icomoon.css">
	
<!-- Bootstrap  -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
	
<!-- Superfish -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/superfish.css">
	
<!-- histroy css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/history.css">
	
<!-- 체크박스 css -->	
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/PostScript/radio-bootstrap.css">


<style>
.sortable {
	font-size: 10px;
	list-style-type: none;
	margin: 0;
	padding: 0;
	width: 60%;
	height: auto;
}

div.over {
	background:
		url("http://cfile1.uf.tistory.com/image/20558E424FEE324E2693F1");
	cursor: pointer; /* 마우스 손모양 */
}

.spinner {
	padding: 10px;
	width: 30px;
	height: 15px;
}

.group {
	width: 80%;
	margin: 15px;
}
</style>


	<script>
		$(document).ready(function(){
			var routeOrder = 0;
			var dayOrder = 0;
			var $group;
			var $h3;
			var $div;
			var $sortablediv;
			var contentId;
			var $sch_content;
			var $content_img;
			var $spot_content_box;
			var $spot_name;
			var $spot_info;
			var $tag;
			var $sinfo_line;
			var $sinfo_txt;
			var scheduleday;
			
			<c:forEach var="routeDetail" items="${routeDetailList}">
				if(routeOrder != ${routeDetail.route_order}){
					dayOrder++;
					$group = $("<div class='group' style='width:400px;'></div>");
		     		$h3 = $("<h3>Day " + dayOrder + " : ${routeDetail.route_date}</h3>");
		     		$div = $("<div class='ui-accordion-content ui-corner-bottom ui-helper-reset ui-widget-content ui-accordion-content-active'></div>");
		     		$sortablediv = $("<div class='sortable' id='ScheduleDay"+dayOrder+"'></div>");
		     		
		     		$sortablediv.appendTo($div);
		     		$group.append($h3).append($div);
		     		$('#accordion').append($group);
		     		routeOrder=1;

				}
				
				// 각 Day 안에 Site 순서대로 append
				$sch_content = $("<div class='sch_content' value=${routeDetail.site} onclick='siteInfo(this)' style='width: 350px;'></div>" );
				$content_img = $("<img src='${pageContext.request.contextPath}/images/category/${routeDetail.category}.JPG' class='spot_img' style='cursor: pointer;'>");
				$spot_content_box = $("<div class='spot_content_box' style='width: 250px;'></div>");
				$spot_name = $("<div class='spot_name' style='cursor: pointer;'> ${routeDetail.site} </div>");
				$spot_info = $("<div class='spot_info'></div>");
				$tag = $("<div class='tag'> ${routeDetail.category_name} </div>");
				$sinfo_line = $("<div class='sinfo_line'></div>");
				$sinfo_txt = $("<div class='sinfo_txt' style='padding: 0px'></div>");
				
				$tag.appendTo($spot_info);
				$sinfo_line.appendTo($spot_info);
				$sinfo_txt.appendTo($spot_info);
				$spot_name.appendTo($spot_content_box);
				$spot_info.appendTo($spot_content_box);
				$content_img.appendTo($sch_content);
				$spot_content_box.appendTo($sch_content);
				
				scheduleday = "#ScheduleDay" + dayOrder;
				$(scheduleday).append($sch_content);
				
				routeOrder ++;
			</c:forEach>
			$("#accordion").accordion("refresh");
			
			
			
		});
		

		function siteInfo(site){

			$('#routePostNav').removeClass('active');
			$('#sitePostNav').addClass('active');
			$('#routePost').removeClass('active');
			$('#sitePost').addClass('active');
			$('#site').empty();
			$('#site').val(site.getAttribute("value"));

			$.ajax({
				type : "get",
				url : "${pageContext.request.contextPath}/RouteDetail/routeDetail.do",
				data : {
						"route_code" : $('#route_code').val(),
						"site" : $('#site').val()
						},
				success : function(result){
						$("#route_order").val(result.route_order);
						$("#route_date").val(result.route_date);
						$("#category").val(result.category);
						$("#fileinput").empty();
						$("#site_comment").val(null);
						$("#here").parent().children("p").addClass('uploader__hide');
						$("#here").children("ul").empty();
						$("#here").children("div").removeClass('uploader__hide');
						
						$("input:checkbox").each(function() {
							$(this).attr("checked", false);
						});
						
				},
				error : function(xhr) {
					console.log("Error! : " + xhr);
				}
			});
		}

	</script>
</head>


<%----------------------------------일정 짜기 부분 ----------------------------------------%>

<div style="background-color: white; width: 450px;" id="schedulebox2">
	<div id="accordion" style="overflow: auto; width: 450px; height: 650px;">
	</div>
</div>

<div class="container"
	style="float: left; position: relative; bottom: 522px; left: 450px;width:67%">
	<div class="row">
		<div class="col-sm-5 col-md-12">
			<div class="tabulation animate-box fadeInUp animated">

				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active" id="routePostNav">
						<a href="#routePost" aria-controls="route" role="tab" data-toggle="tab">루트 후기 작성</a>
					</li>
					<li role="presentation" id="sitePostNav">
						<a href="#sitePost" aria-controls="site" role="tab" data-toggle="tab">여행지 후기 작성</a>
					</li>
				</ul>

				<!-- 루트후기 pane -->
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane active" id="routePost">
						<div class="table-responsive">
							<form action="${pageContext.request.contextPath}/PostScript/Route/WriteOk.do?route_code=${route.route_code}" method="POST" id = "routePostfrm">
								<div role="tabpanel" class="tab-pane active" id="route">
									<input type="text" class="form-control" value="${route.routename}" name="routename" readonly><br>
									<textarea class="form-control" id="route_comment" name="comment" cols="30" rows="7" placeholder="후기를 작성해주세요.( #해쉬태그 사용가능 )"></textarea>
									<br>
									<div align="center">
										<input type="button" value="작성 완료" onClick="route_submit()" class="btn btn-primary">
									</div>
								</div>
							</form>
						</div>
					</div>

					<!-- 여행지후기 pane -->
					<div role="tabpanel" class="tab-pane" id="sitePost">
						<form action="${pageContext.request.contextPath}/PostScript/Site/WriteOk.do" method="POST" enctype="multipart/form-data" id = "sitePostfrm">
						<div class="table-responsive">
							<section role="main" class="l-main">
								<div class="uploader__box js-uploader__box l-center-box" id="here">
									<div class="uploader__contents">
										<label class="button button--secondary" for="fileinput">ImageFiles</label> 
										<input id="fileinput" class="uploader__file-input" type="file" name="file" multiple value="Select Files">
									</div>
									<input class="button button--big-bottom" type="submit" value="Upload Selected Files">
							  	  	
							    </div>
							</section>
		
							 
							<script src="${pageContext.request.contextPath}/dist/jquery.imageuploader.js"></script>
							
							<input type="text" class="form-control" id="site" name="site" placeholder="여행지를 선택해주세요" readonly><br>
							<textarea name="comment" class="form-control" id="site_comment" cols="30" rows="7" placeholder="후기를 작성해주세요.( #해쉬태그 사용가능 )"></textarea>
							<input type="hidden" id="route_code" name="route_code" value="${route.route_code}">
							<input type="hidden" id="route_order" name="route_order" >
							<input type="hidden" id="route_date" name="route_date">
							<input type="hidden" id="category" name="category">
							<br>
							<div align="center">
								<div class="checkbox">
									<img alt="" src="${pageContext.request.contextPath}/images/PostScript/003-sun.png" width="30">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<label class="checkbox-bootstrap checkbox-lg"> 
										<input name="inoutside" type="radio" value="실내" checked="checked" onclick="doOpenCheck(this);"> 
										<span class="checkbox-placeholder"></span> 실내
									</label>&nbsp;&nbsp;&nbsp; 
									<label class="checkbox-bootstrap checkbox-lg"> 
										<input name="inoutside" type="radio" value="야외" onclick="doOpenCheck(this);"> 
										<span class="checkbox-placeholder"></span> 야외
									</label>
								</div>
								<br>
								<div class="checkbox" name="cost">
									<img alt="" src="${pageContext.request.contextPath}/images/PostScript/002-money.png" width="30">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<label class="checkbox-bootstrap checkbox-lg"> 
										<input name="cost" type="radio" value="비쌈" onclick="doOpenCheck2(this);"> 
											<span class="checkbox-placeholder"></span> 비쌈
									</label>&nbsp;&nbsp;&nbsp; 
									<label class="checkbox-bootstrap checkbox-lg"> 
										<input name="cost" type="radio" value="저렴" checked="checked" onclick="doOpenCheck2(this);"> 
										<span class="checkbox-placeholder"></span> 저렴
									</label>
								</div>
								<br>
								<div class="checkbox" >
									<img alt="" src="${pageContext.request.contextPath}/images/PostScript/001-hospital.png" width="30">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<label class="checkbox-bootstrap checkbox-lg"> 
									<input name="health" type="radio" value="완만" checked="checked" onclick="doOpenCheck3(this);"> 
										<span class="checkbox-placeholder"></span> 완만
									</label>&nbsp;&nbsp;&nbsp; 
									<label class="checkbox-bootstrap checkbox-lg"> 
										<input name="health" type="radio" value="힘듦" onclick="doOpenCheck3(this);"> 
										<span class="checkbox-placeholder"></span> 힘듦
									</label>
								</div>
							</div>
							<br>
							<div align="center">
								<input type="button" value="작성 완료" onClick = "site_submit()" class="btn btn-primary btn-block">
							</div>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>