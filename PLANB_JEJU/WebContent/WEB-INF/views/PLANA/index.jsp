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
#map {
	height: 400px;
	width: 100%;
}
</style>



<div id="map"></div>
<script>
	function initMap() {
		var uluru = {
			lat : 33.380023,
			lng : 126.531803
		};
		var map = new google.maps.Map(document.getElementById('map'), {
			zoom : 4,
			center : uluru
		});
		/* var marker = new google.maps.Marker({
			position : uluru,
			map : map
		}); */
	}
</script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDflLqqG9R31zagEwNfAel-Z27Jr54d99M&callback=initMap">
	
</script>


