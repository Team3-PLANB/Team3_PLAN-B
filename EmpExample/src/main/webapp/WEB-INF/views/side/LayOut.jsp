<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<title>Bootstrap Case</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	
	<header>
		<tiles:insertAttribute name="header"/>
	</header>
	<section>
		<div class="container-fluid">
			<div class="row">

				<article>
					<div class="container">
						<tiles:insertAttribute name="well"/>				
					</div>
				</article>
				
				<article>
						<tiles:insertAttribute name="content"/>
				</article>
					
			</div>
		</div>
	</section>
	<br/><br/>
	<footer>
		<tiles:insertAttribute name="footer"/>	
	</footer>

</body>
</html>