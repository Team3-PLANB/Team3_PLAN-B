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

<div style="height:650px;">
	<div style="background-color:#fcde11;width:0px;height:650px;overflow:scroll;" id="schedulebox" >
		<div id="accordion">
			<div class="group">
				<h3>Section 1</h3>
				<div>
					<ul class="sortable" >
					  <li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 1</li>
					  <li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 2</li>
					  <li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 3</li>
					  <li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 4</li>
					  <li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 5</li>
					  <li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 6</li>
					  <li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 7</li>
					</ul>
				</div>
			</div>
			<div class="group">
				<h3>Section 2</h3>
				<div>
					<ul class="sortable" >
					  <li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 1</li>
					  <li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 2</li>
					  <li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 3</li>
					  <li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 4</li>
					  <li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 5</li>
					  <li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 6</li>
					  <li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 7</li>
					</ul>
				</div>
			</div>
			<div class="group">
				<h3>Section 3</h3>
				<div>
					<ul class="sortable" >
					  <li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 1</li>
					  <li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 2</li>
					  <li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 3</li>
					  <li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 4</li>
					  <li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 5</li>
					  <li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 6</li>
					  <li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 7</li>
					</ul>
				</div>
			</div>
			<div class="group">
				<h3>Section 4</h3>
				<div>
					<ul class="sortable" >
					  <li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 1</li>
					  <li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 2</li>
					  <li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 3</li>
					  <li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 4</li>
					  <li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 5</li>
					  <li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 6</li>
					  <li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 7</li>
					</ul>
				</div>
			</div>
		</div>
		
		<input class="spinner" name="during" value="0">분
	</div>
	
</div>