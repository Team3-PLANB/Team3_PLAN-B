<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>쪽지 보내기</title>

<!-- 모달 CSS -->
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
<link rel="stylesheet" href="message/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="message/css/form-elements.css">
<link rel="stylesheet" href="message/css/style.css">

<!-- 모달 Favicon and touch icons -->
<link rel="shortcut icon" href="message/ico/favicon.png">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="message/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="message/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="message/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="message/ico/apple-touch-icon-57-precomposed.png">

</head>



<body>
	<a class="btn btn-link-1 launch-modal" href="#"
		data-modal-id="modal-register">쪽지 보내기</a>
			
	<!-- MODAL -->
	<div class="modal fade" id="modal-register" tabindex="-1" role="dialog"
		aria-labelledby="modal-register-label" aria-hidden="true">
		<div class="modal-dialog" style=float:right>
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h3 class="modal-title" id="modal-register-label">경로 상세 정보</h3>
				</div>

				<div class="modal-body">

					<div id="route_float"></div>

				</div>

			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	
	$('#modal-register').modal({backdrop: 'static', keyboard: false}) ;
	</script>
	
	
	<!-- 모달 Javascript -->
	<script src="message/js/jquery-1.11.1.min.js"></script>
	<script src="message/bootstrap/js/bootstrap.min.js"></script>
	<script src="message/js/jquery.backstretch.min.js"></script>
	<script src="message/js/scripts.js"></script>

	<!--[if lt IE 10]>
            <script src="message/js/placeholder.js"></script>
        <![endif]-->

</body>

</html>