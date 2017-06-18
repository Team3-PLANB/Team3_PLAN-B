<%--
@Project : PLANB_JEJU
@File name : postscriptWrite.jsp 
@Author : 임정연
 @Data : 2017.06.18
@Desc : 후기 작성 페이지
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script
	src="/resources/demos/external/jquery-mousewheel/jquery.mousewheel.js"></script>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>



<link rel="shortcut icon" href="favicon.ico">

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300'
	rel='stylesheet' type='text/css'>

<!-- Icomoon Icon Fonts-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/icomoon.css">
<!-- Bootstrap  -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.css">
<!-- Superfish -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/superfish.css">
<!-- histroy css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/history.css">
<!-- html2canvas 연습 -->
<!-- 갤러리 등록을 위한 css  -->
<link rel="stylesheet"
	href="https://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/PostScript/style.css">
<script src="js/modernizr-2.6.2.min.js"></script>
<link rel="stylesheet" href="css/PostScript/checkbox-bootstrap.css">

<!-- 상세보기 일정 -->

<style>
.sortable {
	font-size: 10px;
	list-style-type: none;
	margin: 0;
	padding: 0;
	width: 60%;
}

.sortable div {
	font-size: 13px;
}

.sortable li {
	margin: 3px;
	padding: 0.4em;
	padding-left: 1.5em;
	font-size: 1.4em;
	height: 40px;
}

.sortable li span {
	position: absolute;
	margin-left: -1.3em;
}

div.over {
	background:
		url("http://cfile1.uf.tistory.com/image/20558E424FEE324E2693F1");
	cursor: pointer; /* 마우스 손모양 */
}

div.selected {
	background:
		url("http://cfile25.uf.tistory.com/image/12558E424FEE324E282F09");
	cursor: default;
	color: black;
}

/* .sortable .sort-handle {
      display: none;
   }
   .sortable .ui-selected .sort-handle {
      display: inline;
      padding: 0 0.5em;
      cursor: pointer;
   } */
/* li.ui-selecting { background: #FECA40; }
     li.ui-selected { background: #F39814; color: white; } */
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
	$(document).ready(function() {
		$('#schedulebox').animate({
			width : '+=380px'
		});
		$('#schedulebox2').animate({
			width : '+=30%'
		});
		$('.spinner').spinner({
			min : 0,
			max : 300,
			step : 15,
			start : 0
		});
		$(".sortable").sortable();
		/* $(".sortable").disableSelection(); */
		$(".sortable").selectable();

		/* $('.sortable').selectable({
		   cancle: '.sort-handle'
		}).sortable({
		   items: "> li",
		   handle: '.sort-handle',
		   helper: function(e, item) {
		      if ( ! item.hasClass('ui-selected') ) {
		         item.parent().children('.ui-selected').removeClass('ui-selected');
		         item.addClass('ui-selected');
		      }
		      var selected = item.parent().children('.ui-selected').clone();
		      item.data('multidrag', selected).siblings('.ui-selected').remove();
		      return $('</li>').append(selected);
		   },
		   stop: function(e, ui) {
		      var selected = ui.item.data('multidrag');
		      ui.item.after(selected);
		      ui.item.remove();
		   }
		}); */
		$("#accordion").accordion({
			collapsible : true,
			header : ".day_info_box"
		}).sortable({
			axis : "y",
			handle : ".day_info_box",
			stop : function(event, ui) {
				// IE doesn't register the blur when sorting
				// so trigger focusout handlers to remove .ui-state-focus
				ui.item.children(".day_info_box").triggerHandler("focusout");
				// Refresh accordion to handle new order
				$(this).accordion("refresh");
			}
		});
		$("#accordion2").accordion({
			collapsible : true,
			header : "> div > h3"
		}).sortable({
			axis : "y",
			handle : "h3",
			stop : function(event, ui) {
				// IE doesn't register the blur when sorting
				// so trigger focusout handlers to remove .ui-state-focus
				ui.item.children("h3").triggerHandler("focusout");
				// Refresh accordion to handle new order
				$(this).accordion("refresh");
			}
		});

	});
</script>
<script type="text/javascript">
	/* 첫번째 체크박스 중복체크 X  */
	function doOpenCheck(chk) {
		var obj = document.getElementsByName("aaa");
		for (var i = 0; i < obj.length; i++) {
			if (obj[i] != chk) {
				obj[i].checked = false;
			}
		}
	}
	/* 두번째 체크박스 중복체크 X  */
	function doOpenCheck2(chk) {
		var obj = document.getElementsByName("bbb");
		for (var i = 0; i < obj.length; i++) {
			if (obj[i] != chk) {
				obj[i].checked = false;
			}
		}
	}
	/* 세번째 체크박스 중복체크 X  */
	function doOpenCheck3(chk) {
		var obj = document.getElementsByName("ccc");
		for (var i = 0; i < obj.length; i++) {
			if (obj[i] != chk) {
				obj[i].checked = false;
			}
		}
	}
</script>





<body>

	<%------------------------------일정 상세보기 ----------------------------------------%>
	<div class="col-md-4">
		<div style="background-color: white; width: 450px; height: 550px;"
			id="schedulebox2">
			<div id="accordion2"
				style="overflow: auto; width: 450px; height: 550px;">
				<div class="group">
					<h3>DAY 1</h3>
					<div>
						<div class="sortable">
							<div class="sch_content" style="width: 280px;">
								<img
									src="http://img.earthtory.com/img/place_img/312/7505_0_et.jpg"
									alt="" class="spot_img"
									onerror="this.src='/res/img/common/no_img/sight55.png';"
									onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
									style="cursor: pointer;">
								<div class="spot_content_box" style="width: 150px;">
									<div class="spot_name"
										onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
										style="cursor: pointer;">1번</div>
									<div class="spot_info">
										<div class="tag">유명한거리/지역</div>
										<div class="sinfo_line"></div>
										<div class="sinfo_txt" style="padding: 0px">
											<img src="<%=request.getContextPath()%>/css/history/like.png"
												style="height: 20px"> 6 / 10 <span>1개의 평가</span>
										</div>
									</div>
								</div>
								<div class="spot_btn_box">
									<img
										src="<%=request.getContextPath()%>/css/history/map_ico.png"
										alt="" class="spot_btn map_view"
										onclick="set_center(33.51010100,126.48125500)">
								</div>
								<div class="clear"></div>
							</div>
							<div class="sch_content" style="width: 280px;">
								<img
									src="http://img.earthtory.com/img/place_img/312/7505_0_et.jpg"
									alt="" class="spot_img"
									onerror="this.src='/res/img/common/no_img/sight55.png';"
									onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
									style="cursor: pointer;">
								<div class="spot_content_box" style="width: 150px;">
									<div class="spot_name"
										onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
										style="cursor: pointer;">22</div>
									<div class="spot_info">
										<div class="tag">유명한거리/지역</div>
										<div class="sinfo_line"></div>
										<div class="sinfo_txt" style="padding: 0px">
											<img src="<%=request.getContextPath()%>/css/history/like.png"
												style="height: 20px"> 6 / 10 <span>1개의 평가</span>
										</div>
									</div>
								</div>
								<div class="spot_btn_box">
									<img
										src="<%=request.getContextPath()%>/css/history/map_ico.png"
										alt="" class="spot_btn map_view"
										onclick="set_center(33.51010100,126.48125500)">
								</div>
								<div class="clear"></div>
							</div>
							<div class="sch_content" style="width: 280px;">
								<img
									src="http://img.earthtory.com/img/place_img/312/7505_0_et.jpg"
									alt="" class="spot_img"
									onerror="this.src='/res/img/common/no_img/sight55.png';"
									onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
									style="cursor: pointer;">
								<div class="spot_content_box" style="width: 150px;">
									<div class="spot_name"
										onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
										style="cursor: pointer;">333</div>
									<div class="spot_info">
										<div class="tag">유명한거리/지역</div>
										<div class="sinfo_line"></div>
										<div class="sinfo_txt" style="padding: 0px">
											<img src="<%=request.getContextPath()%>/css/history/like.png"
												style="height: 20px"> 6 / 10 <span>1개의 평가</span>
										</div>
									</div>
								</div>
								<div class="spot_btn_box">
									<img
										src="<%=request.getContextPath()%>/css/history/map_ico.png"
										alt="" class="spot_btn map_view"
										onclick="set_center(33.51010100,126.48125500)">
								</div>
								<div class="clear"></div>
							</div>
							<div class="sch_content" style="width: 280px;">
								<img
									src="http://img.earthtory.com/img/place_img/312/7505_0_et.jpg"
									alt="" class="spot_img"
									onerror="this.src='/res/img/common/no_img/sight55.png';"
									onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
									style="cursor: pointer;">
								<div class="spot_content_box" style="width: 150px;">
									<div class="spot_name"
										onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
										style="cursor: pointer;">444</div>
									<div class="spot_info">
										<div class="tag">유명한거리/지역</div>
										<div class="sinfo_line"></div>
										<div class="sinfo_txt" style="padding: 0px">
											<img src="<%=request.getContextPath()%>/css/history/like.png"
												style="height: 20px"> 6 / 10 <span>1개의 평가</span>
										</div>
									</div>
								</div>
								<div class="spot_btn_box">
									<img
										src="<%=request.getContextPath()%>/css/history/map_ico.png"
										alt="" class="spot_btn map_view"
										onclick="set_center(33.51010100,126.48125500)">
								</div>
								<div class="clear"></div>
							</div>
							<div class="sch_content" style="width: 280px;">
								<img
									src="http://img.earthtory.com/img/place_img/312/7505_0_et.jpg"
									alt="" class="spot_img"
									onerror="this.src='/res/img/common/no_img/sight55.png';"
									onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
									style="cursor: pointer;">
								<div class="spot_content_box" style="width: 150px;">
									<div class="spot_name"
										onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
										style="cursor: pointer;">555</div>
									<div class="spot_info">
										<div class="tag">유명한거리/지역</div>
										<div class="sinfo_line"></div>
										<div class="sinfo_txt" style="padding: 0px">
											<img src="<%=request.getContextPath()%>/css/history/like.png"
												style="height: 20px"> 6 / 10 <span>1개의 평가</span>
										</div>
									</div>
								</div>
								<div class="spot_btn_box">
									<img
										src="<%=request.getContextPath()%>/css/history/map_ico.png"
										alt="" class="spot_btn map_view"
										onclick="set_center(33.51010100,126.48125500)">
								</div>
								<div class="clear"></div>
							</div>
							<div class="sch_content" style="width: 280px;">
								<img
									src="http://img.earthtory.com/img/place_img/312/7505_0_et.jpg"
									alt="" class="spot_img"
									onerror="this.src='/res/img/common/no_img/sight55.png';"
									onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
									style="cursor: pointer;">
								<div class="spot_content_box" style="width: 150px;">
									<div class="spot_name"
										onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
										style="cursor: pointer;">6666</div>
									<div class="spot_info">
										<div class="tag">유명한거리/지역</div>
										<div class="sinfo_line"></div>
										<div class="sinfo_txt" style="padding: 0px">
											<img src="<%=request.getContextPath()%>/css/history/like.png"
												style="height: 20px"> 6 / 10 <span>1개의 평가</span>
										</div>
									</div>
								</div>
								<div class="spot_btn_box">
									<img
										src="<%=request.getContextPath()%>/css/history/map_ico.png"
										alt="" class="spot_btn map_view"
										onclick="set_center(33.51010100,126.48125500)">
								</div>
								<div class="clear"></div>
							</div>
							<div class="sch_content" style="width: 280px;">
								<img
									src="http://img.earthtory.com/img/place_img/312/7505_0_et.jpg"
									alt="" class="spot_img"
									onerror="this.src='/res/img/common/no_img/sight55.png';"
									onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
									style="cursor: pointer;">
								<div class="spot_content_box" style="width: 150px;">
									<div class="spot_name"
										onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
										style="cursor: pointer;">7777</div>
									<div class="spot_info">
										<div class="tag">유명한거리/지역</div>
										<div class="sinfo_line"></div>
										<div class="sinfo_txt" style="padding: 0px">
											<img src="<%=request.getContextPath()%>/css/history/like.png"
												style="height: 20px"> 6 / 10 <span>1개의 평가</span>
										</div>
									</div>
								</div>
								<div class="spot_btn_box">
									<img
										src="<%=request.getContextPath()%>/css/history/map_ico.png"
										alt="" class="spot_btn map_view"
										onclick="set_center(33.51010100,126.48125500)">
								</div>
								<div class="clear"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="group">
					<h3>DAY 2</h3>
					<div>
						<div class="sortable">
							<div class="sch_content" style="width: 280px;">
								<img
									src="http://img.earthtory.com/img/place_img/312/7505_0_et.jpg"
									alt="" class="spot_img"
									onerror="this.src='/res/img/common/no_img/sight55.png';"
									onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
									style="cursor: pointer;">
								<div class="spot_content_box" style="width: 150px;">
									<div class="spot_name"
										onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
										style="cursor: pointer;">용담 해안도로</div>
									<div class="spot_info">
										<div class="tag">유명한거리/지역</div>
										<div class="sinfo_line"></div>
										<div class="sinfo_txt" style="padding: 0px">
											<img src="<%=request.getContextPath()%>/css/history/like.png"
												style="height: 20px"> 6 / 10 <span>1개의 평가</span>
										</div>

									</div>
								</div>
								<div class="spot_btn_box">
									<img
										src="<%=request.getContextPath()%>/css/history/map_ico.png"
										alt="" class="spot_btn map_view"
										onclick="set_center(33.51010100,126.48125500)">

								</div>
								<div class="clear"></div>
							</div>
							<div class="sch_content" style="width: 280px;">
								<img
									src="http://img.earthtory.com/img/place_img/312/7505_0_et.jpg"
									alt="" class="spot_img"
									onerror="this.src='/res/img/common/no_img/sight55.png';"
									onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
									style="cursor: pointer;">
								<div class="spot_content_box" style="width: 150px;">
									<div class="spot_name"
										onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
										style="cursor: pointer;">용담 해안도로</div>
									<div class="spot_info">
										<div class="tag">유명한거리/지역</div>
										<div class="sinfo_line"></div>
										<div class="sinfo_txt" style="padding: 0px">
											<img src="<%=request.getContextPath()%>/css/history/like.png"
												style="height: 20px"> 6 / 10 <span>1개의 평가</span>
										</div>

									</div>
								</div>
								<div class="spot_btn_box">
									<img
										src="<%=request.getContextPath()%>/css/history/map_ico.png"
										alt="" class="spot_btn map_view"
										onclick="set_center(33.51010100,126.48125500)">

								</div>
								<div class="clear"></div>
							</div>
							<div class="sch_content" style="width: 280px;">
								<img
									src="http://img.earthtory.com/img/place_img/312/7505_0_et.jpg"
									alt="" class="spot_img"
									onerror="this.src='/res/img/common/no_img/sight55.png';"
									onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
									style="cursor: pointer;">
								<div class="spot_content_box" style="width: 150px;">
									<div class="spot_name"
										onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
										style="cursor: pointer;">용담 해안도로</div>
									<div class="spot_info">
										<div class="tag">유명한거리/지역</div>
										<div class="sinfo_line"></div>
										<div class="sinfo_txt" style="padding: 0px">
											<img src="<%=request.getContextPath()%>/css/history/like.png"
												style="height: 20px"> 6 / 10 <span>1개의 평가</span>
										</div>

									</div>
								</div>
								<div class="spot_btn_box">
									<img
										src="<%=request.getContextPath()%>/css/history/map_ico.png"
										alt="" class="spot_btn map_view"
										onclick="set_center(33.51010100,126.48125500)">

								</div>
								<div class="clear"></div>
							</div>

						</div>
					</div>
				</div>
				<div class="group">
					<h3>DAY 3</h3>
					<div>
						<ul class="sortable">
							<li class="ui-state-default"><span
								class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 1</li>
							<li class="ui-state-default"><span
								class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 2</li>
							<li class="ui-state-default"><span
								class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 3</li>
							<li class="ui-state-default"><span
								class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 4</li>
							<li class="ui-state-default"><span
								class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 5</li>
							<li class="ui-state-default"><span
								class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 6</li>
							<li class="ui-state-default"><span
								class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 7</li>
						</ul>
					</div>
				</div>
				<div class="group">
					<h3>DAY 4</h3>
					<div>
						<ul class="sortable">
							<li class="ui-state-default"><span
								class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 1</li>
							<li class="ui-state-default"><span
								class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 2</li>
							<li class="ui-state-default"><span
								class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 3</li>
							<li class="ui-state-default"><span
								class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 4</li>
							<li class="ui-state-default"><span
								class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 5</li>
							<li class="ui-state-default"><span
								class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 6</li>
							<li class="ui-state-default"><span
								class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 7</li>
						</ul>
					</div>
				</div>
			</div>
		</div>


	</div>







	<%------------------------------후기 작성 부분----------------------------------------%>
	<div class="container" align="center">
		<div class="row">
			<div class="col-md-6">
				<div class="card">
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a href="#root"
							aria-controls="root" role="tab" data-toggle="tab">루트 후기 작성</a></li>
						<li role="presentation"><a href="#site" aria-controls="site"
							role="tab" data-toggle="tab">여행지 후기 작성</a></li>
					</ul>

					<!-- Tab panes -->
					<div class="tab-content">
						<%------------------------------루트 후기 작성 ----------------------------------------%>
						<div role="tabpanel" class="tab-pane active" id="root">
							<input type="text" class="form-control" placeholder="제목"><br>
							<textarea name="" class="form-control" id="" cols="30" rows="7"
								placeholder="후기"></textarea>
							<br> <input type="text" class="form-control"
								placeholder="태그"><br>
							<div align="center">
								<input type="submit" value="작성 완료"
									class="btn btn-primary btn-block">
							</div>
						</div>
						<%------------------------------여행지 후기 작성----------------------------------------%>
						<div role="tabpanel" class="tab-pane" id="site">
							<div class="wrap-upload-buttons">
								<div class="container" align="center">
									<ul class="btn-nav">
										<li><span><img
												src="images/PostScript/landscape.png" /><input type="file"
												name="" click-type="type1" class="picupload" multiple
												accept="image/*" /></span></li>
									</ul>
								</div>
							</div>


							<!--boostatrp modal-->
							<div class="modal fade popups" id="hint_brand" role="dialog"
								aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content clearfix">
										<div class="modal-body login-box clearfix">

											<!--user post text -wrap end-->
											<ul id="media-list" class="clearfix">
												<li class="myupload"><span><i class="fa fa-plus"
														aria-hidden="true"></i><input type="file"
														click-type="type2" id="picupload" class="picupload"
														multiple></span></li>
											</ul>

											<!--post btn wrap-->
											<div class="user-post-btn-wrap clearfix">
												<input type="submit" class="btn" value="사진 등록">
											</div>
											<!--post btn wrap end-->
										</div>
									</div>
								</div>
							</div>
							<br> <input type="text" class="form-control"
								placeholder="제목"><br>
							<textarea name="" class="form-control" id="" cols="30" rows="7"
								placeholder="후기"></textarea>
							<br>
							<div class="checkbox">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<img alt="" src="images/PostScript/003-sun.png" width="30">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<label class="checkbox-bootstrap checkbox-lg"> <input
									name="aaa" type="checkbox" value="1"
									onclick="doOpenCheck(this);"> <span
									class="checkbox-placeholder"></span> 맑음
								</label>&nbsp;&nbsp;&nbsp; <label class="checkbox-bootstrap checkbox-lg">
									<input name="aaa" type="checkbox" value="2"
									onclick="doOpenCheck(this);"> <span
									class="checkbox-placeholder"></span> 흐림
								</label>&nbsp;&nbsp;&nbsp;<label class="checkbox-bootstrap checkbox-lg">
									<input name="aaa" type="checkbox" value="3"
									onclick="doOpenCheck(this);"> <span
									class="checkbox-placeholder"></span> 우중충
								</label>
							</div>
							<br>
							<div class="checkbox">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<img alt="" src="images/PostScript/002-money.png" width="30">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<label class="checkbox-bootstrap checkbox-lg"> <input
									name="bbb" type="checkbox" value="1"
									onclick="doOpenCheck2(this);"> <span
									class="checkbox-placeholder"></span> 부족
								</label>&nbsp;&nbsp;&nbsp; <label class="checkbox-bootstrap checkbox-lg">
									<input name="bbb" type="checkbox" value="2"
									onclick="doOpenCheck2(this);"> <span
									class="checkbox-placeholder"></span> 적당
								</label>&nbsp;&nbsp;&nbsp;<label class="checkbox-bootstrap checkbox-lg">
									<input name="bbb" type="checkbox" value="3"
									onclick="doOpenCheck2(this);"> <span
									class="checkbox-placeholder"></span> 풍족
								</label>
							</div>
							<br>
							<div class="checkbox">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<img alt="" src="images/PostScript/001-hospital.png" width="30">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<label class="checkbox-bootstrap checkbox-lg"> <input
									name="ccc" type="checkbox" value="1"
									onclick="doOpenCheck3(this);"> <span
									class="checkbox-placeholder"></span> 양호
								</label>&nbsp;&nbsp;&nbsp; <label class="checkbox-bootstrap checkbox-lg">
									<input name="ccc" type="checkbox" value="2"
									onclick="doOpenCheck3(this);"> <span
									class="checkbox-placeholder"></span> 쏘쏘
								</label>&nbsp;&nbsp;&nbsp;<label class="checkbox-bootstrap checkbox-lg">
									<input name="ccc" type="checkbox" value="3"
									onclick="doOpenCheck3(this);"> <span
									class="checkbox-placeholder"></span> 악화
								</label>
							</div>
							<br>
							<div align="center">
								<input type="submit" value="작성 완료"
									class="btn btn-primary btn-block">
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
	var _gaq = _gaq || [];
	_gaq.push([ '_setAccount', 'UA-36251023-1' ]);
	_gaq.push([ '_setDomainName', 'jqueryscript.net' ]);
	_gaq.push([ '_trackPageview' ]);

	(function() {
		var ga = document.createElement('script');
		ga.type = 'text/javascript';
		ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl'
				: 'http://www')
				+ '.google-analytics.com/ga.js';
		var s = document.getElementsByTagName('script')[0];
		s.parentNode.insertBefore(ga, s);
	})();
</script>