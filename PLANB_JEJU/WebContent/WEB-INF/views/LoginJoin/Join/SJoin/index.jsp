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
	#sortable { list-style-type: none; margin: 0; padding: 0; width: 60%;  width:200px; }
	#sortable li { margin: 0 3px 3px 3px; padding: 0.4em; padding-left: 1.5em; font-size: 1.4em; height: 50px; }
	#sortable li span { position: absolute; margin-left: -1.3em;}
</style>

<script>

	$(document).ready(function() {
		$('#spinner').spinner({
			min : 0,
			max : 300,
			step : 15,
			start : 0
		});
		$("#sortable").sortable();
		$("#sortable").disableSelection();

		$("#accordion")
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


<div style="background-color:#fcde11;width:30%;height:650px;overflow:scroll;" id="schedulebox" >
	<div id="accordion">
		<div class="group">
			<h3>Section 1</h3>
			<div>
				<p>Mauris mauris ante, blandit et, ultrices a, suscipit eget,
					quam. Integer ut neque. Vivamus nisi metus, molestie vel, gravida
					in, condimentum sit amet, nunc. Nam a nibh. Donec suscipit eros.
					Nam mi. Proin viverra leo ut odio. Curabitur malesuada. Vestibulum
					a velit eu ante scelerisque vulputate.</p>
			</div>
		</div>
		<div class="group">
			<h3>Section 2</h3>
			<div>
				<p>Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum
					sit amet purus. Vivamus hendrerit, dolor at aliquet laoreet, mauris
					turpis porttitor velit, faucibus interdum tellus libero ac justo.
					Vivamus non quam. In suscipit faucibus urna.</p>
			</div>
		</div>
		<div class="group">
			<h3>Section 3</h3>
			<div>
				<p>Nam enim risus, molestie et, porta ac, aliquam ac, risus.
					Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in
					pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac
					felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam
					nisi, eu iaculis leo purus venenatis dui.</p>
				<ul>
					<li>List item one</li>
					<li>List item two</li>
					<li>List item three</li>
				</ul>
			</div>
		</div>
		<div class="group">
			<h3>Section 4</h3>
			<div>
				<p>Cras dictum. Pellentesque habitant morbi tristique senectus
					et netus et malesuada fames ac turpis egestas. Vestibulum ante
					ipsum primis in faucibus orci luctus et ultrices posuere cubilia
					Curae; Aenean lacinia mauris vel est.</p>
				<p>Suspendisse eu nisl. Nullam ut libero. Integer dignissim
					consequat lectus. Class aptent taciti sociosqu ad litora torquent
					per conubia nostra, per inceptos himenaeos.</p>
			</div>
		</div>
	</div>

	<div style="padding:30px;">
		<input id="spinner" style="width:30px;" name="during" value="0">분
	</div>
	
	<ul id="sortable" >
	  <li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 1</li>
	  <li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 2</li>
	  <li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 3</li>
	  <li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 4</li>
	  <li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 5</li>
	  <li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 6</li>
	  <li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 7</li>
	</ul>
</div>