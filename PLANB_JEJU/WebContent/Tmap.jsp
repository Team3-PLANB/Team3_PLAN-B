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
<script type="text/javascript">

$( function() {
	var lonlat; 
	
 } );
      //초기화 함수
        function init(){
            /* centerLL = new Tmap.LonLat(14145677.4, 4511257.6); */
            centerLL = new Tmap.LonLat(37.565726, 126.977233);
            map = new Tmap.Map({div:'map_div',
                                width:'100%', 
                                height:'400px',
                                transitionEffect:"resize",
                                animation:true
                            }); 
            
          
            
           
                 
            /*  var lonlat = new Tmap.LonLat(14135893.887852, 4518348.1852606); */

            
            map.addControl(new Tmap.Control.MousePosition());/* 마우스 오버에 좌표값 표시 */
            
            map.events.register("click", map, onClickMap)
            
            
            /* searchRoute(); */
        };
        
        function onClickMap(evt){
            /* console.log(evt.clientX);
            
            console.log(evt.clientY);
            console.log(map.getLonLatFromPixel(new Tmap.Pixel(evt.clientX,evt.clientY)));
            
            console.log('2'); */
            /* console.log(lonlat); */
            /* var lonlat =  map.getLonLatFromPixel(new Tmap.Pixel(evt.clientX,evt.clientY)); */
            lonlat =  map.getLonLatFromPixel(new Tmap.Pixel(evt.clientX,evt.clientY));
            
/*             
            console.log(lonlat);
            console.log(lonlat.lat);
            console.log(lonlat.lon); */
            var markerLayer = new Tmap.Layer.Markers();/* 마커 뿌릴 레이어 추가 */
            map.addLayer(markerLayer);
            
            var size = new Tmap.Size(24,38);
            var offset = new Tmap.Pixel(-(size.w/2), -(size.h/2));
            var icon = new Tmap.Icon('https://developers.skplanetx.com/upload/tmap/marker/pin_b_m_a.png', size, offset); /* 마커 아이콘 */
            
            var marker = new Tmap.Marker(lonlat, icon);
            markerLayer.addMarker(marker);
        }
        
        /* alert(map.getLonLatFromPixel(
        new Tmap.Pixel(document.getElementById('x').value,document.getElementById('y').value))) */
        
        
        //경로 정보 로드
/*         function searchRoute(){
            var routeFormat = new Tmap.Format.KML({extractStyles:true, extractAttributes:true});
            var startX = 14129105.461214;
            var startY = 4517042.1926406;
        
            var endX = 14136027.789587;
            var endY = 4517572.4745242;  
     
           
            var urlStr = "https://apis.skplanetx.com/tmap/routes?version=1&format=xml";
            urlStr += "&startX="+startX;
            urlStr += "&startY="+startY;
            urlStr += "&endX="+endX;
            urlStr += "&endY="+endY;
            urlStr += "&appKey=ce6f02bc-1480-3fc6-9622-5a2fb5dc009d";
            var prtcl = new Tmap.Protocol.HTTP({
                                                url: urlStr,
                                                format:routeFormat
                                                });
            var routeLayer = new Tmap.Layer.Vector("route", {protocol:prtcl, strategies:[new Tmap.Strategy.Fixed()]});
            routeLayer.events.register("featuresadded", routeLayer, onDrawnFeatures);
            map.addLayer(routeLayer);
        } */
         
        function search(){
        	
        	
        	
        	
        	
        	
        	console.log(lonlat.lat);
            console.log(lonlat.lon);
            
        	
        	
            var startX = 14129105.461214;
            var startY = 4517042.1926406;
            var endX = lonlat.lon;
            var endY = lonlat.lat; 
           
           
            var routeFormat = new Tmap.Format.GeoJSON({extractStyles:true, extractAttributes:true}); 
            var urlStr = "https://apis.skplanetx.com/tmap/routes?version=1";/* JSON 타입 */
            /* var routeFormat = new Tmap.Format.KML({extractStyles:true, extractAttributes:true}) *//* KML 타입 */
            /* var urlStr = "https://apis.skplanetx.com/tmap/routes?version=1&format=xml"; *//* KML타입 받아오는 파라메터 추가 */
            urlStr += "&startX="+startX;
            urlStr += "&startY="+startY;
            urlStr += "&endX="+endX;
            urlStr += "&endY="+endY;
            urlStr += "&appKey=ce6f02bc-1480-3fc6-9622-5a2fb5dc009d";
            var prtcl = new Tmap.Protocol.HTTP({
                                                url: urlStr,
                                                format:routeFormat
                                                });
            
            var prtcl1 = prtcl.read();
            console.log(prtcl1.priv);
            
            
            var route = new Array();
			
			$.ajax({
						url : urlStr,
						type : 'GET',
						dataType : 'json',
						success : function(data) {
							/* console.log(data.features[2].properties.description); */
							
							$.each(data.features, function(index, obj) {
								console.log(obj);
								route[index] = obj.properties.description;
								
						        $('body').append(route[index]);
						        $('body').append('<br>');
						        console.log(index);
							}); 
							
						}
			
			
					});
            
            
            var routeLayer = new Tmap.Layer.Vector("route", {protocol:prtcl, strategies:[new Tmap.Strategy.Fixed()]});

            routeLayer.events.register("featuresadded", routeLayer, onDrawnFeatures);/* 레이어에 줌 이벤트 함수 등록 */
            map.addLayer(routeLayer);
        }
        //경로 그리기 후 해당영역으로 줌
        function onDrawnFeatures(e){
            map.zoomToExtent(this.getDataExtent());
        }
        
     
        </script>
</head>
<body onload="init()">
	<div id="map_div"></div>
	<input type="button" id="btn" value="길찾기" onclick="search()" />
</body>
</html>
