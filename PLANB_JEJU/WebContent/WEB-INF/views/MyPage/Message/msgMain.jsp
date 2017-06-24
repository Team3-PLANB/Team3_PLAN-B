<%--
@Project : PLANB_JEJU
@File name : msgMain.jsp 
@Author : 임정연
 @Data : 2017.06.22
@Desc : 쪽지함 페이지
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/WEB-INF/views/Mypage/msg.css">

<jsp:include page="../myPageMain.jsp"></jsp:include>
<link rel="shortcut icon" href="favicon.ico">

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/animate.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/icomoon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/superfish.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/magnific-popup.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap-datepicker.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/cs-select.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/cs-skin-border.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">

<script>
	/* 전체 선택   */
	$(document).ready(function() {
		$("#checkall1").click(function() {
			if ($("#checkall1").prop("checked")) {
				$("input[type=checkbox]").prop("checked", true);

			} else {
				$("input[type=checkbox]").each(function() {
					$("input[type=checkbox]").prop("checked", false);
				});
			}
		});

		$("[data-toggle=tooltip]").tooltip();
	});
	
	$(document).ready(function() {
		$("#checkall2").click(function() {
			if ($("#checkall2").prop("checked")) {
				$("input[type=checkbox]").prop("checked", true);

			} else {
				$("input[type=checkbox]").each(function() {
					$("input[type=checkbox]").prop("checked", false);
				});
			}
		});

		$("[data-toggle=tooltip]").tooltip();
	});

</script>
<br>
<br>
<div class="container" style="margin-bottom: 100px">
	<div class="row">
		<div class="tabulation animate-box fadeInUp animated">

			<!-- Nav tabs -->
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#step1"
					aria-controls="flights" role="tab" data-toggle="tab">받은 쪽지함</a></li>
				<li role="presentation"><a href="#step2" aria-controls="hotels"
					role="tab" data-toggle="tab">보낸 쪽지함</a></li>
			</ul>

			<!-- Tab panes -->
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane active" id="step1">
					<div class="table-responsive">
						<table id="mytable" class="table table-bordred table-striped">
							<thead>
								<th><input type="checkbox" id="checkall1" /></th>
								<th>닉네임</th>
								<th>이메일</th>
								<th>제목</th>
								<th>날짜</th>
								<th>Delete</th>
							</thead>
							<tbody>
								<tr>
									<td><input type="checkbox" class="checkthis" /></td>
									<td>뚱녀</td>
									<td>isometric.mohsin@gmail.com</td>
									<td>루트 중에 어떤 여행지가 가장 좋으셨어요?</td>
									<td>2017.06.15</td>

									<td align="center"><p data-placement="top"
											data-toggle="tooltip" title="Delete">
											<button class="btn btn-danger btn-xs" data-title="Delete"
												data-toggle="modal" data-target="#delete">
												<span class="glyphicon glyphicon-trash"></span>
											</button>
										</p></td>
								</tr>
								<tr>
									<td><input type="checkbox" class="checkthis" /></td>
									<td>꿍녀</td>
									<td>isometric.mohsin@gmail.com</td>
									<td>루트 중에 어떤 여행지가 가장 좋으셨어요?</td>
									<td>2017.06.15</td>

									<td align="center"><p data-placement="top"
											data-toggle="tooltip" title="Delete">
											<button class="btn btn-danger btn-xs" data-title="Delete"
												data-toggle="modal" data-target="#delete">
												<span class="glyphicon glyphicon-trash"></span>
											</button>
										</p></td>
								</tr>
								<tr>
									<td><input type="checkbox" class="checkthis" /></td>
									<td>꿍녀</td>
									<td>isometric.mohsin@gmail.com</td>
									<td>루트 중에 어떤 여행지가 가장 좋으셨어요?</td>
									<td>2017.06.15</td>

									<td align="center"><p data-placement="top"
											data-toggle="tooltip" title="Delete">
											<button class="btn btn-danger btn-xs" data-title="Delete"
												data-toggle="modal" data-target="#delete">
												<span class="glyphicon glyphicon-trash"></span>
											</button>
										</p></td>
								</tr>
								<tr>
									<td><input type="checkbox" class="checkthis" /></td>
									<td>꿍녀</td>
									<td>isometric.mohsin@gmail.com</td>
									<td>루트 중에 어떤 여행지가 가장 좋으셨어요?</td>
									<td>2017.06.15</td>

									<td align="center"><p data-placement="top"
											data-toggle="tooltip" title="Delete">
											<button class="btn btn-danger btn-xs" data-title="Delete"
												data-toggle="modal" data-target="#delete">
												<span class="glyphicon glyphicon-trash"></span>
											</button>
										</p></td>
								</tr>
								<tr>
									<td><input type="checkbox" class="checkthis" /></td>
									<td>꿍녀</td>
									<td>isometric.mohsin@gmail.com</td>
									<td>루트 중에 어떤 여행지가 가장 좋으셨어요?</td>
									<td>2017.06.15</td>

									<td align="center"><p data-placement="top"
											data-toggle="tooltip" title="Delete">
											<button class="btn btn-danger btn-xs" data-title="Delete"
												data-toggle="modal" data-target="#delete">
												<span class="glyphicon glyphicon-trash"></span>
											</button>
										</p></td>
								</tr>
								<tr>
									<td><input type="checkbox" class="checkthis" /></td>
									<td>꿍녀</td>
									<td>isometric.mohsin@gmail.com</td>
									<td>루트 중에 어떤 여행지가 가장 좋으셨어요?</td>
									<td>2017.06.15</td>

									<td align="center"><p data-placement="top"
											data-toggle="tooltip" title="Delete">
											<button class="btn btn-danger btn-xs" data-title="Delete"
												data-toggle="modal" data-target="#delete">
												<span class="glyphicon glyphicon-trash"></span>
											</button>
										</p></td>
								</tr>

							</tbody>

						</table>

						<div class="clearfix"></div>
						<ul class="pagination pull-right">
							<li class="disabled"><a href="#"><span
									class="glyphicon glyphicon-chevron-left"></span></a></li>
							<li class="active"><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#"><span
									class="glyphicon glyphicon-chevron-right"></span></a></li>
						</ul>

					</div>
				</div>
				<div role="tabpanel" class="tab-pane" id="step2">
					<div class="table-responsive">
						<table id="mytable" class="table table-bordred table-striped">

							<thead>

								<th><input type="checkbox" id="checkall2" /></th>
								<th>닉네임</th>
								<th>이메일</th>
								<th>제목</th>
								<th>날짜</th>
								<th>Delete</th>
							</thead>
							<tbody>

								<tr>
									<td><input type="checkbox" class="checkthis" /></td>
									<td>꿍녀</td>
									<td>isometric.mohsin@gmail.com</td>
									<td>루트 중에 어떤 여행지가 가장 좋으셨어요?</td>
									<td>2017.06.15</td>

									<td align="center"><p data-placement="top"
											data-toggle="tooltip" title="Delete">
											<button class="btn btn-danger btn-xs" data-title="Delete"
												data-toggle="modal" data-target="#delete">
												<span class="glyphicon glyphicon-trash"></span>
											</button>
										</p></td>
								</tr>
								<tr>
									<td><input type="checkbox" class="checkthis" /></td>
									<td>꿍녀</td>
									<td>isometric.mohsin@gmail.com</td>
									<td>루트 중에 어떤 여행지가 가장 좋으셨어요?</td>
									<td>2017.06.15</td>

									<td align="center"><p data-placement="top"
											data-toggle="tooltip" title="Delete">
											<button class="btn btn-danger btn-xs" data-title="Delete"
												data-toggle="modal" data-target="#delete">
												<span class="glyphicon glyphicon-trash"></span>
											</button>
										</p></td>
								</tr>
								<tr>
									<td><input type="checkbox" class="checkthis" /></td>
									<td>꿍녀</td>
									<td>isometric.mohsin@gmail.com</td>
									<td>루트 중에 어떤 여행지가 가장 좋으셨어요?</td>
									<td>2017.06.15</td>

									<td align="center"><p data-placement="top"
											data-toggle="tooltip" title="Delete">
											<button class="btn btn-danger btn-xs" data-title="Delete"
												data-toggle="modal" data-target="#delete">
												<span class="glyphicon glyphicon-trash"></span>
											</button>
										</p></td>
								</tr>
								<tr>
									<td><input type="checkbox" class="checkthis" /></td>
									<td>꿍녀</td>
									<td>isometric.mohsin@gmail.com</td>
									<td>루트 중에 어떤 여행지가 가장 좋으셨어요?</td>
									<td>2017.06.15</td>

									<td align="center"><p data-placement="top"
											data-toggle="tooltip" title="Delete">
											<button class="btn btn-danger btn-xs" data-title="Delete"
												data-toggle="modal" data-target="#delete">
												<span class="glyphicon glyphicon-trash"></span>
											</button>
										</p></td>
								</tr>
								<tr>
									<td><input type="checkbox" class="checkthis" /></td>
									<td>꿍녀</td>
									<td>isometric.mohsin@gmail.com</td>
									<td>루트 중에 어떤 여행지가 가장 좋으셨어요?</td>
									<td>2017.06.15</td>

									<td align="center"><p data-placement="top"
											data-toggle="tooltip" title="Delete">
											<button class="btn btn-danger btn-xs" data-title="Delete"
												data-toggle="modal" data-target="#delete">
												<span class="glyphicon glyphicon-trash"></span>
											</button>
										</p></td>
								</tr>
								<tr>
									<td><input type="checkbox" class="checkthis" /></td>
									<td>꿍녀</td>
									<td>isometric.mohsin@gmail.com</td>
									<td>루트 중에 어떤 여행지가 가장 좋으셨어요?</td>
									<td>2017.06.15</td>

									<td align="center"><p data-placement="top"
											data-toggle="tooltip" title="Delete">
											<button class="btn btn-danger btn-xs" data-title="Delete"
												data-toggle="modal" data-target="#delete">
												<span class="glyphicon glyphicon-trash"></span>
											</button>
										</p></td>
								</tr>

							</tbody>

						</table>

						<div class="clearfix"></div>
						<ul class="pagination pull-right">
							<li class="disabled"><a href="#"><span
									class="glyphicon glyphicon-chevron-left"></span></a></li>
							<li class="active"><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#"><span
									class="glyphicon glyphicon-chevron-right"></span></a></li>
						</ul>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>