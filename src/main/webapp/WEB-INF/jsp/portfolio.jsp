<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>	
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Quiz Portfolio</title>
		<!-- Disabled Zooming -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="css/portfolio.css">
	</head>
	<body data-ng-app="Portfolio" data-ng-controller="Portfolio">
		<!-- Start of Header and footer -->
		<div>
			<jsp:include page="header_footer.jsp"></jsp:include>
		</div>
		<!-- End of Header and footer -->
		
		<div class="container">
			<div class="row">
				<div class="stepwizard col-lg-12">
    				<div class="stepwizard-row setup-panel">
      					<div class="stepwizard-step">
        					<a href="#step-1" type="button" class="btn btn-primary btn-circle">1</a>
        					<h6>Validate User Information</h6>
      					</div>
      					<div class="stepwizard-step">
						     <a href="#step-2" type="button" class="btn btn-default btn-circle" disabled="disabled">2</a>
						     <h6>Select Subject For Quiz</h6>
						 </div>
						 <div class="stepwizard-step">
						      <a href="#step-3" type="button" class="btn btn-default btn-circle" disabled="disabled">3</a>
						      <h6>Terms & conditions</h6>
						 </div>
    				</div>
  				</div>
  			</div>		
  			<div class="row">
  				<div class="col-lg-12">
  					<form role="form" action="" method="post">
				    	<div class="setup-content" id="step-1">
				        	<h4><b>Validate User Information :</b></h4>
							<div class="col-lg-3" id="userpic">
								<img alt="" data-ng-src="{{loggedInUser.profilePhoto}}">
								<h5><b>Profile Photo</b></h5>
							</div>
							<div class="col-lg-4" id="userinfo">
								  <div class="table-responsive">
									  <table class="table">
									  	<thead>
										  <tr>
									        <th>Username : </th>
									        <td>{{loggedInUser.fullname}}</td>
									      </tr>
									      <tr>
									        <th>Fullname : </th>
									        <td>{{loggedInUser.fullname}}</td>
									      </tr>
									      <tr>
									        <th>Designation : </th>
									        <td>{{loggedInUser.designation}}</td>
									      </tr>
									      <tr>
									        <th>Email : </th>
									        <td>{{loggedInUser.emailId}}</td>
									      </tr>
									    </thead>
									  </table>
								  </div>
								  <button class="btn btn-primary nextBtn pull-right" type="button"><b>Next</b></button>
							</div>
				      	</div>
				    	<div class="setup-content" id="step-2">
				          	<h4><b>Select Subject For Quiz :</b></h4>
				          	<div class="col-lg-9 subdetails">
				          		<div class="table-responsive">
									<table class="table">
									    <thead>
									      <tr>
									        <th>Choose Subject</th>
									        <th>Total Marks</th>
									        <th>Passign Marks</th>
									        <th>Time</th>
									      </tr>
									    </thead>
									    <tbody>
									      <tr>
									        <td style="min-width: 150px;">
									        	<select class="btn-primary form-group subsel" data-ng-change="subdetails(subjectString)" data-ng-model="subjectString" data-ng-options="subject.subjectName as subject.subjectName for subject in subjects"></select>
									        </td>
									        <td>{{subjectTotalMarks}}</td>
									        <td>{{subjectPassingMarks}}</td>
									        <td>{{subjectTimeInMinutes}} min.</td>
									      </tr>
									    </tbody>
									  </table>
								  </div>
				          		<button class="btn btn-primary nextBtn pull-right" type="button"><b>Next</b></button>
				    		</div>
				    	</div>
				    	<div class="setup-content" id="step-3">
				       		<h4><b>Terms & Conditions :</b></h4>
				       		<div class="col-lg-6">
				       			<div class="table-resposive">
					       			<table class="table">
									    <tbody>
									      <tr><td>1. All questions are compulsory.</td></tr>
									       <tr><td>2. Total number of questions : <b>{{subjectTotalMarks}}</b>.</td></tr>
									        <tr><td>3. Time alloted : <b>{{subjectTimeInMinutes}}</b> minutes.</td></tr>
									        <tr><td>4. 1 point for answering each question correctly.</td></tr>
									        <tr><td>5. No negative marking.</td></tr>
									        <tr><td>6. All the best :-).</td></tr>
									    </tbody>
									</table>
								</div>
								<button class="btn btn-primary pull-right" type="button" onclick="window.location.href='test'"><b>Start Quiz</b></button>
				       		</div>
				    	</div>
				  	</form>
				</div>
  			</div>		
		</div>

		<!-- Start of external scripts -->
		<script src="js/portfolio.js"></script>
		<!-- End of external scripts -->
	</body>
</html>