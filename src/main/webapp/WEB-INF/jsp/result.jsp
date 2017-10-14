<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">	
		<title>Result</title>
		<!-- Disabled Zooming -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="css/result.css">
	</head>
	<body data-ng-app="result" data-ng-controller="result">
		<!-- Start of Header and footer -->
		<div>
			<jsp:include page="header_footer.jsp"></jsp:include>
		</div>
		<!-- End of Header and footer -->
		
		<div class="container">
			<div class="row">
				<div class="col-sm-12 scorecard" align="center">
					<h2><b>Brain Booster Quiz Scorecard</b></h2>
					<div style="margin-top: 3%; color: {{btnclass}}">
						<img data-ng-src="{{emoticon}}" style="height: 100px; width: 100px;"><p style="font-size: medium; display: inline-block;"><strong> {{msg1}}</strong>{{msg2}}</p>
					</div>
					<div class="table-responsive">
						<table class="table" style="margin-top: 4%;">
						    <thead>
						      <tr>
						        <!-- <th>Profile Photo</th> -->
						        <th>Username</th>
						        <th>Fullname</th>
						        <th>Email</th>
						        <th>Subject</th>
						        <th>Out of {{result.subject.subjectTotalMarks}}*</th>
						        <th>is Cleared ?</th>
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
						        <td style="color: {{btnclass}}"><strong>{{result.status}}</strong></td>
						      </tr>
						    </tbody>
						  </table>
					  </div>
				</div>
			</div>		
			<div class="row">
				<div class="col-lg-12" align="center" style="margin-top: 3%;">
					<button class="btn btn-primary btn-lg"><b>Download Certificate</b></button>
				</div>
			</div>
		</div>
	
		<!-- Start of external scripts -->
		<script src="js/result.js"></script>
		<!-- End of external scripts -->
	</body>
</html>