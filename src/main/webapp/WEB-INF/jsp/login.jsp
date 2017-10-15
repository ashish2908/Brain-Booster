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
				<div class="col-md-12" align="center" style="margin-top: 10%; color:  #3F729B;">
					<img alt="" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9f1Jp_edyP5BhNyNuCtHuispjff6UaVVZi3U8tpEwAxlYd1vD6g" style="height: 100px; widows: 100px;">
					<h1><strong>Brain Booster</strong></h1>
					<h5> Welcome to Brain Booster quiz app, its free and always will be</h5>
				</div>
			</div>	
			<div class="row">
				<div class="col-md-12" align="center">
					<div align="center" style="width: 30%; height: 20px; border-bottom: 1px solid black; text-align: center">
      					<span class="fa fa-star-o" style="font-size: 20px; background-color: #fff; padding: 10px 20px 0 20px"></span>
   					</div>
				</div>
			</div>
			<div class="row"> 
				<div class="col-md-12" id="logindiv" align="center">
					<form id="loginForm" action='login' method="post">
					  	<button class="socialbtn fb" data-ng-click="fbLogin()"><span class="fa fa-facebook" ></span></button>
					   	<button class="socialbtn tw" data-ng-click="fbLogin()"><span class="fa fa-twitter" ></span></button> 
					   	<button class="socialbtn pi" data-ng-click="fbLogin()"><span class="fa fa-pinterest" ></span></button> 
					</form> 
				</div>
			</div>
			<div class="row" id="disclaimer">
				<div class="col-md-8" id="disclaimer">
					<h4><strong>Disclaimer: </strong>This is trusted quiz application. We are using authentication API's of facebook, twitter, pinterest. We are not storing any user credentials.</h4>
				</div>
			</div>
		</div>
		
		<!-- Start of external scripts -->  
		<script src="https://connect.facebook.net/en_US/all.js"></script>
		<script src="js/login.js"></script>
		<!-- End of external scripts -->
		
	</body>
</html>