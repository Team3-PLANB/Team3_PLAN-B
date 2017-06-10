<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<h3>구글맵</h3>
<!-- <div class="box-testimony animate-box">
	<blockquote>
		<span class="quote"><span><i class="icon-quotes-right"></i></span></span>
		<p>&ldquo;Far far away, behind the word mountains, far from the
			countries Vokalia and Consonantia, there live the blind texts.
			Separated they live in Bookmarksgrove right at the coast of the
			Semantics, a large language ocean.&rdquo;</p>
	</blockquote>
	<p class="author">
		John Doe, CEO <a href="http://freehtml5.co/" target="_blank">FREEHTML5.co</a>
		<span class="subtext">Creative Director</span>
	</p>
</div> -->


<style>
#right-panel {
	font-family: 'Roboto', 'sans-serif';
	line-height: 30px;
	padding-left: 10px;
}

#right-panel select, #right-panel input {
	font-size: 15px;
}

#right-panel select {
	width: 100%;
}

#right-panel i {
	font-size: 12px;
}

html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

#map {
	height: 100%;
	float: left;
	width: 63%;
	height: 100%;
}

#right-panel {
	float: right;
	width: 34%;
	height: 100%;
}

.panel {
	height: 100%;
	overflow: auto;
}
</style>


<div id="map"></div>
<div id="right-panel">
	<p>
		Total Distance: <span id="total"></span>
	</p>
</div>
<script>
      function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 4,
          center: {lat: 33.378537, lng: 126.537358}  // Jeju.
        });

        var directionsService = new google.maps.DirectionsService;
        var directionsDisplay = new google.maps.DirectionsRenderer({
          draggable: true,
          map: map,
          panel: document.getElementById('right-panel')
        });

        directionsDisplay.addListener('directions_changed', function() {
          computeTotalDistance(directionsDisplay.getDirections());
        });

        displayRoute(directionsService,
            directionsDisplay);
      }

      /* function displayRoute(service, display) {
        service.route({
          origin: {lat:33.504096, lng:126.496143},
          destination: {lat:33.504821,lng: 126.949736},
         waypoints: [{location: new google.maps.LatLng(33.547252, 126.782692)},{location: new google.maps.LatLng(33.547253, 126.782691)}],
          travelMode: 'TRANSIT',
          avoidTolls: true
        }, function(response, status) {
          if (status === 'OK') {
            display.setDirections(response);
          } else {
            alert('Could not display directions due to: ' + status);
          }
        });
      }
 *///1차 원본
 function displayRoute(service, display) {
     service.route({
      /*  origin: origin,
       destination: destination, */
       origin:  {lat: 33.508139,lng: 126.491372},
       destination: {lat : 33.551459, lng : 126.828020},/* 33.556122, 126.796255 */
       /*  waypoints: [{location: 'Adelaide, SA'}, {location: 'Broken Hill, NSW'}], */
       waypoints: [{location: 'Adelaide, SA'}, {location: 'Broken Hill, NSW'}],
       /* waypoints: [{ location: new google.maps.LatLng(33.556122,126.796255)}], */
       travelMode: 'TRANSIT',
       avoidTolls: true
     }, function(response, status) {
       if (status === 'OK') {
         display.setDirections(response);
       } else {
         alert('Could not display directions due to: ' + status);
       }
     });
   }
      function computeTotalDistance(result) {
        var total = 0;
        var myroute = result.routes[0];
        for (var i = 0; i < myroute.legs.length; i++) {
          total += myroute.legs[i].distance.value;
        }
        total = total / 1000;
        document.getElementById('total').innerHTML = total + ' km';
      }
    </script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDflLqqG9R31zagEwNfAel-Z27Jr54d99M&callback=initMap">
    </script>


