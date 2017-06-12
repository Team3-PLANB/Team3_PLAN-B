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

<script>
	$(document).ready(function(){
		$('#spinner').spinner({
		      min: 0,
		      max: 300,
		      step: 15,
		      start: 0
		});
  	});
</script>


<div style="background-color:#fcde11;width:30%;">
	<div style="padding:30px;">
		<input id="spinner" style="width:30px;" name="during" value="0">분
	</div>	
</div>