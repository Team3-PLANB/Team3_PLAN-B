<%-- 
   @JSP : msgMain.jsp 
   @Date : 2017-06-09
   @Author : 홍단비
   @Desc : 쪽지함 메인페이지
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="WEB-INF/views/Mypage/msg.css">

<jsp:include page="../myPageMain.jsp"></jsp:include>

<div class="container">
  <div class="row">
    <nav class="col-sm-2" >
      <ul class="nav nav-pills nav-stacked">
        <li><a href="#section1" class = "active">받은 쪽지</a></li>
        <li><a href="#section2" class = "active">보낸 쪽지</a></li>
      </ul>
    </nav>
    <div class="col-sm-10" >
		<table class="responstable" >
		  <tr>
		    <th class="col-sm-1"/>
		    <th class="col-sm-1"><span>Index</span></th>
		    <th class="col-sm-1"><span>보낸 사람</span></th>
		    <th class="col-sm-5"><span>내용</span></th>
		    <th class="col-sm-2">받은 날짜</th>
		  </tr>
		  <tr>
		    <td class="col-sm-1"><input type="checkbox"/></td>
		    <td class="col-sm-1">1</td>
		    <td class="col-sm-1">Steve</td>
		    <td class="col-sm-5">Foo</td>
		    <td class="col-sm-2">01/01/1978</td>
		  </tr>

		</table>
		
    </div>
  </div>
  <br>
</div>
	
<!--
::: 쪽지쓰기 :::
 	<div class = "box-testimony animate-box">
		<form method="post" action="" class="ccform">
		    <div class="ccfield-prepend">
		        <span class="ccform-addon"><i class="fa fa-envelope fa-2x"></i></span>

		        <input class="ccformfield" type="text" placeholder="받는 사람 Email" required>
		    </div>
		    <br>
		    <div class="ccfield-prepend">
		        <span class="ccform-addon"><i class="fa fa-comment fa-2x"></i></span>
		        <textarea class="ccformfield" name="comments" rows="8" placeholder="Message" required></textarea>
		    </div>
		    <div class="ccfield-prepend">
		        <input class="ccbtn" type="submit" value="보내기">
		    </div>
		 </form>
    </div>
 -->
 <style>
@import "compass/css3";

/*

RESPONSTABLE 2.0 by jordyvanraaij
  Designed mobile first!

If you like this solution, you might also want to check out the 1.0 version:
  https://gist.github.com/jordyvanraaij/9069194

*/

// Default options for table style
$table-breakpoint: 400px;
$table-background-color: #F78536;
$table-text-color: #024457;
$table-outer-border: 1px solid #F78536;
$table-cell-border: 1px solid #F78536;

// Extra options for table style (parse these arguments when including your mixin)
$table-border-radius: 10px;
$table-highlight-color: #F78536;
$table-header-background-color: #F78536;
$table-header-text-color: #FFF;
$table-header-border: 1px solid #FFF;

// The Responstable mixin

@mixin responstable(
  $breakpoint: $table-breakpoint,
  $background-color: $table-background-color,
  $text-color: $table-text-color,
  $outer-border: $table-outer-border,
  $cell-border: $table-cell-border,
  $border-radius: none,
  $highlight-color: none,
  $header-background-color: $table-background-color,
  $header-text-color: $table-text-color,
  $header-border: $table-cell-border) {
  
  .responstable {
    margin: 1em 0;
    width: 200px;
    overflow: hidden;  
    background: $background-color;
    color: $text-color;
    border-radius: $border-radius;
    border: $outer-border;
  
    tr {
      border: $cell-border; 
      &:nth-child(odd) { // highlight the odd rows with a color
        background-color: $highlight-color;
      }  
    }
  
    th {
      display: none; // hide all the table header for mobile
      border: $header-border;
      background-color: $header-background-color;
      color: $header-text-color;
      padding: 1em;  
      &:first-child { // show the first table header for mobile
        display: table-cell;
        text-align: center;
      }
      &:nth-child(2) { // show the second table header but replace the content with the data-th from the markup for mobile
        display: table-cell;
        span {display:none;}
        &:after {content:attr(data-th);}
      }
      @media (min-width: $breakpoint) {
        &:nth-child(2) { // hide the data-th and show the normal header for tablet and desktop
          span {display: block;}
          &:after {display: none;}
        }
      }
    }
  
    td {
      display: block; // display the table data as one block for mobile
      word-wrap: break-word;
      max-width: 7em;
      &:first-child { 
        display: table-cell; // display the first one as a table cell (radio button) for mobile
        text-align: center;
        border-right: $cell-border;
      }
      @media (min-width: $breakpoint) {
        border: $cell-border;
      }
    }
  
    th, td {
      text-align: left;
      margin: .5em 1em;  
      @media (min-width: $breakpoint) {
        display: table-cell; // show the table as a normal table for tablet and desktop
        padding: 1em;
      }
    }  
  }    
}

// Include the mixin (with extra options as overrides)

@include responstable(
  $border-radius: $table-border-radius,
  $highlight-color: $table-highlight-color,
  $header-background-color: $table-header-background-color,
  $header-text-color: $table-header-text-color,
  $header-border: $table-header-border);


@import url(https://fonts.googleapis.com/css?family=Lato:300,400,700);

/* body {
	background: #FFFFFF;
	color: #fff;
	font-weight: 400;
	font-size: 1em;
	font-family: 'Lato', Arial, sans-serif;
	margin:0;
	padding:0;
	padding-bottom:60px;
} */

#active {
	background-color: #F78536;
	font-color: #FFFFFF;
}
.ccheader {
	margin: 0 auto;
	padding: 2em;
	text-align: center;
}

.ccheader h1 {
	margin: 0;
	font-weight: 300;
	font-size: 2.5em;
	line-height: 1.3;
}
.ccheader {
	margin: 0 auto;
	padding: 2em;
	text-align: center;
}

.ccheader h1 {
	margin: 0;
	font-weight: 300;
	font-size: 2.5em;
	line-height: 1.3;
}

/* Form CSS*/
.ccform {
   margin: 0 auto;
    width: 800px;
}
.ccfield-prepend{
	margin-bottom:10px;
	width:100%;
}

.ccform-addon{
	color:#f8ae45; 
	float:left;
	padding:8px;
	width:8%;
	background:#FFFFFF;
	text-align:center;	
}

.ccformfield {
	color:#000000; 
	background:rgba(242, 145, 7, 0.25);
	border:none;
	padding:15.5px;
	width:91.9%;
	display:block;
	font-family: 'Lato',Arial,sans-serif;
	font-size:14px;
    border-radius: 4px;
}

.ccformfield {
	font-family: 'Lato',Arial,sans-serif;
}
.ccbtn{
	display:block;
	border:none;
	background:#f8ae45;
	color:#FFFFFF;
	padding:12px 25px;
	font-size: medium;
	text-decoration:none;
	font-weight:bold;
    margin: auto;
}
.ccbtn:hover{
	background:#d8850e;
}

#msgStep1 {
	width: 100px;
padding:12px 25px;
	
}

 </style>
