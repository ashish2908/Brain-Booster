<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<!-- Disabled Zooming -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="css/login.css">
		<!-- Including css for social buttons -->
		<link rel="stylesheet" href="css/bootstrap-social.css">
	</head>
	<body data-ng-app="Login" data-ng-controller="Login">
		<!-- Start of Header and footer -->
		<div>
			<jsp:include page="header_footer.jsp"></jsp:include>
		</div>
		<!-- End of Header and footer -->
		
		<!-- Start Main Container -->
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12 alert alert-info" id="welcome">
    				<h3><strong>Welcome!</strong> you are at the right place to boost your brain.<br> Its free and always will be.</h3>
				</div>
			</div>	
			<div class="row"> 
				<div class="col-md-12" id="logindiv">
					<div class="col-sm-8 carousel slide" id="carouselExampleIndicators" data-ride="carousel" align="center">
						<ol class="carousel-indicators">
    						<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
						    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
						</ol>
						<div class="carousel-inner" role="listbox">
						    <div class="item active">
						      <img class="d-block img-fluid" id="img" src="https://i.pinimg.com/736x/78/fe/d8/78fed87cdc1974bd9c2b595024bdcdac--nursing-students-nursing-schools.jpg" alt="First slide">
						    </div>
						    <div class="item">
						      <img class="d-block img-fluid" id="img" src="http://www.buzznet.com/wp-content/uploads/sites/12/2015/01/msg-14202165622482.jpg" alt="Second slide">
						    </div>
						    <div class="item">
						      <img class="d-block img-fluid" id="img" src="https://previews.123rf.com/images/stanciuc/stanciuc1606/stanciuc160600383/58109705-If-You-Can-Dream-It-You-Can-Do-It-motivational-quote-Authentic-hand-writing-isolated-over-white-back-Stock-Photo.jpg" alt="Third slide">
						    </div>
						</div>
					    <!-- Left and right controls -->
					    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
					      <span class="glyphicon glyphicon-chevron-left"></span>
					      <span class="sr-only">Previous</span>
					    </a>
					    <a class="right carousel-control" href="#myCarousel" data-slide="next">
					      <span class="glyphicon glyphicon-chevron-right"></span>
					      <span class="sr-only">Next</span>
					    </a>
					</div>
					<div class="col-sm-3" id="loginformdiv">
						<form id="loginForm" action='login' method="post">
							<button id="socialbtn" class="btn btn-block btn-social btn-facebook btn-lg" data-ng-click="fbLogin()" type="button">
					    		<span class="fa fa-facebook" ></span> Sign in with Facebook
					  		</button>
						</form> 
						<form id="loginForm" action='login' method="post">
							<button id="socialbtn" class="btn btn-block btn-social btn-twitter btn-lg" data-ng-click="fbLogin()" type="button">
					    		<span class="fa fa-twitter" ></span> Sign in with Twitter
					  		</button>
						</form>
						<form id="loginForm" action='login' method="post">
							<button id="socialbtn" class="btn btn-block btn-social btn-pinterest btn-lg" data-ng-click="fbLogin()" type="button">
					    		<span class="fa fa-pinterest" ></span> Sign in with Pinterest
					  		</button>
						</form>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-8" id="disclaimer">
					<h4><strong>Disclaimer: </strong>This is trusted quiz application. We are using authentication API's of facebook, twitter, pinterest. We are not storing any user credentials.</h4>
				</div>
			</div>
		</div>
		
		<!-- Start of external scripts -->  
		<script src="http://connect.facebook.net/en_US/all.js"></script>
		<script src="js/login.js"></script>
		<!-- End of external scripts -->
		
	</body>
</html>