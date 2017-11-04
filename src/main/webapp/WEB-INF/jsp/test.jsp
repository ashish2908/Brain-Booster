<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Quiz Started</title>
		<!-- Disabled Zooming -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="css/test.css">
	</head>

	<body data-ng-app="OnlineQuiz" data-ng-controller="OnlineQuiz">
		<!-- Start of Header and footer -->
		<div>
			<jsp:include page="header_footer.jsp"></jsp:include>
		</div>
		<!-- End of Header and footer -->
		
		<!-- Start Main Container -->
		<div class="container-fluid">
			<!-- Start of User profile, Subject details, counter -->
			<div class="row">
				<div class="col-md-12" id="user-profile-info" align="center">
					<div class="col-lg-1" id="profile-photo">
						<img data-ng-src="{{loggedInUser.profilePhoto}}" class="img-circle img-responsive">
					</div>
					<div class="col-lg-2" id="user-basic-info">
						<h3>{{loggedInUser.fullname}}<br></h3><h5>{{loggedInUser.designation}}</h5>
						<h6>{{loggedInUser.emailId}}</h6>
					</div>
					<div class="col-lg-7">
						<h5 class="subjectname"><ins><b>{{questions[0].subject.subjectName}}</b></ins></h5>
						<h6>Maximum points : <b>{{questions[0].subject.subjectTotalMarks}}</b></h6>
						<h6>Passing points : <b>{{questions[0].subject.subjectPassingMarks}}</b></h6>
					</div>
					<div class="col-lg-2" id="countdown">
						<div id='tiles' class="color-full"></div>
					</div>
				</div>
			</div>
			<!-- End of User profile, Subject details, counter -->
			
			<!-- Start of instructions, drawing google charts --> 
 			<div class="row">
				<div class="col-md-8">
				    <table class="table table-condensed instructions">
							    <tbody>
							      <tr class="info">
							        <td><span class="glyphicon glyphicon-circle-arrow-right"></span></td>
							        <td>Total number of questions : <b>{{questions.length}}</b>, Time alloted : <b>{{questions[0].subject.subjectTimeInMinutes}}</b> minutes.</td>
							      </tr>
							      <tr class="info">
							        <td><span class="glyphicon glyphicon-circle-arrow-right"></span></td>
							        <td>1 point for answering each question correctly.</td>
							      </tr>
							      <tr class="info">
							        <td><span class="glyphicon glyphicon-circle-arrow-right"></span></td>
							        <td>No negaive marking.</td>
							      </tr>
							      <tr class="info">
									<td><span class="glyphicon glyphicon-circle-arrow-right"></span></td>
							        <td>DO NOT refresh the page.</td>
							      </tr>
							      <tr class="info">
									<td><span class="glyphicon glyphicon-circle-arrow-right"></span></td>
							        <td>All the best :-).</td>
							      </tr>
							    </tbody>
							  </table>
				</div>
				<div class="col-md-4">
  					<div id="piechart_3d"></div>
				</div>
			</div>
			<!-- Start of instructions, drawing google charts -->
			
			<!-- Start of Question, Option, Submit button -->			
			<div class="row">
				<div class="tab-content">
					<div id="{{$index+1}}" class="tab-pane" data-ng-repeat="question in questions" data-ng-class="{'active': question == questions[0]}">
						<div class="col-md-8" id="question-string">
							<h4><b>Q. </b>{{question.questionString}}</h4>
							<div id="options">
								<button class="option {{$index+1 + 'btnA'}}" data-ng-show="question.optionA.length != 0" data-ng-click="optsel($event, question.optionA)"><span class="span-option {{$index+1 + 'spnA'}}" style="width: 200px; max-width: 200px;">{{question.optionA}}</span></button>
								<button class="option {{$index+1 + 'btnB'}}" data-ng-show="question.optionB.length != 0" data-ng-click="optsel($event, question.optionB)"><span class="span-option {{$index+1 + 'spnB'}}" style="width: 200px; max-width: 200px;">{{question.optionB}}</span></button>
								<button class="option {{$index+1 + 'btnC'}}" data-ng-show="question.optionC.length != 0" data-ng-click="optsel($event, question.optionC)"><span class="span-option {{$index+1 + 'spnC'}}" style="width: 200px; max-width: 200px;">{{question.optionC}}</span></button>
								<button class="option {{$index+1 + 'btnD'}}" data-ng-show="question.optionD.length != 0" data-ng-click="optsel($event, question.optionD)"><span class="span-option {{$index+1 + 'spnD'}}" style="width: 200px; max-width: 200px;">{{question.optionD}}</span></button> 				
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<ul class="pagination">
				        <li data-ng-repeat="question in questions" id="li{{$index+1}}" data-ng-class="{'active': question == questions[0]}"><a data-toggle="tab" href="\#{{$index+1}}">{{$index+1}}</a></li>
				  	</ul>
				  	<div align="center">
				  		<button type="button" class="btn btn-primary btn-lg" data-ng-click="saveResult()"><b>End Quiz</b></button>
				  	</div>
				</div>

			</div>
			<!-- End of Question, Option, Submit button -->
		</div>
		<!-- End Main Container -->

		<!-- Start of external scripts -->
		<script src="js/test.js"></script>
  		<!-- Google charts js-->
  		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
		<!-- End of external scripts -->
		
	</body>
</html>