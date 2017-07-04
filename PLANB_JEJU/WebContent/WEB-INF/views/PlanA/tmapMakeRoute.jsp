<%--
@Project : PLANB_JEJU
@File name : tmapMakeRoute.jsp 
@Author : 강나영, 이준성, 임정연
@Data : 2017.06.19
@Desc : 일정 만들기
--%>



<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
<script
	src="https://apis.skplanetx.com/tmap/js?version=1&format=javascript&appKey=ce6f02bc-1480-3fc6-9622-5a2fb5dc009d"></script>

<link rel="stylesheet" href="css/plana_tmap.css">

<!-- html2canvas : jquery.js위에-->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/html2canvas.js"></script>

<!-- Start : 일정부분 적용 링크 -->


<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="shortcut icon" href="favicon.ico">

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<!-- Icomo

 Icon Fonts-->
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
	
	
	
	
<!-- 모달 CSS -->
<!-- <link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
<link rel="stylesheet" href="message/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="message/css/form-elements.css">
<link rel="stylesheet" href="message/css/style.css">  -->

<!-- 모달 Favicon and touch icons -->
<link rel="shortcut icon" href="message/ico/favicon.png">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="message/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="message/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="message/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="message/ico/apple-touch-icon-57-precomposed.png">

<!-- End : 일정부분 적용 링크 -->

<%----------------------------------지도 부분 스크립트----------------------------------------%>
  
<script type="text/javascript">
$( function() {
	var lonlat; 
	
	// 서버에서 넘어온 User의 여행 설정 정보
	route_code = ${requestScope.myRouteInfo.route_code};
	username = '${requestScope.myRouteInfo.username}';
	routename = '${requestScope.myRouteInfo.routename}';
	partner_code = '${requestScope.myRouteInfo.partner_code}';
	
	// 여행 이름 표시
	$('#routename').val(routename);
		
	// 서버에서 넘어온 날짜 담을 배열  
	dayList = [];
	
	// 서버에서 넘어온 날짜List 배열로 저장
	<c:forEach var="item" items="${requestScope.datesList}" varStatus="num"> 
		dayList.push('${item}');
	</c:forEach>

	
	// 여행지 담을 날짜별 div태그(sortable) 생성 함수 호출
	initSortableDiv();
	
	// 전역변수 루트 선택 시 초기화
	routeDetailList = [];
	
	// routeDetailList에서 선택 된 경로만 customizedRouteList로 초기화 작업 필요
	customizedRouteList = [];

	// map 초기화 함수 호출
	init();
	
	// route_site_delete_tag 클릭 : 클릭한 객체 sortable 컨테이너에서 삭제
	$(document).on("click",".route_site_delete_tag", function(event){ 
		
		// 클릭 객체 제거
		$(event.target).parent().parent().parent().remove();
		
		// 해당 마커 지도에서 삭제
		var SiteId = $(event.target).parent().parent().parent().attr('id');
		deleteMarker(SiteId);	
		
		// 라인 삭제
		deleteRouteLine();
		
		// 라인 다시 그리기
		drawRouteLine();
		
		// sortable 수동 함수 호출
		$('.sortable').trigger('sortupdate');
		
       
  	});
	
	// 여행지 검색 버튼 클릭
	$("#searchSiteBtn").on("click", function() {
		// Tmap POI 호출 로직
    	searchPOI();
		
		// 검색 값 변수에 담기
		searchWordVal = $("#searchWord").val();
		
    	// input 태그 값
		$("#searchWord").val('');
	});


	// 일정 submit button
	$(document).on("click","#submit_route_detail", function(event){
				
		  var lastcustomizedRouteList = $('.sortable').find('.sch_content').map(function(i, el) {
		        return $(el).data('sitedata')
	      }).get()
	      
	     // console.log(JSON.stringify(lastcustomizedRouteList));
	      	  
		  // 현재 저장되어 있는 data empty
		  $('#route_list_form_innerdiv').empty();
		  
		  //submit 할 때 보낼 경로 정보 reload - form 태그 안에 hidden input 값으로 추가
		  $.each(lastcustomizedRouteList, function( index, value ) {
			
			    var $route_order = $("<input type='hidden' name='routeDetailList["+index+"].route_order' value="+(value.route_order)+">");
				var $username = $("<input type='hidden' name='routeDetailList["+index+"].username' value='"+value.username+"'>");
				var $route_code = $("<input type='hidden' name='routeDetailList["+index+"].route_code' value="+value.route_code+">");
				var $route_date = $("<input type='hidden' name='routeDetailList["+index+"].route_date' value='"+value.route_date+"'>");
				var $site = $("<input type='hidden' name='routeDetailList["+index+"].site' value='"+value.site+"'>");
				var $lon = $("<input type='hidden' name='routeDetailList["+index+"].lon' value='"+value.lon+"'>");
				var $lat = $("<input type='hidden' name='routeDetailList["+index+"].lat' value='"+value.lat+"'>");
				var $category = $("<input type='hidden' name='routeDetailList["+index+"].category' value='"+value.category+"'>");
				var $stime = $("<input type='hidden' name='routeDetailList["+index+"].stime' value="+value.stime+">");
				var $etime = $("<input type='hidden' name='routeDetailList["+index+"].etime' value="+value.etime+">");
				
				$('#route_list_form_innerdiv').append($route_order).append($username).append($route_code).append($route_date).append($site).append($lon).append($lat).append($category).append($stime).append($etime);
						
			});
		  
		  $('#route_list_form').submit();
       
  	});
		
 });
 
 
 	//Tmap POI
 	function addMarker(options){
 		
	    var size = new Tmap.Size(12,19);
	    var offset = new Tmap.Pixel(-(size.w/2), -size.h);
	    var icon = new Tmap.Icon("https://developers.skplanetx.com/upload/tmap/marker/pin_b_s_simple.png",size,offset);
	    var marker = new Tmap.Markers(options.lonlat,icon,options.label);
	    poi_markerLayer.addMarker(marker);
	    marker.events.register("mouseover", marker, onOverMouse);
	    marker.events.register("mouseout", marker, onOutMouse);
	    marker.idString = options.id;
	    marker.events.register("click", marker, onClickMouse);
	}
	function onOverMouse(e){
	    this.popup.show();
	}
	function onOutMouse(e){
	    this.popup.hide();
	}
	// 마커 클릭
	function onClickMouse(e){
		
		// 마커 삭제 this.destroy();
		sch_content_layer.clearMarkers();
		
		// 마커와 일치하는 div찾아서 연결, 마커의 라벨값 -> div의  id값과 같음 
		var markerLabel = '#'+this.labelHtml;
		
		
		var markerLabelVal = this.labelHtml;
		var markerLonLat = new Tmap.LonLat(this.lonlat.lon, this.lonlat.lat).transform(pr_3857, pr_4326); // 저장된 좌표 처럼 변경 33. 140처럼
		var markerId = this.idString;	
		
				
		//검색 값 넣기
		$(".ui-accordion-content").each(function(){  //ui-accordion-content 포문
			
		
			var id_hidden =$(this).attr("aria-hidden"); // this() .attr(속성)을 
			
			if(id_hidden == "false"){ //열려있는 div 이면
				var id = $(this).attr("id");
				
				
				var sitedataVal;
				var newsitedataVal =[];
				var contentNum=0;
				// map으로 만들어서 안에 sch_content가 있을 때와 없을 때 경우 나눠 값 설정
				schcontentSizeMap = $(this).find('.sch_content').map(function(i, el) {
						        return $(el).data('sitedata')
				}).get()
				
				// 해당 날짜 div 에 sch_content가 없을 경우
				if(schcontentSizeMap.length==0){
					newsitedataVal.push({
						"route_code" : preSitedataVal.route_code,
						"username" : preSitedataVal.username,
						"route_order" : 1,
						"route_date" : id,
						"site" : markerId,
						"lon" : markerLonLat.lon,
						"lat" : markerLonLat.lat,
						"category" : '기타',
						"stime" : '',
						"etime" : ''
					});
					
				}else{
					$(this).find('.sch_content').each(function(i, el) { // date값, routecode, username, order가져오기 위해서 
						sitedataVal =  $(el).data('sitedata');
						contentNum++;
				      });
					console.log('contentNum값');
					console.log(contentNum);
					newsitedataVal.push({
						"route_code" : sitedataVal.route_code,
						"username" : sitedataVal.username,
						"route_order" : contentNum+1,
						"route_date" : sitedataVal.route_date,
						"site" : markerId,
						"lon" : markerLonLat.lon,
						"lat" : markerLonLat.lat,
						"category" : '기타',
						"stime" : '',
						"etime" : ''
					});
				}
				
				
				
				
				
				
				
				 	      
			      
				var $sch_content = $( "<div class='sch_content' id='"+markerId+"' style='width: 250px;' onclick='sch_contentClick(this)'></div>" );
				var $content_img = $("<img src='${pageContext.request.contextPath}/images/category/Z0101.JPG' class='spot_img' style='cursor: pointer;' onclick='sch_contentClick(this)'>");
				var $spot_content_box = $("<div class='spot_content_box' style='width: 150px;'></div>");
				var $spot_name = $("<div class='spot_name' style='cursor: pointer; '><div class='order' style='cursor: pointer; float:left; padding-right:8px'>"+(contentNum+1)+"</div><div class='tag' style='float: left; width:120px; text-align:center; border: 1px solid #de9541;'>"+markerId+"</div></div>");
				var $spot_info = $("<div class='spot_info'></div>");
				/* var $tag = $("<div class='tag'>"+markerId+"</div><br>"); */
				var $sinfo_line = $("<div class='sinfo_line'></div>");
				var $sinfo_txt = $("<div class='sinfo_txt' style='padding: 0px; padding-left:15px;'></div>");
				var $sinfo_txt_img = $("<span>"+searchWordVal+"</span>");
				<%-- var $sinfo_txt_img = $("<img src='<%=request.getContextPath()%>/css/history/like.png' style='height: 20px'> 6 / 10 <span>좋아요</span>"); --%> 
				var $delete_tag = $("<div class='tag route_site_delete_tag' style='float:right; background: #ff6535; border: 1px solid #ff6535; color: #ffffff;'>X</div>");
				
				// div에 data값 처리
				$sch_content.data('sitedata', newsitedataVal[0]);
				
				
				 $sinfo_txt_img.appendTo($sinfo_txt); 
				 
				 
				 //$tag.appendTo($spot_info);
				 $sinfo_line.appendTo($spot_info);
				 $sinfo_txt.appendTo($spot_info);
				 $delete_tag.appendTo($spot_info);
				 
				 $spot_name.appendTo($spot_content_box);
				 $spot_info.appendTo($spot_content_box);
				 
				 $content_img.appendTo($sch_content);
				 $spot_content_box.appendTo($sch_content);
			
				
				
				$("#"+id+" .sortable").append($sch_content);
				
				//찍어보기
				/* $(this).find('.sch_content').each(function(i, el) { // date값, routecode, username, order가져오기 위해서 
					console.log($(el).data('sitedata'));
					sitedataVal =  $(el).data('sitedata');
					
			      }); */
				
				//copedsitedataVal = sitedataVal; // 값 넣기
			      
			     /*  sitedataVal.category='기타';
			      sitedataVal.etime='';
			      sitedataVal.stime='';
			      sitedataVal.route_order=$(contentNum);
			      sitedataVal.site=markerId;
			      sitedataVal.lon=markerLonLat.lon;
			      sitedataVal.lat=markerLonLat.lat;  */
			      
				
			}else{
				//shc_content가 없는 div의 정보 추가를 위해 그 전 div의 값 저장
				$(this).find('.sch_content').each(function(i, el) { // date값, routecode, username, order가져오기 위해서 
					preSitedataVal =  $(el).data('sitedata');
			      });
			}
			
		});
		
	    //getDataFromId(this.idString);
	    
	 	// 지도 : 마커 추가
		var options = {
            label:new Tmap.Label(markerLabelVal),
            lonlat:new Tmap.LonLat(markerLonLat.lon,markerLonLat.lat).transform(pr_4326, pr_3857),
            id:'Route'
        };
		 addRouteMarker(options);
		 drawRouteLine();
	}
	// 검색 함수 getPOIDataFromSearch()
	function searchPOI(){
		
		
	    tdata = new Tmap.TData();
	    tdata.events.register("onComplete", tdata, onCompleteTData);
	    var center = map.getCenter();
	    tdata.getPOIDataFromSearch(encodeURIComponent($("#searchWord").val()), {centerLon:center.lon, centerLat:center.lat});
	}
	
	function onCompleteTData(e){
		//이전 검색결과 마커 삭제
		poi_markerLayer.clearMarkers();
		
	    if(jQuery(this.responseXML).find("searchPoiInfo pois poi").text() != ''){
	        jQuery(this.responseXML).find("searchPoiInfo pois poi").each(function(){
	            var name = $(this).find("name").text();
	            var telNo = $(this).find("telNo").text();
	            var Addr = $(this).find("middleAddrName").text()+" "+$(this).find("lowerAddrName").text()+" "+$(this).find("detailAddrName").text();
	            var type = $(this).find("middleBizName").text();
	            var id = $(this).find("id").text();
	            var lon = $(this).find("frontLon").text();
	            var lat = $(this).find("frontLat").text();
	            var options = {
	                /* label : 각 정보 보여줄 div 디자인 삽입 */
	                label:new Tmap.Label('<div style="background-color: ivory"><a class="btn btn-defalut">'+name+'</a><br><a class="btn btn-defalut">'+telNo+'</a><br><a class="btn btn-defalut">'+Addr+'</a><br><a class="btn btn-defalut">'+type+'</a></div>'),
	                lonlat:new Tmap.LonLat(lon, lat),
	                /* id : div에 site이름 띄어주려고 name값 저장 */
	                id:name
	            };
	            addMarker(options);
	        });
	    }else {
	        alert('검색결과가 없습니다.');
	    }
	    map.zoomToExtent(poi_markerLayer.getDataExtent());
	    tdata.events.unregister("onComplete", tdata, onCompleteTData);
	}
	
	function getDataFromId(id){
		
	    tdata = new Tmap.TData();
	    tdata.events.register("onComplete", tdata, onCompleteTDataID);
	    tdata.getPOIDataFromId(id);
	}
	
	function onCompleteTDataID(e){
	    if(jQuery(this.responseXML).find("poiDetailInfo").text() != ''){
	        jQuery(this.responseXML).find("poiDetailInfo").each(function(){
	            var name = jQuery(this).text();
	        });
	    }else {
	        alert('검색결과가 없습니다.');
	    }
	    tdata.events.unregister("onComplete", tdata, onCompleteTDataID);
	}
	
	
	function addRouteMarker(options){
 		
	    var size = new Tmap.Size(12,19);
	    var offset = new Tmap.Pixel(-(size.w/2), -size.h);
	    var icon = new Tmap.Icon("https://developers.skplanetx.com/upload/tmap/marker/pin_b_s_simple.png",size,offset);
	    var marker = new Tmap.Markers(options.lonlat,icon,options.label);
	    markerLayer.addMarker(marker);
	    marker.events.register("mouseover", marker, onOverMouse);
	    marker.events.register("mouseout", marker, onOutMouse);
	    marker.idString = options.id;
	   /*  marker.events.register("click", marker, onClickMouse); */
	}
	
	function addSchContentMarkers(options){
		
	    var size = new Tmap.Size(18,27); 
	    var offset = new Tmap.Pixel(-(size.w/2), -size.h);
	    /* 큰 마커 : var icon = new Tmap.Icon("https://developers.skplanetx.com/upload/tmap/marker/pin_b_s_simple.png",size,offset);  */
	    var icon = new Tmap.IconHtml("<img src= 'https://developers.skplanetx.com/upload/tmap/marker/pin_b_m_a.png'></img>", size, offset); 

	    var marker = new Tmap.Markers(options.lonlat,icon,options.label);
	    sch_content_layer.addMarker(marker);
	    
	    marker.popup.show();
	    
	    marker.events.register("mouseover", marker, onOverMouse);
	    marker.events.register("mouseout", marker, onOutMouse);
	      	    
	}
	
	//여행지 담을 날짜별 div태그 생성 함수
 	function initSortableDiv(){
		var routedate;
		var dayOrder=0;
	
  		// 서버에서 리턴된 날짜 배열 객채 -> 날짜 별 박스 하나씩 만들기
		$( dayList ).each(function( index, element ) {
			
	 		if(routedate!=element){
	     		routedate = element;
	     		++dayOrder;
	     		
	     		// Day 드래그 박스 추가
	     		/* html에 붙는 구조 : 
	     		   <div class="group" style="width: 280px;">
	     				<h3 class="ui-accordion-header ui-corner-top ui-state-default ui-accordion-header-active ui-state-active ui-accordion-icons">Day'+dayOrder+'</h3>
		     				<div class="ui-accordion-content ui-corner-bottom ui-helper-reset ui-widget-content ui-accordion-content-active">
		     					<div class="sortable" id="ScheduleDay'+dayOrder+'">
		     					</div>	
		     				</div>
	     			</div> */
	     		
	     		
	     		var $group = $("<div class='group' style='width: 280px;'></div>");
	     		var $h3 = $("<h3 class='ui-accordion-header ui-corner-top ui-state-default ui-accordion-header-active ui-state-active ui-accordion-icons' style='background: #F78536; border: 1px solid #F78536;'>Day"+dayOrder+"  :  "+element+"</h3>");
	     		var $div = $("<div class='ui-accordion-content ui-corner-bottom ui-helper-reset ui-widget-content ui-accordion-content-active'></div>");
	     		var $sortablediv = $("<div class='sortable' id='ScheduleDay"+dayOrder+"'></div>");
	     		
	     		$sortablediv.appendTo($div);
	     		$group.append($h3).append($div);
	     		$('#accordion2').append($group);
	     		
	     		
	     	}
		});
 		
 	}
        
	//초기화 함수
    function init(){
        	//pr_3857 인스탄스 생성. (Google Mercator)
			pr_3857 = new Tmap.Projection("EPSG:3857");
			 
			//pr_4326 인스탄스 생성. (WGS84 GEO)
			pr_4326 = new Tmap.Projection("EPSG:4326");
			
            //중심 좌표 : 제주 공항
            centerLL = new Tmap.LonLat(14085866.64992, 3963136.5754785);
			//map 생성
            map = new Tmap.Map({div:'map_div', 
                                width:'100%', 
                                height:'610px',
                                transitionEffect:"resize",
                                animation:true
                            }); 
            
           
            
            map.setCenter(centerLL,10);/* 센터값, 11 : 지도 표현 범위(10 : 제주도 전체) */
                 
            map.addControl(new Tmap.Control.MousePosition());/* 마우스 오버에 좌표값 표시 함수*/
            
            //map.events.register("click", map, onClickMap)//813줄 함수 제거할 것
            
            
            // 라인 그리는 레이어
            vector_layer = new Tmap.Layer.Vector('Tmap Vector Layer');
            
        	// poi 마커 레이어
       	 	poi_markerLayer = new Tmap.Layer.Markers('poi MarkerLayer');
        	
       		// 여행 루트 마커 레이어
            markerLayer = new Tmap.Layer.Markers('markerLayer');
       		
       		// 여행 루트 중 Day별 줌 레이어
       		sch_content_layer = new Tmap.Layer.Markers('day markerLayer');
        	
       		// 레이어 배열로 add
    		map.addLayers([vector_layer, markerLayer,poi_markerLayer,sch_content_layer]); 
            
    	
            /* searchRoute(); */
            
            
            <c:choose>
				<c:when test="${requestScope.pageCase=='routeDetailPage'}">
					
				 </c:when>
				
				<c:when test="${requestScope.pageCase=='routeRecommendPage'}">
				 	// sortable div 하나 생성
					
					var $group = $("<div class='group' style='width: 280px;'></div>");
		     		var $h3 = $("<h3 class='ui-accordion-header ui-corner-top ui-state-default ui-accordion-header-active ui-state-active ui-accordion-icons' style='background: #ead84a; border: 1px solid #ead84a;'>추천여행지</h3>");
		     		var $div = $("<div class='ui-accordion-content ui-corner-bottom ui-helper-reset ui-widget-content ui-accordion-content-active' style='padding: 1em 1em;'></div>");
		     		var $sortablediv = $("<div id='recommendSortableDiv'></div>");
		     		
		     		$sortablediv.appendTo($div);
		     		$group.append($h3).append($div);
		     		$('#accordion2').prepend($group);
		     		
					<c:forEach var="item" items="${requestScope.routeMap}" varStatus="num"> 
				    
						//경로 이름 버튼 생성
						 $('#recommendSortableDiv').append("<input type='button' value='${item.key}' class='routeSelectButton btn btn-warning' style='font-size:10px' onclick='routeButtonClick(this)'><br>"); 
						
					</c:forEach>
				
				</c:when>
			</c:choose>
           
        	 
        };
        
        
        
        // 루트 선택 버튼 클릭 함수
        function routeButtonClick(btn){
        	
        	
        	// 이전에 선택한 루트 경로 선 삭제
        	vector_layer.removeAllFeatures();
        	
        	//markerLayer 마커들 제거
        	markerLayer.clearMarkers();
        	poi_markerLayer.clearMarkers();
        	sch_content_layer.clearMarkers();
        	
        	// 일정 Drag 박스 empty 적용
        	$('.sortable').empty();
        	
        	
        	
        	
        	<c:forEach var="item" items="${requestScope.routeMap}" varStatus="num"> 
    	    
    		
    			// 클릭한 버튼의 값이 routeMap의 값과 같으면
    			if(btn.value == '${item.key}'){
    				
    				//JsonArray로 경로의 각 Site 내용 정리
    				//이전 routeDetailList 내용 비우기
    				routeDetailList = [];
    				
    				var dayCount = 0;
    				
    				
    				<c:forEach var="i" items="${item.value}" varStatus="num">
    				
    						// 쪽지 아이디 Session값 설정
    						sessionStorage.setItem("MessageReceiverId","${i.username}");
    						
    						
	    					if(routedate!='${i.route_date}'){
	    		         		++dayCount;
	    		         	}
	    					routeDetailList.push({
	    												"route_code" : route_code,
	    												"username" : username,
	    												"route_order" : ${i.route_order},
	    												"route_date" : '${i.route_date}',
	    												"site" : '${i.site}',
	    												"lon" : '${i.lon}',
	    												"lat" : '${i.lat}',
	    												"category" : '${i.category}',
	    												"stime" : '${i.stime}',
	    												"etime" : '${i.etime}'
	    					});
	    					
	    				
    			    </c:forEach>
    				 
    				
    			    
    		         var dayOrder=-1;
    		         
    		         //var routedate = routeDetailList[0].route_date;
    		         var routedate;
    				 
    		         
    		         var doneLoop = true;
    		         <c:forEach var="i" items="${item.value}" varStatus="num">
	    		        
    		         if(routedate!='${i.route_date}'){
 		         		routedate = '${i.route_date}';
 		         		++dayOrder;
 		         		
 		         	}
    		         	
    		         	if(dayOrder == dayList.length){
	 				     	doneLoop=false;
	 				 	 } 
	    		         if(doneLoop){
	    		        	 	    		         	
	    		         	// routeDetailList에 date 정보만 변경
	    		      	    routeDetailList[${num.index}].route_date=dayList[dayOrder];
	    		      	    
	    		      	    
	    					// 각 Day 안에 Site 순서대로 append
	    					//var contentId= routedate+'${i.route_order}';
	    					
	    					
	    					
	    					var $sch_content = $( "<div class='sch_content' id='"+'${i.site}'+"' style='width: 250px;' ></div>" );
	    					switch('${i.category}'){
	    					//var $content_img = $("<img src='http://img.earthtory.com/img/place_img/312/7505_0_et.jpg' class='spot_img' style='cursor: pointer;' onclick='sch_contentClick(this)'>");
	    					
		    					case "자연" : var $content_img = $("<img src='${pageContext.request.contextPath}/images/category/A0101.JPG' class='spot_img' style='cursor: pointer;' onclick='sch_contentClick(this)'>"); break;
		    					case "역사관광" : var $content_img = $("<img src='${pageContext.request.contextPath}/images/category/A0201.JPG' class='spot_img' style='cursor: pointer;' onclick='sch_contentClick(this)'>"); break;
		    					case "힐링" : var $content_img = $("<img src='${pageContext.request.contextPath}/images/category/A0202.JPG' class='spot_img' style='cursor: pointer;' onclick='sch_contentClick(this)'>"); break;
		    					case "체험" : var $content_img = $("<img src='${pageContext.request.contextPath}/images/category/A0203.JPG' class='spot_img' style='cursor: pointer;' onclick='sch_contentClick(this)'>"); break;
		    					case "산업관광" : var $content_img = $("<img src='${pageContext.request.contextPath}/images/category/A0204.JPG' class='spot_img' style='cursor: pointer;' onclick='sch_contentClick(this)'>"); break;
		    					case "건축/조형" : var $content_img = $("<img src='${pageContext.request.contextPath}/images/category/A0205.JPG' class='spot_img' style='cursor: pointer;' onclick='sch_contentClick(this)'>"); break;
		    					case "문화시설" : var $content_img = $("<img src='${pageContext.request.contextPath}/images/category/A0206.JPG' class='spot_img' style='cursor: pointer;' onclick='sch_contentClick(this)'>"); break;
		    					case "축제" : var $content_img = $("<img src='${pageContext.request.contextPath}/images/category/A0207.JPG' class='spot_img' style='cursor: pointer;' onclick='sch_contentClick(this)'>"); break;
		    					case "공연/행사" : var $content_img = $("<img src='${pageContext.request.contextPath}/images/category/A0208.JPG' class='spot_img' style='cursor: pointer;' onclick='sch_contentClick(this)'>"); break;
		    					case "육상 레포츠" : var $content_img = $("<img src='${pageContext.request.contextPath}/images/category/A0302.JPG' class='spot_img' style='cursor: pointer;' onclick='sch_contentClick(this)'>"); break;
		    					case "수상 레포츠" : var $content_img = $("<img src='${pageContext.request.contextPath}/images/category/A0303.JPG' class='spot_img' style='cursor: pointer;' onclick='sch_contentClick(this)'>"); break;
		    					case "항공 레포츠" : var $content_img = $("<img src='${pageContext.request.contextPath}/images/category/A0304.JPG' class='spot_img' style='cursor: pointer;' onclick='sch_contentClick(this)'>"); break;
		    					case "복합 레포츠" : var $content_img = $("<img src='${pageContext.request.contextPath}/images/category/A0305.JPG' class='spot_img' style='cursor: pointer;' onclick='sch_contentClick(this)'>"); break;
		    					case "쇼핑" : var $content_img = $("<img src='${pageContext.request.contextPath}/images/category/A0401.JPG' class='spot_img' style='cursor: pointer;' onclick='sch_contentClick(this)'>"); break;
		    					case "맛집" : var $content_img = $("<img src='${pageContext.request.contextPath}/images/category/A0502.JPG' class='spot_img' style='cursor: pointer;' onclick='sch_contentClick(this)'>"); break;
		    					case "기타" : var $content_img = $("<img src='${pageContext.request.contextPath}/images/category/Z0101.JPG' class='spot_img' style='cursor: pointer;' onclick='sch_contentClick(this)'>"); break;
		    				
	    						default : var $content_img = $("<img src='${pageContext.request.contextPath}/images/category/A0101.JPG' class='spot_img' style='cursor: pointer;' onclick='sch_contentClick(this)'>"); break;
			    				
	    					} 
	    					var substr  = '${i.site}'.substr(0,8);
	    
	    			
	    					//var $content_img = $("<img src='${pageContext.request.contextPath}/images/category/"+'${i.category}'+".JPG' class='spot_img' style='cursor: pointer;' onclick='sch_contentClick(this)'>");
	    					var $spot_content_box = $("<div class='spot_content_box' style='width: 150px;'></div>");
	    					var $spot_name = $("<div class='spot_name' style='cursor: pointer; '><div class='order' style='cursor: pointer; float:left; padding-right:8px'>"+${i.route_order}+"</div><div class='tag' style='float: left; width:120px; text-align:center; border: 1px solid #de9541;'>"+substr+"</div></div>");
	    					var $spot_info = $("<div class='spot_info'></div>");
	    					//var $tag = $("<div class='tag'>"+'${i.site}'+"</div>");
	    					var $sinfo_line = $("<div class='sinfo_line'></div>");
	    					var $sinfo_txt = $("<div class='sinfo_txt' style='padding: 0px; padding-left:15px'></div>");
	    					var $sinfo_txt_img = $("<span>"+'${i.category}'+"</span>");
	    					var $delete_tag = $("<div class='tag route_site_delete_tag' style='float:right; background: #ff6535; border: 1px solid #ff6535; color: #ffffff;'>X</div>");
	    					
	    					// 각 Day div id 변수로 선언 / dayOrder + 1 해준 이유 : 위에서 
	    					var scheduleday = '#'+'ScheduleDay'+(dayOrder+1);
	    					
	    					
	    					
	    					// div에 data값 삽입
	    					$sch_content.data('sitedata', routeDetailList[${num.index}]);
	    					
	    	
	    					
	    					 $sinfo_txt_img.appendTo($sinfo_txt);
	    					 
	    					 
	    					 //$tag.appendTo($spot_info);
	    					 $sinfo_line.appendTo($spot_info);
	    					 $sinfo_txt.appendTo($spot_info);
	    					 $delete_tag.appendTo($spot_info);
	    					 
	    					 $spot_name.appendTo($spot_content_box);
	    					 $spot_info.appendTo($spot_content_box);
	    					 
	    					 $content_img.appendTo($sch_content);
	    					 $spot_content_box.appendTo($sch_content);
	    				
	    					 
	    					 $(scheduleday).append($sch_content);
	    			
	    				
	    				
		    			    
		    				// 지도 : 마커 추가
	    					var options = {
				                label:new Tmap.Label('<div style="background-color: ivory"><a class="btn btn-defalut">${i.site}<br><${i.category}></a></div>'),
				                lonlat:new Tmap.LonLat(${i.lon}, ${i.lat}).transform(pr_4326, pr_3857),
				                id:'Route'
				            };
	    					 addRouteMarker(options);
	    					 
	    					 
	    					 
	    		         }
	    		         
    				 </c:forEach>
    			       
    				 // 생성된 마커 루트 라인 생성 함수 호출
    				 drawRouteLine();
    				
    			};	
    			
    		</c:forEach>
    		
    		// 일정 Drag 박스 스타일 적용 함수 호출 -> update manual함수 작성
    		scheduleBoxStyle();
    		
    	/*  $('#accordion2').accordion('refresh'); */
        };
        
        // 일정 Drag 박스 스타일 적용 함수 
        function scheduleBoxStyle(){
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
           
           $(".sortable").sortable({
        	   
            						
        	   
        	   // drag 한 후 객체 변경 되면 실행 : 하단 수동으로 만든 sortupdate 트리거 함수 불필요시 현 코드 필요
        	   //sortable 안에 태그 변동있을때 실행되는 함수 -> 수동으로 붙인 update함수가 삭제 클릭시에만 실행되는게 아니라 계속 실행되서...일단 주석 처리
	           /*   update: function(event, ui) {
	        	   
					      new_locations = $(this).find('.sch_content').map(function(i, el) {
						        return $(el).data('sitedata')
						      }).get()
					      
						      
						  // site_order값  재 정렬 
						  new_locations = jQuery.map( new_locations, function( n, i ) {
							  n.route_order = i ;
							  return ( n );
						  });
						      
					      // 화면 컨텐츠 순서 값 바꾸기
					      $(this).find('.spot_name').each(function(index, value){
					    	  console.log($(this).text());
					    	  $(this).text(new_locations[index].route_order+1);
					      });
						  
						  // console.log(JSON.stringify(routeDetailList));
	                   
						  
						  // 현재 저장되어 있는 data empty
						  $('#route_list_form_innerdiv').empty();
						  
						  //submit 할 때 보낼 경로 정보 reload - form 태그 안에 hidden input 값으로 추가
						  $.each(new_locations, function( index, value ) {
							
							    var $route_order = $("<input type='hidden' name='routeDetailList["+index+"].route_order' value="+value.route_order+">");
								var $username = $("<input type='hidden' name='routeDetailList["+index+"].username' value='"+value.username+"'>");
								var $route_code = $("<input type='hidden' name='routeDetailList["+index+"].route_code' value="+value.route_code+">");
								var $route_date = $("<input type='hidden' name='routeDetailList["+index+"].route_date' value='"+value.route_date+"'>");
								var $site = $("<input type='hidden' name='routeDetailList["+index+"].site' value='"+value.site+"'>");
								var $lon = $("<input type='hidden' name='routeDetailList["+index+"].lon' value='"+value.lon+"'>");
								var $lat = $("<input type='hidden' name='routeDetailList["+index+"].lat' value='"+value.lat+"'>");
								var $category = $("<input type='hidden' name='routeDetailList["+index+"].category' value='"+value.category+"'>");
								var $stime = $("<input type='hidden' name='routeDetailList["+index+"].stime' value="+value.stime+">");
								var $etime = $("<input type='hidden' name='routeDetailList["+index+"].etime' value="+value.etime+">");
								
								$('#route_list_form_innerdiv').append($route_order).append($username).append($route_code).append($route_date).append($site).append($lon).append($lat).append($category).append($stime).append($etime);
										
							});
						  
						  deleteRouteLine();
							
						  // 라인 다시 그리기
						  drawRouteLine();	
						  
						  
	                   }  */
	                  
         
           
           });
           
           // 수동으로 sortable 트리거 함수 생성
           $('.sortable').on('sortupdate',function(event, ui) {
        	   sch_content_layer.clearMarkers();
        	   	
        	   	  // 각 Day 별  Site 배열 정리
			      new_locations = $(this).find('.sch_content').map(function(i, el) {
				        return $(el).data('sitedata')
				  }).get()
			      
    		   
				  // site_order값  재 정렬 
				  new_locations = jQuery.map( new_locations, function( n, i ) {
					  n.route_order = i +1;
					  return ( n );
				  });
				  
				      
			      // 화면 컨텐츠 순서 값 바꾸기
			      $(this).find('.spot_name').each(function(index, value){
			    	  // console.log($(this).text()); 
			    	  $(this).find('.order').text(new_locations[index].route_order);
			    	  
			      });
			      
				  /* 값 확인시 : JSON.stringify(new_locations)*/
               
				  // 재정렬 된 Site Data 만 배열로 정리 해 둘 것
				  customizedRouteList = $('.sortable').find('.sch_content').map(function(i, el) {
				        return $(el).data('sitedata')
			      }).get()
			      
			      //input태그에 들어가는 Site정보 확인용 
			      console.log(JSON.stringify(customizedRouteList)); 
				  //라인 삭제
				  deleteRouteLine();
				  // 라인 다시 그리기
				  drawRouteLine();	
        	   
           });
          
           $(".sortable").selectable();
           
          
           $("#accordion")
           .accordion({
              collapsible : true,
              header : ".day_info_box"
           })
           .sortable({
              axis : "y",
              handle : ".day_info_box",
              stop : function(event, ui) {
                 // 가이드 내용 : 
                 // IE doesn't register the blur when sorting  so trigger focusout handlers to remove .ui-state-focus
                 ui.item.children(".day_info_box").triggerHandler("focusout");
                 // Refresh accordion to handle new order
                 $(this).accordion("refresh");
              }
           });
           $("#accordion2")
           .accordion({
              collapsible : true,
              header : "> div > h3",
              autoHeight: false,
              navigation: true,
              heightStyle: "content" 
           })
           .sortable({
              axis : "y",
              handle : "h3",
              stop : function(event, ui) {
            	 // 가이드 내용 : 
                 // IE doesn't register the blur when sorting  so trigger focusout handlers to remove .ui-state-focus
                 ui.item.children("div").triggerHandler("focusout");
                 // Refresh accordion to handle new order
                 $(this).accordion("refresh");
              }
           });
         
         };
        
         
         // sortable div안에 각 Site div
         function sch_contentClick(sch_content){
        	 
        	 if(sch_content_layer.markers.length>0){
        		 sch_content_layer.clearMarkers();
        	 }
        	 
        	 var schId = $(sch_content).parent().attr('id');
        	 
        	 
        	  // 각 Day 별  Site 배열 정리
		      var schList = $(sch_content).parent().parent().find('.sch_content').map(function(i, el) {
			  		return $(el).data('sitedata')
			  }).get()
			   
			      
			  $.each(schList, function( index, value ) {
				  if(value.site == schId){
					  var lonlat = new Tmap.LonLat(value.lon, value.lat).transform(pr_4326, pr_3857);
					  
					  var options = {
					                label:new Tmap.Label('<div style="background-color: ivory; text-align: center;"><a class="btn btn-warning">'+value.route_order+'번째 여행지</a><br><span>'+value.site+'</span></div>'),
					                lonlat:new Tmap.LonLat(lonlat.lon, lonlat.lat)
					            };
					  addSchContentMarkers(options);
				  }
			  });
			  
        	 //클릭시 해당 여행지로 Zoom -> 최대 줌
		     map.zoomToExtent(sch_content_layer.getDataExtent(), false); 
			 //map.zoomToMinExtent(sch_content_layer.getDataExtent()); // 변동 없음
			 // 최대 줌 상태에서 13레벨로 reZoom
			 map.zoomTo(12);
		     
			  
         }
         
         
       
        
        
        // 마커 중 파라메터의 값과 라벨값이 같은 마커 삭제
        function deleteMarker(SiteId){
        	
        	for(var i = 0; i<markerLayer.markers.length; i++){
                if(markerLayer.markers[i].labelHtml == SiteId){
                	markerLayer.removeMarker(markerLayer.markers[i]);
                }
           }
        }
        
      
        
        function deleteRouteLine(){
        	// 현재 라인 삭제
    		vector_layer.removeAllFeatures();
        }
        
        // 존재하는 마커 정보로 line 작업
        function drawRouteLine(){
        	
        	console.log('라인 다시 그리기');
        	//polyline 좌표 배열.
			var pointList = [];
		
			
					
			var schcontentsList = $('.sortable').find('.sch_content').map(function(i, el) {
				 return $(el).data('sitedata')
			 }).get()
			 
			/* console.log(JSON.stringify(schcontentsList));  */
			
			
			$.each(schcontentsList, function( index, value ) {
				var lonlat = new Tmap.LonLat(value.lon, value.lat).transform(pr_4326, pr_3857);
				
				pointList.push(new Tmap.Geometry.Point(lonlat.lon, lonlat.lat)); 
			});
					
			/* for(var i = 0; i<markerLayer.markers.length; i++){
				 var pointlonlat = new Tmap.LonLat(markerLayer.markers[i].lonlat.lon, markerLayer.markers[i].lonlat.lat);
				pointList.push(new Tmap.Geometry.Point(pointlonlat.lon, pointlonlat.lat)); 
				
			} */
			
			//좌표 배열 객체화
			var lineString = new Tmap.Geometry.LineString(pointList);
			
			var style_bold = {fillColor:"#FE9A2E",
				     fillOpacity:0.2,
				     strokeColor: "#FE9A2E",
				     strokeWidth: 3,
				     strokeDashstyle: "solid"};
		
			
			var mLineFeature = new Tmap.Feature.Vector(lineString, null, style_bold);
			 
			vector_layer.addFeatures([mLineFeature]);
			
			map.zoomToExtent(vector_layer.getDataExtent());
        }
        
        
        //클릭시 경로 정보 로드
        function search(){
        	
        	var pointList = [];
        	var schcontentsList = $('.sortable').find('.sch_content').map(function(i, el) {
				 //console.log($(el).data('sitedata')); 
				 return $(el).data('sitedata')
			 }).get()
			 
			/* console.log(JSON.stringify(schcontentsList));  */
			
			
			$.each(schcontentsList, function( index, value ) {
				//33.좌표 -> Tmap좌표로 변환
				var lonlat = new Tmap.LonLat(value.lon, value.lat).transform(pr_4326, pr_3857);
				
				//pointList.push(new Tmap.Geometry.Point(lonlat.lon, lonlat.lat)); 
				pointList.push(lonlat); 
			});
        
       	
           var startX = pointList[0].lon;
           var startY = pointList[0].lat;
            
            
            
            var passList ="";
            
            
            
            for(var i = 1; i<pointList.length-1; i++){	
             	/* 
            	sk개발자 사이트 가이드 내용 : 
            		
            	MPP1개수_경유지2 X 좌표,
            	경유지2 Y 좌표,
            	POIID,
            	RP Flag, 
            	MPP2개수
            	14180382.309390113,4349064.210998647,1000559889,G,0	
            	
            	*/ 
         
              
            	passList += pointList[i].lon;
                passList += ",";
                passList += pointList[i].lat;
                passList += ",,G,0"
                passList += "_";
               
              
            }
          
           
           
           
           var endX = pointList[pointList.length-1].lon;
           var endY = pointList[pointList.length-1].lat;
           
           
            /* var routeFormat = new Tmap.Format.GeoJSON({extractStyles:true, extractAttributes:true}); 
            var urlStr = "https://apis.skplanetx.com/tmap/routes?version=1"; *//* JSON 타입 으로 파싱 할 경우*/
            var routeFormat = new Tmap.Format.KML({extractStyles:true, extractAttributes:true}) /* KML 타입 */
            var urlStr = "https://apis.skplanetx.com/tmap/routes?version=1&format=xml"; /* KML타입 받아오는 파라메터 추가 */
            urlStr += "&startX="+startX;
            urlStr += "&startY="+startY;
            urlStr += "&endX="+endX;
            urlStr += "&endY="+endY;
            urlStr += "&passList="+passList;
            urlStr += "&appKey=ce6f02bc-1480-3fc6-9622-5a2fb5dc009d"; 
            
         
            
            console.log('');
            console.log(urlStr);
            
            var prtcl = new Tmap.Protocol.HTTP({
                                                url: urlStr,
                                                format:routeFormat
                                                }); 
            
            
            routeLayer = new Tmap.Layer.Vector("route", {protocol:prtcl, strategies:[new Tmap.Strategy.Fixed()]});
            routeLayer.events.register("featuresadded", routeLayer, onDrawnFeatures);/* 레이어에 줌 이벤트 함수 등록 */
            map.addLayer(routeLayer);
        }
        //경로 그리기 후 해당영역으로 줌
        function onDrawnFeatures(e){
            map.zoomToExtent(this.getDataExtent());
        }
        
        // 경로 삭제
        function searchRouteDelete(){
        	routeLayer.destroy();
        }
        
        
        
        /* Start : https://developers.skplanetx.com/community/forum/t-map/view/?ntcStcId=20120822153630 */
        Tmap.Format.KML.prototype.parseData = function(data, options) {
	        if(typeof data == "string") {
	            data = Tmap.Format.XML.prototype.read.apply(this, [data]);
	        }
			// 총 거리 계산
	        var totalDistance = this.getElementsByTagNameNS(data, "*", "totalDistance");
	 		// 총 시간 계산
			var totalTime = this.getElementsByTagNameNS(data, "*", "totalTime");
	        // 각 site 별 노드 이름 배열
	        var types = ["Link", "NetworkLink", "Style", "StyleMap", "Placemark"];
	        for(var i=0, len=types.length; i<len; ++i) {
	            var type = types[i];
	
	            // 노드 내용 가져오기
	            var nodes = this.getElementsByTagNameNS(data, "*", type);
				
	            // 노드에 값 없으면 넘어가기
	            if(nodes.length == 0) { 
	                continue;
	            }
	
	            switch (type.toLowerCase()) {
	
	                // Fetch external links 
	                case "link":
	                case "networklink":
	                    this.parseLinks(nodes, options);
	                    break;
	
	                // parse style information
	                case "style":
	                    if (this.extractStyles) {
	                        this.parseStyles(nodes, options);
	                    }
	                    break;
	                case "stylemap":
	                    if (this.extractStyles) {
	                        this.parseStyleMaps(nodes, options);
	                    }
	                    break;
	
	                // parse features
	                case "placemark":
	                	
	                    this.parseFeatures(nodes, options);
	                    break;
	            }
	            
	        }
	        
	        for(var i=0, len=this.features.length; i<len; ++i) { 	        	
	        	var div_route_box = "<div class='btn-primary btn-outline btn-lg'>";
	        	div_route_box+=this.features[i].data.description; // 각 길 찾기 항목
	        	div_route_box+= "</div>";
	        	
	        	 $('#route_float').append(div_route_box);
			     $('#route_float').append('<br>');
	        }
	        
	        
	        return this.features;
	    };
	    

    	/* var map, kmlLayer, select;
		var paging;
		var markers;
		
		var stylemap;
		
		
		var context = {
	        getColor: function(feature){
	        	
	            var color = '#aaaaaa';
				if (feature.attributes.clazz && feature.attributes.clazz === 4) {
					color = '#ee0000';
				} else if(feature.cluster) {
					var onlyFour = true;
					for (var i = 0; i < feature.cluster.length; i++) {
						if (onlyFour && feature.cluster[i].attributes.clazz !== 4) {
							onlyFour = false;
						}
					}
					if (onlyFour === true) {
						color = '#ee0000';
					}
				}
				return color;
	        }
	    };  */
        
        /* End : https://developers.skplanetx.com/community/forum/t-map/view/?ntcStcId=20120822153630 */
     
        /* 길찾기 내용 modal로 업로드  */	
        $('#modal-register').modal({backdrop: 'static', keyboard: false}) ;
        		
        </script>




						
					



<%----------------------------------왼쪽 일정 짜기 부분 스크립트 ----------------------------------------%>


<!-- 상세보기 일정 스타일-->

<style>

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
      $(".sortable").selectable();
      
    
      $("#accordion")
      .accordion({
         collapsible : true,
         header : ".day_info_box"
      })
      .sortable({
         axis : "y",
         handle : ".day_info_box",
         stop : function(event, ui) {
           
            ui.item.children(".day_info_box").triggerHandler("focusout");
            // 아코디언 안에 new order정리 하기위해 refresh
            $(this).accordion("refresh");
         }
      });
      $("#accordion2")
      .accordion({
         collapsible : true,
         header : "> div > h3",
         autoHeight: false,
         navigation: true,
         heightStyle: "content" 
      })
      .sortable({
         axis : "y",
         handle : "h3",
         stop : function(event, ui) {
  
            ui.item.children("div").triggerHandler("focusout");
         	// 아코디언 안에 new order정리 하기위해 refresh
            $(this).accordion("refresh");
         }
      });
    
    });

  
  
  
</script>




<!-- 여행이름 입력 창 -->
<input type="text" style="width:300px;" class="btn btn-primary"  id="routename" name="routename" >



<!-- 검색창 -->
<button style="margin-left:2px;float:right;" value="검색하기" class="btn btn-primary " id="searchSiteBtn">
	<span class="glyphicon glyphicon-search"></span>
</button>
<input type="text" style="margin-left:5px;width:300px;float:right;" class="form-control" id="searchWord" name="searchWord" value="${searchWord}" placeholder="검색할 태그를 입력해주세요.">
	
	

<!-- 루트 길찾기 routeLayer delete 버튼  -->
<button class="btn btn-warning btn-link-1" style="width:50px; float:right; padding:10px 0px;" onclick="searchRouteDelete()" data-modal-id="modal-register">
     <span class="glyphicon glyphicon-refresh"></span>
</button>

<!-- 루트 길찾기 모달 띄우기 버튼 -->
<button class="btn btn-warning  btn-link-1 launch-modal" style="width:50px; float:right; padding:10px 0px;" onclick="search()" data-modal-id="modal-register">
     <span class="glyphicon glyphicon-road"></span>
</button>
        

<%-- ----------------------------------form-------------------------------------------%>

<button class = "btn btn-warning" id="submit_route_detail">
		 <span class="glyphicon glyphicon-floppy-disk"></span>
</button>

<form action="${pageContext.request.contextPath}/PLANA.detail.insert.do" method="post" id="route_list_form">
	
	<div id="route_list_form_innerdiv"></div><!-- 각 site input태그 붙는 창 -->

</form>



<%----------------------------------일정 짜기 부분 ----------------------------------------%>
		
<div style="background-color: white; width: 450px;" id="schedulebox2">
	<!-- 이놈은 아님 -->
	<div id="accordion1" style="overflow: auto; width: 450px;" >
	
	
	</div>				
	<div id="accordion2"
		style="overflow: auto; width: 450px; height: 650px;">
		
		
	</div>
</div>

















<%-- ----------------------------------지도 부분---------------------------------------- --%>


<div id="body_map" >
	<div id="map_div" style="float: left; position:relative; bottom:635px; left:300px;" class="printDiv" ></div>
	
</div>

<!-- 경로 상세 정보 : 모달 -->
 <div class="modal fade" id="modal-register" tabindex="-1" role="dialog"
		aria-labelledby="modal-register-label" aria-hidden="true">
		<div class="modal-dialog" style=float:right>
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h3 class="modal-title" id="modal-register-label">경로 상세 정보</h3>
				</div>

				<div class="modal-body">

					<div id="route_float"></div>

				</div>

			</div>
		</div>
	</div>



	


<!-- 모달 Javascript -->
    <!-- <script src="message/js/jquery-1.11.1.min.js"></script> : 위의 jquery와  충돌 -->
	<script src="message/bootstrap/js/bootstrap.min.js"></script>
	<script src="message/js/jquery.backstretch.min.js"></script>
	<script src="message/js/scripts.js"></script>  