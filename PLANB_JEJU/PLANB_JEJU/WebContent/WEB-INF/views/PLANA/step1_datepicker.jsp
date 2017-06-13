<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="shortcut icon" href="favicon.ico">

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300'
	rel='stylesheet' type='text/css'>

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


<!-- 주석 -->
<!-- START :  jquery ui : tab ui cv부분 -->

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#tabs").tabs().addClass("ui-tabs-vertical ui-helper-clearfix");
		$("#tabs li").removeClass("ui-corner-top").addClass("ui-corner-left");
	});
</script>
<style>
.ui-tabs-vertical {
	width: 55em;
}

.ui-tabs-vertical .ui-tabs-nav {
	/* padding: .2em .1em .2em .2em; */
	float: left;
	/* width: 12em; */
}

.ui-tabs-vertical .ui-tabs-nav li {
	clear: left;
	width: 100%;
	border-bottom-width: 1px !important;
	border-right-width: 0 !important;
	margin: 0 -1px .2em 0;
}

.ui-tabs-vertical .ui-tabs-nav li a {
	display: block;
}

.ui-tabs-vertical .ui-tabs-nav li.ui-tabs-active {
	padding-bottom: 0;
	padding-right: 0;
	padding-top: 0;
	padding-left: 0;
	border-right-width: 1px;
	margin-bottom: 0px;
}

.ui-tabs-vertical .ui-tabs-panel {
	padding: 1em;
	float: right;
	width: 40em;
}

.ui-widget-content {
    /* border: 1px solid #dddddd; */
    background: none; 
    /* color: #333333; */
}

.tabulation {
    width: 100%;
    float: left;
    margin-top: -7em;
    background: none;
    -webkit-box-shadow: 0px 43px 83px -20px rgba(0, 0, 0, 0.41);
    -moz-box-shadow: 0px 43px 83px -20px rgba(0, 0, 0, 0.41);
    -ms-box-shadow: 0px 43px 83px -20px rgba(0, 0, 0, 0.41);
    -o-box-shadow: 0px 43px 83px -20px rgba(0, 0, 0, 0.41);
    box-shadow: 0px 43px 83px -20px rgba(0, 0, 0, 0.41);
}

.ui-widget.ui-widget-content {
    /* border: 1px solid #c5c5c5;  */
    border: 0px ; 
}

.ui-state-default, .ui-widget-content .ui-state-default, .ui-widget-header .ui-state-default, .ui-button, html .ui-button.ui-state-disabled:hover, html .ui-button.ui-state-disabled:active {
    border: 1px solid #c5c5c5;
   /*  background: #f6f6f6; */
    background: none;
    font-weight: normal;
    color: #454545;
} 

.ui-widget-header {
    border: 1px solid #dddddd;
    /* background: #e9e9e9; */
    background: none;
    color: #333333;
    font-weight: bold;
}
</style>


<div class="fh5co-hero">
	<div class="fh5co-overlay"></div>
	<div class="fh5co-cover" data-stellar-background-ratio="0.5"
		style="background-image: url(&quot;images/cover_bg_1.jpg&quot;); background-position: 0px -47.7px;">
		<div class="desc">
			<div class="container">
				<div class="row">
						<div class="tabulation animate-box fadeInUp animated">


							<div id="tabs" class="tabulation animate-box fadeInUp animated" >
								<ul class="nav nav-tabs" role="tablist">
									<li role="presentation" class="active"><a href="#tabs-1" role="tab" data-toggle="tab">Nunc tincidunt</a></li>
									<li role="presentation" class="active"><a href="#tabs-2">Proin dolor</a></li>
									<li><a href="#tabs-3">Aenean lacinia</a></li>
								</ul>
								<div id="tabs-1">
									<h2>Content heading 1</h2>
									<p>Proin elit arcu, rutrum commodo, vehicula tempus,
										commodo a, risus. Curabitur nec arcu. Donec sollicitudin mi
										sit amet mauris. Nam elementum quam ullamcorper ante. Etiam
										aliquet massa et lorem. Mauris dapibus lacus auctor risus.
										Aenean tempor ullamcorper leo. Vivamus sed magna quis ligula
										eleifend adipiscing. Duis orci. Aliquam sodales tortor vitae
										ipsum. Aliquam nulla. Duis aliquam molestie erat. Ut et mauris
										vel pede varius sollicitudin. Sed ut dolor nec orci tincidunt
										interdum. Phasellus ipsum. Nunc tristique tempus lectus.</p>
								</div>
								<div id="tabs-2">
									<h2>Content heading 2</h2>
									<p>Morbi tincidunt, dui sit amet facilisis feugiat, odio
										metus gravida ante, ut pharetra massa metus id nunc. Duis
										scelerisque molestie turpis. Sed fringilla, massa eget luctus
										malesuada, metus eros molestie lectus, ut tempus eros massa ut
										dolor. Aenean aliquet fringilla sem. Suspendisse sed ligula in
										ligula suscipit aliquam. Praesent in eros vestibulum mi
										adipiscing adipiscing. Morbi facilisis. Curabitur ornare
										consequat nunc. Aenean vel metus. Ut posuere viverra nulla.
										Aliquam erat volutpat. Pellentesque convallis. Maecenas
										feugiat, tellus pellentesque pretium posuere, felis lorem
										euismod felis, eu ornare leo nisi vel felis. Mauris
										consectetur tortor et purus.</p>
								</div>
								<div id="tabs-3">
									<h2>Content heading 3</h2>
									<p>Mauris eleifend est et turpis. Duis id erat. Suspendisse
										potenti. Aliquam vulputate, pede vel vehicula accumsan, mi
										neque rutrum erat, eu congue orci lorem eget lorem. Vestibulum
										non ante. Class aptent taciti sociosqu ad litora torquent per
										conubia nostra, per inceptos himenaeos. Fusce sodales. Quisque
										eu urna vel enim commodo pellentesque. Praesent eu risus
										hendrerit ligula tempus pretium. Curabitur lorem enim, pretium
										nec, feugiat nec, luctus a, lacus.</p>
									<p>Duis cursus. Maecenas ligula eros, blandit nec, pharetra
										at, semper at, magna. Nullam ac lacus. Nulla facilisi.
										Praesent viverra justo vitae neque. Praesent blandit
										adipiscing velit. Suspendisse potenti. Donec mattis, pede vel
										pharetra blandit, magna ligula faucibus eros, id euismod lacus
										dolor eget odio. Nam scelerisque. Donec non libero sed nulla
										mattis commodo. Ut sagittis. Donec nisi lectus, feugiat
										porttitor, tempor ac, tempor vitae, pede. Aenean vehicula
										velit eu tellus interdum rutrum. Maecenas commodo.
										Pellentesque nec elit. Fusce in lacus. Vivamus a libero vitae
										lectus hendrerit hendrerit.</p>
								</div>
							</div>
						</div>
					
				</div>
			</div>
		</div>
	</div>
</div>


<!-- END :  jquery ui : tab ui cv부분 -->


<div class="fh5co-hero">
	<div class="fh5co-overlay"></div>
	<div class="fh5co-cover" data-stellar-background-ratio="0.5"
		style="background-image: url(&quot;images/cover_bg_1.jpg&quot;); background-position: 0px -47.7px;">
		<div class="desc">
			<div class="container">
				<div class="row">
					<!-- <div class="col-sm-5 col-md-5"> -->
						<div class="tabulation animate-box fadeInUp animated">

							<!-- Nav tabs -->
							<ul class="nav nav-tabs" role="tablist">
								<li role="presentation" class="active"><a href="#flights"
									aria-controls="flights" role="tab" data-toggle="tab">Flights</a>
								</li>
								<li role="presentation"><a href="#hotels"
									aria-controls="hotels" role="tab" data-toggle="tab">Hotels</a>
								</li>
								<li role="presentation"><a href="#packages"
									aria-controls="packages" role="tab" data-toggle="tab">Packages</a>
								</li>
							</ul>

							<!-- Tab panes -->
							<div class="tab-content">
								<div role="tabpanel" class="tab-pane active" id="flights">
									<div class="row">
										<div class="col-xxs-12 col-xs-6 mt">
											<div class="input-field">
												<label for="from">From:</label> <input type="text"
													class="form-control" id="from-place"
													placeholder="Los Angeles, USA">
											</div>
										</div>
										<div class="col-xxs-12 col-xs-6 mt">
											<div class="input-field">
												<label for="from">To:</label> <input type="text"
													class="form-control" id="to-place"
													placeholder="Tokyo, Japan">
											</div>
										</div>
										<div class="col-xxs-12 col-xs-6 mt alternate">
											<div class="input-field">
												<label for="date-start">Check In:</label> <input type="text"
													class="form-control" id="date-start"
													placeholder="mm/dd/yyyy">
											</div>
										</div>
										<div class="col-xxs-12 col-xs-6 mt alternate">
											<div class="input-field">
												<label for="date-end">Check Out:</label> <input type="text"
													class="form-control" id="date-end" placeholder="mm/dd/yyyy">
											</div>
										</div>
										<div class="col-sm-12 mt">
											<section>
												<label for="class">Class:</label>

												<div class="cs-select cs-skin-border" tabindex="0">
													<span class="cs-placeholder">Economy</span>
													<div class="cs-options">
														<ul>
															<li data-option="" data-value="economy"><span>Economy</span></li>
															<li data-option="" data-value="first"><span>First</span></li>
															<li data-option="" data-value="business"><span>Business</span></li>
														</ul>
													</div>
													<select class="cs-select cs-skin-border">
														<option value="" disabled="" selected="">Economy</option>
														<option value="economy">Economy</option>
														<option value="first">First</option>
														<option value="business">Business</option>
													</select>
												</div>
											</section>
										</div>
										<div class="col-xxs-12 col-xs-6 mt">
											<section>
												<label for="class">Adult:</label>

												<div class="cs-select cs-skin-border" tabindex="0">
													<span class="cs-placeholder">1</span>
													<div class="cs-options">
														<ul>
															<li data-option="" data-value="1"><span>1</span></li>
															<li data-option="" data-value="2"><span>2</span></li>
															<li data-option="" data-value="3"><span>3</span></li>
															<li data-option="" data-value="4"><span>4</span></li>
														</ul>
													</div>
													<select class="cs-select cs-skin-border">
														<option value="" disabled="" selected="">1</option>
														<option value="1">1</option>
														<option value="2">2</option>
														<option value="3">3</option>
														<option value="4">4</option>
													</select>
												</div>
											</section>
										</div>
										<div class="col-xxs-12 col-xs-6 mt">
											<section>
												<label for="class">Children:</label>

												<div class="cs-select cs-skin-border" tabindex="0">
													<span class="cs-placeholder">1</span>
													<div class="cs-options">
														<ul>
															<li data-option="" data-value="1"><span>1</span></li>
															<li data-option="" data-value="2"><span>2</span></li>
															<li data-option="" data-value="3"><span>3</span></li>
															<li data-option="" data-value="4"><span>4</span></li>
														</ul>
													</div>
													<select class="cs-select cs-skin-border">
														<option value="" disabled="" selected="">1</option>
														<option value="1">1</option>
														<option value="2">2</option>
														<option value="3">3</option>
														<option value="4">4</option>
													</select>
												</div>
											</section>
										</div>
										<div class="col-xs-12">
											<input type="submit" class="btn btn-primary btn-block"
												value="Search Flight">
										</div>
									</div>
								</div>

								<div role="tabpanel" class="tab-pane" id="hotels">
									<div class="row">
										<div class="col-xxs-12 col-xs-12 mt">
											<div class="input-field">
												<label for="from">City:</label> <input type="text"
													class="form-control" id="from-place"
													placeholder="Los Angeles, USA">
											</div>
										</div>
										<div class="col-xxs-12 col-xs-6 mt alternate">
											<div class="input-field">
												<label for="date-start">Return:</label> <input type="text"
													class="form-control" id="date-start"
													placeholder="mm/dd/yyyy">
											</div>
										</div>
										<div class="col-xxs-12 col-xs-6 mt alternate">
											<div class="input-field">
												<label for="date-end">Check Out:</label> <input type="text"
													class="form-control" id="date-end" placeholder="mm/dd/yyyy">
											</div>
										</div>
										<div class="col-sm-12 mt">
											<section>
												<label for="class">Rooms:</label>

												<div class="cs-select cs-skin-border" tabindex="0">
													<span class="cs-placeholder">1</span>
													<div class="cs-options">
														<ul>
															<li data-option="" data-value="economy"><span>1</span></li>
															<li data-option="" data-value="first"><span>2</span></li>
															<li data-option="" data-value="business"><span>3</span></li>
														</ul>
													</div>
													<select class="cs-select cs-skin-border">
														<option value="" disabled="" selected="">1</option>
														<option value="economy">1</option>
														<option value="first">2</option>
														<option value="business">3</option>
													</select>
												</div>
											</section>
										</div>
										<div class="col-xxs-12 col-xs-6 mt">
											<section>
												<label for="class">Adult:</label>

												<div class="cs-select cs-skin-border" tabindex="0">
													<span class="cs-placeholder">1</span>
													<div class="cs-options">
														<ul>
															<li data-option="" data-value="1"><span>1</span></li>
															<li data-option="" data-value="2"><span>2</span></li>
															<li data-option="" data-value="3"><span>3</span></li>
															<li data-option="" data-value="4"><span>4</span></li>
														</ul>
													</div>
													<select class="cs-select cs-skin-border">
														<option value="" disabled="" selected="">1</option>
														<option value="1">1</option>
														<option value="2">2</option>
														<option value="3">3</option>
														<option value="4">4</option>
													</select>
												</div>
											</section>
										</div>
										<div class="col-xxs-12 col-xs-6 mt">
											<section>
												<label for="class">Children:</label>

												<div class="cs-select cs-skin-border" tabindex="0">
													<span class="cs-placeholder">1</span>
													<div class="cs-options">
														<ul>
															<li data-option="" data-value="1"><span>1</span></li>
															<li data-option="" data-value="2"><span>2</span></li>
															<li data-option="" data-value="3"><span>3</span></li>
															<li data-option="" data-value="4"><span>4</span></li>
														</ul>
													</div>
													<select class="cs-select cs-skin-border">
														<option value="" disabled="" selected="">1</option>
														<option value="1">1</option>
														<option value="2">2</option>
														<option value="3">3</option>
														<option value="4">4</option>
													</select>
												</div>
											</section>
										</div>
										<div class="col-xs-12">
											<input type="submit" class="btn btn-primary btn-block"
												value="Search Hotel">
										</div>
									</div>
								</div>

								<div role="tabpanel" class="tab-pane" id="packages">
									<div class="row">
										<div class="col-xxs-12 col-xs-6 mt">
											<div class="input-field">
												<label for="from">City:</label> <input type="text"
													class="form-control" id="from-place"
													placeholder="Los Angeles, USA">
											</div>
										</div>
										<div class="col-xxs-12 col-xs-6 mt">
											<div class="input-field">
												<label for="from">Destination:</label> <input type="text"
													class="form-control" id="to-place"
													placeholder="Tokyo, Japan">
											</div>
										</div>
										<div class="col-xxs-12 col-xs-6 mt alternate">
											<div class="input-field">
												<label for="date-start">Departs:</label> <input type="text"
													class="form-control" id="date-start"
													placeholder="mm/dd/yyyy">
											</div>
										</div>
										<div class="col-xxs-12 col-xs-6 mt alternate">
											<div class="input-field">
												<label for="date-end">Return:</label> <input type="text"
													class="form-control" id="date-end" placeholder="mm/dd/yyyy">
											</div>
										</div>
										<div class="col-sm-12 mt">
											<section>
												<label for="class">Rooms:</label>

												<div class="cs-select cs-skin-border" tabindex="0">
													<span class="cs-placeholder">1</span>
													<div class="cs-options">
														<ul>
															<li data-option="" data-value="economy"><span>1</span></li>
															<li data-option="" data-value="first"><span>2</span></li>
															<li data-option="" data-value="business"><span>3</span></li>
														</ul>
													</div>
													<select class="cs-select cs-skin-border">
														<option value="" disabled="" selected="">1</option>
														<option value="economy">1</option>
														<option value="first">2</option>
														<option value="business">3</option>
													</select>
												</div>
											</section>
										</div>
										<div class="col-xxs-12 col-xs-6 mt">
											<section>
												<label for="class">Adult:</label>

												<div class="cs-select cs-skin-border" tabindex="0">
													<span class="cs-placeholder">1</span>
													<div class="cs-options">
														<ul>
															<li data-option="" data-value="1"><span>1</span></li>
															<li data-option="" data-value="2"><span>2</span></li>
															<li data-option="" data-value="3"><span>3</span></li>
															<li data-option="" data-value="4"><span>4</span></li>
														</ul>
													</div>
													<select class="cs-select cs-skin-border">
														<option value="" disabled="" selected="">1</option>
														<option value="1">1</option>
														<option value="2">2</option>
														<option value="3">3</option>
														<option value="4">4</option>
													</select>
												</div>
											</section>
										</div>
										<div class="col-xxs-12 col-xs-6 mt">
											<section>
												<label for="class">Children:</label>

												<div class="cs-select cs-skin-border" tabindex="0">
													<span class="cs-placeholder">1</span>
													<div class="cs-options">
														<ul>
															<li data-option="" data-value="1"><span>1</span></li>
															<li data-option="" data-value="2"><span>2</span></li>
															<li data-option="" data-value="3"><span>3</span></li>
															<li data-option="" data-value="4"><span>4</span></li>
														</ul>
													</div>
													<select class="cs-select cs-skin-border">
														<option value="" disabled="" selected="">1</option>
														<option value="1">1</option>
														<option value="2">2</option>
														<option value="3">3</option>
														<option value="4">4</option>
													</select>
												</div>
											</section>
										</div>
										<div class="col-xs-12">
											<input type="submit" class="btn btn-primary btn-block"
												value="Search Packages">
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
					<div class="desc2 animate-box fadeInUp animated">
						<div class="col-sm-7 col-sm-push-1 col-md-7 col-md-push-1">
							<p>
								HandCrafted by <a href="http://frehtml5.co/" target="_blank"
									class="fh5co-site-name">FreeHTML5.co</a>
							</p>
							<h2>컨텐츠</h2>
							<h3>Fly to Hong Kong via Los Angeles, USA</h3>
							<span class="price">$599</span>
							<!-- <p><a class="btn btn-primary btn-lg" href="#">Get Started</a></p> -->
						</div>
					<!-- </div> -->
				</div>
			</div>
		</div>
	</div>

</div>