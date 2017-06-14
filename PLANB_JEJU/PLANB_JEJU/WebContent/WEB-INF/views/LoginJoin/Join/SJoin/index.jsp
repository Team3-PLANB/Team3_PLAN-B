<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="/resources/demos/external/jquery-mousewheel/jquery.mousewheel.js"></script>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- html2canvas 연습 -->
<link>

<!-- 상세보기 일정 -->

<style>
	.sortable { font-size:10px; list-style-type: none; margin: 0; padding: 0; width: 60%;  width:200px; }
	.sortable li { margin: 3px; padding: 0.4em; padding-left: 1.5em; font-size: 1.4em; height: 40px; }
	.sortable li span { position: absolute; margin-left: -1.3em;}
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
	.spinner{
		padding:10px;
		width:30px;
		height:15px;
	}
	.group{
		width:80%;
		margin:15px;
	}
  	
</style>

<script>

	$(document).ready(function() {
		$('#schedulebox').animate({
	        width: '+=380px'
		});
		$('#schedulebox2').animate({
	        width: '+=30%'
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

		$("#accordion")
		.accordion({
			collapsible : true,
			header : ".day_info_box"
		})
		.sortable({
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
		$("#accordion2")
		.accordion({
			collapsible : true,
			header : "> div > h3"
		})
		.sortable({
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
    
<link rel="shortcut icon" href="favicon.ico">

<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>
	
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/icomoon.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/bootstrap.css">
<!-- Superfish -->
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/superfish.css">
<!-- histroy css -->
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/history.css">


<%-- <div class="page_left" style="padding:0px;">
	<div style="height:650px;width:0px;overflow:scroll;" id="schedulebox" >
		<div id="accordion">
			<div class="day_box" data-id="1" > 
				<div class="day_info_box" >
					<div class="day_txt" >DAY1</div>
					<div class="day_info" style="float:left;">
						<div class="day_title"style="margin:15px;">2017.06.12(월)</div>
					</div>
				</div> 
				<div class="clear"></div>
				<ul class="sortable" >
					<li>
						<div class="day_sch_box" data-id="1-1" style="width:350px;">
							<div class="day_sch_num" style="width:40px;height:50px;">
								<div class="sch_num" style="margin-top:30px;">1</div>
							</div>
							<div class="sch_content" style="width:300px;">
								<img src="http://img.earthtory.com/img/place_img/312/7505_0_et.jpg"
									alt="" class="spot_img"
									onerror="this.src='/res/img/common/no_img/sight55.png';"
									onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
									style="cursor: pointer;">
								<div class="spot_content_box" style="width:150px;">
									<div class="spot_name"
										onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
										style="cursor: pointer;">용담 해안도로</div>
									<div class="spot_info">
										<div class="tag">유명한거리/지역</div>
										<div class="sinfo_line"></div>
										<div class="sinfo_txt" style="padding:0px">
										<img src="<%= request.getContextPath() %>/css/history/like.png" style="height : 20px">
											6 / 10 <span>1개의 평가</span>
										</div>
										
									</div>
								</div>
								<div class="spot_btn_box">
									<img src="<%= request.getContextPath() %>/css/history/map_ico.png" alt="" class="spot_btn map_view" onclick="set_center(33.51010100,126.48125500)">
									
								</div>
								<div class="clear"></div>
							</div>
							
							<div class="sch_add_content">
								<div class="sch_price hide" data-srl="1-1"></div>
								<div class="sch_memo"
									data-full="&nbsp;<span class='memo_more' data-op='min'>닫기</span>"
									data-min="" data-srl="1-1"></div>	
							</div>					
						</div>
					</li>
					
					<div class="day_sch_distance" style="padding-left:50px;">
					<img src="<%= request.getContextPath() %>/css/history/down.png" style="height:20px;">
						<a>&emsp;&emsp;&emsp;&emsp;  11.16km 추천경로</a>
					</div>
					<li>
						<div class="day_sch_box" data-id="1-2" style="width:350px;">
							<div class="day_sch_num" style="width:40px;height:50px;">
								<div class="sch_num" style="margin-top:30px;">2</div>
							</div>
							<div class="sch_content" style="width:300px;">
								<img src="http://img.earthtory.com/img/place_img/312/7504_0_et.jpg"
									alt="" class="spot_img"
									onerror="this.src='/res/img/common/no_img/sight55.png';"
									onclick="window.open('/ko/city/jeju_312/attraction/aewol-ocean-road_7504');"
									style="cursor: pointer;">
								<div class="spot_content_box" style="width:150px;">
									<div class="spot_name"
										onclick="window.open('/ko/city/jeju_312/attraction/aewol-ocean-road_7504');"
										style="cursor: pointer;">애월 해안도로</div>
									<div class="spot_info">
										<div class="tag">유명한거리/지역</div>
										<div class="sinfo_line"></div>
										<div class="sinfo_txt" style="padding:0px">
										<img src="<%= request.getContextPath() %>/css/history/like.png" style="height : 20px">
											8 / 10 <span>4개의 평가</span>
										</div>
									</div>
								</div>
								<div class="spot_btn_box">
									<img src="<%= request.getContextPath() %>/css/history/map_ico.png" alt=""
										class="spot_btn map_view" onclick="set_center(33.47822600,126.36708100)">
									
								</div>
							</div>
							<div class="clear"></div>
							<div class="sch_add_content">
								<div class="sch_price hide" data-srl="1-2"></div>
								<div class="sch_memo"
									data-full="&nbsp;<span class='memo_more' data-op='min'>닫기</span>"
									data-min="" data-srl="1-2"></div>
							</div>
							
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div> --%>







<div style="height:550px; margin:10px; overflow:scroll; width:100px;" id="schedulebox2"><!-- overflow:scroll; 이거 <--- 스크롤 생기는거 필요시 추가 -->
	
	<div id="accordion2">
		<div class="group" >
			<h3>DAY 1</h3>
			<div>
				<div class="sortable" >
				 	<div class="ui-state-default" style="width:300px;">
						<img src="http://img.earthtory.com/img/place_img/312/7505_0_et.jpg"
							alt="" class="spot_img"
							onerror="this.src='/res/img/common/no_img/sight55.png';"
							onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
							style="cursor: pointer;">
						<div class="spot_content_box" style="width:150px;">
							<div class="spot_name"
								onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
								style="cursor: pointer;">11111111</div>
							<div class="spot_info">
								<div class="tag">유명한거리/지역</div>
								<div class="sinfo_line"></div>
								<div class="sinfo_txt" style="padding:0px">
								<img src="<%= request.getContextPath() %>/css/history/like.png" style="height : 20px">
									6 / 10 <span>1개의 평가</span>
								</div>
							</div>
						</div>
						<div class="spot_btn_box">
							<img src="<%= request.getContextPath() %>/css/history/map_ico.png" alt="" class="spot_btn map_view" onclick="set_center(33.51010100,126.48125500)">
						</div>
					<div class="clear"></div>
				</div>
					  	<div class="ui-state-default" style="width:300px;">
						<img src="http://img.earthtory.com/img/place_img/312/7505_0_et.jpg"
							alt="" class="spot_img"
							onerror="this.src='/res/img/common/no_img/sight55.png';"
							onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
							style="cursor: pointer;">
						<div class="spot_content_box" style="width:150px;">
							<div class="spot_name"
								onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
								style="cursor: pointer;">2222222222</div>
							<div class="spot_info">
								<div class="tag">유명한거리/지역</div>
								<div class="sinfo_line"></div>
								<div class="sinfo_txt" style="padding:0px">
								<img src="<%= request.getContextPath() %>/css/history/like.png" style="height : 20px">
									6 / 10 <span>1개의 평가</span>
								</div>
							</div>
						</div>
						<div class="spot_btn_box">
							<img src="<%= request.getContextPath() %>/css/history/map_ico.png" alt="" class="spot_btn map_view" onclick="set_center(33.51010100,126.48125500)">
						</div>
					<div class="clear"></div>
				</div>
					  <div class="ui-state-default" style="width:300px;">
						<img src="http://img.earthtory.com/img/place_img/312/7505_0_et.jpg"
							alt="" class="spot_img"
							onerror="this.src='/res/img/common/no_img/sight55.png';"
							onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
							style="cursor: pointer;">
						<div class="spot_content_box" style="width:150px;">
							<div class="spot_name"
								onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
								style="cursor: pointer;">3333333</div>
							<div class="spot_info">
								<div class="tag">유명한거리/지역</div>
								<div class="sinfo_line"></div>
								<div class="sinfo_txt" style="padding:0px">
								<img src="<%= request.getContextPath() %>/css/history/like.png" style="height : 20px">
									6 / 10 <span>1개의 평가</span>
								</div>
							</div>
						</div>
						<div class="spot_btn_box">
							<img src="<%= request.getContextPath() %>/css/history/map_ico.png" alt="" class="spot_btn map_view" onclick="set_center(33.51010100,126.48125500)">
						</div>
					<div class="clear"></div>
				</div>
					  <div class="ui-state-default" style="width:300px;">
						<img src="http://img.earthtory.com/img/place_img/312/7505_0_et.jpg"
							alt="" class="spot_img"
							onerror="this.src='/res/img/common/no_img/sight55.png';"
							onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
							style="cursor: pointer;">
						<div class="spot_content_box" style="width:150px;">
							<div class="spot_name"
								onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
								style="cursor: pointer;">444444444</div>
							<div class="spot_info">
								<div class="tag">유명한거리/지역</div>
								<div class="sinfo_line"></div>
								<div class="sinfo_txt" style="padding:0px">
								<img src="<%= request.getContextPath() %>/css/history/like.png" style="height : 20px">
									6 / 10 <span>1개의 평가</span>
								</div>
							</div>
						</div>
						<div class="spot_btn_box">
							<img src="<%= request.getContextPath() %>/css/history/map_ico.png" alt="" class="spot_btn map_view" onclick="set_center(33.51010100,126.48125500)">
						</div>
					<div class="clear"></div>
				</div>
				
				<!-- 이새끼 쓰면 아이템쪽에 화살표 생김 <span class="ui-icon ui-icon-arrowthick-2-n-s"></span> -->
					  <li class="ui-state-default">Item 5</li>
					  <li class="ui-state-default">Item 6</li>
					  <li class="ui-state-default">Item 7</li>
					</ul>
				</div>
			</div>
			<div class="group">
				<h3>Section 2</h3>
				<div>
					<ul class="sortable" >
					  <li class="ui-state-default">Item 1</li>
					  <li class="ui-state-default">Item 2</li>
					  <li class="ui-state-default">Item 3</li>
					  <li class="ui-state-default">Item 4</li>
					  <li class="ui-state-default">Item 5</li>
					  <li class="ui-state-default">Item 6</li>
					  <li class="ui-state-default">Item 7</li>
					</ul>
				</div>
			</div>
			<div class="group">
				<h3>Section 3</h3>
				<div>
					<ul class="sortable" >
					  <li class="ui-state-default">Item 1</li>
					  <li class="ui-state-default">Item 2</li>
					  <li class="ui-state-default">Item 3</li>
					  <li class="ui-state-default">Item 4</li>
					  <li class="ui-state-default">Item 5</li>
					  <li class="ui-state-default">Item 6</li>
					  <li class="ui-state-default">Item 7</li>
					</ul>
				</div>
			</div>
			<div class="group">
				<h3>Section 4</h3>
				<div>
					<ul class="sortable" >
					  <li class="ui-state-default">Item 1</li>
					  <li class="ui-state-default">Item 2</li>
					  <li class="ui-state-default">Item 3</li>
					  <li class="ui-state-default">Item 4</li>
					  <li class="ui-state-default">Item 5</li>
					  <li class="ui-state-default">Item 6</li>
					  <li class="ui-state-default">Item 7</li>
					</ul>
				</div>
			</div>
		</div>
		
		<input class="spinner" name="during" value="0">분
	</div>
	
</div>