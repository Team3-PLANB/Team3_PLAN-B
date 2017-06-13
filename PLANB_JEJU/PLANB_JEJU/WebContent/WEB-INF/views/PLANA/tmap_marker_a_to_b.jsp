<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>simpleMap</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
<script
	src="https://apis.skplanetx.com/tmap/js?version=1&format=javascript&appKey=ce6f02bc-1480-3fc6-9622-5a2fb5dc009d"></script>

<link rel="stylesheet" href="css/plana_tmap.css">

<script type="text/javascript">
$( function() {
	var lonlat; 
	var markerLayer;
	init();
	
 } );
      //초기화 함수
        function init(){
            /* centerLL = new Tmap.LonLat(14145677.4, 4511257.6); */
            centerLL = new Tmap.LonLat(14085866.64992, 3963136.5754785);
            map = new Tmap.Map({div:'map_div',
                                width:'80%', 
                                height:'400px',
                                transitionEffect:"resize",
                                animation:true
                            }); 
            
          
            
            map.setCenter(centerLL,11);/* 센터값, 11 : 지도 표현 범위(10 : 제주도 전체) */
                 
            /*  var lonlat = new Tmap.LonLat(14135893.887852, 4518348.1852606); */
            
            map.addControl(new Tmap.Control.MousePosition());/* 마우스 오버에 좌표값 표시 */
            
            map.events.register("click", map, onClickMap)
            
            markerLayer = new Tmap.Layer.Markers();
            map.addLayer(markerLayer);
            /* searchRoute(); */
        };
        
        //맵 클릭시 이벤트 함수 -> 마커 출력
        function onClickMap(evt){
            /* console.log(evt.clientX);
            
            console.log(evt.clientY);
            console.log(map.getLonLatFromPixel(new Tmap.Pixel(evt.clientX,evt.clientY)));
            
            console.log('2'); */
            /* console.log(lonlat); */
            /* var lonlat =  map.getLonLatFromPixel(new Tmap.Pixel(evt.clientX,evt.clientY)); */
            lonlat =  map.getLonLatFromPixel(new Tmap.Pixel(evt.clientX,(evt.clientY-100)));/* header 높이 만큼 처리 */
            
             
            console.log(lonlat);
            console.log(lonlat.lat);
            console.log(lonlat.lon); 
           /*  var markerLayer = new Tmap.Layer.Markers(); *//* 마커 뿌릴 레이어 추가 */
            /* map.addLayer(markerLayer); */
            
            var size = new Tmap.Size(24,38);
             var offset = new Tmap.Pixel(-(size.w/2), -(size.h/2)); 
       
            var icon = new Tmap.Icon('https://developers.skplanetx.com/upload/tmap/marker/pin_b_m_a.png', size, offset); /* 마커 아이콘 */
            
            
            
            
            var label = new Tmap.Label('0');
            
            var marker = new Tmap.Markers(lonlat, icon, label);
            markerLayer.addMarker(marker);
           
            console.log(marker);
            console.log(markerLayer.markers);
            console.log(markerLayer.markers.length);
            
            /* markers.markers[0].popup.setContentHTML("수정할 label의 html 문자열"); */
            console.log(markerLayer.markers[0].lonlat);
            
            if(marker.labelHtml=='0'){
            	 console.log(marker.labelHtml);
            }
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
</head>

<a href="${pageContext.request.contextPath}/PLANA.datepick.do">일정 만들기 step1</a><br>

<div id= "body_map">
	<div id="map_div" style="float : left; position : absolute "></div>
	<div id="route_float">
		<input type="button" id="btn" value="길찾기" class="btn btn-primary btn-outline btn-lg" onclick="search()" />
	</div>
</div>
</html>