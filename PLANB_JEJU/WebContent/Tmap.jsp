<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>simpleMap</title>
<script
	src="https://apis.skplanetx.com/tmap/js?version=1&format=javascript&appKey=ce6f02bc-1480-3fc6-9622-5a2fb5dc009d"></script>
<script type="text/javascript">
 
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
            searchRoute();
        };
        //경로 정보 로드
        function searchRoute(){
            var routeFormat = new Tmap.Format.KML({extractStyles:true, extractAttributes:true});
           /*  var startX = 14129105.461214;
            var startY = 4517042.1926406;
            var endX = 14136027.789587;
            var endY = 4517572.4745242; */
            var startX = 37.565726;
            var startY = 126.977233;
            var endX = 37.560522;
            var endY = 126.963041;
           
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
        }
        //경로 그리기 후 해당영역으로 줌
        function onDrawnFeatures(e){
            map.zoomToExtent(this.getDataExtent());
        }
        
     
        </script>
</head>
<body onload="init()">
	<div id="map_div"></div>
</body>
</html>
