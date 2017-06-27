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



<!-- Start : 일정부분 적용 링크 -->


<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="shortcut icon" href="favicon.ico">

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


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

<!-- End : 일정부분 적용 링크 -->

<%----------------------------------지도 부분 스크립트----------------------------------------%>

<script type="text/javascript">
$( function() {
	var lonlat; 
	//Tmap 마커 레이어 변수
	var markerLayer;
	
	var vector_layer;

	//서버에서 넘어온 User의 여행 설정 정보
	route_code = ${requestScope.myRouteInfo.route_code};
	username = '${requestScope.myRouteInfo.username}';
	routename = '${requestScope.myRouteInfo.routename}';
	partner_code = '${requestScope.myRouteInfo.partner_code}';
	
	//여행 이름 표시
	$('#routename').val(routename);
		
	//서버에서 넘어온 날짜 담을 배열  
	dayList = [];
	
	//서버에서 넘어온 날짜List 배열로 저장
	<c:forEach var="item" items="${requestScope.datesList}" varStatus="num"> 
		console.log('num값?');
		console.log(${num.index})
		dayList.push('${item}');
	</c:forEach>

	
	//여행지 담을 날짜별 div태그 생성 함수 호출
	initSortableDiv();
	
	
	
	//전역변수 루트 선택 시 초기화
	routeDetailList = [];
	
	// routeDetailList에서 선택 된 경로만 customizedRouteList로 초기화 작업 필요
	customizedRouteList = [];
	
	
	/* console.log(JSON.stringify(routeDetailList)); */

	//초기화 함수 호출
	init();
	
	// route_site_delete_tag 클릭 : 클릭한 객체 sortable 컨테이너에서 삭제
	$(document).on("click",".route_site_delete_tag", function(event){ 
		
		// 클릭 객체 제거
		$(event.target).parent().parent().parent().remove();
		
		// sortable 수동 함수 호출
		$('.sortable').trigger('sortupdate');
		
       
  	});
	
	// 여행지 검색 버튼 클릭
	$("#searchSiteBtn").on("click", function() {
    	//현재 POI marker 삭제
    	
		
		/* PlanA 컨트롤러 타는 로직
		$.ajax({
			type : 'post',
			url : '${pageContext.request.contextPath}'+'/PLANA.make.do',
			 headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST" 
			}, 
			dataType : 'text',
			data : { 'searchWord' : $("#searchWord").val() },
			success : function(result) {

				if (result == 'SUCCESS') {

					alert("등록 되었습니다.");
					console.log(result);
				}
			}
		}); */
		
		//Tmap POI 호출 로직
    	searchPOI();
		
	});

	
	/* $('#accordion2').accordion('refresh'); */
	
 } );
 
 
 	//Tmap POI
 	function addMarker(options){
 		
	    var size = new Tmap.Size(12,19);
	    var offset = new Tmap.Pixel(-(size.w/2), -size.h);
	    var icon = new Tmap.Icon("https://developers.skplanetx.com/upload/tmap/marker/pin_b_s_simple.png",size,offset);
	    var marker = new Tmap.Markers(options.lonlat,icon,options.label);
	    markerLayer.addMarker(marker);
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
	function onClickMouse(e){
		console.log("클릭클릭클릭클릭클릭클릭");
		//
		/* $( "div[style='aira-hidden:false']" ).append('제발제발제방'); */
		$( "div:visible div.sortable" ).append('제발제발제방');
		//input:not(:checked)
		//$( "div:not(:hidden) div.sortable" ).append('제발제발제방');
		
	/* 	$( "div[style='display:block'] div.sortable" ).append('제발제발제방'); */
		//$('#ui-id-2').append('제발제발제방');
	    getDataFromId(this.idString);
	}
	function searchPOI(){
	    tdata = new Tmap.TData();
	    tdata.events.register("onComplete", tdata, onCompleteTData);
	    var center = map.getCenter();
	    tdata.getPOIDataFromSearch(encodeURIComponent($("#searchWord").val()), {centerLon:center.lon, centerLat:center.lat});
	}
	function onCompleteTData(e){
		//이전 검색결과 마커 삭제
		markerLayer.clearMarkers();
		
	    if(jQuery(this.responseXML).find("searchPoiInfo pois poi").text() != ''){
	        jQuery(this.responseXML).find("searchPoiInfo pois poi").each(function(){
	            var name = jQuery(this).find("name").text();
	            var id = jQuery(this).find("id").text();
	            var lon = jQuery(this).find("frontLon").text();
	            var lat = jQuery(this).find("frontLat").text();
	            var options = {
	                label:new Tmap.Label(name),
	                lonlat:new Tmap.LonLat(lon, lat),
	                id:id
	            };
	            addMarker(options);
	        });
	    }else {
	        alert('검색결과가 없습니다.');
	    }
	    map.zoomToExtent(markerLayer.getDataExtent());
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
	            alert(name);
	        });
	    }else {
	        alert('검색결과가 없습니다.');
	    }
	    tdata.events.unregister("onComplete", tdata, onCompleteTDataID);
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
	     		/*
	     		<div class='group' style='width: 280px;'>
					<h3>DAY 1</h3>
					<div>
						<div class='sortable'>
						</div>
					</div>
				</div>
	     		*/
	     		
	     		//$('#accordion2').append('<div class="group" style="width: 280px;"><h3 class="ui-accordion-header ui-corner-top ui-state-default ui-accordion-header-active ui-state-active ui-accordion-icons">Day'+dayOrder+'</h3><div class="ui-accordion-content ui-corner-bottom ui-helper-reset ui-widget-content ui-accordion-content-active"><div class="sortable" id="ScheduleDay'+dayOrder+'"></div></div></div>');
	     	
	     		
	     		var $group = $("<div class='group' style='width: 280px;'></div>");
	     		var $h3 = $("<h3 class='ui-accordion-header ui-corner-top ui-state-default ui-accordion-header-active ui-state-active ui-accordion-icons'>Day"+dayOrder+"  :  "+element+"</h3>");
	     		var $div = $("<div class='ui-accordion-content ui-corner-bottom ui-helper-reset ui-widget-content ui-accordion-content-active'></div>");
	     		var $sortablediv = $("<div class='sortable' id='ScheduleDay"+dayOrder+"'></div>");
	     		
	     		$sortablediv.appendTo($div);
	     		$group.append($h3).append($div);
	     		$('#accordion2').append($group);
	     		
	     		/* <div class="group" style="width: 280px;">
	     			<h3 class="ui-accordion-header ui-corner-top ui-state-default ui-accordion-header-active ui-state-active ui-accordion-icons">Day'+dayOrder+'</h3>
	     				<div class="ui-accordion-content ui-corner-bottom ui-helper-reset ui-widget-content ui-accordion-content-active">
	     					<div class="sortable" id="ScheduleDay'+dayOrder+'">
	     					</div>	
	     				</div>
	     			</div> */
	     	}
		});
 		
 	}
        //초기화 함수
        function init(){
        	//pr_3857 인스탄스 생성. (Google Mercator)
			var pr_3857 = new Tmap.Projection("EPSG:3857");
			 
			//pr_4326 인스탄스 생성. (WGS84 GEO)
			var pr_4326 = new Tmap.Projection("EPSG:4326");
			
            /* centerLL = new Tmap.LonLat(14145677.4, 4511257.6); */
            centerLL = new Tmap.LonLat(14085866.64992, 3963136.5754785);
            map = new Tmap.Map({div:'map_div',
                                width:'77%', 
                                height:'610px',
                                transitionEffect:"resize",
                                animation:true
                            }); 
            
          
            
            map.setCenter(centerLL,11);/* 센터값, 11 : 지도 표현 범위(10 : 제주도 전체) */
                 
            /*  var lonlat = new Tmap.LonLat(14135893.887852, 4518348.1852606); */
            
            map.addControl(new Tmap.Control.MousePosition());/* 마우스 오버에 좌표값 표시 */
            
            //map.events.register("click", map, onClickMap)//813줄 함수 제거할 것
            
            
            vector_layer = new Tmap.Layer.Vector('Tmap Vector Layer');
    		map.addLayers([vector_layer]); 
            
            markerLayer = new Tmap.Layer.Markers();
            
            map.addLayer(markerLayer);
            /* searchRoute(); */
            
            
            <c:choose>
				<c:when test="${requestScope.pageCase=='routeDetailPage'}">
					
				</c:when>
				
				<c:when test="${requestScope.pageCase=='routeRecommendPage'}">
				 	// sortable div 하나 생성
					
					var $group = $("<div class='group' style='width: 280px;'></div>");
		     		var $h3 = $("<h3 class='ui-accordion-header ui-corner-top ui-state-default ui-accordion-header-active ui-state-active ui-accordion-icons'>추천여행지</h3>");
		     		var $div = $("<div class='ui-accordion-content ui-corner-bottom ui-helper-reset ui-widget-content ui-accordion-content-active'></div>");
		     		var $sortablediv = $("<div id='recommendSortableDiv'></div>");
		     		
		     		$sortablediv.appendTo($div);
		     		$group.append($h3).append($div);
		     		$('#accordion2').prepend($group);
		     		
					<c:forEach var="item" items="${requestScope.routeMap}" varStatus="num"> 
				    
						//경로 이름 버튼 생성
						/* console.log('${item.key}'); */
						 $('#recommendSortableDiv').prepend("<input type='button' value='${item.key}' class='routeSelectButton' onclick='routeButtonClick(this)'><br>"); 
						
					</c:forEach>
				
				</c:when>
			</c:choose>
           
        	 
        };
        
        
        
        // 루트 선택 버튼 클릭 함수
        function routeButtonClick(btn){
        	// map위 Layers 제거
        	//deleteLayers();
        	
        	// 이전에 선택한 루트 경로 선 삭제
        	vector_layer.removeAllFeatures();
        	
        	//markerLayer 마커들 제거
        	markerLayer.clearMarkers();
        	// 일정 Drag 박스 empty 적용
        	$('.sortable').empty();
        	
        	//pr_3857 인스탄스 생성. (Google Mercator)
        	var pr_3857 = new Tmap.Projection("EPSG:3857");
        	 
        	//pr_4326 인스탄스 생성. (WGS84 GEO)
        	var pr_4326 = new Tmap.Projection("EPSG:4326");
        	
        	// Map위에 해당 경로 출력
        	<c:forEach var="item" items="${requestScope.routeMap}" varStatus="num"> 
    	    
    		
    			// 클릭한 버튼의 값이 routeMap의 값과 같으면
    			if(btn.value == '${item.key}'){
    				
    				// 1. 지도 작업
    				//벡터레이어 생성
    				/* var vector_layer = new Tmap.Layer.Vector('Tmap Vector Layer');
    				map.addLayers([vector_layer]);  */
    				
    				
    				
    				//polyline 좌표 배열.
    				var pointList = [];
    			
    				<c:forEach var="i" items="${item.value}" varStatus="num">
    					
    					/* console.log('${i.site}'); */
    					 var pointlonlat = new Tmap.LonLat(${i.lon}, ${i.lat}).transform(pr_4326, pr_3857);
    					pointList.push(new Tmap.Geometry.Point(pointlonlat.lon, pointlonlat.lat)); 
    					/* 마커작업 필요
    					addSiteMarkers(${i.lon}, ${i.lat}, '${i.site}'); */
    				</c:forEach>
    				
    				//좌표 배열 객체화
    				var lineString = new Tmap.Geometry.LineString(pointList);
    				
    				var style_bold = {fillColor:"#FE9A2E",
    					     fillOpacity:0.2,
    					     strokeColor: "#FE9A2E",
    					     strokeWidth: 3,
    					     strokeDashstyle: "solid"};
    			
    				
    				var mLineFeature = new Tmap.Feature.Vector(lineString, null, style_bold);
    				 
    				 
    				vector_layer.addFeatures([mLineFeature]);
    				
    				
    				
    				//JsonArray로 경로의 각 Site 내용 정리
    				//이전 routeDetailList 내용 비우기
    				routeDetailList = [];
    				<c:forEach var="i" items="${item.value}" varStatus="num">
    					
    					routeDetailList.push({
    												"route_code" : route_code,
    												"username" : username,
    												"route_order" : '${i.route_order}',
    												"route_date" : '${i.route_date}',
    												"site" : '${i.site}',
    												"lon" : '${i.lon}',
    												"lat" : '${i.lat}',
    												"category" : '${i.category}',
    												"stime" : '${i.stime}',
    												"etime" : '${i.etime}'
    					});	         	
    			    </c:forEach>
    				 
    				
    				
    				
    				
    				
    				
    				 // 2. 일정표 작업
    	         	
    		         var dayOrder=-1;
    		         
    		         //var routedate = routeDetailList[0].route_date;
    		         var routedate;
    				 
    		         <c:forEach var="i" items="${item.value}" varStatus="num">
    					
    		      	   
    		         
    		         	if(routedate!='${i.route_date}'){
    		         		routedate = '${i.route_date}';
    		         		++dayOrder;
    		         		
    		         	}
    		         	
    		         	
    		         	 // routeDetailList에 date 정보만 변경
    		      	    console.log('그럼 dayList값은?');
    		      	    console.log(dayOrder);
    		      	    routeDetailList[${num.index}].route_date=dayList[dayOrder];
    		      	    console.log(routeDetailList[${num.index}].route_date);
    					
    		      	    
    		      	    
    					// 각 Day 안에 Site 순서대로 append
    					var contentId= routedate+'${i.route_order}';
    					
    					
    					
    					var $sch_content = $( "<div class='sch_content' id='"+contentId+"' style='width: 250px;'></div>" );
    					var $content_img = $("<img src='http://img.earthtory.com/img/place_img/312/7505_0_et.jpg' class='spot_img' style='cursor: pointer;'>");
    					var $spot_content_box = $("<div class='spot_content_box' style='width: 150px;'></div>");
    					var $spot_name = $("<div class='spot_name' style='cursor: pointer;'>"+${i.route_order}+"</div>");
    					var $spot_info = $("<div class='spot_info'></div>");
    					var $tag = $("<div class='tag'>"+'${i.site}'+"</div>");
    					var $sinfo_line = $("<div class='sinfo_line'></div>");
    					var $sinfo_txt = $("<div class='sinfo_txt' style='padding: 0px'></div>");
    					var $sinfo_txt_img = $("<img src='<%=request.getContextPath()%>/css/history/like.png' style='height: 20px'> 6 / 10 <span>좋아요</span>");
    					var $delete_tag = $("<div class='tag route_site_delete_tag'>X</div>");
    					
    					// 각 Day div id 변수로 선언 / dayOrder + 1 해준 이유 : 위에서 
    					var scheduleday = '#'+'ScheduleDay'+(dayOrder+1);
    					
    					
    					
    					// div에 data값 삽입
    					$sch_content.data('sitedata', routeDetailList[${num.index}]);
    					
    	
    					
    					 $sinfo_txt_img.appendTo($sinfo_txt);
    					 
    					 
    					 $tag.appendTo($spot_info);
    					 $sinfo_line.appendTo($spot_info);
    					 $sinfo_txt.appendTo($spot_info);
    					 $delete_tag.appendTo($spot_info);
    					 
    					 $spot_name.appendTo($spot_content_box);
    					 $spot_info.appendTo($spot_content_box);
    					 
    					 $content_img.appendTo($sch_content);
    					 $spot_content_box.appendTo($sch_content);
    				
    					 
    					 $(scheduleday).append($sch_content);
    			
    				
    				
	    			    //정보 저장을 위해 form 태그 안에 값으로 추가       routeDetailList[num] : RouteDetail에 멤버필드 ArrayList
	    				$('#route_list_form_innerdiv').empty();
	    				var $route_order = $("<input type='hidden' name='routeDetailList[${num.index}].route_order' value=${i.route_order}>");
	    				var $username = $("<input type='hidden' name='routeDetailList[${num.index}].username' value='${i.username}'>");
	    				var $route_code = $("<input type='hidden' name='routeDetailList[${num.index}].route_code' value=${i.route_code}>");
	    				var $route_date = $("<input type='hidden' name='routeDetailList[${num.index}].route_date' value='${i.route_date}'>");
	    				var $site = $("<input type='hidden' name='routeDetailList[${num.index}].site' value='${i.site}'>");
	    				var $lon = $("<input type='hidden' name='routeDetailList[${num.index}].lon' value='${i.lon}'>");
	    				var $lat = $("<input type='hidden' name='routeDetailList[${num.index}].lat' value='${i.lat}'>");
	    				var $category = $("<input type='hidden' name='routeDetailList[${num.index}].category' value='${i.category}'>");
	    				var $stime = $("<input type='hidden' name='routeDetailList[${num.index}].stime' value=${i.stime}>");
	    				var $etime = $("<input type='hidden' name='routeDetailList[${num.index}].etime' value=${i.etime}>");
	    				
	    				
	    				$('#route_list_form_innerdiv').append($route_order).append($username).append($route_code).append($route_date).append($site).append($lon).append($lat).append($category).append($stime).append($etime);
	    					
    					 
    				 </c:forEach>
    			       
    				
    				
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
        	   
        	   // drag 한 후 객체 변경 되면 실행
        	   /* sortable 안에 태그 변동있을때 실행되는 함수 -> 수동으로 붙인 update함수가 삭제 클릭시에만 실행되는게 아니라 계속 실행되서...일단 주석 처리
        	   update: function(event, ui) {
				      
        		   console.log('sortable update 함수')
        		    //console.log($(this)); 
        		   
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
				      
					   //console.log(JSON.stringify(new_locations));
					  
					  //console.log(JSON.stringify(routeDetailList));
                   
					  
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
					  
							
					  
					  
                   } */
                   /* , 이건 sortable -> sortable로 객체 droped 실행되고 난 후에 실행되는 함수
           
           	remove: function( event, ui ) {
           		console.log('sort remove function 실행');
           	} */
         
           
           });
           
           // 수동으로 sortable 트리거 함수 생성, 왜 delete 버튼 클릭할때 뿐만 아니라 drag update 시에도 실행되지? 걸어 두지 않았는데??
           $('.sortable').on('sortupdate',function(event, ui) {
        	   	
        	   console.log('sort에 update 붙인 함수');
    		   console.log('this 는?');
    		   console.log($(this));
    		   console.log('this.parent 는?');
    		   console.log($(this).parent().parent());
    		   
    		   	  // 각 Day 별  Site 배열 정리
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
			    	  // console.log($(this).text()); 
			    	  $(this).text(new_locations[index].route_order+1);
			    	  
			      });
			      
				  /* console.log(JSON.stringify(new_locations));
				  
				  console.log(JSON.stringify(routeDetailList)); */
               
				  // 재정렬 된 Site Data 만 배열로 정리 해 둘 것
				  customizedRouteList = $('.sortable').find('.sch_content').map(function(i, el) {
					  /* console.log($(el).data('sitedata')); */
				        return $(el).data('sitedata')
			      }).get()
			      
			      console.log(JSON.stringify(customizedRouteList));
				  
				  // 현재 저장되어 있는 data empty
				  $('#route_list_form_innerdiv').empty();
				  
				  //submit 할 때 보낼 경로 정보 reload - form 태그 안에 hidden input 값으로 추가
				  $.each(customizedRouteList, function( index, value ) {
					
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
              header : "> div > h3",
              autoHeight: false,
              navigation: true,
              heightStyle: "content" 
           })
           .sortable({
              axis : "y",
              handle : "h3",
              stop : function(event, ui) {
                 // IE doesn't register the blur when sorting
                 // so trigger focusout handlers to remove .ui-state-focus
                 ui.item.children("div").triggerHandler("focusout");
                 // Refresh accordion to handle new order
                 $(this).accordion("refresh");
              }
           });
         
         };
        
         
         
         
         
         
         
         
         
         
         
         
        // 맵 위 Layer 제거 함수
        function deleteLayers(){
			var mapLayers = map.layers;
		        	
		        	var mapLayerCount = mapLayers.length;
		        	
		        	for(var i =3; i<mapLayerCount; i++){
		        		//console.log("길이"+mapLayerCount);
		        		//console.log("i"+i);
		        		//console.log(mapLayers[i]);  
		        		if(mapLayers[i]!=null){
		        			map.removeLayer(mapLayers[i]); 
		        		}else{
		        			var mapLayers = map.layers;
		                	
		                	var mapLayerCount = mapLayers.length;
		                	
		                	for(var i =1; i<mapLayerCount; i++){
		                		
		                		if(mapLayers[i]!=null){
		                			map.removeLayer(mapLayers[i]); 
		                		}else{
		                			var mapLayers = map.layers;
		                        	
		                        	var mapLayerCount = mapLayers.length;
		                        	
		                        	for(var i =1; i<mapLayerCount; i++){
		                        		
		                        		if(mapLayers[i]!=null){
		                        			map.removeLayer(mapLayers[i]); 
		                        		}else{
		                        			var mapLayers = map.layers;
		                                	
		                                	var mapLayerCount = mapLayers.length;
		                                	
		                                	for(var i =1; i<mapLayerCount; i++){
		                                		
		                                		if(mapLayers[i]!=null){
		                                			map.removeLayer(mapLayers[i]); 
		                                		}
		                                	}
		                        		}
		                        	}
		                		}
		                	} 
		        		}
		        		
		        	}
		       
        };
       
        //추천 여행지 마커 추가하기 
        function addSiteMarkers(lon, lat, site){
    	  
     		
        	//pr_3857 인스탄스 생성. (Google Mercator)
			var pr_3857 = new Tmap.Projection("EPSG:3857");
			 
			//pr_4326 인스탄스 생성. (WGS84 GEO)
			var pr_4326 = new Tmap.Projection("EPSG:4326");
			
			var size = new Tmap.Size(24,38);
	        var offset = new Tmap.Pixel(-(size.w/2), -(size.h/2)); 
	  
	       	var icon = new Tmap.Icon('https://developers.skplanetx.com/upload/tmap/marker/pin_b_m_a.png', size, offset); /* 마커 아이콘 */
	     
	       
		      	
		     var marker = new Tmap.Markers(new Tmap.LonLat(lon, lat).transform(pr_4326, pr_3857), icon, new Tmap.Label(site));
		     markerLayer.addMarker(marker); 	
		     marker.events.register("mouseover", marker, onOverMouse);
		     marker.events.register("mouseout", marker, onOutMouse);
		     /* marker.events.register("click", map, onClickMarker); */
		    /*  marker.events.register("click", marker, onClickMarker); */
		     
		     
        }
        function onOverMouse(e){
            this.popup.show();
        }
        function onOutMouse(e){
            this.popup.hide();
        }
        
        function onClickMarker(evt){
        	
	         console.log(evt);
	     }
        //맵 클릭시 이벤트 함수 -> 마커 출력
        function onClickMap(evt){
            
            lonlat =  map.getLonLatFromPixel(new Tmap.Pixel(evt.clientX,(evt.clientY-80)));/* header 높이 만큼 처리 */
            
             
           /*  console.log(lonlat);
            console.log(lonlat.lat);
            console.log(lonlat.lon);  */
           /*  var markerLayer = new Tmap.Layer.Markers(); *//* 마커 뿌릴 레이어 추가 */
            /* map.addLayer(markerLayer); */
            
            var size = new Tmap.Size(24,38);
             var offset = new Tmap.Pixel(-(size.w/2), -(size.h/2)); 
       
            var icon = new Tmap.Icon('https://developers.skplanetx.com/upload/tmap/marker/pin_b_m_a.png', size, offset); /* 마커 아이콘 */
            
            
            
            
            var label = new Tmap.Label('0');
            
            var marker = new Tmap.Markers(lonlat, icon, label);
            markerLayer.addMarker(marker);
           
            /* console.log(marker);
            console.log(markerLayer.markers);
            console.log(markerLayer.markers.length); */
            
            /* markers.markers[0].popup.setContentHTML("수정할 label의 html 문자열"); */
            /* console.log(markerLayer.markers[0].lonlat); */
            
            /* if(marker.labelHtml=='0'){
            	 console.log(marker.labelHtml);
            } */
        }
        
        /* alert(map.getLonLatFromPixel(
        new Tmap.Pixel(document.getElementById('x').value,document.getElementById('y').value))) */
        
        
        
        //클릭시 경로 정보 로드
        function search(){
       	
            var startX = markerLayer.markers[0].lonlat.lon;
            var startY = markerLayer.markers[0].lonlat.lat;
            
            var passList ="";
            
            for(var i = 1; i<markerLayer.markers.length-1; i++){
            	
             	/* 
            	경유지1 X 좌표,
            	경유지1 Y 좌표,
            	경유지1 POI ID,
            	경유지1 RP Flag,
            	
            	MPP1개수_경유지2 X 좌표,
            	경유지2 Y 좌표,
            	POIID,
            	RP Flag, 
            	MPP2개수
            	
            	14180382.309390113,4349064.210998647,1000559889,G,0
            	*/ 
            	
            	passList += markerLayer.markers[i].lonlat.lon;
                 passList += ",";
                 passList += markerLayer.markers[i].lonlat.lat;
                 passList += ",,G,0"
                 
                 if(i<markerLayer.markers.length-2){
                	 passList += ",";
                 }
            }
           
            /* console.log(passList); */
           
            var endX = markerLayer.markers[markerLayer.markers.length-1].lonlat.lon;
            var endY = markerLayer.markers[markerLayer.markers.length-1].lonlat.lat;
         
           
           
            /* var routeFormat = new Tmap.Format.GeoJSON({extractStyles:true, extractAttributes:true}); 
            var urlStr = "https://apis.skplanetx.com/tmap/routes?version=1"; *//* JSON 타입 */
             var routeFormat = new Tmap.Format.KML({extractStyles:true, extractAttributes:true}) /* KML 타입 */
             var urlStr = "https://apis.skplanetx.com/tmap/routes?version=1&format=xml"; /* KML타입 받아오는 파라메터 추가 */
            urlStr += "&startX="+startX;
            urlStr += "&startY="+startY;
            urlStr += "&endX="+endX;
            urlStr += "&endY="+endY;
            urlStr += "&passList="+passList;
            urlStr += "&appKey=ce6f02bc-1480-3fc6-9622-5a2fb5dc009d";
            
            
            console.log(urlStr);
            
            var prtcl = new Tmap.Protocol.HTTP({
                                                url: urlStr,
                                                format:routeFormat
                                                }); 
            
            
            var routeLayer = new Tmap.Layer.Vector("route", {protocol:prtcl, strategies:[new Tmap.Strategy.Fixed()]});
            routeLayer.events.register("featuresadded", routeLayer, onDrawnFeatures);/* 레이어에 줌 이벤트 함수 등록 */
            map.addLayer(routeLayer);
        }
        //경로 그리기 후 해당영역으로 줌
        function onDrawnFeatures(e){
            map.zoomToExtent(this.getDataExtent());
        }
        
        
        
        
        
        /* Start : https://developers.skplanetx.com/community/forum/t-map/view/?ntcStcId=20120822153630 */
        Tmap.Format.KML.prototype.parseData = function(data, options) {
	        if(typeof data == "string") {
	            data = Tmap.Format.XML.prototype.read.apply(this, [data]);
	            console.log('data가 String');
	        }
	        /* console.log(data); */
	        var totalDistance = this.getElementsByTagNameNS(data, "*", "totalDistance");
	        var totalTime = this.getElementsByTagNameNS(data, "*", "totalTime");
	        /* console.log(totalDistance[0].firstChild.data);
	        console.log(totalTime[0].firstChild.data); */
	        // Loop throught the following node types in this order and
	        // process the nodes found 
	        var types = ["Link", "NetworkLink", "Style", "StyleMap", "Placemark"];
	        for(var i=0, len=types.length; i<len; ++i) {
	            var type = types[i];
	
	            var nodes = this.getElementsByTagNameNS(data, "*", type);
				
	            
	            // skip to next type if no nodes are found
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
	        
	        /* console.log(this.features); */
	        
	        for(var i=0, len=this.features.length; i<len; ++i) { 
	        	console.log(this.features[i].data.description);
	        	
	        	var div_route_box = "<div class='btn-primary btn-outline btn-lg'>";
	        	div_route_box+=this.features[i].data.description;
	        	div_route_box+= "</div>";
	        	
	        	 $('#route_float').append(div_route_box);
			     $('#route_float').append('<br>');
	        }
	        
	        
	        return this.features;
	    };
	    
	    /* 이하 코드는 해독 필요 어디다 쓰이는건지 이해못함 */
    	var map, kmlLayer, select;
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
	    };
        
        /* End : https://developers.skplanetx.com/community/forum/t-map/view/?ntcStcId=20120822153630 */
     
        		
        </script>



<!-- append clone 해서 사용할 div 생성해두기 -->
<!-- style="display:none;" -->
<%-- <div class="sch_content" style="width: 250px; display:none;"/>


						<img
							src="http://img.earthtory.com/img/place_img/312/7505_0_et.jpg"
							alt="" class="spot_img"
							onerror="this.src='/res/img/common/no_img/sight55.png';"
							onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
							style="cursor: pointer; display:none;">
							
						<div class="spot_content_box" style="width: 150px; display:none;" />
						
							<div class="spot_name"
								onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
								style="cursor: pointer; display:none;">1번</div>
								
							<div class="spot_info"  style="display:none;"/>
								<div class="tag"  style="display:none;">유명한거리/지역</div>
								<div class="sinfo_line"  style="display:none;"></div>
								<div class="sinfo_txt" style="padding: 0px; display:none;">
									<img src="<%=request.getContextPath()%>/css/history/like.png"
										style="height: 20px"> 6 / 10 <span>1개의 평가</span>
								</div> --%>
							
						
					



<%----------------------------------왼쪽 일정 짜기 부분 스크립트 ----------------------------------------%>

<%-- <link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
	href="<%=request.getContextPath()%>/css/history.css"> --%>






<!-- 상세보기 일정 -->

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
      /* $(".sortable").disableSelection(); */
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
         header : "> div > h3",
         autoHeight: false,
         navigation: true,
         heightStyle: "content" /* 이걸 추가하기 위해 염병을 했다 */
      })
      .sortable({
         axis : "y",
         handle : "h3",
         stop : function(event, ui) {
            // IE doesn't register the blur when sorting
            // so trigger focusout handlers to remove .ui-state-focus
            ui.item.children("div").triggerHandler("focusout");
            // Refresh accordion to handle new order
            $(this).accordion("refresh");
         }
      });
    
    });

  
  
  
</script>















<!-- 여행이름 입력 창 -->
<input type="text" style="width:300px;" class="btn btn-primary"  id="routename" name="routename" >



<!-- 검색창 -->
<input type="button" style="margin-left:10px;float:right;" value="검색하기" class="btn btn-primary" id="searchSiteBtn">
<input type="text" style="width:300px;float:right;" class="form-control" id="searchWord" name="searchWord" value="${searchWord}" placeholder="검색할 태그를 입력해주세요.">






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
	<div id="map_div" style="float: left; position:relative; bottom:635px; left:300px;"></div>
	
</div>


<div id="route_float">
		<input type="button" id="btn" value="길찾기"
			class="btn btn-primary btn-outline btn-lg" onclick="search()" />
</div>

	
<%-- ----------------------------------form-------------------------------------------%>
<form action="${pageContext.request.contextPath}/PLANA.detail.insert.do" method="post" id="route_list_form">
	<div id="route_list_form_innerdiv"></div>
	<!-- <input type='hidden' name='route_code' value='1'>
	<input type='hidden' name='username' value='username'>
	<input type='hidden' name='route_order' value='1'>
	<input type='hidden' name='route_date' value='2017/06/23'>
	<input type='hidden' name='site' value='site'>
	<input type='hidden' name='lon' value='lon'>
	<input type='hidden' name='lat' value='lat'>
	<input type='hidden' name='category' value='category'>
	<input type='hidden' name='stime' value= '2017/06/23 11:00:00'>
	<input type='hidden' name='etime' value= '2017/06/23'> 
	
	<input type='hidden' name='route_order' value='2'>
	<input type='hidden' name='username' value='2'>
	<input type='hidden' name='route_code' value='2'>
	<input type='hidden' name='route_date' value='2017/06/23'>
	<input type='hidden' name='site' value='2'>
	<input type='hidden' name='lon' value='2'>
	<input type='hidden' name='lat' value='2'>
	<input type='hidden' name='category' value='2'>
	<input type='hidden' name='stime' value='2'>
	<input type='hidden' name='etime' value='2'>
	 -->
	
	
	<input type="submit" value="저장" id="submit_route_detail">
</form>