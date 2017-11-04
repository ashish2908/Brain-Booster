<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Result</title>
<!-- Disabled Zooming -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta property="og:url" content="http://www.your-domain.com/your-page.html" />
<meta property="og:type" content="website" />
<meta property="og:title" content="Your Website Title" />
<meta property="og:description" content="Your description" />
<meta property="og:image" content="http://www.your-domain.com/path/image.jpg" />
<link rel="stylesheet" href="css/result.css">
</head>
<body data-ng-app="result" data-ng-controller="result">
	<!-- Start of Header and footer -->
	<div>
		<jsp:include page="header_footer.jsp"></jsp:include>
	</div>
	<!-- End of Header and footer -->

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-12">
				<div class="col-md-8" align="center">
					<h3 class="scorecard" style="text-align: center;">
						<b>Brain Booster Quiz Scorecard</b>
					</h3>
					<img data-ng-src="{{emoticon}}"
						style="height: 100px; width: 100px;" align="middle">
					<p
						style="font-size: medium; display: inline-block; color: {{btnclass}}">
						<strong> {{msg1}}</strong>{{msg2}}
					</p>
					<div class="table-responsive" align="center">
						<table class="table table-striped"
							style="margin-top: 1%; color: #3F729B;">
							<thead>
								<tr>
									<!-- <th>Profile Photo</th> -->
									<th>Username</th>
									<th>Fullname</th>
									<th>Email</th>
									<th>Subject</th>
									<th>Out of {{result.subject.subjectTotalMarks}}*</th>
									<th>Status</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<!-- <td><img alt="" data-ng-src="{{result.user.profilePhoto}}" style="height: 100px; width: 100px; border-radius: 100px;"></td> -->
									<td>{{result.user.username}}</td>
									<td>{{result.user.fullname}}</td>
									<td>{{result.user.emailId}}</td>
									<td>{{result.subject.subjectName}}</td>
									<td>{{result.marks}}</td>
									<td style="color: {{btnclass"><strong>{{result.status}}</strong></td>
								</tr>
							</tbody>
						</table>
					</div>
					<button class="btn btn-primary btn-md">
						<b>Download Certificate</b>
					</button>
				</div>
				<div class="col-md-4" align="center" >
					<div class="row lead">
						<h3 class="scorecard">
							<b>Please rate this quiz app</b>
						</h3>
						<div class="row" style="margin-left: 15%; color: #3F729B">
							<div class="col-xs-8 col-md-4 text-center">
								<h1 class="rating-num">4.0</h1> 
									<div class="rating">
										<div id="stars" class="starrr" style="color: #00C851;"></div>
									</div>
							<div>
							<span class="glyphicon glyphicon-user"></span><h6>1,050,008 total</h6>
						</div>
					</div>
					<div class="col-xs-12 col-md-7" style="margin-top: 6%; color: #3F729B;">
							<div class="row rating-desc">
								<div class="row">
									<div class="col-xs-2 col-md-3 text-right">
										<h6 style="margin-top: 0; margin-left: 0; padding-left: 0;"><span class="glyphicon glyphicon-star"></span>5</h6>
									</div>
									<div class="col-xs-5 col-md-6" style="height: 15px;">
										<div class="progress progress-striped" style="height: 100%;" >
											<div class="progress-bar progress-bar-success"
												role="progressbar" aria-valuenow="20" aria-valuemin="0"
												aria-valuemax="100" style="width: 80%">
												<span class="sr-only">80%</span>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-2 col-md-3 text-right">
										<h6 style="margin-top: 0; margin-left: 0; padding-left: 0;"><span class="glyphicon glyphicon-star"></span>4</h6>
									</div>
									<div class="col-xs-5 col-md-6" style="height: 15px;">
										<div class="progress" style="height: 100%;" >
											<div class="progress-bar progress-bar-success"
												role="progressbar" aria-valuenow="20" aria-valuemin="0"
												aria-valuemax="100" style="width: 60%">
												<span class="sr-only">60%</span>
											</div>
										</div>
									</div>
								</div>
								<!-- end 4 -->
								<div class="row">
									<div class="col-xs-2 col-md-3 text-right">
										<h6 style="margin-top: 0; margin-left: 0; padding-left: 0;"><span class="glyphicon glyphicon-star"></span>3</h6>
									</div>
									<div class="col-xs-5 col-md-6" style="height: 15px;">
										<div class="progress" style="height: 100%;" >
											<div class="progress-bar progress-bar-info"
												role="progressbar" aria-valuenow="20" aria-valuemin="0"
												aria-valuemax="100" style="width: 40%">
												<span class="sr-only">40%</span>
											</div>
										</div>
									</div>
								</div>
								<!-- end 3 -->
								<div class="row">
									<div class="col-xs-2 col-md-3 text-right">
										<h6 style="margin-top: 0; margin-left: 0; padding-left: 0;"><span class="glyphicon glyphicon-star"></span>2</h6>
									</div>
									<div class="col-xs-5 col-md-6" style="height: 15px;">
										<div class="progress" style="height: 100%;" >
											<div class="progress-bar progress-bar-warning"
												role="progressbar" aria-valuenow="20" aria-valuemin="0"
												aria-valuemax="100" style="width: 20%">
												<span class="sr-only">20%</span>
											</div>
										</div>
									</div>
								</div>
								<!-- end 2 -->
								<div class="row">
									<div class="col-xs-2 col-md-3 text-right">
										<h6 style="margin-top: 0; margin-left: 0; padding-left: 0;"><span class="glyphicon glyphicon-star"></span>1</h6>
									</div>
									<div class="col-xs-5 col-md-6" style="height: 15px;">
										<div class="progress" style="height: 100%;" >
											<div class="progress-bar progress-bar-danger"
												role="progressbar" aria-valuenow="20" aria-valuemin="0"
												aria-valuemax="100" style="width: 15%">
												<span class="sr-only">15%</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-8">
			<div id="fb-root"></div>
  <script>(function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));</script>

  <!-- Your share button code -->
  <div class="fb-share-button" data-href="https://developers.facebook.com/docs/plugins/" data-layout="button_count" data-size="large" data-mobile-iframe="true"><a class="fb-xfbml-parse-ignore" target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fdevelopers.facebook.com%2Fdocs%2Fplugins%2F&amp;src=sdkpreparse">Share</a></div>
			<!-- <div id="fb-root"></div>
				<script>(function(d, s, id) {
					  var js, fjs = d.getElementsByTagName(s)[0];
					  if (d.getElementById(id)) return;
					  js = d.createElement(s); js.id = id;
					  js.src = 'https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.10&appId=1063477887111184';
					  fjs.parentNode.insertBefore(js, fjs);
					}(document, 'script', 'facebook-jssdk'));
				</script>
				<div class="fb-share-button" data-href="https://www.google.com/" data-layout="button_count" data-size="large" data-mobile-iframe="true">
					<a class="fb-xfbml-parse-ignore" target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fdevelopers.facebook.com%2Fdocs%2Fplugins%2F&amp;src=sdkpreparse">Share</a>
				</div> -->
		</div>
		<div class="col-md-4">
			<div class="row">
				<div class="col-xs-12 col-md-12" style="display: inline-block;">
					<textarea class="longInput" placeholder="Help us to improve" style="color: #3F729B; width: 100%; display: block; border-radius: 10px;" rows="4"></textarea>
					<button class="btn btn-primary" style="position:absolute; bottom:10px; right:23px;">Comment</button>
				</div>
			</div>
			<div class="row"  style="margin-top: 2%;">
				<div class="col-sm-2">
					<div class="thumbnail">
						<img class="img-responsive user-photo" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
					</div><!-- /thumbnail -->
				</div><!-- /col-sm-1 -->
				<div class="col-sm-10">
					<div class="panel panel-default">
						<div class="panel-heading">
							<strong>myusername</strong> <span class="text-muted">commented 5 days ago</span>
						</div>
						<div class="panel-body">
							Panel content
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12" style="text-align: center;">
					<a href="#">Load more comments</a>
				</div>
			</div>
		</div>
	</div>
</div>
	<!-- Start of external scripts -->
	<script src="js/result.js"></script>
	<!-- End of external scripts -->
</body>
</html>