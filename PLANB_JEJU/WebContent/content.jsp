<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="shortcut icon" href="favicon.ico">

<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>

<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<!-- Superfish -->
	<link rel="stylesheet" href="css/superfish.css">
	<!-- Magnific Popup -->
	<link rel="stylesheet" href="css/magnific-popup.css">
	<!-- Date Picker -->
	<link rel="stylesheet" href="css/bootstrap-datepicker.min.css">
	<!-- CS Select -->
	<link rel="stylesheet" href="css/cs-select.css">
	<link rel="stylesheet" href="css/cs-skin-border.css">
	
	<link rel="stylesheet" href="css/style.css">



<div class="fh5co-hero">
			<div class="fh5co-overlay"></div>
			<div class="fh5co-cover" data-stellar-background-ratio="0.5" style="background-image: url(&quot;images/cover_bg_1.jpg&quot;); background-position: 0px -47.7px;">
				<div class="desc">
					<div class="container">
						<div class="row">
							<div class="col-sm-5 col-md-5">
								<div class="tabulation animate-box fadeInUp animated">

								  <!-- Nav tabs -->
								   <ul class="nav nav-tabs" role="tablist">
								      <li role="presentation" class="active">
								      	<a href="#flights" aria-controls="flights" role="tab" data-toggle="tab">Flights</a>
								      </li>
								      <li role="presentation">
								    	   <a href="#hotels" aria-controls="hotels" role="tab" data-toggle="tab">Hotels</a>
								      </li>
								      <li role="presentation">
								    	   <a href="#packages" aria-controls="packages" role="tab" data-toggle="tab">Packages</a>
								      </li>
								   </ul>

								   <!-- Tab panes -->
									<div class="tab-content">
									 <div role="tabpanel" class="tab-pane active" id="flights">
										<div class="row">
											<div class="col-xxs-12 col-xs-6 mt">
												<div class="input-field">
													<label for="from">From:</label>
													<input type="text" class="form-control" id="from-place" placeholder="Los Angeles, USA">
												</div>
											</div>
											<div class="col-xxs-12 col-xs-6 mt">
												<div class="input-field">
													<label for="from">To:</label>
													<input type="text" class="form-control" id="to-place" placeholder="Tokyo, Japan">
												</div>
											</div>
											<div class="col-xxs-12 col-xs-6 mt alternate">
												<div class="input-field">
													<label for="date-start">Check In:</label>
													<input type="text" class="form-control" id="date-start" placeholder="mm/dd/yyyy">
												</div>
											</div>
											<div class="col-xxs-12 col-xs-6 mt alternate">
												<div class="input-field">
													<label for="date-end">Check Out:</label>
													<input type="text" class="form-control" id="date-end" placeholder="mm/dd/yyyy">
												</div>
											</div>
											<div class="col-sm-12 mt">
												<section>
													<label for="class">Class:</label>
													
												<div class="cs-select cs-skin-border" tabindex="0"><span class="cs-placeholder">Economy</span><div class="cs-options"><ul><li data-option="" data-value="economy"><span>Economy</span></li><li data-option="" data-value="first"><span>First</span></li><li data-option="" data-value="business"><span>Business</span></li></ul></div><select class="cs-select cs-skin-border">
														<option value="" disabled="" selected="">Economy</option>
														<option value="economy">Economy</option>
														<option value="first">First</option>
														<option value="business">Business</option>
													</select></div></section>
											</div>
											<div class="col-xxs-12 col-xs-6 mt">
												<section>
													<label for="class">Adult:</label>
													
												<div class="cs-select cs-skin-border" tabindex="0"><span class="cs-placeholder">1</span><div class="cs-options"><ul><li data-option="" data-value="1"><span>1</span></li><li data-option="" data-value="2"><span>2</span></li><li data-option="" data-value="3"><span>3</span></li><li data-option="" data-value="4"><span>4</span></li></ul></div><select class="cs-select cs-skin-border">
														<option value="" disabled="" selected="">1</option>
														<option value="1">1</option>
														<option value="2">2</option>
														<option value="3">3</option>
														<option value="4">4</option>
													</select></div></section>
											</div>
											<div class="col-xxs-12 col-xs-6 mt">
												<section>
													<label for="class">Children:</label>
													
												<div class="cs-select cs-skin-border" tabindex="0"><span class="cs-placeholder">1</span><div class="cs-options"><ul><li data-option="" data-value="1"><span>1</span></li><li data-option="" data-value="2"><span>2</span></li><li data-option="" data-value="3"><span>3</span></li><li data-option="" data-value="4"><span>4</span></li></ul></div><select class="cs-select cs-skin-border">
														<option value="" disabled="" selected="">1</option>
														<option value="1">1</option>
														<option value="2">2</option>
														<option value="3">3</option>
														<option value="4">4</option>
													</select></div></section>
											</div>
											<div class="col-xs-12">
												<input type="submit" class="btn btn-primary btn-block" value="Search Flight">
											</div>
										</div>
									 </div>

									 <div role="tabpanel" class="tab-pane" id="hotels">
									 	<div class="row">
											<div class="col-xxs-12 col-xs-12 mt">
												<div class="input-field">
													<label for="from">City:</label>
													<input type="text" class="form-control" id="from-place" placeholder="Los Angeles, USA">
												</div>
											</div>
											<div class="col-xxs-12 col-xs-6 mt alternate">
												<div class="input-field">
													<label for="date-start">Return:</label>
													<input type="text" class="form-control" id="date-start" placeholder="mm/dd/yyyy">
												</div>
											</div>
											<div class="col-xxs-12 col-xs-6 mt alternate">
												<div class="input-field">
													<label for="date-end">Check Out:</label>
													<input type="text" class="form-control" id="date-end" placeholder="mm/dd/yyyy">
												</div>
											</div>
											<div class="col-sm-12 mt">
												<section>
													<label for="class">Rooms:</label>
													
												<div class="cs-select cs-skin-border" tabindex="0"><span class="cs-placeholder">1</span><div class="cs-options"><ul><li data-option="" data-value="economy"><span>1</span></li><li data-option="" data-value="first"><span>2</span></li><li data-option="" data-value="business"><span>3</span></li></ul></div><select class="cs-select cs-skin-border">
														<option value="" disabled="" selected="">1</option>
														<option value="economy">1</option>
														<option value="first">2</option>
														<option value="business">3</option>
													</select></div></section>
											</div>
											<div class="col-xxs-12 col-xs-6 mt">
												<section>
													<label for="class">Adult:</label>
													
												<div class="cs-select cs-skin-border" tabindex="0"><span class="cs-placeholder">1</span><div class="cs-options"><ul><li data-option="" data-value="1"><span>1</span></li><li data-option="" data-value="2"><span>2</span></li><li data-option="" data-value="3"><span>3</span></li><li data-option="" data-value="4"><span>4</span></li></ul></div><select class="cs-select cs-skin-border">
														<option value="" disabled="" selected="">1</option>
														<option value="1">1</option>
														<option value="2">2</option>
														<option value="3">3</option>
														<option value="4">4</option>
													</select></div></section>
											</div>
											<div class="col-xxs-12 col-xs-6 mt">
												<section>
													<label for="class">Children:</label>
													
												<div class="cs-select cs-skin-border" tabindex="0"><span class="cs-placeholder">1</span><div class="cs-options"><ul><li data-option="" data-value="1"><span>1</span></li><li data-option="" data-value="2"><span>2</span></li><li data-option="" data-value="3"><span>3</span></li><li data-option="" data-value="4"><span>4</span></li></ul></div><select class="cs-select cs-skin-border">
														<option value="" disabled="" selected="">1</option>
														<option value="1">1</option>
														<option value="2">2</option>
														<option value="3">3</option>
														<option value="4">4</option>
													</select></div></section>
											</div>
											<div class="col-xs-12">
												<input type="submit" class="btn btn-primary btn-block" value="Search Hotel">
											</div>
										</div>
									 </div>

									 <div role="tabpanel" class="tab-pane" id="packages">
									 	<div class="row">
											<div class="col-xxs-12 col-xs-6 mt">
												<div class="input-field">
													<label for="from">City:</label>
													<input type="text" class="form-control" id="from-place" placeholder="Los Angeles, USA">
												</div>
											</div>
											<div class="col-xxs-12 col-xs-6 mt">
												<div class="input-field">
													<label for="from">Destination:</label>
													<input type="text" class="form-control" id="to-place" placeholder="Tokyo, Japan">
												</div>
											</div>
											<div class="col-xxs-12 col-xs-6 mt alternate">
												<div class="input-field">
													<label for="date-start">Departs:</label>
													<input type="text" class="form-control" id="date-start" placeholder="mm/dd/yyyy">
												</div>
											</div>
											<div class="col-xxs-12 col-xs-6 mt alternate">
												<div class="input-field">
													<label for="date-end">Return:</label>
													<input type="text" class="form-control" id="date-end" placeholder="mm/dd/yyyy">
												</div>
											</div>
											<div class="col-sm-12 mt">
												<section>
													<label for="class">Rooms:</label>
													
												<div class="cs-select cs-skin-border" tabindex="0"><span class="cs-placeholder">1</span><div class="cs-options"><ul><li data-option="" data-value="economy"><span>1</span></li><li data-option="" data-value="first"><span>2</span></li><li data-option="" data-value="business"><span>3</span></li></ul></div><select class="cs-select cs-skin-border">
														<option value="" disabled="" selected="">1</option>
														<option value="economy">1</option>
														<option value="first">2</option>
														<option value="business">3</option>
													</select></div></section>
											</div>
											<div class="col-xxs-12 col-xs-6 mt">
												<section>
													<label for="class">Adult:</label>
													
												<div class="cs-select cs-skin-border" tabindex="0"><span class="cs-placeholder">1</span><div class="cs-options"><ul><li data-option="" data-value="1"><span>1</span></li><li data-option="" data-value="2"><span>2</span></li><li data-option="" data-value="3"><span>3</span></li><li data-option="" data-value="4"><span>4</span></li></ul></div><select class="cs-select cs-skin-border">
														<option value="" disabled="" selected="">1</option>
														<option value="1">1</option>
														<option value="2">2</option>
														<option value="3">3</option>
														<option value="4">4</option>
													</select></div></section>
											</div>
											<div class="col-xxs-12 col-xs-6 mt">
												<section>
													<label for="class">Children:</label>
													
												<div class="cs-select cs-skin-border" tabindex="0"><span class="cs-placeholder">1</span><div class="cs-options"><ul><li data-option="" data-value="1"><span>1</span></li><li data-option="" data-value="2"><span>2</span></li><li data-option="" data-value="3"><span>3</span></li><li data-option="" data-value="4"><span>4</span></li></ul></div><select class="cs-select cs-skin-border">
														<option value="" disabled="" selected="">1</option>
														<option value="1">1</option>
														<option value="2">2</option>
														<option value="3">3</option>
														<option value="4">4</option>
													</select></div></section>
											</div>
											<div class="col-xs-12">
												<input type="submit" class="btn btn-primary btn-block" value="Search Packages">
											</div>
										</div>
									 </div>
									</div>

								</div>
							</div>
							<div class="desc2 animate-box fadeInUp animated">
								<div class="col-sm-7 col-sm-push-1 col-md-7 col-md-push-1">
									<p>HandCrafted by <a href="http://frehtml5.co/" target="_blank" class="fh5co-site-name">FreeHTML5.co</a></p>
									<h2>컨텐츠</h2>
									<h3>Fly to Hong Kong via Los Angeles, USA</h3>
									<span class="price">$599</span>
									<!-- <p><a class="btn btn-primary btn-lg" href="#">Get Started</a></p> -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>