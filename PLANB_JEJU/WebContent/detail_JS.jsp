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
.sortable{
	font-size: 10px;
	list-style-type: none;
	margin: 0;
	padding: 0;
	width: 60%;
	height: auto; 
	display : inline;
}
/* .sortable div{

 	height: auto; 
}
 */

/* .sortable li {
	margin: 3px;
	padding: 0.4em;
	padding-left: 1.5em;
	font-size: 1.4em;
	height: 40px;
} */

/* .sortable li span {
	position: absolute;
	margin-left: -1.3em;
} */

div.over {
	background: url("http://cfile1.uf.tistory.com/image/20558E424FEE324E2693F1");
	
	cursor: pointer; /* 마우스 손모양 */
}



/* class="ui-accordion-content ui-corner-bottom ui-helper-reset ui-widget-content ui-accordion-content-active"

id="ui-id-2"

aria-labelledby="ui-id-1"

role="tabpanel"

aria-hidden="false"

style="display: block; height: 458px;" */

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
 

    
<link rel="shortcut icon" href="favicon.ico">

<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>
   
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/icomoon.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/bootstrap.css">
<!-- Superfish -->
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/superfish.css">
<!-- histroy css -->
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/history.css">





<div style="background-color:white; width:450px;" id="schedulebox2" ><!-- 이놈은 아님 -->
	<div id="accordion2" style ="overflow:auto; width:450px; height:650px;">
    	<div class="group">
           <h3>DAY 1</h3> <!--min-height   -->
			<div>
			
			
		<div class="sortable">
		<div class="sch_content" style="width:280px;">
        <img src="http://img.earthtory.com/img/place_img/312/7505_0_et.jpg"
         alt="" class="spot_img"
         onerror="this.src='/res/img/common/no_img/sight55.png';"
         onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
         style="cursor: pointer;">
    <div class="spot_content_box" style="width:150px;">
         <div class="spot_name"
          onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
          style="cursor: pointer;">1번 </div>
     <div class="spot_info">
     <div class="tag">유명한거리/지역</div>
     <div class="sinfo_line"></div>
     <div class="sinfo_txt" style="padding:0px">
     <img src="<%= request.getContextPath() %>/css/history/like.png" style="height : 20px">
       6 / 10 <span>1개의 평가</span>
     </div>
     </div>
     </div>
     	<div class="spot_btn_box">
        	<img src="<%= request.getContextPath() %>/css/history/map_ico.png" alt="" class="spot_btn map_view" onclick="set_center(33.51010100,126.48125500)">
        </div>
     
        </div>

        
        
 <div class="sch_content" style="width:280px;">
        <img src="http://img.earthtory.com/img/place_img/312/7505_0_et.jpg"
         alt="" class="spot_img"
         onerror="this.src='/res/img/common/no_img/sight55.png';"
         onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
         style="cursor: pointer;">
    <div class="spot_content_box" style="width:150px;">
         <div class="spot_name"
          onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
          style="cursor: pointer;">222 </div>
     <div class="spot_info">
     <div class="tag">유명한거리/지역</div>
     <div class="sinfo_line"></div>
     <div class="sinfo_txt" style="padding:0px">
     <img src="<%= request.getContextPath() %>/css/history/like.png" style="height : 20px">
       6 / 10 <span>1개의 평가</span>
     </div>
     </div>
     </div>
     	<div class="spot_btn_box">
        	<img src="<%= request.getContextPath() %>/css/history/map_ico.png" alt="" class="spot_btn map_view" onclick="set_center(33.51010100,126.48125500)">
        </div>
    
        </div>
        
 	<%-- <div class="sch_content" style="width:280px;">
        <img src="http://img.earthtory.com/img/place_img/312/7505_0_et.jpg"
         alt="" class="spot_img"
         onerror="this.src='/res/img/common/no_img/sight55.png';"
         onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
         style="cursor: pointer;">
    <div class="spot_content_box" style="width:150px;">
         <div class="spot_name"
          onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
          style="cursor: pointer;">333 </div>
     <div class="spot_info">
     <div class="tag">유명한거리/지역</div>
     <div class="sinfo_line"></div>
     <div class="sinfo_txt" style="padding:0px">
     <img src="<%= request.getContextPath() %>/css/history/like.png" style="height : 20px">
       6 / 10 <span>1개의 평가</span>
     </div>
     </div>
     </div>
     		<div class="spot_btn_box">
        		<img src="<%= request.getContextPath() %>/css/history/map_ico.png" alt="" class="spot_btn map_view" onclick="set_center(33.51010100,126.48125500)">
        	</div>
     	 </div> --%>
     
    	</div>
	</div>
</div>


<div class="group">
           <h3>DAY 2</h3>
			<div>
    <div class="sortable">
        <div class="sch_content" style="width:280px;">
        <img src="http://img.earthtory.com/img/place_img/312/7505_0_et.jpg"
         alt="" class="spot_img"
         onerror="this.src='/res/img/common/no_img/sight55.png';"
         onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
         style="cursor: pointer;">
    <div class="spot_content_box" style="width:150px;">
         <div class="spot_name"
          onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
          style="cursor: pointer;">1번 </div>
     <div class="spot_info">
     <div class="tag">유명한거리/지역</div>
     <div class="sinfo_line"></div>
     <div class="sinfo_txt" style="padding:0px">
     <img src="<%= request.getContextPath() %>/css/history/like.png" style="height : 20px">
       6 / 10 <span>1개의 평가</span>
     </div>
     </div>
     </div>
     	<div class="spot_btn_box">
        	<img src="<%= request.getContextPath() %>/css/history/map_ico.png" alt="" class="spot_btn map_view" onclick="set_center(33.51010100,126.48125500)">
        </div>
   
        </div>
 <div class="sch_content" style="width:280px;">
        <img src="http://img.earthtory.com/img/place_img/312/7505_0_et.jpg"
         alt="" class="spot_img"
         onerror="this.src='/res/img/common/no_img/sight55.png';"
         onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
         style="cursor: pointer;">
    <div class="spot_content_box" style="width:150px;">
         <div class="spot_name"
          onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
          style="cursor: pointer;">22 </div>
     <div class="spot_info">
     <div class="tag">유명한거리/지역</div>
     <div class="sinfo_line"></div>
     <div class="sinfo_txt" style="padding:0px">
     <img src="<%= request.getContextPath() %>/css/history/like.png" style="height : 20px">
       6 / 10 <span>1개의 평가</span>
     </div>
     </div>
     </div>
     	<div class="spot_btn_box">
        	<img src="<%= request.getContextPath() %>/css/history/map_ico.png" alt="" class="spot_btn map_view" onclick="set_center(33.51010100,126.48125500)">
        </div>
     		
        </div>
        
        
 <div class="sch_content" style="width:280px;">
        <img src="http://img.earthtory.com/img/place_img/312/7505_0_et.jpg"
         alt="" class="spot_img"
         onerror="this.src='/res/img/common/no_img/sight55.png';"
         onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
         style="cursor: pointer;">
    <div class="spot_content_box" style="width:150px;">
         <div class="spot_name"
          onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
          style="cursor: pointer;">333 </div>
     <div class="spot_info">
     <div class="tag">유명한거리/지역</div>
     <div class="sinfo_line"></div>
     <div class="sinfo_txt" style="padding:0px">
     <img src="<%= request.getContextPath() %>/css/history/like.png" style="height : 20px">
       6 / 10 <span>1개의 평가</span>
     </div>
     </div>
     </div>
     	<div class="spot_btn_box">
        	<img src="<%= request.getContextPath() %>/css/history/map_ico.png" alt="" class="spot_btn map_view" onclick="set_center(33.51010100,126.48125500)">
        </div>
    
        </div>
        
 	<div class="sch_content" style="width:280px;">
        <img src="http://img.earthtory.com/img/place_img/312/7505_0_et.jpg"
         alt="" class="spot_img"
         onerror="this.src='/res/img/common/no_img/sight55.png';"
         onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
         style="cursor: pointer;">
    <div class="spot_content_box" style="width:150px;">
         <div class="spot_name"
          onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
          style="cursor: pointer;">444 </div>
     <div class="spot_info">
     <div class="tag">유명한거리/지역</div>
     <div class="sinfo_line"></div>
     <div class="sinfo_txt" style="padding:0px">
     <img src="<%= request.getContextPath() %>/css/history/like.png" style="height : 20px">
       6 / 10 <span>1개의 평가</span>
     </div>
     </div>
     </div>
     		<div class="spot_btn_box">
        		<img src="<%= request.getContextPath() %>/css/history/map_ico.png" alt="" class="spot_btn map_view" onclick="set_center(33.51010100,126.48125500)">
        	</div>
     	 </div>
   
    	</div>
	</div>
</div>

<div class="group">
           <h3>DAY 3</h3>
			<div>
    <div class="sortable">
        <div class="sch_content" style="width:280px;">
        <img src="http://img.earthtory.com/img/place_img/312/7505_0_et.jpg"
         alt="" class="spot_img"
         onerror="this.src='/res/img/common/no_img/sight55.png';"
         onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
         style="cursor: pointer;">
    <div class="spot_content_box" style="width:150px;">
         <div class="spot_name"
          onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
          style="cursor: pointer;">1번 </div>
     <div class="spot_info">
     <div class="tag">유명한거리/지역</div>
     <div class="sinfo_line"></div>
     <div class="sinfo_txt" style="padding:0px">
     <img src="<%= request.getContextPath() %>/css/history/like.png" style="height : 20px">
       6 / 10 <span>1개의 평가</span>
     </div>
     </div>
     </div>
     	<div class="spot_btn_box">
        	<img src="<%= request.getContextPath() %>/css/history/map_ico.png" alt="" class="spot_btn map_view" onclick="set_center(33.51010100,126.48125500)">
        </div>
    
        </div>
 <div class="sch_content" style="width:280px;">
        <img src="http://img.earthtory.com/img/place_img/312/7505_0_et.jpg"
         alt="" class="spot_img"
         onerror="this.src='/res/img/common/no_img/sight55.png';"
         onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
         style="cursor: pointer;">
    <div class="spot_content_box" style="width:150px;">
         <div class="spot_name"
          onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
          style="cursor: pointer;">22 </div>
     <div class="spot_info">
     <div class="tag">유명한거리/지역</div>
     <div class="sinfo_line"></div>
     <div class="sinfo_txt" style="padding:0px">
     <img src="<%= request.getContextPath() %>/css/history/like.png" style="height : 20px">
       6 / 10 <span>1개의 평가</span>
     </div>
     </div>
     </div>
     	<div class="spot_btn_box">
        	<img src="<%= request.getContextPath() %>/css/history/map_ico.png" alt="" class="spot_btn map_view" onclick="set_center(33.51010100,126.48125500)">
        </div>
     		
        </div>
        
        
 <div class="sch_content" style="width:280px;">
        <img src="http://img.earthtory.com/img/place_img/312/7505_0_et.jpg"
         alt="" class="spot_img"
         onerror="this.src='/res/img/common/no_img/sight55.png';"
         onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
         style="cursor: pointer;">
    <div class="spot_content_box" style="width:150px;">
         <div class="spot_name"
          onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
          style="cursor: pointer;">333 </div>
     <div class="spot_info">
     <div class="tag">유명한거리/지역</div>
     <div class="sinfo_line"></div>
     <div class="sinfo_txt" style="padding:0px">
     <img src="<%= request.getContextPath() %>/css/history/like.png" style="height : 20px">
       6 / 10 <span>1개의 평가</span>
     </div>
     </div>
     </div>
     	<div class="spot_btn_box">
        	<img src="<%= request.getContextPath() %>/css/history/map_ico.png" alt="" class="spot_btn map_view" onclick="set_center(33.51010100,126.48125500)">
        </div>
    
        </div>
        
 	<div class="sch_content" style="width:280px;">
        <img src="http://img.earthtory.com/img/place_img/312/7505_0_et.jpg"
         alt="" class="spot_img"
         onerror="this.src='/res/img/common/no_img/sight55.png';"
         onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
         style="cursor: pointer;">
    <div class="spot_content_box" style="width:150px;">
         <div class="spot_name"
          onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
          style="cursor: pointer;">444 </div>
     <div class="spot_info">
     <div class="tag">유명한거리/지역</div>
     <div class="sinfo_line"></div>
     <div class="sinfo_txt" style="padding:0px">
     <img src="<%= request.getContextPath() %>/css/history/like.png" style="height : 20px">
       6 / 10 <span>1개의 평가</span>
     </div>
     </div>
     </div>
     		<div class="spot_btn_box">
        		<img src="<%= request.getContextPath() %>/css/history/map_ico.png" alt="" class="spot_btn map_view" onclick="set_center(33.51010100,126.48125500)">
        	</div>
     	 </div>
     <div class="sch_content" style="width:280px;">
        <img src="http://img.earthtory.com/img/place_img/312/7505_0_et.jpg"
         alt="" class="spot_img"
         onerror="this.src='/res/img/common/no_img/sight55.png';"
         onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
         style="cursor: pointer;">
    <div class="spot_content_box" style="width:150px;">
         <div class="spot_name"
          onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
          style="cursor: pointer;">555 </div>
     <div class="spot_info">
     <div class="tag">유명한거리/지역</div>
     <div class="sinfo_line"></div>
     <div class="sinfo_txt" style="padding:0px">
     <img src="<%= request.getContextPath() %>/css/history/like.png" style="height : 20px">
       6 / 10 <span>1개의 평가</span>
     </div>
     </div>
     </div>
     		<div class="spot_btn_box">
        		<img src="<%= request.getContextPath() %>/css/history/map_ico.png" alt="" class="spot_btn map_view" onclick="set_center(33.51010100,126.48125500)">
        	</div>
     	 </div>
    	</div>
	</div>
</div>



</div>
</div>






  
